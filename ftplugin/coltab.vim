:function ColTab(group)

	:try 
		:TableModeEnable
		:echo "Use TableModeRealign to realign the table which the cursor is in."
	:catch
		:echo "TableMode Plugin not installed."
		:echo "Install it to realign the tables."
	:endtry


	:normal o |-----------------+---------------|
	:normal o | System:         | Point Group:  |
	:normal o |-----------------+---------------|
	:normal o | # of Electrons: | Multiplicity: |
	:normal o |-----------------+---------------|
	:normal o | Level:          |               |
	:normal o |-----------------+---------------|
	:normal o  

	:if index(['d2h', 'c2v', 'c2h', 'd2', 'ci', 'cs', 'c2', 'c1'],a:group) == -1
		:let choicen = inputlist(['Select the Point Group', '1. d2h', '2. c2v', '3. c2h', '4. d2', '5. ci', '6. cs', '7. c2', '8. c1'])
"		:execute "normal o" type(a:group)
		:if choicen == 1
			:let choice = 'd2h'	
		:elseif choicen == 2 
			:let choice = 'c2v'
		:elseif choicen == 3
			:let choice = 'c2h'
		:elseif choicen == 4
			:let choice = 'd2'
		:elseif choicen == 5
			:let choice = 'ci'
		:elseif choicen == 6
			:let choice = 'cs'
		:elseif choicen == 7
			:let choice = 'c2'
		:elseif choicen == 8
			:let choice = 'c1'
		:endif
	:else
		:let choice = a:group
	:endif


"	:execute "normal o" group


	:if choice ==? 'd2h' 
		:call WriteEightCol(choice)
	:elseif choice ==? 'c2v' || choice ==? 'c2h' || choice ==? 'd2' 
		:call WriteFourCol(choice)
	:elseif choice ==? 'ci' || choice ==? 'cs' || choice ==? 'c2' 
		:call WriteTwoCol(choice)
	:elseif choice ==? 'c1' 
		:call WriteOneCol(choice)
	:endif

:normal o 
:normal o |-------+--------------+----------------+----------|
:normal o | State | Multiplicity | # of Electrons | Symmetry |
:normal o |-------+--------------+----------------+----------|
:normal o |       |              |                |          |
:normal o |-------+--------------+----------------+----------|
:normal o 
:normal o 
:normal o Number of Distincty Rows (DRTs):
:normal o 
:normal o 
:normal o XYZ:

:endfunction

:function WriteEightCol(group)

	:normal o  
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       |       | ag | b3u | b2u | b1g | b1u | b2g | b3g | au |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | BASIS |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o | SCF   | DOCC  |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | OPSH  |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o | MCSCF | DOCC  |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | RAS   |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | CAS   |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | AUX   |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o | MRCI  | FC    |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | FV    |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | DOCC  |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | ACT   |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | AUX   |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|
	:normal o |       | INT   |    |     |     |     |     |     |     |    |
	:normal o |-------+-------+----+-----+-----+-----+-----+-----+-----+----|


:endfunction

:function WriteFourCol(group)

	:normal o  
	:normal o |-------+-------+----+----+----+----|

	:if a:group == 'c2v' 
		:normal o |       |       | a1 | b1 | b2 | a2 |
	:endif

	:if a:group == 'c2h'
		:normal o |       |       | ag | bu | au | ag |
	:endif
	:if a:group == 'd2' 
		:normal o |       |       | a  | b2 | b1 | b3 |
	:endif

	:normal o |-------+-------+----+----+----+----|
	:normal o |       | BASIS |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o | SCF   | DOCC  |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | OPSH  |    |    |    |    |
	:normal o |-------+-------+------+----+----+--|
	:normal o | MCSCF | DOCC  |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | RAS   |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | CAS   |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | AUX   |    |    |    |    |
        :normal o |-------+-------+----+----+----+----|
        :normal o | MRCI  | FC    |    |    |    |    |
        :normal o |-------+-------+----+----+----+----|
	:normal o |       | FV    |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | DOCC  |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | ACT   |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | AUX   |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|
	:normal o |-------+-------+----+----+----+----|
	:normal o |       | INT   |    |    |    |    |
	:normal o |-------+-------+----+----+----+----|



:endfunction

:function WriteTwoCol(group)

	:normal o  
	:normal o |-------+-------+----+----|

	:if a:group == 'ci' 
		:normal o |       |       | ag | au |
	:endif

	:if a:group == 'cs' 
		:normal o |       |       | a' | a" |
	:endif

	:if a:group == 'c2' 
		:normal o |       |       | a  | b  |
	:endif

	:normal o |-------+-------+----+----|
	:normal o |       | BASIS |    |    |
	:normal o |-------+-------+----+----|
	:normal o | SCF   | DOCC  |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | OPSH  |    |    |
	:normal o |-------+-------+----+----|
	:normal o | MCSCF | DOCC  |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | RAS   |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | CAS   |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | AUX   |    |    |
	:normal o |-------+-------+----+----|
        :normal o | MRCI  | FC    |    |    |
        :normal o |-------+-------+----+----|
	:normal o |       | FV    |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | DOCC  |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | ACT   |    |    |
	:normal o |-------+-------+----+----|
	:normal o |       | AUX   |    |    |
	:normal o |-------+-------+----+----|
	:normal o |-------+-------+----+----|
	:normal o |       | INT   |    |    |
	:normal o |-------+-------+----+----|


:endfunction

:function WriteOneCol(group)

	:normal o  
	:normal o |-------+-------+----|
	:normal o |       |       | a  |
	:normal o |-------+-------+----|
	:normal o |       | BASIS |    |
	:normal o |-------+-------+----|
	:normal o | SCF   | DOCC  |    |
	:normal o |-------+-------+----|
	:normal o |       | OPSH  |    |
	:normal o |-------+-------+----|
	:normal o | MCSCF | DOCC  |    |
	:normal o |-------+-------+----|
	:normal o |       | RAS   |    |
	:normal o |-------+-------+----|
	:normal o |       | CAS   |    |
	:normal o |-------+-------+----|
	:normal o |       | AUX   |    |
	:normal o |-------+-------+----|
        :normal o | MRCI  | FC    |    |
        :normal o |-------+-------+----|
	:normal o |       | FV    |    |
	:normal o |-------+-------+----|
	:normal o |       | DOCC  |    |
	:normal o |-------+-------+----|
	:normal o |       | ACT   |    |
	:normal o |-------+-------+----|
	:normal o |       | AUX   |    |
	:normal o |-------+-------+----|
	:normal o |-------+-------+----|
	:normal o |       | INT   |    |
	:normal o |-------+-------+----|


:endfunction

