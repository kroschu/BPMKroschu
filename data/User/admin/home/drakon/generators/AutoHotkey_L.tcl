gen::add_generator AutoHotkey_L gen_AutoHotkey_L::generate

namespace eval gen_AutoHotkey_L {

variable keywords {
and or not
Break Continue Exit ExitApp Gosub Goto If Else IfEqual IfExist IfGreater IfGreaterOrEqual IfInString IfLess IfLessOrEqual IfMsgBox IfNotEqual IfNotExist IfNotInString IfWinActive IfWinExist IfWinNotActive IfWinNotExist Loop OnExit Pause Return SetTimer Shutdown
HKEY_LOCAL_MACHINE HKEY_USERS HKEY_CURRENT_USER HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKLM HKU HKCU HKCR HKCC REG_SZ REG_EXPAND_SZ REG_MULTI_SZ REG_DWORD REG_BINARY
}

# Autogenerated with DRAKON Editor 1.29

proc assign { variable value } {
    #item 1398
    return "$variable := $value"
}

proc bad_case { switch_var select_icon_number } {
    #item 1408
    return "Msgbox, Error. Unexpected value in Switch macroicon.`n`nNumber\
    of Select icon: $select_icon_number .`n`nScript will exit now to prevent any unintended behavior.\nExitApp"
}

proc block_close { output depth } {
    #item 1787
    upvar 1 $output result
    set line [ gen::make_indent $depth ]
    append line "\}"
    lappend result $line
}

proc commentator { text } {
    #item 143
    return "; $text"
}

proc compare { variable constant } {
    #item 1404
    return "$variable = $constant"
}

proc declare { type name value } {
    #item 1434
    return "$name := $value"
}

proc else_start { } {
    #item 1805
    return "\} else \{"
}

proc elseif_start { } {
    #item 1809
    return "\} else if \("
}

proc extract_signature { text name } {
    #item 783
    array set props { type function access public }
    set error_message ""
    set parameters {}
    #item 15
    set lines [ gen::separate_from_comments $text ]
    #item 17
    if {[ llength $lines ] == 0} {
        
    } else {
        #item 16
        set first_line [ lindex $lines 0 ]
        set first [ lindex $first_line 0 ]
        #item 1566
        set start_index 0
        #item 34
        set count [ llength $lines ]
        #item 370001
        set i $start_index
        while { 1 } {
            #item 370002
            if {$i < $count} {
                
            } else {
                break
            }
            #item 36
            set current [ lindex $lines $i ]
            #item 45
            lappend parameters $current
            #item 370003
            incr i
        }
    }
    #item 793
    set prop_list [ array get props ]
    #item 38
    return [ list $error_message \
    [ gen::create_signature $props(type) $prop_list $parameters "" ] ]
}

proc foreach_check { item_id first second } {
    #item 1676
    set vars [ split_vars $item_id $first ]
    #item 1677
    set var1 [ lindex $vars 0 ]
    #item 1678
    return "$var1 ~= nil"
}

proc foreach_current { item_id first second } {
    #item 1610
    return ""
}

proc foreach_declare { item_id first second } {
    #item 1667
    set iter_var "_iter$item_id"
    set state_var "_state$item_id"
    #item 1618
    return "local $iter_var, $state_var, $first"
}

proc foreach_incr { item_id first second } {
    #item 1673
    set vars [ split_vars $item_id $first ]
    #item 1675
    set iter_var "_iter$item_id"
    set state_var "_state$item_id"
    #item 1674
    set var1 [ lindex $vars 0 ]
    #item 1672
    return "$first = $iter_var\($state_var, $var1\)"
}

proc foreach_init { item_id first second } {
    #item 1668
    set vars [ split_vars $item_id $first ]
    #item 1671
    set iter_var "_iter$item_id"
    set state_var "_state$item_id"
    #item 1669
    set var1 [ lindex $vars 0 ]
    #item 1670
    return "$iter_var, $state_var, $var1 = $second $first = $iter_var\($state_var, $var1\)"
}

proc generate { db gdb filename } {
    #item 1767
    set diagrams [ $gdb eval {
    	select diagram_id
    	from vertices
    	group by diagram_id
    } ]
    foreach diagram_id $diagrams {
        #item 1766
        rewire_AutoHotkey_L_for $gdb $diagram_id
    }
    #item 1284
    set callbacks [ make_callbacks ]
    #item 1278
    gen::fix_graph $gdb $callbacks 0
    #item 1279
    set sections { header footer }
    unpack [ gen::scan_file_description $db $sections ] \
    header footer
    #item 1270
    set functions [ gen::generate_functions $db $gdb  \
    	$callbacks 1 ]
    #item 1261
    if {[ graph::errors_occured ]} {
        
    } else {
        #item 1280
        set filename [ replace_extension $filename "ahk" ]
        #item 1860
        if {$header == ""} {
            
        } else {
            #item 1858
            set header "\n\n\;Header starts here.\n$header\nreturn\
            ;This \"return\" is here\
            to prevent unintended execution of code.\n;Header ends here.\n"
        }
        #item 1863
        if {$footer == ""} {
            
        } else {
            #item 1859
            set footer "\n\;Footer starts here.\nreturn\
            ;This \"return\" is here\
            to prevent unintended execution of code.\n$footer\n;Footer ends here."
        }
        #item 1282
        set fhandle [ open_output_file $filename ]
        
        catch {
        	print_to_file $fhandle $functions \
        		$header $footer
        } error_message
        
        catch { close $fhandle }
        #item 1262
        if {$error_message == ""} {
            
        } else {
            #item 1263
            puts $::errorInfo
            error $error_message
        }
    }
}

proc generate_body { gdb diagram_id start_item node_list items incoming } {
    #item 1512
    set callbacks [ make_callbacks ]
    #item 1511
    cbody::generate_body $gdb $diagram_id $start_item $node_list \
        $items $incoming $callbacks
}

proc goto { text } {
    #item 1644
    return "goto, $text"
}

proc highlight { tokens } {
    #item 1889
    set result {}
    #item 1890
    set state "idle"
    #item 1930
    variable keywords
    foreach token $tokens {
        #item 1978
        lassign $token type text
        #item 18910001
        if {$state == "idle"} {
            #item 19060001
            if {$text == "\""} {
                #item 1931
                lappend result \
                  $colors::syntax_string
                #item 1913
                set state "string"
            } else {
                #item 19060002
                if {$text == ";"} {
                    #item 1972
                    lappend result \
                      $colors::syntax_comment
                    #item 1971
                    set state "comment"
                } else {
                    #item 19160001
                    if {$type == "op"} {
                        #item 1924
                        lappend result \
                          $colors::syntax_operator
                    } else {
                        #item 19160002
                        if {$type == "number"} {
                            #item 1923
                            lappend result \
                              $colors::syntax_number
                        } else {
                            #item 19160003
                            if {($type == "token") && ([contains $keywords $text])} {
                                #item 1928
                                lappend result \
                                  $colors::syntax_keyword
                            } else {
                                #item 1925
                                lappend result \
                                  $colors::syntax_identifier
                            }
                        }
                    }
                }
            }
        } else {
            #item 18910002
            if {$state == "string"} {
                #item 19330001
                if {$text == "\""} {
                    #item 1940
                    lappend result \
                      $colors::syntax_string
                    #item 1941
                    set state "idle"
                } else {
                    #item 19330002
                    if {$text == "`"} {
                        #item 1979
                        lappend result \
                          $colors::syntax_string
                        #item 1942
                        set state "escaping"
                    } else {
                        #item 19330003
                        if {$text == "\n"} {
                            #item 1980
                            lappend result \
                              $colors::syntax_string
                            #item 1945
                            set state "idle"
                        } else {
                            #item 1981
                            lappend result \
                              $colors::syntax_string
                        }
                    }
                }
            } else {
                #item 18910003
                if {$state == "escaping"} {
                    #item 1947
                    lappend result $colors::syntax_string
                    #item 1963
                    if {$text == "\n"} {
                        #item 1965
                        set state "idle"
                    } else {
                        #item 1946
                        set state "string"
                    }
                } else {
                    #item 18910004
                    if {$state == "comment"} {
                        
                    } else {
                        #item 18910005
                        error "Unexpected switch value: $state"
                    }
                    #item 1973
                    lappend result \
                      $colors::syntax_comment
                    #item 1974
                    if {$text == "\n"} {
                        #item 1976
                        set state "idle"
                    } else {
                        
                    }
                }
            }
        }
    }
    #item 1888
    return $result
}

proc if_end { } {
    #item 1797
    return "\) \{"
}

proc if_start { } {
    #item 1801
    return "if \("
}

proc is_for { text } {
    #item 1684
    set trimmed [ string trim $text]
    #item 1685
    set result [ string match "for *" $trimmed ]
    #item 1686
    return $result
}

proc make_callbacks { } {
    #item 1192
    set callbacks {}
    #item 1194
    gen::put_callback callbacks assign    gen_AutoHotkey_L::assign
    gen::put_callback callbacks compare   gen_AutoHotkey_L::compare
    gen::put_callback callbacks compare2  gen_AutoHotkey_L::compare
    gen::put_callback callbacks bad_case  gen_AutoHotkey_L::bad_case
    
    gen::put_callback callbacks body      gen_AutoHotkey_L::generate_body
    gen::put_callback callbacks signature gen_AutoHotkey_L::extract_signature
    gen::put_callback callbacks and       gen_AutoHotkey_L::p.and
    gen::put_callback callbacks or        gen_AutoHotkey_L::p.or
    gen::put_callback callbacks not       gen_AutoHotkey_L::p.not
    gen::put_callback callbacks declare   gen_AutoHotkey_L::declare
    
    gen::put_callback callbacks comment   gen_AutoHotkey_L::commentator
    #item 1505
    gen::put_callback callbacks if_start     gen_AutoHotkey_L::if_start
    gen::put_callback callbacks while_start     gen_AutoHotkey_L::while_start
    gen::put_callback callbacks elseif_start     gen_AutoHotkey_L::elseif_start
    gen::put_callback callbacks if_end       gen_AutoHotkey_L::if_end
    gen::put_callback callbacks pass       gen_AutoHotkey_L::pass
    gen::put_callback callbacks else_start   gen_AutoHotkey_L::else_start
    gen::put_callback callbacks block_close  gen_AutoHotkey_L::block_close
    gen::put_callback callbacks return_none  gen_AutoHotkey_L::return_none
    gen::put_callback callbacks goto         gen_AutoHotkey_L::goto
    gen::put_callback callbacks tag          gen_AutoHotkey_L::tag
    gen::put_callback callbacks break        "break"
    #item 1619
    gen::put_callback callbacks for_check		gen_AutoHotkey_L::foreach_check
    gen::put_callback callbacks for_current		gen_AutoHotkey_L::foreach_current
    gen::put_callback callbacks for_init		gen_AutoHotkey_L::foreach_init
    gen::put_callback callbacks for_incr		gen_AutoHotkey_L::foreach_incr
    gen::put_callback callbacks for_declare		gen_AutoHotkey_L::foreach_declare
    gen::put_callback callbacks shelf gen_AutoHotkey_L::shelf
    #item 1193
    return $callbacks
}

proc normalize_for { var start end } {
    #item 1726
    return "$var := $start; $var <= $end; $var := $var + 1"
}

proc p.and { left right } {
    #item 1414
    return "($left) && ($right)"
}

proc p.not { operand } {
    #item 1426
    return "!($operand)"
}

proc p.or { left right } {
    #item 1422
    return "($left) || ($right)"
}

proc parse_for { item_id text } {
    #item 1692
    set tokens [ to_tokens $text ]
    #item 1711
    if {[ llength $tokens ] < 6} {
        #item 1714
        error "Wrong 'for' syntax in item $item_id"
    } else {
        #item 1694
        unpack $tokens for var eq start comma
        #item 1715
        if {$for == "for"} {
            #item 1868
            if {$eq == ":"} {
                #item 1869
                unpack $tokens for var ahk_eqfirst ahk_eqsecond start comma
                #item 1870
                set eq "$ahk_eqfirst$ahk_eqsecond"
            } else {
                
            }
            #item 1867
            if {($eq == "=" || $eq == ":=") && ($comma == "\;")} {
                #item 1718
                set comma_index [ string first "\;" $text ]
                #item 1719
                set target_index [ expr { $comma_index + 1 } ]
                set target [ string range $text $target_index end ]
                set end [ string trim $target ]
                #item 1720
                return [ list $var $start $end ]
            } else {
                #item 1714
                error "Wrong 'for' syntax in item $item_id"
            }
        } else {
            #item 1714
            error "Wrong 'for' syntax in item $item_id"
        }
    }
}

proc parse_foreach { item_id init } {
    #item 1625
    set length [ llength $init ]
    #item 1627
    if {$length == 2} {
        
    } else {
        #item 1626
        set message "item id: $item_id, wrong syntax in foreach. Should be: Type variable; collection"
    }
    #item 1630
    return $init
}

proc pass { } {
    #item 1781
    return ""
}

proc print_function { fhandle function } {
    #item 1571
    unpack $function diagram_id name signature body
    unpack $signature type prop_list parameters returns
    array set props $prop_list
    #item 1812
    set ahk_searchresultcomment [string match -nocase "Comment_*" $name]
    set ahk_searchresultfree [string match -nocase "Free_*" $name]
    set ahk_searchresulthotkey [string match "*::*" $name]
    #item 1854
    if {$ahk_searchresultcomment == 1} {
        #item 1856
        set ahk_diagramtype "comment"
    } else {
        #item 1816
        if {$ahk_searchresultfree == 1} {
            #item 1818
            set ahk_diagramtype "free"
        } else {
            #item 1820
            if {$ahk_searchresulthotkey == 1} {
                #item 1822
                set ahk_diagramtype "hotkey"
            } else {
                #item 1823
                set ahk_diagramtype function
            }
        }
    }
    #item 1572
    set type   $props(type)
    set access $props(access)
    #item 1576
    set line ""
    set result {}
    #item 1813
    if {$ahk_searchresultfree == 1 && $ahk_searchresulthotkey == 1 && $ahk_searchresultcomment !=1} {
        #item 1817
        error "Diagram \"$name\"\
        cant be Hotkey type and Free type at the same time.\
        Diagram \"$name\" is not generated."
    } else {
        #item 1857
        if {$ahk_diagramtype == "comment"} {
            
        } else {
            #item 1872
            append line "\n"
            #item 1833
            if {$ahk_diagramtype == "free"} {
                #item 1852
                append line "\;Diagram \"$name\"."
                #item 1851
                append line "\nreturn ;This \"return\" is here\
                to protect Free type diagram from unintended execution."
                #item 1842
                append line "\n$name\:"
                #item 1853
                append line "\n\{\} \;This empty block\
                is there to prevent error caused by\
                interaction of label and other code\
                \(for example function definition\)."
            } else {
                #item 1824
                if {$ahk_diagramtype == "hotkey"} {
                    #item 1850
                    append line "return ;This \"return\" is here\
                    to protect Hotkey type diagram from unintended execution."
                    #item 1827
                    append line "\n$name"
                } else {
                    #item 1873
                    append line "return ;This \"return\" is here\
                    to prevent unintended execution of code."
                    #item 536
                    append line "\n$name\("
                }
            }
            #item 1848
            if {($ahk_diagramtype == "free") || ($ahk_diagramtype == "hotkey")} {
                
            } else {
                #item 588
                set param_count [ llength $parameters ]
                #item 5400001
                set i 0
                while { 1 } {
                    #item 5400002
                    if {$i < $param_count} {
                        
                    } else {
                        break
                    }
                    #item 543
                    set parameter_info [ lindex $parameters $i ]
                    set parameter [ lindex $parameter_info 0 ]
                    #item 541
                    append line $parameter
                    #item 544
                    if {$i == $param_count - 1} {
                        
                    } else {
                        #item 545
                        append line ", "
                    }
                    #item 5400003
                    incr i
                }
                #item 542
                append line "\) \{"
            }
            #item 552
            lappend result $line
            foreach line $body {
                #item 582
                lappend result "    $line"
            }
            #item 1835
            if {($ahk_diagramtype == "free") || ($ahk_diagramtype == "hotkey")} {
                #item 1832
                lappend result "return"
            } else {
                #item 1831
                lappend result "    return"
                #item 585
                lappend result "\}"
            }
            foreach line $result {
                #item 1022
                puts $fhandle $line
            }
            #item 1023
            puts $fhandle ""
        }
    }
}

proc print_to_file { fhandle functions header footer } {
    #item 1561
    put_credits $fhandle
    #item 1559
    puts $fhandle $header
    foreach function $functions {
        #item 1570
        print_function $fhandle $function
    }
    #item 1560
    puts $fhandle $footer
}

proc put_credits { fhandle } {
    #item 180
    set version [ version_string ]
    puts $fhandle \
        "; Autogenerated with DRAKON Editor $version\n\; AutoHotkey_L beta v1.8 code generator used"
}

proc return_none { } {
    #item 1640
    return "return"
}

proc rewire_AutoHotkey_L_for { gdb diagram_id } {
    #item 1732
    set starts [ $gdb eval {
    	select vertex_id
    	from vertices
    	where type = 'loopstart'
    		and text like 'for %'
    		and diagram_id = :diagram_id
    } ]
    #item 1733
    set loop_vars {}
    foreach vertex_id $starts {
        #item 1736
        unpack [ $gdb eval { 
        	select text, item_id
        	from vertices
        	where vertex_id = :vertex_id
        } ] text item_id
        #item 1737
        unpack [ parse_for $item_id $text ] var start end
        #item 1738
        set new_text [ normalize_for $var $start $end ]
        #item 1739
        $gdb eval {
        	update vertices
        	set text = :new_text
        	where vertex_id = :vertex_id
        }
        #item 1740
        lappend loop_vars $var
    }
    #item 1753
    set var_list [ lsort -unique $loop_vars ]
    #item 1759
    if {$var_list == {}} {
        
    } else {
        #item 1755
        set vars_comma [ join $var_list ", " ]
        #item 1756
        set declaration ""
        #item 1757
        gen::p.save_declare_kernel $gdb $diagram_id $declaration
    }
}

proc shelf { primary secondary } {
    #item 1793
    return "$secondary := $primary"
}

proc split_vars { $item_id var_list } {
    #item 1652
    set raw [ split $var_list "," ]
    #item 1653
    set result {}
    foreach part $raw {
        #item 1657
        set stripped [ string trim $part ]
        #item 1658
        if {$stripped == ""} {
            
        } else {
            #item 1661
            lappend result $stripped
        }
    }
    #item 1663
    if {$result == {}} {
        #item 1662
        error "Bad variable list in $item_id"
    } else {
        
    }
    #item 1654
    return $result
}

proc tag { text } {
    #item 1634
    return "$text\:"
}

proc to_tokens { text } {
    #item 1700
    set tokens [ search::to_tokens $text ]
    #item 1701
    set result {}
    foreach token $tokens {
        #item 1705
        set text [ lindex $token 0 ]
        #item 1706
        set trimmed [ string trim $text ]
        #item 1708
        if {$trimmed == ""} {
            
        } else {
            #item 1707
            lappend result $text
        }
    }
    #item 1702
    return $result
}

proc while_start { } {
    #item 1777
    return "Loop, \{"
}

}
