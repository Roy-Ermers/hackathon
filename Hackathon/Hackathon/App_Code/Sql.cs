using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sql
/// </summary>
public static class Sql
{
	static string _DBConnection = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + HttpContext.Current.Server.MapPath("~") + @"App_Data\Database.mdf;Integrated Security=True";

	public static DataTableReader Query(string query)
	{
		try
		{
			DataSet ds = new DataSet();
			using (SqlConnection con = new SqlConnection(_DBConnection))
			{
				using (SqlCommand cmd = new SqlCommand(query, con))
				{
					cmd.Prepare();
					con.Open();
					SqlDataAdapter Adapter = new SqlDataAdapter(cmd);
					Adapter.Fill(ds);
					con.Close();
					if(ds.Tables.Count>0)
					return ds.CreateDataReader();
					else
					{
						//table is empty
						return null;
					}
				}
			}
		}
		catch(Exception Exception)
		{
			throw new Exception(query, Exception);
		}
	}
	public static object ScalarQuery(string query)
	{
		var SQLquery = Query(query);
		if (SQLquery != null && SQLquery.HasRows)
		{
			SQLquery.Read();
			return SQLquery.GetValue(0);
		}
		else return null;
	}
	public static DataTableReader Procedure(string name, params SqlParameter[] parameter)
	{
		try
		{
			DataSet ds = new DataSet();
			using (SqlConnection con = new SqlConnection(_DBConnection))
			{
				using (SqlCommand cmd = new SqlCommand(name, con) { CommandType = CommandType.StoredProcedure })
				{
					cmd.Parameters.AddRange(parameter);
					cmd.Prepare();
					con.Open();
					SqlDataAdapter Adapter = new SqlDataAdapter(cmd);
					Adapter.Fill(ds);
					con.Close();
					if (ds.Tables.Count == 0)
						return null;
					return ds.CreateDataReader();
				}
			}
		}
		catch(Exception exception)
		{
			throw new Exception(name, exception);
		}
	}
}