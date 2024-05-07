local t = require("html-entities")

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end


describe("testenconde", function()
        it("do setup", function()
                assert.has_no.errors(t.setup)
        end)
        it("runs Encode", function()
                vim.api.nvim_command('edit tests/dec_ref.txt')
                vim.api.nvim_command("HtmlEncode")
                vim.api.nvim_command('write! tests/enc_test.txt')
                local encoded = lines_from('tests/enc_test.txt')
                local ref = lines_from('tests/enc_ref.txt')
                assert.equals(vim.deep_equal(encoded, ref), true)
        end)

end)

describe("testdecode", function()
        it("do setup", function()
                assert.has_no.errors(t.setup)
        end)
        it("runs Decode", function()
                vim.api.nvim_command('edit tests/enc_ref.txt')
                vim.api.nvim_command("HtmlDecode")
                vim.api.nvim_command('write! tests/dec_test.txt')
                local encoded = lines_from('tests/dec_test.txt')
                local ref = lines_from('tests/dec_ref.txt')
                assert.equals(vim.deep_equal(encoded, ref), true)
        end)

end)
