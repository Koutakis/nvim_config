local function db(name, var, suffix)
  local url = os.getenv(var)
  if not url then return nil end
  return { name = name, url = url .. (suffix or "") }
end

local candidates = {
  db("Ekonomi", "BIG_EKONOMI_EXECUTION_PROD"),
  db("VARD", "BIG_VARD_EXECUTION_PROD"),
  db("FRAPP", "BIG_FRAPP_EXECUTION_PROD"),
  db("STATISTIK", "BIG_STATISTIK_EXECUTION_PROD"),
  db("FRAPP_SOURCE", "FRAPP", "?TrustServerCertificate=yes"),
  db("BIRTH_CID", "BIRTH_CID_DADBOD"),
  db("HR", "BIG_HR_EXECUTION_PROD"),
}

vim.g.dbs = vim.tbl_filter(function(entry)
  return entry ~= nil
end, candidates)
