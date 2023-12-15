
Sub trier_ans(nom)
' trier Macro par années
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        With .SortFields
            .Clear
            .Add2 Key:=Range("A1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
            .Add2 Key:=Range("P1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
            .Add2 Key:=Range("N1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
            .Add2 Key:=Range("K1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
        End With
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub
Sub trier_local(nom)
' trier Macro par localisation
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        With .SortFields
            .Clear
            .Add2 Key:=Range("A1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
            .Add2 Key:=Range("D1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("H1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("F1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("I1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("J1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
        End With
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub trier_ordre(nom)
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        With .SortFields
            .Clear
            .Add2 Key:=Range("A1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
            .Add2 Key:=Range("B1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
        End With
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub trier_taille(nom)
    With ActiveWorkbook.Worksheets(nom).ListObjects(nom).Sort
        With .SortFields
            .Clear
'            .Add2 Key:=Range("A1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlDescending
            .Add2 Key:=Range("K1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("D1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("H1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("I1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("J1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
        End With
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
            .Add2 Key:=Range("I1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("C1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("AM1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
            .Add2 Key:=Range("AG1"), SortOn:=xlSortOnValues, DataOption:=xlSortTextAsNumbers, Order:=xlAscending
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
    ''' copie une plage en f0 de n à x et les colles en f1 de l à c '''
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
    ''' donne la colonne ou se trouve la valeur dans la plage selectioné '''
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
''' nom de la feuille de base de 40ans '''
    FA = "base40"
End Function

Function FB()
    FB = "modif1"
End Function

Function FC()
    FC = "modif2"
End Function

Function nom_l()
''' ligne du nom de la categorie dans regle '''
    nom_l = 11
End Function

Function AGmnn_l()
''' ligne de l'age moyen dans regle '''
    AGmnn_l = 12
End Function

Function AGmndc_l()
''' ligne de decalage dans regle '''
    AGmndc_l = 13
End Function

Function AGmxdc_l()
''' ligne de ecart dans regle '''
    AGmxdc_l = 14
End Function

Function PL_c()
''' colone des plantations dans regle '''
    PL_c = 2
End Function

Function CR_c()
''' colone des coupe rase 40 dans regle '''
    CR_c = 10
End Function

Function CR25_c()
''' colone des coupe rase 25 dans regle '''
    CR25_c = 11
End Function

Function srfc_c()
''' colone des surface dans les tablaux '''
    srfc_c = 11
End Function

Function ans_c()
''' colone des années de plantation dans les tablaux '''
    ans_c = 14
End Function

Function CRsi_c()
''' colone bolein si la nature de base est une coupe rase '''
    CRsi_c = 16
End Function

Function PLage_c()
''' colone de la duré envisage dans les tablaux '''
    PLage_c = 17
End Function

Function deb_l()
    deb_l = 2
End Function

Function fin_l(feuille)
    fin_l = deb_l()
    Do While cases(feuille, fin_l + 1, 1) = "Vrai"
        fin_l = fin_l + 1
    Loop
End Function

Function deb_c()
''' colone ... dans les tablaux '''
    deb_c = 18
End Function

Function fin_c()
''' colone ... dans les tablaux '''
    fin_c = 27
End Function

Function cases(f, l, c)
''' retourne la valeur de la cellue '''
    cases = Sheets(f).Cells(l, c).Value
End Function

Function actn(l, c)
''' retourne les valeur de la feuille regle '''
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
        Q = srfc_c()
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
    j10 = srfc_c()
    Smm_Si = 0
    
    If condition <> "" Then
        Do While j <= cc
            If B Then
                j10 = j + 10
            End If
            Smm_Si = Smm_Si _
                + WorksheetFunction.SumIfs(Sheets(f).Range(Sheets(f).Cells(l, j10), Sheets(f).Cells(ll, j10)) _
                    , Sheets(f).Range(Sheets(f).Cells(l, j), Sheets(f).Cells(ll, j)) _
                    , actn(nom_l(), valeur) _
                    , Sheets(f).Range(Sheets(f).Cells(l, PLage_c()), Sheets(f).Cells(ll, PLage_c())) _
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
                    , actn(nom_l(), valeur))
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
''' retrouve l'age '''
'MsgBox cn & " : " & cases(f, l, deb_c() + cn + 20 - 1)
    If cn = 0 Then
    ''' si on est sur la prmier colone '''
        If cases(f, l, CRsi_c()) = "Vrai" Then
        ''' si c'est une coupe rase à l'origine '''
            AGql = anees(cn) - CSng(cases(f, l, ans_c())) - 2
        Else
            AGql = anees(cn) - CSng(cases(f, l, ans_c()))
        End If
    Else
        If CSng(cases(f, l, deb_c() + cn + 20 - 1)) = -1 Then
        ''' si cette année fait 2ans de surface ouverte '''
            c = estdans(actn(nom_l(), CR_c()), f, l, l, deb_c(), deb_c() + cn - 1)
            If c = 0 Then
            ''' si il n'y a pas de coupe race de 40ans precedament '''
                AGql = anees(cn) - CSng(cases(f, l, ans_c())) - 2
            Else
                AGql = cn - (c - deb_c()) - 2
            End If
        Else
            AGql = CSng(cases(f, l, deb_c() + cn + 20 - 1)) + 1
        End If
    End If
End Function

Function AGdr(f, l, c, DRcc)
    If DRcc = -1 Then
        DRcc = CCdr(f, l, c)
    End If

    If DRcc = PL_c() Then
        AGdr = actn(AGmnn_l(), DRcc)
    Else
        alpha = estdans(actn(nom_l(), DRcc), f, l, l, deb_c(), c) + 20
        If alpha = 20 Then
            AGdr = actn(AGmnn_l(), DRcc)
        Else
            AGdr = CSng(cases(f, l, alpha))
        End If
    End If
'MsgBox "AGdr " & AGdr
End Function

Sub svgrd(f, ln, lx, cn, cx)
    Call copie(f, rgl(), ln, lx, 3, cn, cx, 2)
End Sub

Sub chrg(f, l, c)
    Call copie(rgl(), f, 3, 3, l, 2, 11, c)
End Sub

Sub reste(valeur, f, l, lx, c, DRag)
    ''' reecie la ligne '''
    Dim c1, c10, c20, cc, ccj, k20 As Byte
    
    c10 = c + 10
    c20 = c + 20
    
    If valeur <> "" Then
        ''' si la cellue est non vide, on recher par ou on commence '''
        cc = estdans(valeur, rgl(), nom_l(), nom_l(), PL_c(), CR25_c())
    Else
        ''' si non on retrouve par son age '''
        cc = 2
        age = AGql(f, l, c - deb_c())
        Do While cc < CR_c() _
        And age > actn(AGmnn_l(), cc)
            cc = cc + 1
        Loop
    End If
    
    If DRag = -1 Then
        DRag = AGdr(f, l, c, -1)
    End If
'MsgBox DRag
    
    ccj = cc
    MNag = DRag + actn(AGmndc_l(), ccj)
    MXag = DRag + actn(AGmxdc_l(), ccj)
'MsgBox l & " " & MXag & " >= " & age & " >= " & MNag
    For k = c To fin_c()
        ccj1 = ccj
        k20 = k + 20
        Sheets(f).Cells(l, k) = ""
        age = AGql(f, l, k - deb_c())
'Sheets(f).Cells(l, k).Select
'MsgBox age
'MsgBox Sheets(f).Cells(l, k)
'MsgBox MNag & " : " & MXag
        If ccj = CR_c() Then
            If age >= actn(AGmndc_l(), CR_c()) Then
                Sheets(f).Cells(l, k).Value = actn(nom_l(), CR_c())
                ccj = PL_c()
                DRag = age
                MNag = actn(AGmndc_l(), PL_c())
                MXag = actn(AGmxdc_l(), PL_c())
            End If
        ElseIf ccj = CR25_c() Then
            If age >= actn(AGmndc_l(), CR25_c()) Then
                Sheets(f).Cells(l, k).Value = actn(nom_l(), CR25_c())
                ccj = PL_c()
                DRag = age
                MNag = actn(AGmndc_l(), PL_c())
                MXag = actn(AGmxdc_l(), PL_c())
            End If
        ElseIf ccj = PL_c() Then
'            If age >= actn( AGmndc_l(), ccj) _
            And age <= actn( AGmxdc_l(), ccj) Then
            If age >= actn(AGmndc_l(), ccj) Then
                Sheets(f).Cells(l, k).Value = actn(nom_l(), PL_c())
'                Sheets(f).Cells(l, PLage_c()).Value = 40
                If PL25() Then
                    Dim ecrtI, ecrtI2, somI, somI2 As Long
                    somI = Smm_Si(PL_c(), 40, f, 1, lx, k, k, False)
                    ecrtI = ptntl() - somI
                    somI2 = somI - CSng(cases(f, l, srfc_c()))
                    ecrtI2 = ptntl() - somI2
'                    If ecrtI2 < 0 _
                    Or Abs(ecrtI) > Abs(ecrtI2) Then
                    If Abs(ecrtI) > Abs(ecrtI2) Then
'MsgBox age
'MsgBox Sheets(f).Cells(l, c)
'MsgBox "1 cases = " & cases(f, l, Q(c10))
'MsgBox somI & " : " & somI2
'MsgBox ecrtI & " > " & ecrtI2
                        If k < fin_c() Then
                            Sheets(f).Range(Sheets(f).Cells(l, k + 1), Sheets(f).Cells(l, fin_c())).Clear
                        End If
                        Sheets(f).Cells(l, PLage_c()).Value = 25
                        Exit Sub
                    End If
                End If
                ccj = PL_c() + 1
                DRag = 0
                MNag = actn(AGmndc_l(), ccj)
                MXag = actn(AGmxdc_l(), ccj)
            End If
        Else
            If age >= MNag _
            And age <= MXag Then
'Sheets(f).Cells(l, c).Select
'MsgBox "2 cases = " & cases(f, l, Q(c10))
                Sheets(f).Cells(l, k).Value = actn(nom_l(), ccj)
                ccj = ccj + 1
                DRag = age
                MNag = DRag + actn(AGmndc_l(), ccj)
                MXag = DRag + actn(AGmxdc_l(), ccj)
                If MNag <= actn(AGmnn_l(), ccj) - 1 Then
                    MNag = actn(AGmnn_l(), ccj) - 1
                    MXag = actn(AGmnn_l(), ccj) + 2
                End If
            End If
        End If
'Sheets(FB()).Cells(l, k).Select
'MsgBox cases(f, l, k20) & " : " & actn( nom_l(), ccj) & " ; " & ccj & " " & cases(f, l, k20) & " >= " & actn( AGmn(), ccj) & " " & cases(f, l, k20) & " <= " & actn( AGmx(), ccj)
    Next
End Sub

Sub etalement(lx)
    Dim c10, ccn As Byte
    Dim ecrtI, ecrtI2, mnn, som, somI, somI2 As Long
    
    som = Smm_Si(CR_c(), "", FB(), deb_l(), lx, deb_c(), fin_c(), Q3()) _
    + Smm_Si(CR25_c(), "", FB(), deb_l(), lx, deb_c(), fin_c(), Q3())
    mnn = Q2(som / 10)
    
    For c = deb_c() To fin_c() - 1
        c10 = c + 10
        cn = c - deb_c()
        somI = Smm_Si(CR_c(), "", FB(), deb_l(), lx, c, c, Q3()) _
        + Smm_Si(CR25_c(), "", FB(), deb_l(), lx, c, c, Q3())
        ecrtI = mnn - somI
        For l = deb_l() To lx
'            If cases(FB(), l, c) = actn( nom_l(), CR_c()) _
            And AGql(FB(), l, cn) < actn( AGmxdc_l(), CR_c()) _
            And somme(FC(), deb_l(), lx, c10, c10 + 9) > 0 Then
            If cases(FB(), l, c) = actn(nom_l(), CR_c()) _
            And AGql(FB(), l, cn) < actn(AGmxdc_l(), CR_c()) Then
                somI2 = somI - CSng(cases(FB(), l, Q(c10)))
                ecrtI2 = mnn - somI2
'Sheets(FB()).Cells(l, c).Select
'MsgBox mnn & " : " & ecrtI & " > " & ecrtI2
                If ecrtI2 < 0 _
                Or Abs(ecrtI) > Abs(ecrtI2) Then
                    Sheets(FB()).Cells(l, c).Clear
                    Call reste(actn(nom_l(), CR_c()), FB(), l, lx, c + 1, -1)
                    som = Smm_Si(CR_c(), "", FB(), deb_l(), lx, deb_c() + cn, fin_c(), Q3()) _
                    + Smm_Si(CR25_c(), "", FB(), deb_l(), lx, deb_c(), fin_c(), Q3())
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
''' Ajoute CR25 jusqua que la surface total soit egale a la posibilité '''
    Dim c10, c20 As Byte
    Dim ecrtI0, ecrtI1, somI0, somI1 As Long
    
    For c = deb_c() To fin_c()
        c10 = c + 10
        c20 = c + 20
        somI0 = Round(Smm_Si(CR_c(), "", FB(), deb_l(), lx, c, c, False) _
        + Smm_Si(CR25_c(), "", FB(), deb_l(), lx, c, c, False), 4)
        ecrtI0 = Round(ptntl() - somI0, 4)
        For l = deb_l() To lx
            If estdans(actn(nom_l(), CR_c()), FB(), l, l, deb_c(), fin_c()) = 0 _
            And estdans(actn(nom_l(), CR25_c()), FB(), l, l, deb_c(), fin_c()) = 0 Then
                If CSng(cases(FB(), l, c20)) >= 25 Then
                    somI1 = somI0 + CSng(cases(FB(), l, srfc_c()))
                    ecrtI1 = ptntl() - somI1
 '                   If ecrtI1 > 0 _
                    Or Abs(ecrtI0) > Abs(ecrtI1) Then
'Sheets(FB()).Cells(l, c).Select
'MsgBox CSng(cases(FB(), l, srfc_c()))
'MsgBox somI0 & " : " & somI1
'MsgBox ecrtI0 & " > " & ecrtI1
                    If ecrtI1 > 0 _
                    And Abs(ecrtI0) > Abs(ecrtI1) Then
                        Sheets(FB()).Range(Sheets(FB()).Cells(l, deb_c()), Sheets(FB()).Cells(l, c)).Clear
                        Sheets(FB()).Cells(l, c).Value = actn(nom_l(), CR25_c())
                        Call reste(actn(nom_l(), PL_c()), FB(), l, lx, c + 1, -1)
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
    For l = deb_l() To lx
'Sheets(FB()).Cells(l, deb_c()).Select
        Call reste(cases(FB(), l, deb_c()), FB(), l, lx, deb_c(), -1)
    Next
End Sub

Sub prcr_3(mnn, l_fin, c, B)
    Dim age, c1, c10, c20, cn10, cx10, ccn As Byte
    Dim ecrtI0, ecrtI1, somI0, somI1 As Long
    Dim lc As String
    
    c10 = c + 10
    c20 = c + 20
    cn = c - deb_c()
    somI0 = somme(FC(), deb_l(), l_fin, c10, c10)
    ecrtI0 = mnn - somI0
    For l = deb_l() To l_fin
        vlr_ctg = cases(FC(), l, c)
'        If vlr_ctg <> "" Then
        If vlr_ctg <> "" _
        And (Not CRetlr() _
            Or (CRetlr() _
                And vlr_ctg <> actn(nom_l(), CR_c()) _
                And vlr_ctg <> actn(nom_l(), CR25_c()) _
                ) _
            ) Then
'Sheets(FC()).Cells(l, c).Select
            age = AGql(FC(), l, cn)
            DRcc = CCdr(FC(), l, c)
            DRag = AGdr(FC(), l, c, DRcc)
            If DRcc = 9 Then
                MXag = actn(AGmxdc_l(), DRcc + 1)
            ElseIf DRcc = 2 Then
                MXag = actn(AGmxdc_l(), DRcc)
            Else
                MXag = DRag + actn(AGmxdc_l(), DRcc + 1)
            End If
'MsgBox l & " " & c & " " & DRcc & " : " & age & " < " & MXag
            If age < MXag Then
                vlr_bdjt = CSng(cases(FC(), l, c10))
                somI1 = somI0 - vlr_bdjt
                ecrtI1 = mnn - somI1
'MsgBox vlr_bdjt & ", " & mnn & " : " & somI1
'MsgBox mnn & " : " & ecrtI0 & " > " & ecrtI1
                If Abs(ecrtI0) > Abs(ecrtI1) _
                And (vlr_bdjt < 0 And mnn > somI1 _
                Or vlr_bdjt > 0 And mnn < somI1) Then
                'If (somI1 < 0 And CSng(cases(FC(), l, c10)) < 0) _
                Or Abs(ecrtI0) > Abs(ecrtI1) Then
                    Sheets(FC()).Cells(l, c).Clear
                    Call colorer(6, FC(), l, l, c, c)
                    Call reste(vlr_ctg, FC(), l, l_fin, c + 1, DRag)
                    somI0 = somI1
                    ecrtI0 = ecrtI1
                    If B Then
                        mnn = somme(FC(), deb_l(), l_fin, deb_c() + 10 + cn, fin_c() + 10) / (10 - cn)
                    End If
                End If
            End If
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

Sub modif3()
''' réecrie le programe de travaux '''
Call trier_taille("prog")
Call trier_event("objtevnt")

Dim l, ll As Byte
Dim cc_cod, cc_date, cc_eta, ccident As Byte
Dim a, age, cn, rc As Byte
Dim ident As String
l = 2
ll = 2
cc_id = estdans("gid", "objtevnt", 1, 1, 1, 50)
cc_eta = estdans("EVT_ETA_N", "objtevnt", 1, 1, 1, 50)
cc_date = estdans("EVT_DAT_D", "objtevnt", 1, 1, 1, 50)
cc_cod = estdans("EVT_COD_T", "objtevnt", 1, 1, 1, 50)
Do While cases("prog", l, 1) <> ""
''' faire toute les parcelles '''
    Sheets("objtevnt").Range(Sheets("objtevnt").Cells(l, deb_c()), Sheets("objtevnt").Cells(l, fin_c())).Clear
    Do While cases("objtevnt", ll, cc_id) = cases("prog", l, 3)
    ''' tant que l'indente corespon, on supose que des parcelles avec le meme ident n'on pas non plus une surface proche '''
        If cases("objtevnt", ll, cc_eta) <> "0" Then
        ''' si il n'est pas abendoné '''
            a = Year(cases("objtevnt", ll, cc_date))
            cn = a - cases(rgl(), 2, 2)
            If cn > 0 And cn < 10 Then
            ''' si il est dans l'interval '''
                age = a - cases("prog", l, ans_c())
                For rc = 2 To 11
                    If age = actn(AGmnn_l(), rc) Then
                        If rc = 2 Then
                            If cases("ojtevnt", ll, cc_cod) Like "PLA_*" _
                            Or cases("ojtevnt", ll, cc_cod) Like "SL_*" _
                            Or cases("ojtevnt", ll, cc_cod) Like "SN_*" _
                            Or cases("ojtevnt", ll, cc_cod) Like "TAIL_*" Then
                                Sheets(f).Cells(l, deb_c() + cn) = actn(nom_l(), rc)
                            End If
                        ElseIf rc < 6 Then
                            If cases("ojtevnt", ll, cc_cod) = "DEBLIG" Then
                                Sheets(f).Cells(l, deb_c() + cn) = actn(nom_l(), rc)
                            End If
                        ElseIf rc > 9 Then
                            If cases("ojtevnt", ll, cc_cod) Like "CR_*" Then
                                Sheets(f).Cells(l, deb_c() + cn) = actn(nom_l(), rc)
                            End If
                        ElseIf cases("ojtevnt", ll, cc_cod) Like "CE#" Then
                            Sheets(f).Cells(l, deb_c() + cn) = actn(nom_l(), rc)
                        End If
                    End If
                Next
            End If
        End If
        ll = ll + 1
    Loop
    l = l + 1
Loop
End Sub
