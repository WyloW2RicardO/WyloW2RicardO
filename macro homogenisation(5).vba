
Sub trier_ans(nom)
' trier Macro par années
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Clear
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("A1"), SortOn:=xlSortOnValues, Order:=xlDescending _
        , DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("O1"), SortOn:=xlSortOnValues, Order:=xlDescending, _
        DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("M1"), SortOn:=xlSortOnValues, Order:=xlDescending, _
        DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("J1"), SortOn:=xlSortOnValues, Order:=xlDescending _
        , DataOption:=xlSortNormal
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub trier_local(nom)
' trier Macro par localisation
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Clear
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("A1"), SortOn:=xlSortOnValues, Order:=xlDescending _
        , DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("C1"), SortOn:=xlSortOnValues, Order:=xlAscending _
        , DataOption:=xlSortTextAsNumbers
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("G1"), SortOn:=xlSortOnValues, Order:=xlAscending, _
        DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("E1"), SortOn:=xlSortOnValues, Order:=xlAscending _
        , DataOption:=xlSortTextAsNumbers
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("J1"), SortOn:=xlSortOnValues, Order:=xlDescending _
        , DataOption:=xlSortNormal
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub trier_ordre(nom)
' Macro4 Macro
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Clear
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("A1"), SortOn:=xlSortOnValues, Order:=xlDescending, DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("B1"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortTextAsNumbers
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub trier_taille(nom)
' Macro4 Macro
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Clear
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("A1"), SortOn:=xlSortOnValues, Order:=xlDescending, DataOption:=xlSortNormal
    ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort.SortFields.Add2 _
        Key:=Range("j1"), SortOn:=xlSortOnValues, Order:=xlDescending, DataOption:=xlSortTextAsNumbers
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub trier_event(nom)
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        With .SortFields
            .Clear
            .Add2 Key:=Range("I1"), SortOn:=xlSortOnValues, DataOption:=xlSortNormal, Order:=xlAscending
            .Add2 Key:=Range("C1"), SortOn:=xlSortOnValues, DataOption:=xlSortNormal, Order:=xlAscending
            .Add2 Key:=Range("AM1"), SortOn:=xlSortOnValues, DataOption:=xlSortNormal, Order:=xlAscending
            .Add2 Key:=Range("AG1"), SortOn:=xlSortOnValues, DataOption:=xlSortNormal, Order:=xlAscending
        End With
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub colorer(num, f, l, ll, c, cc)
'MsgBox num & ", " & nom & ", " & l & ", " & ll & ", " & c & ", " & cc
    Sheets(f).Range(Sheets(f).Cells(l, c), Sheets(f).Cells(ll, cc)).Interior.ColorIndex = num
End Sub

Sub uncolor(f, l, ll, c, cc)
'MsgBox "ok"
    With Sheets(f).Range(Sheets(f).Cells(l, c), Sheets(f).Cells(ll, cc)).Interior
        .Pattern = xlNone
        .TintAndShade = 0
        .PatternTintAndShade = 0
    End With
End Sub

Sub copie(f0, f1, ln, lx, l, cn, cx, c)
    Dim k, m As Integer
    k = l + lx - ln
    m = c + cx - cn
    'Sheets(f1).Range(Sheets(f1).Cells(l, c), Sheets(f1).Cells(k ,m)).Select
    Sheets(f1).Range(Sheets(f1).Cells(l, c), Sheets(f1).Cells(k, m)).Clear
    Sheets(f1).Range(Sheets(f1).Cells(l, c), Sheets(f1).Cells(k, m)).Interior.ColorIndex = xlColorIndexNone
    Sheets(f0).Range(Sheets(f0).Cells(ln, cn), Sheets(f0).Cells(lx, cx)).Copy
    Sheets(f1).Cells(l, c).PasteSpecial Paste:=xlPasteValues
End Sub

Function estdans(valeur, f, l, ll, c, cc)
    Set cellulecherchee = Sheets(f).Range(Sheets(f).Cells(l, c), Sheets(f).Cells(ll, cc)).Find( _
            what:=valeur, LookIn:=xlValues, lookat:=xlWhole)
    If cellulecherchee Is Nothing Then
        estdans = 0
'MsgBox ("pas trouv?")
    Else
'        estdans = True
        estdans = cellulecherchee.Column
'        ligne = cellulecherchee.Row
'MsgBox ("trouvé : ligne = " & ligne & " , colonne = " & col & " , " & cellulecherchee.Address)
    End If
End Function

Function rgl()
    rgl = "regle"
End Function

Function FA()
    FA = "modif0"
End Function

Function FB()
    FB = "modif1"
End Function

Function FC()
    FC = "modif2"
End Function

Function nom()
    nom = 11
End Function

Function AGmnn()
    AGmnn = 12
End Function

Function AGmndc()
    AGmndc = 13
End Function

Function AGmxdc()
    AGmxdc = 14
End Function

Function PL()
    PL = 2
End Function

Function CR()
    CR = 10
End Function

Function CR_25()
    CR_25 = 11
End Function

Function srfc()
    srfc = 10
End Function

Function ans()
    ans = 13
End Function

Function CRsi()
    CRsi = 15
End Function

Function PLage()
    PLage = 16
End Function

Function lna()
    lna = 2
End Function

Function lxa(f)
    lxa = 2
    Do While cases(f, lxa + 1, 1) = "Vrai"
        lxa = lxa + 1
    Loop
End Function

Function cnb()
    cnb = 17
End Function

Function cxb()
    cxb = 26
End Function

Function cases(f, l, c)
    cases = Sheets(f).Cells(l, c).Value
End Function

Function actn(l, c)
    actn = cases(rgl(), l, c)
End Function

Function ptntl()
    ptntl = actn(30, 2)
End Function

Function anees(c)
    anees = actn(2, 2 + c)
End Function

Function PMunq()
    If actn(27, 8) = "Vrai" Then
        PMunq = True
    Else
        PMunq = False
    End If
End Function

Function TRIElocal()
    If actn(28, 8) = "Vrai" Then
        TRIElocal = True
    Else
        TRIElocal = False
    End If
End Function

Function CRetlr()
    If actn(29, 8) = "Vrai" Then
        CRetlr = True
    Else
        CRetlr = False
    End If
End Function

Function PL25()
    If actn(30, 8) = "Vrai" Then
        PL25 = True
    Else
        PL25 = False
    End If
End Function

Function CR25()
    If actn(31, 8) = "Vrai" Then
        CR25 = True
    Else
        CR25 = False
    End If
End Function

Function SmmBdgt()
    If actn(32, 8) = "Vrai" Then
        SmmBdgt = True
    Else
        SmmBdgt = False
    End If
'MsgBox actn( 45, 2)
End Function

Function Q(valeur)
    If Q3() Then
        Q = valeur
    Else
        Q = srfc()
    End If
'MsgBox SmmBdgt()
End Function

Function Q2(valeur)
    If Q3() Then
        Q2 = valeur
    Else
        Q2 = ptntl()
    End If
'MsgBox SmmBdgt()
End Function

Function Q3()
    If CR25() Then
        Q3 = False
    Else
        Q3 = SmmBdgt()
    End If
'MsgBox SmmBdgt()
End Function

Function somme(nom, l, ll, c, cc)
    somme = WorksheetFunction.Sum(Sheets(nom).Range(Sheets(nom).Cells(l, c), Sheets(nom).Cells(ll, cc)))
End Function

Function Smm_Si(valeur, condition, f, l, ll, c, cc, B)
    Dim j, j10 As Byte
    
    j = c
    j10 = srfc()
    Smm_Si = 0
    
    If condition <> "" Then
        Do While j <= cc
            If B Then
                j10 = j + 10
            End If
            Smm_Si = Smm_Si _
                + WorksheetFunction.SumIfs(Sheets(f).Range(Sheets(f).Cells(l, j10), Sheets(f).Cells(ll, j10)) _
                    , Sheets(f).Range(Sheets(f).Cells(l, j), Sheets(f).Cells(ll, j)) _
                    , actn(nom(), valeur) _
                    , Sheets(f).Range(Sheets(f).Cells(l, PLage()), Sheets(f).Cells(ll, PLage())) _
                    , condition)
            j = j + 1
        Loop
    Else
        Do While j <= cc
            If B Then
                j10 = j + 10
            End If
'MsgBox j10
            Smm_Si = Smm_Si _
                + WorksheetFunction.SumIfs(Sheets(f).Range(Sheets(f).Cells(l, j10), Sheets(f).Cells(ll, j10)) _
                    , Sheets(f).Range(Sheets(f).Cells(l, j), Sheets(f).Cells(ll, j)) _
                    , actn(nom(), valeur))
            j = j + 1
        Loop
    End If
End Function

Function CCdr(f, l, c)
''' retourne la colone dans regle de la dernier action '''
    vlr = cases(f, l, c)
    If vlr <> "" Then
    ''' si on deja les travaux en cour '''
        If vlr = actn(nom_l(), PL_c()) Then
            CCdr = PL_c()
        Else
            CCdr = estdans(vlr, rgl(), nom_l(), nom_l(), PL_c() + 1, CR25_c()) - 1
        End If
    Else
        c1 = c
        vlr1 = vrl
        Do While c1 > deb_c() _
        And vlr1 = ""
            c1 = c1 - 1
            vlr1 = cases(f, l, c1)
        Loop
        If vlr1 <> "" Then
            CCdr = estdans(vrl1, rgl(), nom_l(), nom_l(), PL_c(), CR25_c())
        Else
        ''' le retrouver en fonction de l'age moyen '''
            CCdr = CR_c()
            age = AGql(f, l, c - deb_c())
            Do While CCdr > PL_c() _
            And age <= actn(AGmnn_l(), CCdr)
                CCdr = CCdr - 1
            Loop
        End If
    End If
'MsgBox "CCdr " & CCdr
End Function

Function AGql(f, l, cn)
'MsgBox cn & " : " & cases(f, l, cnb() + cn + 20 - 1)
    If cn = 0 Then
        If cases(f, l, CRsi()) = "Vrai" Then
            AGql = anees(cn) - cases(f, l, ans()) - 2
        Else
            AGql = anees(cn) - cases(f, l, ans())
        End If
    Else
        If cases(f, l, cnb() + cn + 20 - 1) = -1 Then
            c = estdans(actn(nom(), CR()), f, l, l, cnb(), cnb() + cn - 1)
            If c = 0 Then
                AGql = anees(cn) - cases(f, l, ans()) - 2
            Else
                AGql = cn - (c - cnb()) - 2
            End If
        Else
            AGql = cases(f, l, cnb() + cn + 20 - 1) + 1
        End If
    End If
End Function

Function AGdr(f, l, c, DRcc)
    If DRcc = -1 Then
        DRcc = CCdr(f, l, c)
    End If

'MsgBox DRcc
    If DRcc = PL() Then
        AGdr = actn(AGmnn(), DRcc)
    Else
        alpha = estdans(actn(nom(), DRcc), f, l, l, cnb(), c) + 20
        If alpha = 20 Then
            AGdr = actn(AGmnn(), DRcc)
        Else
            AGdr = cases(f, l, alpha)
        End If
    End If
End Function

Sub svgrd(f, ln, lx, cn, cx)
    Call copie(f, rgl(), ln, lx, 3, cn, cx, 2)
End Sub

Sub chrg(f, l, c)
    Call copie(rgl(), f, 3, 3, l, 2, 11, c)
End Sub

Sub reste(valeur, f, l, lx, c, DRag)
    Dim c1, c10, c20, cc, ccj, k20 As Byte
    
    c10 = c + 10
    c20 = c + 20
    
    If valeur <> "" Then
        cc = estdans(valeur, rgl(), nom(), nom(), PL(), CR_25())
    Else
        cc = 2
        age = AGql(f, l, c - cnb())
        Do While cc < CR() _
        And age > actn(AGmnn(), cc)
            cc = cc + 1
        Loop
    End If
    
    If DRag = -1 Then
        DRag = AGdr(f, l, c, -1)
    End If
'MsgBox DRag
    
    ccj = cc
    MNag = DRag + actn(AGmndc(), ccj)
    MXag = DRag + actn(AGmxdc(), ccj)
'MsgBox l & " " & MXag & " >= " & age & " >= " & MNag
    For k = c To cxb()
        ccj1 = ccj
        k20 = k + 20
        Sheets(f).Cells(l, k) = ""
        age = AGql(f, l, k - cnb())
'Sheets(f).Cells(l, k).Select
'MsgBox age
'MsgBox Sheets(f).Cells(l, k)
'MsgBox MNag & " : " & MXag
        If ccj = CR() Then
            If age >= actn(AGmndc(), CR()) Then
                Sheets(f).Cells(l, k).Value = actn(nom(), CR())
                ccj = PL()
                DRag = age
                MNag = actn(AGmndc(), PL())
                MXag = actn(AGmxdc(), PL())
            End If
        If ccj = CR_25() Then
            If age >= actn(AGmndc(), CR_25()) Then
                Sheets(f).Cells(l, k).Value = actn(nom(), CR_25())
                ccj = PL()
                DRag = age
                MNag = actn(AGmndc(), PL())
                MXag = actn(AGmxdc(), PL())
            End If
        ElseIf ccj = PL() Then
'            If age >= actn( AGmndc(), ccj) _
            And age <= actn( AGmxdc(), ccj) Then
            If age >= actn(AGmndc(), ccj) Then
                Sheets(f).Cells(l, k).Value = actn(nom(), PL())
'                Sheets(f).Cells(l, PLage()).Value = 40
                If PL25() Then
                    Dim ecrtI, ecrtI2, somI, somI2 As Long
                    somI = Smm_Si(PL(), 40, f, 1, lx, k, k, False)
                    ecrtI = ptntl() - somI
                    somI2 = somI - cases(f, l, srfc())
                    ecrtI2 = ptntl() - somI2
'                    If ecrtI2 < 0 _
                    Or Abs(ecrtI) > Abs(ecrtI2) Then
                    If Abs(ecrtI) > Abs(ecrtI2) Then
'MsgBox age
'MsgBox Sheets(f).Cells(l, c)
'MsgBox "1 cases = " & cases(f, l, Q(c10))
'MsgBox somI & " : " & somI2
'MsgBox ecrtI & " > " & ecrtI2
                        If k < cxb() Then
                            Sheets(f).Range(Sheets(f).Cells(l, k + 1), Sheets(f).Cells(l, cxb())).Clear
                        End If
                        Sheets(f).Cells(l, PLage()).Value = 25
                        Exit Sub
                    End If
                End If
                ccj = PL() + 1
                DRag = 0
                MNag = actn(AGmndc(), ccj)
                MXag = actn(AGmxdc(), ccj)
            End If
        Else
            If age >= MNag _
            And age <= MXag Then
'Sheets(f).Cells(l, c).Select
'MsgBox "2 cases = " & cases(f, l, Q(c10))
                Sheets(f).Cells(l, k).Value = actn(nom(), ccj)
                ccj = ccj + 1
                DRag = age
                MNag = DRag + actn(AGmndc(), ccj)
                MXag = DRag + actn(AGmxdc(), ccj)
                If MNag <= actn(AGmnn(), ccj) - 1 Then
                    MNag = actn(AGmnn(), ccj) - 1
                    MXag = actn(AGmnn(), ccj) + 2
                End If
            End If
        End If
'Sheets(FB()).Cells(l, k).Select
'MsgBox cases(f, l, k20) & " : " & actn( nom(), ccj) & " ; " & ccj & " " & cases(f, l, k20) & " >= " & actn( AGmn(), ccj) & " " & cases(f, l, k20) & " <= " & actn( AGmx(), ccj)
    Next
End Sub

Sub etalement(lx)
    Dim c10, ccn As Byte
    Dim ecrtI, ecrtI2, mnn, som, somI, somI2 As Long
    
    som = Smm_Si(CR(), "", FB(), lna(), lx, cnb(), cxb(), Q3()) _
    + Smm_Si(CR_25(), "", FB(), lna(), lx, cnb(), cxb(), Q3())
    mnn = Q2(som / 10)
    
    For c = cnb() To cxb() - 1
        c10 = c + 10
        cn = c - cnb()
        somI = Smm_Si(CR(), "", FB(), lna(), lx, c, c, Q3()) _
        + Smm_Si(CR_25(), "", FB(), lna(), lx, c, c, Q3())
        ecrtI = mnn - somI
        For l = lna() To lx
'            If cases(FB(), l, c) = actn( nom(), CR()) _
            And AGql(FB(), l, cn) < actn( AGmxdc(), CR()) _
            And somme(FC(), lna(), lx, c10, c10 + 9) > 0 Then
            If cases(FB(), l, c) = actn(nom(), CR()) _
            And AGql(FB(), l, cn) < actn(AGmxdc(), CR()) Then
                somI2 = somI - cases(FB(), l, Q(c10))
                ecrtI2 = mnn - somI2
'Sheets(FB()).Cells(l, c).Select
'MsgBox mnn & " : " & ecrtI & " > " & ecrtI2
                If ecrtI2 < 0 _
                Or Abs(ecrtI) > Abs(ecrtI2) Then
                    Sheets(FB()).Cells(l, c).Clear
                    Call reste(actn(nom(), CR()), FB(), l, lx, c + 1, -1)
                    som = Smm_Si(CR(), "", FB(), lna(), lx, cnb() + cn, cxb(), Q3()) _
                    + Smm_Si(CR_25(), "", FB(), lna(), lx, cnb(), cxb(), Q3())
                    mnn = Q2(som / (10 - ccn))
                    Call colorer(6, FB(), l, l, c, c)
                    somI = somI2
                    ecrtI = ecrtI2
                End If
            End If
        Next
    Next
End Sub

Sub comble(lx)
    Dim c10, c20 As Byte
    Dim ecrtI0, ecrtI1, somI0, somI1 As Long
    
    For c = cnb() To cxb()
        c10 = c + 10
        c20 = c + 20
        somI0 = Round(Smm_Si(CR(), "", FB(), lna(), lx, c, c, False) _
        + Smm_Si(CR_25(), "", FB(), lna(), lx, c, c, False), 4)
        ecrtI0 = Round(ptntl() - somI0, 4)
        For l = lna() To lx
            If estdans(actn(nom(), CR()), FB(), l, l, cnb(), cxb()) = 0 _
            And estdans(actn(nom(), CR_25()), FB(), l, l, cnb(), cxb()) = 0 Then
                If cases(FB(), l, c20) >= 25 Then
                    somI1 = Round(somI0 + cases(FB(), l, srfc()), 4)
                    ecrtI1 = Round(ptntl() - somI1, 4)
 '                   If ecrtI1 > 0 _
                    Or Abs(ecrtI0) > Abs(ecrtI1) Then
'Sheets(FB()).Cells(l, c).Select
'MsgBox somI0 & " : " & somI1
'MsgBox ecrtI0 & " > " & ecrtI1
                    If ecrtI1 > 0 _
                    And Abs(ecrtI0) > Abs(ecrtI1) Then
                        Sheets(FB()).Range(Sheets(FB()).Cells(l, cnb()), Sheets(FB()).Cells(l, c)).Clear
                        Sheets(FB()).Cells(l, c).Value = actn(nom(), CR_25())
                        Call reste(actn(nom(), PL()), FB(), l, lx, c + 1, -1)
                        Call colorer(6, FB(), l, l, c, c)
                        somI0 = somI1
                        ecrtI0 = ecrtI1
                    End If
                End If
            End If
         Next
    Next
End Sub

Sub prcr_1(lx)
    For l = lna() To lx
'Sheets(FB()).Cells(l, cnb()).Select
        Call reste(cases(FB(), l, cnb()), FB(), l, lx, cnb(), -1)
    Next
End Sub

Sub prcr_3(mnn, lx, c, B)
    Dim age, c1, c10, c20, cn10, cx10, ccn As Byte
    Dim ecrtI0, ecrtI1, somI0, somI1 As Long
    Dim lc As String
    
    c10 = c + 10
    c20 = c + 20
    cn = c - cnb()
    somI0 = somme(FC(), lna(), lx, c10, c10)
    ecrtI0 = mnn - somI0
    For l = lna() To lx
        lc = cases(FC(), l, c)
        If lc <> "" Then
'            If (CRetlr() _
            And lc <> actn(nom(), CR()) _
            And lc <> actn(nom(), CR_25())) _
            Or Not CRetlr() Then
Sheets(FC()).Cells(l, c).Select
                age = AGql(FC(), l, cn)
                DRcc = CCdr(FC(), l, c)
'MsgBox DRcc
                DRag = AGdr(FC(), l, c, DRcc)
                If DRcc = 9 Then
                    MXag = actn(AGmxdc(), DRcc + 1)
                ElseIf DRcc = 2 Then
                    MXag = actn(AGmxdc(), DRcc)
                Else
                    MXag = DRag + actn(AGmxdc(), DRcc + 1)
                End If
'MsgBox l & " " & c & " " & DRcc & " : " & age & " < " & MXag
                If age < MXag Then
                    somI1 = somI0 - cases(FC(), l, c10)
                    ecrtI1 = mnn - somI1
'MsgBox somI0 & " : " & somI1
'MsgBox mnn & " : " & ecrtI0 & " > " & ecrtI1
                    If (somI1 < 0 And cases(FC(), l, c10) < 0) _
                    Or Abs(ecrtI0) > Abs(ecrtI1) Then
                        Sheets(FC()).Cells(l, c).Clear
                        Call colorer(6, FC(), l, l, c, c)
                        Call reste(lc, FC(), l, lx, c + 1, DRag)
                        somI0 = somI1
                        ecrtI0 = ecrtI1
                        If B Then
                            mnn = somme(FC(), lna(), lx, cnb() + 10 + cn, cxb() + 10) / (10 - cn)
                        End If
                    End If
                End If
'            End If
        End If
    Next
End Sub

Sub prcr_2(l_fin)
    Dim cmm, cn10, cx10 As Byte
    Dim mnn0, som0, mnn1, som1, somI As Long
    
    cn10 = deb_c() + 10
    cx10 = fin_c() + 10
    cmm = deb_c
    For c = deb_c() To fin_c() - 1
        c10 = c + 10
        som0 = somme(FC(), deb_l(), l_fin, c10, cx10)
        mnn0 = som0 / (fin_c() - c + 1)
'MsgBox "som0 " & som0
'MsgBox fin_c() - c + 1
'MsgBox "mnn0 " & mnn0
        somI = somme(FC(), deb_l(), l_fin, c10, c10)
'MsgBox "somIa " & somI
        If somI > 0 Then
            'Call prcr_3(mnn0, l_fin, c, True)
            Call prcr_3(mnn0, l_fin, c, False)
        Else
            If c = deb_c() Then
                Call prcr_3(0, l_fin, deb_c(), False)
            ElseIf c > cmm Then
                cmm = c
                som1 = somme(FC(), deb_l(), l_fin, c10 - 1, c10)
                mnn1 = som1 / 2
'MsgBox "som1 " & som1
'MsgBox "mnn1 " & mnn1
                Call prcr_3(mnn1, l_fin, c - 1, False)
            End If
        End If
    Next
End Sub

Sub modif1()
    Application.ScreenUpdating = True
'    Application.ScreenUpdating = False
    
    Dim lx As Integer
    
    Call trier_ordre(FA())
    Call trier_ordre(FB())
    lx = lxa(FB())
    Call uncolor(FB(), lna() - 1, lx, cnb(), cxb())
    Call copie(FA(), FB(), lna(), lx, lna(), 20, 30, PLage())
    Call trier_ans(FB())
'    Sheets(FB()).Range(Sheets(FB()).Cells(lna(), PLage()), Sheets(FB()).Cells(lx, PLage())).Clear
'    Call trier_taille(FB())
    
    Call prcr_1(lx)
    If CRetlr() Then
        Call etalement(lx)
    End If
    If CR25() Then
        Call comble(lx)
    End If
    
    
    Application.ScreenUpdating = True
MsgBox "lx = " & lx
End Sub

Sub modif2()
    Application.ScreenUpdating = True
'    Application.ScreenUpdating = False
    
    Dim lx As Integer
    
    If TRIElocal() Then
        Call trier_local(FB())
    Else
        Call trier_ans(FB())
    End If
    
    Call trier_ordre(FC())
    lx = lxa(FC())
    Call uncolor(FC(), lna(), lx, PLage(), cxb())
    Call copie(FB(), FC(), lna(), lx, lna(), PLage(), cxb(), PLage())
'    Call trier_taille(FC())
    Call prcr_2(lx)
    
    Application.ScreenUpdating = True
MsgBox "lx = " & lx
End Sub

Sub test()
Application.ScreenUpdating = True

MsgBox ptntl()
'MsgBox 37 + actn( AGmxdc(), 9)
'Call trier_ans(FB())
End Sub
