@{
   SolutionName="DBRollbacks"
   SSISDatabaseName="SSISDB"
   SqlVersion="130"
   DbProjects = @(
       @{
            ProjectName="DBRollbacks"
			DatabaseName="DBRollbacks"
			PublishDB=$true
        }
   )
   Nuget = @(
      @{
         Source = "http://nuget.laterooms.io/nuget"
         ApiKey = "creat10n"
      }
   );
   Dev = @(
      @{
         IncludeCompositeObjects=$false
         Server="."
         ConnectionString="Server=.;Database=DBRollbacks;connection timeout=6000;Integrated Security=SSPI;"
         SSIS = @(
            @{
               Server="."
               principle_server="."               
               mirror_server="."
            }
         )
         Testing = @(
            @{
                UseEnvironmental = $false
                RunTimeOut = 0
                TestTimeOut = 0
            }
         )
       }
   );
   CI = @(
      @{
         IncludeCompositeObjects=$false
         Server="dev-sql-01"
         ConnectionString="Server=dev-sql-01;Database=DBRollbacks;connection timeout=6000;Integrated Security=SSPI;"
         SSIS = @(
            @{
               Server="dev-sql-01"
               principle_server="dev-sql-01"               
               mirror_server="TELTLRGBISQL02"
            }
         )
         Testing = @(
            @{
                UseEnvironmental = $false
                RunTimeOut = 0
                TestTimeOut = 0
            }
         )
       }
   );    
   QA = @(
      @{
         IncludeCompositeObjects=$false
         Server="dev-sql-02"
         ConnectionString="Server=dev-sql-02;Database=DBRollbacks;connection timeout=6000;Integrated Security=SSPI;"
         SSIS = @(
            @{
               Server="dev-sql-02"
               principle_server="dev-sql-02"               
               mirror_server="TELTLRGBISQL02"
            }
         )
         Testing = @(
            @{
                UseEnvironmental = $false
                RunTimeOut = 0
                TestTimeOut = 0
            }
         )
       }
   ); 
    Live = @(
      @{
         IncludeCompositeObjects=$false
         Server="BI-SQL-01"
         ConnectionString="Server=BI-SQL-01;Database=DBRollbacks;connection timeout=6000;Integrated Security=SSPI;"
         SSIS = @(
            @{
               Server="PROD-SQLMON-UKF"
               principle_server="BI-SQL-01"               
               mirror_server="BI-SQL-02"
               linked_server="DBRollbacks_LIVE"
            }
         )
       }
   );    
   SqlCmdVaribles = @(
      @{}
   );
}