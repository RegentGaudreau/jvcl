{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvDBEditors.PAS, released on 2002-05-26.

The Initial Developer of the Original Code is John Doe.
Portions created by John Doe are Copyright (C) 2003 John Doe.
All Rights Reserved.

Contributor(s):

Last Modified: 2003-11-09

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I jvcl.inc}
unit JvDBGridExportEditors;

interface

uses
  Classes,
  {$IFDEF COMPILER6_UP}
  DesignIntf, DesignEditors, VCLEditors;
  {$ELSE}
  DsgnIntf;
  {$ENDIF COMPILER6_UP}

type
  TDBGridExportWordFormatProperty = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetValue: String; override;
    procedure SetValue(const Value: String); override;
  end;

implementation
uses
  SysUtils, JvDBGridExport;

{ TDBGridExportWordFormatProperty }

function TDBGridExportWordFormatProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paMultiSelect, paRevertable];
end;

function TDBGridExportWordFormatProperty.GetValue: String;
begin
  if not IntToWordGridFormatIdent(GetOrdValue, Result) then
    Result := IntToStr(GetOrdValue);
end;

procedure TDBGridExportWordFormatProperty.GetValues(Proc: TGetStrProc);
begin
  GetWordGridFormatValues(Proc);
end;

procedure TDBGridExportWordFormatProperty.SetValue(const Value: String);
var i:integer;
begin
  if WordGridFormatIdentToInt(Value,i) then
    SetOrdValue(i)
  else
    raise Exception.Create('Invalid property value');
end;

end.
