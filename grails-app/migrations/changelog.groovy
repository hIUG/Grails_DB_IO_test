databaseChangeLog = {

	changeSet(author: "HugoCE (generated)", id: "1395600345734-1") {
		createTable(schemaName: "dbo", tableName: "phonebook") {
			column(autoIncrement: "true", name: "id_contact", type: "INT") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "PK_phonebook")
			}

			column(name: "name", type: "NVARCHAR(100)")

			column(name: "phone", type: "NVARCHAR(50)")

			column(name: "birthdate", type: "SMALLDATETIME")

			column(name: "sex", type: "CHAR(1)")
		}
	}
}
