#requires -Version 3.0

<#

    Author: Pen Warner
    Version: 1.0 Initial Release
    Version History:

    Purpose: PowerShell WPF Wizard Template

#>

#region XAML window definition
$xaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    MinWidth="400"
    Width ="800"
    Height="600"
    Title="PowerShell WPF Wizard Template"
    Topmost="True">
    <Grid Margin="0" Background="#fff" >

        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <TextBlock Grid.Column="0" Grid.Row="0" Grid.ColumnSpan="2" Margin="10" FontSize="18">Welcome to the PensPlace PowerShell WPF Wizard Template</TextBlock>
        <TabControl Name="wizardPages" HorizontalAlignment="Left" Height="472" Margin="10,-5,0,0" Grid.Row="1" VerticalAlignment="Top" Width="760" Grid.ColumnSpan="2" Grid.RowSpan="3">
            <TabItem Name="Step1" Header="Select Folder">
                <Grid Background="#ededed" Margin="0,0,0,0">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="150"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="35"/>
                        <RowDefinition Height="35"/>
                        <RowDefinition Height="35"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>
                    <TextBlock x:Name="txtDocFolder" HorizontalAlignment="Left" Margin="0,6,0,5" Grid.Row="1" TextWrapping="Wrap" Text="Select Folder to Import:" VerticalAlignment="Center" Height="24" Width="150" TextAlignment="Right" LineHeight="12"/>
                     <TextBox x:Name="DocFolder" Grid.Column="1" HorizontalAlignment="Left" Height="23" Margin="5,5,0,0" Grid.Row="1" TextWrapping="Wrap" VerticalAlignment="Top" Width="450"/>
                     <Button x:Name="SelectDocumentRootFolderBtn" Content="Browse" Grid.Column="1" HorizontalAlignment="Left" Margin="460,6,0,0" Grid.Row="1" VerticalAlignment="Top" Width="74"/>
                      <TextBlock x:Name="txtStep1Info" HorizontalAlignment="Left" Margin="0,6,0,5" Grid.Row="2" Grid.Column="2" TextWrapping="Wrap" Text="Select a folder to validate the tab and enable step 2" VerticalAlignment="Center" Height="24" Width="400" TextAlignment="Right" LineHeight="12"/>
                </Grid>
            </TabItem>
            <TabItem Name="TabStep2" Header="Step 2" IsEnabled="False">
                <Grid Background="#ededed">
                    <TextBlock x:Name="step2InfoText" HorizontalAlignment="Left" Margin="103,20,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Enter text to enable step 3" />
                    <TextBox Name="TestStep2" HorizontalAlignment="Left" Height="23" Margin="103,50,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209"/>
                    <TextBlock x:Name="testTextChanged2" HorizontalAlignment="Left" Margin="103,80,0,0" TextWrapping="Wrap" VerticalAlignment="Top"/>
                </Grid>
            </TabItem>
            <TabItem Name="TabStep3" Header="Step 3" IsEnabled="False">
                <Grid Background="#ededed">
                    <TextBlock x:Name="step3InfoText" HorizontalAlignment="Left" Margin="103,20,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Enter text to enable step 4" />
                    <TextBox Name="TestStep3" HorizontalAlignment="Left" Height="23" Margin="103,50,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209"/>
                    <TextBlock x:Name="testTextChanged3" HorizontalAlignment="Left" Margin="103,80,0,0" TextWrapping="Wrap" VerticalAlignment="Top"/>
                </Grid>
            </TabItem>
            <TabItem Name="TabStep4" Header="Step 4" IsEnabled="False">
                <Grid Background="#ededed">
                  <TextBlock x:Name="step4InfoText" HorizontalAlignment="Left" Margin="103,20,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Enter text to enable step 5" />
                    <TextBox Name="TestStep4" HorizontalAlignment="Left" Height="23" Margin="103,50,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209"/>
                    <TextBlock x:Name="testTextChanged4" HorizontalAlignment="Left" Margin="103,80,0,0" TextWrapping="Wrap" VerticalAlignment="Top"/>
                </Grid>
            </TabItem>
            <TabItem Name="TabStep5" Header="Step 5" IsEnabled="False">
                <Grid Background="#ededed">
                <TextBlock x:Name="step5Text" HorizontalAlignment="Left" Margin="103,20,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Text="Congratulations you made it to step 5, click Finish to close" />
                
                </Grid>
            </TabItem>
        </TabControl>

        <StackPanel Orientation="Horizontal" HorizontalAlignment="Left" VerticalAlignment="Bottom" Margin="5,10,0,5" Grid.Row="3" Grid.Column="1">
            <Button Name="ButBack" MinWidth="80" Height="22" Margin="5" IsEnabled="False">&lt; Back</Button>
        </StackPanel>
        <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Bottom" Margin="0,0,10,5" Grid.Row="3" Grid.Column="1">
            <Button Name="ButNext" MinWidth="80" Height="22" Margin="5" IsEnabled="False">Next &gt;</Button>
            <Button Name="ButCancel" MinWidth="80" Height="22" Margin="5">Cancel</Button>
            <Button Name="ButFinish" MinWidth="80" Height="22" Margin="5" IsEnabled="False">Finish</Button>
        </StackPanel>
        <Image Name="logo" Grid.ColumnSpan="2" HorizontalAlignment="Left" Height="44" Margin="638,10,0,0" VerticalAlignment="Top" Width="132" Source="/pp_logo.png" />
    </Grid>
</Window>
'@
#endregion

#region Code Behind
function Validate-WizardPage
{
  <#
      Add TabPages and place the validation code in this function
  #>
  [OutputType([boolean])]
  param($WizardPage)
		
  if($WizardPage -eq 0)
  {
    #TODO: Enter Validation Code here for Step 1
    if($window.DocFolder.Text)
    {
      $window.TabStep2.IsEnabled = $true
      return $true	
    }
    $window.TabStep2.IsEnabled = $false
    $window.TabStep3.IsEnabled = $false
    $window.TabStep4.IsEnabled = $false
    $window.TabStep5.IsEnabled = $false
    return $false
  }
  elseif ($WizardPage -eq 1)
  {
    #TODO: Enter Validation Code here for Step 2 
    if($window.TestStep2.Text)
    {
      $window.TabStep3.IsEnabled = $true
      return $true	
    }
    $window.TabStep3.IsEnabled = $False
    $window.TabStep4.IsEnabled = $false
    $window.TabStep5.IsEnabled = $false
    
    return $false
  }
  elseif ($WizardPage -eq 2)
  {
    #TODO: Enter Validation Code here for Step 3
    if($window.TestStep3.Text)
    {
      $window.TabStep4.IsEnabled = $true
      return $true	
    }
    $window.TabStep4.IsEnabled = $false
    $window.TabStep5.IsEnabled = $false
    return $false
  }
  elseif ($WizardPage -eq 3)
  {
    #TODO: Enter Validation Code here for Step 4
    if($window.TestStep4.Text)
    {
      $window.TabStep5.IsEnabled = $true
      return $true	
    }
    $window.TabStep5.IsEnabled = $false
    return $false
  }elseif ($WizardPage -eq 4)
  {
    #TODO: Enter Validation Code here for Step 5
    return $true
  }

  return $false
}
function Update-NavButtons
{
  <# 
      .DESCRIPTION
      Validates the current tab and Updates the Next, Prev and Finish buttons.
  #>
  $enabled = Validate-WizardPage $window.wizardPages.SelectedIndex
  $window.ButNext.IsEnabled = $enabled -and ($window.wizardPages.SelectedIndex -lt $window.wizardPages.Items.Count - 1)
  $window.ButBack.IsEnabled = $window.wizardPages.SelectedIndex -gt 0
  $window.ButFinish.IsEnabled = $enabled -and ($window.wizardPages.SelectedIndex -eq $window.wizardPages.Items.Count  - 1)	
    	
}
function Select-FileDialog
{
  param([Parameter(Mandatory=$true)][string]$Title,[string]$Directory,[string]$Filter="All Files (*.*)|*.*")
  Add-Type -AssemblyName System.Windows.Forms
  $objForm = New-Object System.Windows.Forms.OpenFileDialog
  $objForm.InitialDirectory = $Directory
  $objForm.Filter = $Filter
  $objForm.Title = $Title
  $Show = $objForm.ShowDialog()
  If ($Show -eq "OK")
  {
    Return $objForm.FileName
  }
  Else
  {
    Write-Warning 'User aborted dialog.'
  }
}
function Select-FolderDialog
{
  param([string]$Title,[string]$Directory,[string]$Filter="All Files (*.*)|*.*")
  
  Add-Type -AssemblyName System.Windows.Forms
  $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
  $Show = $FolderBrowser.ShowDialog()
  If ($Show -eq "OK")
  {
    return $FolderBrowser.SelectedPath
  }
  Else
  {
    Write-Warning 'User aborted dialog.'
  }
}
function Convert-XAMLtoWindow
{
  param
  (
    [Parameter(Mandatory)]
    [string]
    $XAML,
    
    [string[]]
    $NamedElement=$null,
    
    [switch]
    $PassThru
  )
  
  Add-Type -AssemblyName PresentationFramework
  
  
  $reader = [XML.XMLReader]::Create([IO.StringReader]$XAML)
  $result = [Windows.Markup.XAMLReader]::Load($reader)
  foreach($Name in $NamedElement)
  {
    $result | Add-Member NoteProperty -Name $Name -Value $result.FindName($Name) -Force
  }
  
  if ($PassThru)
  {
    $result
  }
  else
  {
    $null = $window.Dispatcher.InvokeAsync{
      $result = $window.ShowDialog()
      Set-Variable -Name result -Value $result -Scope 1
    }.Wait()
    $result
  }
}
function Show-WPFWindow
{
  param
  (
    [Parameter(Mandatory)]
    [Windows.Window]$Window
  )
  
  $result = $null
  $null = $window.Dispatcher.InvokeAsync{
    $result = $window.ShowDialog()
    Set-Variable -Name result -Value $result -Scope 1
  }.Wait()
  $result
}
#endregion Code Behind

#region Convert XAML to Window
$window = Convert-XAMLtoWindow -XAML $xaml -NamedElement 'ButBack', 'ButCancel', 'ButFinish', 'ButNext', 'logo', 'TabStep1', 'TabStep2', 'TabStep3', 'TabStep4', 'TabStep5', 'CSVInputFile', 'testTextChanged1','TestStep2', 'testTextChanged2','TestStep3', 'testTextChanged3', 'TestStep4', 'testTextChanged4','wizardPages','selectFileBtn','SelectDocumentRootFolderBtn','txtCSVInputFile','txtDocFoler','CSVInputFile','DocFolder','txtStep1Info' -PassThru
#endregion

#region Window Icon
$iconbase64 = 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKRSURBVEhLtZY9iFpBEMfnPUWinChBtLnCIhYphCBWFmKVawwknVemTJ+Qxm+FtClPCBYGSXXkAhZ
      3ET8gChYWsYqEgGgUHiZ4apSoKGZm396RxOepwfxg2f8M72Z2Z9edE+AGQqHQgUqleigIwtFyubTifEh+1BLqNs4Xi8XiLBKJfGd/oIBiAgqsVqufonyO4xZzrmeO42Q+n2Oe1UQrCeLxuBNX9hYlW+0O9HEcBwKBc9mUUfGZEY1GfTi9w3GbOXaDdurzeD
      w/isViRXb9tgO+8g8oN5VkIxjnQTAYzJBmCXjNP6HctSzrGOGZ3MUzaavJ4geqGNzr9YLdbmd6NpvBeDyGTqcD5XIZer0e8ytAC47h/Fjgq/+GhmJpKIHFYoFsNgs6nQ6MRiM4HA7QarWQTCbh8vKSf7kK7sIm0j1HfWPdJ5MJtFotqNfrUKlUIJVKgSiK4
      HQ6+RfK4Dc+kX5E3N6a0WgEkiSB2WzmHmUotognbuX2Tuj1ehgOh9xSBhNYaQc73RwqjcvlAoPBALVajXvXcijEYrGvJGR7FTpkm80G3W6XBTeZTKDRaCCXy0G1WuVfrYdK1OZ6LdPpFJrNJjQaDcjn85BIJLYKjkhUoo0JBoMBlEolNqgs/T49O5uhxdMO
      Lri9d7Ck5yK956jpyf0fnIr8DT+R7b2S8fv9H0VS1CxwUixsJpOBdDrNra3BkPNnJFgCvotjHHspFZ7rE4xZJ33dcAqFwhdsFj/xVt3nrn/lJfaCF1yvtkzsal5M8gblgezZmjmtHIO/4jbjj5ZJ4E4+u93u13jFqG3ek70byWDNH4XD4ffcvkbxv4orsFf
    coScXd3SEgx7FqydFYj8ivOeoT+m2yO6/AfgF/HH9HrIvlqYAAAAASUVORK5CYII='
    $iconBitmap = New-Object -TypeName System.Windows.Media.Imaging.BitmapImage 
    $iconBitmap.BeginInit() 
    $iconBitmap.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($iconbase64) 
    $iconBitmap.EndInit() 
    $iconBitmap.Freeze() 

    $window.Icon = $iconBitmap
#endregion

#region Logo

$logobase64 = "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
  LLa5rhmgy5hf/yZmmeTVanDxL1fZ1I3Kd2EA+U8gvJqwSAwSM8nb+/6+AUlgmMjyddj5Fbv1uDHqzaTJ+7cIyM/3/3/lK1/5yle+8pWvfOUrX/nKV77yla985Stf+cpXvvKVr3zlK1/5yle+8pWvfOUrX/nKV77yl
  a985Stf+cpXvvKVr3zlK1/5yle+8pWvfOUrX/nKV77yla985Stf+cpXvvKVr3zlK1/5yle+8pWvfOUrX/nKV77yla985Stf+cpXvvKVr3zlK1/5yle+8pWvfOUrX/nKV77yla985Stf+cpXvvKVr3zlK1/5yle+8h
  WA/wfdmhmZdymm9wAAMhhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU
  6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3Lncz
  Lm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvI
  j4KICAgICAgICAgPHhtcDpDcmVhdG9yVG9vbD5BZG9iZSBGaXJld29ya3MgQ1M2IChXaW5kb3dzKTwveG1wOkNyZWF0b3JUb29sPgogICAgICAgICA8eG1wOkNyZWF0ZURhdGU+MjAxNi0wOS0xMFQwNDoxNDoxMV
  o8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAxNi0wOS0xMFQwNDoxOTowMlo8L3htcDpNb2RpZnlEYXRlPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgICAgPHJkZjpEZXN
  jcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIj4KICAgICAgICAgPGRjOmZvcm1hdD5pbWFnZS9wbmc8L2RjOmZvcm1hdD4K
  ICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCi
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICA
  gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI
  CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC
  AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
  gICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAg
  ICAgICAgICAgICAgICAgICAgICAgICAgCjw/eHBhY2tldCBlbmQ9InciPz6MP5mCAAAPSElEQVR4Xu3cBZAcRRcH8D5cD3eX4FpYcHdJcJfgTuEBQlG4BHd3d3fX4IUT3N3dwnzz65tO9vZ2b/fuIJeP7L9qam9ne
  2Ze9/N+b66pb9++2XnnnRdGGmmk0MDwiUGDBoVxxx033HjjjaGpV69e2U033RRGHXXU0NTUVAxpYHhClmXh999/D0888URo+vzzz7MXX3wxSklDIIZP4P1kk00WZp999tCUS0dWnG+ggTBC8dlAAxFVLcSXX34ZPv
  nkk/D333+3ciX+nnjiiaOJKccff/wRXn/99arux73GGWecMPXUU4eRRx45nnvrrbfCDz/8EEYYYYQw6aSTxqMa0PTee+/FeGeWWWYJo4wySvHLEOQuMHz44Yfho48+Ks6E+KyZZ545TDPNNIOf++eff4Y333wz+s5
  SWi3H6KOPHmaaaaZIUznQ+/3330ca5phjjuJsfbAuaPvqq6/ChBNOGKaaaqow4ogjFr/Wh1dffTW88cYbxbcQr3cva4onaK42twR8GGusseI1o402WnG2BVUFQsQp+/jtt9/iDRIsqIgUQzbYYIP4mfDZZ5+FHXfc
  MTIYIaXXAQJ79uwZ9tprr8GM32+//WIwI8uZa665wjHHHFM147nuuutC//79w+STTx5OP/30VsLz66+/hssuuyzcf//9kY6PP/44Pt8CmTSB2G677cKyyy4bxxOuvffeOzLImEQrugnE9NNPH1ZeeeWw3HLLtaIHv
  Y8++miYYoopwpVXXlmcrQ+Y1K9fv/DFF19EpTrssMNCjx49il+rgyDddtttcW7u8c4770Smo5VS4MeCCy4Ydt111zDddNNVnVsCxbXWxkw77bTF2RZUdRlff/11eO2114KAk0Zgss/77rsv3HXXXVFYMHbAgAHFFS
  1ax0K89NJLUUN//PHHeE063OPnn39uRSCNf/nll6Pk33zzzeH8888vfmkLmoUez/CshL/++iuccsop4cgjjwx33313eO6558KMM84YlllmmThhAvLII4+Et99+u7ii5RqL634ffPBB+Omnn8K3334baXnggQcis/f
  ZZ59w6aWXxrEJ6DU/NHQUTz/9dLjnnnuihqPTs2sBXUcccUQ44IADosDfe++9UWCXX375sNhii4UxxxwzPP/88+Hxxx+PPINKcyvlg+OXX35pNa+EqpsPTBHpo3mYT6JJKuk79dRTww033BAnaOFmnXXW6ApILAvi
  QVtttVXo06dPfHACQTCZCSaYoDiTE5Brn+fQYhbkqquuilaEBJcj0eQZpabQIl1++eVR2Jj6ww8/PJpzY92TRl188cVh7LHHLq5osQTug6Y111wz7LvvvnHhzPfOO+8MJ510UtRkn/PNN1+Yc84543XodZ2jI/jmm
  2+iEHA1Ds+l9YR2vPHGK0a1But88sknh3PPPTfSRsj79u0bFlhggdDc3Bz5YX0JJ4XiOqDa3BKct97jjz9+cWYIagaVNJGW8U9TTjllmHfeeaPZm3/++ePvzzzzTBttQaiHYTw/mQ4+nGBV8ps8F0FyLwvArNULGs
  dFuIZJX3rppcNEE00UhdTzCNhxxx0X1lprreKKIbA4TC6moJFA7bzzzmHbbbeNc6dhLE5X8emnn0aTTyHAGhBkcVo1sMRnn312FAwCeeGFF0YG4wOBQDPXxQ1uv/32MSYoRfncSvkwySSTVBTqurKMctPipohwnoQ
  iuByIqRfGMn3rrbde1GiugwWqFwTQ4T7VglKMoJmV4NpS8LsE3r0IKhNb6qI6CnQRBi7T2q222mrxk0t1vtJacXPWgMVilVg9lrgaMBfd5SifWy3UJRDtwYJViksrEVcNiCbJhxxySJRmQkYbxDD1gDWiMWOMMUb0
  +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"

$logoBitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$logoBitmap.BeginInit()
$logoBitmap.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($logobase64)
$logoBitmap.EndInit()
$logoBitmap.Freeze()

$window.logo.source = $logoBitmap
#endregion Logo

#region Define Event Handlers

$window.ButCancel.add_Click(
  {
    $window.DialogResult = $false
  }
)

$window.ButNext.add_Click(
  {
    #
    if($window.wizardPages.SelectedIndex -lt $window.wizardPages.Items.Count - 1)
    {
      $window.wizardPages.SelectedIndex++
    }
    Update-NavButtons
  }
)

$window.ButBack.add_Click{
  #Go to the previous tab page
  if($window.wizardPages.SelectedIndex -gt 0)
  {
    $window.wizardPages.SelectedIndex--
  }
  Update-NavButtons
}
$window.ButFinish.add_Click{
  
  $window.DialogResult = $true
}

$window.DocFolder.add_TextChanged{

  Update-NavButtons
  
}

$window.TestStep2.add_TextChanged{

  Update-NavButtons
  $window.testTextChanged2.Text = "Step 2 Validated"
}

$window.TestStep3.add_TextChanged{

  Update-NavButtons
  $window.testTextChanged3.Text = "Step 3 Validated"
}

$window.TestStep4.add_TextChanged{

  Update-NavButtons
  $window.testTextChanged4.Text = "Step 4 Validated"
}

$window.wizardPages.add_SelectionChanged{

 # add event code here
  Update-NavButtons 
}

$window.SelectDocumentRootFolderBtn.add_Click{
  # remove param() block if access to event information is not required
  param
  (
    [Parameter(Mandatory)][Object]$sender,
    [Parameter(Mandatory)][Windows.RoutedEventArgs]$e
  )
  
  # add event code here
  $folder = Select-FolderDialog -Title "Select a folder" -Directory "" -Filter ""
  $window.DocFolder.Text = $folder
  
}
#endregion Event Handlers

#region Manipulate Window Content
if($window.IsInitialized){
  Update-NavButtons
}
#endregion

# Show Window
$result = Show-WPFWindow $window
  

#region Process results
if ($result -eq $true)
{
  ##TODO Process Results
}
else
{
  Write-Warning 'User aborted dialog.'
}
#endregion Process results
