
${SegmentFile}

${Segment.OnInit}
	; Borrowed the following from PAL 2.2, Remove on release of PAL 2.2
		; Work out if it's 64-bit or 32-bit
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
        System::Call kernel32::Wow64EnableWow64FsRedirection(i0)
	${If} $0 == 0
		StrCpy $Bits 32
	${Else}
		StrCpy $Bits 64
	${EndIf}
!macroend

${SegmentPrePrimary}
    ${If} $Bits = 64
		Rename "$EXEDIR\App\PartAssist\loaddrv.exe" "$EXEDIR\App\PartAssist\loaddrv,1.exe"
		Rename "$EXEDIR\App\PartAssist\loaddrv,2.exe" "$EXEDIR\App\PartAssist\loaddrv.exe"
		Rename "$EXEDIR\Data\win\ampa.exe" "$EXEDIR\Data\win\ampa,2.exe"
		Rename "$EXEDIR\Data\win\ampa,4.exe" "$EXEDIR\Data\win\ampa.exe"
		Rename "$EXEDIR\Data\win\system32\ampa.sys" "$EXEDIR\Data\win\system32\ampa,2.sys"
		Rename "$EXEDIR\Data\win\system32\ampa,4.sys" "$EXEDIR\Data\win\system32\ampa.sys"
	${Else}
		Rename "$EXEDIR\App\PartAssist\loaddrv.exe" "$EXEDIR\App\PartAssist\loaddrv,2.exe"
		Rename "$EXEDIR\App\PartAssist\loaddrv,1.exe" "$EXEDIR\App\PartAssist\loaddrv.exe"
		Rename "$EXEDIR\Data\win\ampa.exe" "$EXEDIR\Data\win\ampa,4.exe"
		Rename "$EXEDIR\Data\win\ampa,2.exe" "$EXEDIR\Data\win\ampa.exe"
		Rename "$EXEDIR\Data\win\system32\ampa.sys" "$EXEDIR\Data\win\system32\ampa,4.sys"
		Rename "$EXEDIR\Data\win\system32\ampa,2.sys" "$EXEDIR\Data\win\system32\ampa.sys"
        ${EndIf}
		CopyFiles /SILENT "$EXEDIR\Data\win\ampa.exe" "$WINDIR"
		CopyFiles /SILENT "$EXEDIR\Data\win\system32\ampa.sys" "$SYSDIR"
!macroend
${SegmentPostPrimary}
                Delete "$WINDIR\ampa.exe"
                Delete "$SYSDIR\ampa.sys"
!macroend