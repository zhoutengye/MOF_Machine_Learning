Module Read_File

  Implicit None

  Contains

  Subroutine Get_File_Size(Num_Line, Num_Row, File_Num)

  	Implicit None

    Integer , Intent(In)  :: File_Num
    Integer , Intent(Out) :: Num_Line 
    Integer , Intent(Out) :: Num_Row
    
    Character(len=512) :: Test_String
    Integer :: n_size = 1
    Logical :: bIsSeparator , bIsQuote
    Integer :: io, i  

     Num_Line = 0
     Num_Row  = 1

    Do
      Read(File_Num,*,Iostat=io)
      If (io/=0) Exit
      Num_Line = Num_Line + 1
    End Do

    Rewind(File_Num)
    read(File_Num,  '(a512)') Test_String 

    Do i = 1 , Len_Trim( Test_String )
      Select Case( Test_String (i:i) )
      Case( '"' , "'" ) !// when the data is devided by " or '
        If ( .Not.bIsQuote )  Num_Row = Num_Row + 1  !//If not inbetween 
        bIsQuote = .Not.bIsQuote !// 引号结束或开始
        bIsSeparator = .FALSE.
      Case( " " , "," , char(9) ) !// 如果遇到分隔符
        If ( .Not.bIsQuote ) then  !// 分隔符如果不在引号中
          bIsSeparator = .TRUE.
        End If
      Case Default     
        If ( bIsSeparator ) then
          Num_Row = Num_Row + 1
        End If
        bIsSeparator = .FALSE.
      End Select
    End Do

    Rewind(File_Num)

  End Subroutine Get_File_Size

  Subroutine Load_File(Var,Num_Line,Num_Row,File_Num)

    Integer , Intent(In)    :: File_Num
    Integer , Intent(In)    :: Num_Line 
    Integer , Intent(In)    :: Num_Row
    Real    , Intent(inout) :: Var(Num_Line,Num_Row)
    
    Integer :: i

    Do i = 1,Num_Line
      Read(File_Num,*) Var(i,:)
    EndDo
    
  End Subroutine Load_File

End Module Read_File



Module Linear_Regressors

  Implicit None
  Save

  Real, Allocatable :: theta(:,:)

  Contains

  Subroutine Fit_Linear(Training_Inputs, Training_Outputs, L_Training, N_Input, N_Output )

    Implicit None

    Integer, Intent(In) :: L_Training, N_Input, N_Output
    Integer, Intent(In) :: Training_Inputs(L_Training,N_Input)
    Integer, Intent(In) :: Training_Outputs(L_Training,N_Output)

    Allocate(Theta(N_Input+1,N_Output))

    Theta = 0

    Call Gradient_Decent

  End Subroutine Fit_Linear

  Subroutine Predict_Linear(Predict_Inputs, Predict_Outputs, L_Predict, N_Input, N_Output )

  Implicit None

  Integer, Intent(In)  :: L_Predict, N_Input, N_Output
  Integer, Intent(In)  :: Predict_Inputs(L_Predict,N_Input)
  Integer, Intent(Out) :: Predict_Outputs(L_Predict,N_Output)

  Integer :: i,j,k

  Do k = 1, L_Predict
    
    Do i = 1, N_Output
    
      Predict_Outputs(k,i) = Theta(1,i)
      Do j = 2, N_Input+1
        Predict_Outputs(k,i) = Predict_Outputs(k,i) + Theta(j,i) * Predict_Inputs(k,j) 
      EndDo
    
    EndDo
  
  EndDo


  End Subroutine Predict_Linear

  Subroutine Gradient_Decent(Training_Inputs, Training_Outputs, L_Training, N_Input, N_Output )

  	Implicit None

    Integer, Intent(In) :: L_Training, N_Input, N_Output
    Integer, Intent(In) :: Training_Inputs(L_Training,N_Input)
    Integer, Intent(In) :: Training_Outputs(L_Training,N_Output)


  

  End Subroutine Gradient_Decent

  Function CostFunction

End Module Linear_Regressors



Program Main

  Use Read_File
  Implicit None

  Integer :: N_Input, N_Output
  Integer :: L_Training, L_Test
  Real , Allocatable :: Training_Inputs(:,:), Training_Outputs(:,:)

  
  Open(2, File = 'MOF_Training_Input.dat', Status = 'old', Action = 'read')
  Open(3, File = 'MOF_Training_Output.dat', Status = 'old', Action = 'read')

  Call Get_File_Size(L_Training,N_Input,2)
  Call Get_File_Size(L_Training,N_Output,3)
  Allocate(Training_Inputs(L_Training,N_Input))
  Allocate(Training_Outputs(L_Training,N_Output))
  Call Load_File(Training_Inputs,L_Training,N_Input,2)
  Call Load_File(Training_Outputs,L_Training,N_Output,3)



End Program Main




