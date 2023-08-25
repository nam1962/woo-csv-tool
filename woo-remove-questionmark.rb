require 'csv'

# Open the CSV file
CSV.open('wc-product-export-22-8-2023.csv', 'r', headers: true) do |csv|
  rows = csv.read

  # Iterate through each row and remove question marks from the description
  rows.each do |row|
    description = row['Description courte']
    if description
      clean_description = description.gsub('?', '') # Remove question marks
      row['Description courte'] = clean_description
    end
  end

  # Write the modified data back to the CSV file
  CSV.open('modified_csv_file.csv', 'w', write_headers: true, headers: csv.headers) do |new_csv|
    rows.each { |row| new_csv << row }
  end
end
