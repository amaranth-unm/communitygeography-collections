# Keep historical image/document URLs working without duplicate editable files.
require 'fileutils'
require 'pathname'

Jekyll::Hooks.register :site, :post_write do |site|
  Array(site.data['legacy-assets']).each do |asset|
    old_path, new_path = asset.values_at('from', 'to')
    [old_path, new_path].each do |path|
      unless path.is_a?(String) && !Pathname.new(path).absolute? && !path.split('/').include?('..')
        raise Jekyll::Errors::FatalException, "Unsafe legacy asset path: #{path.inspect}"
      end
    end
    source = File.join(site.source, new_path)
    raise Jekyll::Errors::FatalException, "Missing organized asset: #{new_path}" unless File.file?(source)
    # Copy canonical paths too: Jekyll skips the inherited filename ending in a dot.
    [new_path, old_path].each do |path|
      destination = File.join(site.dest, path)
      FileUtils.mkdir_p(File.dirname(destination))
      FileUtils.cp(source, destination)
    end
  end
end
