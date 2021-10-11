# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_tsv(tsv)
    lines = tsv.split("\n")
    keys = lines[0].split("\t")
    @data = []

    lines.shift
    lines.each do |line|
      input = line.split(/\t/)
      @data << Hash[keys.zip input]
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format

  def lines(value)
    value.join("\t") + "\n"
  end

  def to_tsv
    out = lines(@data[0].keys)
    @data.each do |i|
      out << lines(i.values)
    end
    out
  end
end
