def read_folder(folder_path)
  files = Dir.entries(folder_path).select { |file| File.file? folder_path + "/" + file}
  files.select! { |file| file.end_with? ".txt" }
  files.map! { |file| folder_path + "/" + file }
  puts files
end

read_folder("../test/test_folder")
