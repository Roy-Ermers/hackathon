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
	const string _DBConnection = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jonas\source\repos\hackathon\Hackathon\Hackathon\App_Data\Database.mdf;Integrated Security=True";

	public static DataTableReader Query(string query)
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
				return ds.CreateDataReader();
			}
		}
	}
	public static DataTableReader Procedure(string name, params SqlParameter[] parameter)
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

}