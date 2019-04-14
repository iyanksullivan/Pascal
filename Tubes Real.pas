Program jual_beli_2;
uses crt;
type 
    barang = record 
    nama:string;
    harga:real;
    idbarang:integer;
    stokb:integer;
end;
type 
    tabelbarang = array[1..100] of barang;
type
    dtransaksi = record
    namab:string;
    hargab:real;
    idtransaksi:integer;
    dibeli:integer;
end;
type
    tabeltransaksi = array[1..100] of dtransaksi;

var
    tabbarang:tabelbarang;
    tabtransaksi:tabeltransaksi;
    parrayb,parrayt:integer;
    x:boolean;
procedure isidatabarang(var arrayb:tabelbarang);
{IS:MEMBERIKAN NILAI/DATA TERHADAP ARRAY DATA BARANG
FS :MENGEMBALIKAN NILAI/DATA KE PROGRAM UTAMA UNTUK DIOLAH}
var
    i:integer;
    red:char;
begin
    clrscr;
    writeln('============================================================');
    writeln('                 MENU INPUT DATA BARANG                     ');
    writeln('============================================================');
    i:=1;
    if (parrayb <> 0) then
    begin
        i:=parrayb;
        repeat
            red:='y';
            Write('Masukan nama barang  : ');
            readln(arrayb[i].nama);
            repeat
            begin
                Write('Masukan harga barang : ');
                readln(arrayb[i].harga);
            end;
            until (arrayb[i].harga > 0);
            repeat
            begin
                Write('Masukan stok barang  : ');
                readln(arrayb[i].stokb);
            end;
            until (arrayb[i].stokb > 0);
            arrayb[i].idbarang:=i;
            parrayb:=parrayb+1;
            repeat
            Write('Tambah data ? (Y/N): ');
            readln(red);
            until (red = 'y') or (red = 'n'); 
            writeln();
            i:=i+1;
        until(red = 'n');
    end
    else
    begin
        i:=1;
        parrayb:=1;
        writeln('Masukan data lebih dari 2 barang');
        red:='y';
        repeat
        Write('Masukan nama barang  : ');
        readln(arrayb[i].nama);
        repeat
        begin
            Write('Masukan harga barang : ');
            readln(arrayb[i].harga);
        end;
        until (arrayb[i].harga > 0);
        repeat
        begin
            Write('Masukan stok barang  : ');
            readln(arrayb[i].stokb);
        end;
        until (arrayb[i].stokb > 0);
        arrayb[i].idbarang:=i;
        parrayb:=parrayb+1;
        i:=i+1;
        repeat
        Write('Tambah data ? (Y/N)(N Jika sudah input lebih dari 2 data): ');
        readln(red);
        until(red='y') or (red='n');
        writeln();
    until (red = 'n') and (i>2);
    end;
end;
procedure lihatisibarang(var arrayb:tabelbarang);
{IS:---
FS: MENGEMBALIKAN/MENAMPILKAN DATA YANG BERADA PADA ARRAY DATA BARANG}
var
    i:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                     LIHAT DATA BARANG                      ');
    writeln('============================================================');
    i:=1;
    if (parrayb>0) then
    begin
        repeat
        begin 
            writeln('ID Barang     : ',tabbarang[i].idbarang);
            writeln('Nama Barang   : ',tabbarang[i].nama);
            writeln('Harga Barang  : ',tabbarang[i].harga:0:0);
            writeln('Stok Barang   : ',tabbarang[i].stokb);
            writeln();
            i:=i+1;
        end;
        until(i=parrayb);
    end
    else if (parrayb=0) then
        begin
            writeln('Belum ada data yang di input');
            writeln();
        end;
    readln;
end;
procedure isidatatransaksi(var arrayt:tabeltransaksi);
{IS: MENGIMPUT NILAI/DATA KEDALAM ARRAY TRANSAKSI
FS : MENGEMBALIKAN NILAI/DATA KE PROGRAM UTAMA}
var
    i,a:integer;
    beli,dibelir:integer;
    red:char;
    namemark:string;
begin
    clrscr;
    writeln('============================================================');
    writeln('                MENU INPUT DATA TRANSAKSI                   ');
    writeln('============================================================');
    writeln();
    red:='y';
    a:=1;
    if (parrayb>0) then
    begin
        if (parrayt <> 0) then
        begin
            i:=parrayt;
            lihatisibarang(tabbarang);
            repeat
                a:=1;
                write('Masukan nama barang: ');
                readln(namemark);
                while (namemark <> tabbarang[a].nama) and (a < parrayb) do
                begin
                    a:=a+1;
                end;
                if (namemark = tabbarang[a].nama) then
                begin
                    arrayt[i].namab:=namemark;
                    arrayt[i].hargab:=tabbarang[a].harga;
                    write('Masukan berapa banyak yang dibeli: ');
                    readln(beli);
                    if (beli <= tabbarang[a].stokb) then
                    begin
                    arrayt[i].dibeli:=beli;
                    tabbarang[a].stokb:=(tabbarang[a].stokb)-(arrayt[i].dibeli); 
                    arrayt[i].idtransaksi:=i;
                    parrayt:=parrayt+1;
                    i:=i+1;
                    repeat
                    write('Ingin Menambah data transaksi? (Y/N): ');
                    readln(red);
                    until(red='y') or (red='n');
                    end
                    else
                    begin
                        repeat                
                            write('Stok Kurang, Masukan dibawah ',tabbarang[a].stokb,' untuk melanjutkan transaksi: ');
                            readln(dibelir);
                        until (dibelir<=tabbarang[a].stokb);
                        arrayt[i].dibeli:=dibelir;
                        tabbarang[a].stokb:=(tabbarang[a].stokb)-(arrayt[i].dibeli);
                        arrayt[i].idtransaksi:=i;
                        parrayt:=parrayt+1;
                        i:=i+1;
                        repeat
                        write('Ingin Menambah data transaksi? (Y/N): ');
                        readln(red);
                        until (red='y') or (red='n');
                    end;
                end
                else
                begin
                    writeln('Nama barang tidak ditemukan');
                    repeat
                    write('Ingin melanjutkan transaksi?(Y/N): ');
                    readln(red);
                    until (red='y') or (red='n');
                end;
            until (red = 'n');
        end
        else
            i:=1;
            parrayt:=i;
            lihatisibarang(tabbarang);
            repeat
                a:=1;
                write('Masukan nama barang: ');
                readln(namemark);
                while  (namemark <> tabbarang[a].nama) and (a < parrayb) do
                begin
                    a:=a+1;
                end;
                if (namemark = tabbarang[a].nama) then
                begin
                    arrayt[i].namab:=namemark;
                    arrayt[i].hargab:=tabbarang[a].harga;
                    writeln('Masukan berapa banyak yang dibeli: ');
                    readln(beli);
                    if (beli <= tabbarang[a].stokb) then
                    begin
                    arrayt[i].dibeli:=beli;
                    tabbarang[a].stokb:=(tabbarang[a].stokb)-(arrayt[i].dibeli); 
                    arrayt[i].idtransaksi:=i;
                    parrayt:=parrayt+1;
                    i:=i+1;
                    repeat
                    writeln('Ingin Menambah data transaksi? (Y/N)');
                    readln(red);
                    until (red='y') or (red='n');
                    end
                    else
                    begin
                        repeat                
                            writeln('Stok Kurang, Masukan dibawah ',tabbarang[a].stokb,' untuk melanjutkan transaksi');
                            readln(dibelir);
                        until (dibelir<=tabbarang[a].stokb);
                        arrayt[i].dibeli:=dibelir;
                        tabbarang[a].stokb:=(tabbarang[a].stokb)-(arrayt[i].dibeli);
                        arrayt[i].idtransaksi:=i;
                        parrayt:=parrayt+1;
                        i:=i+1;
                        repeat
                        writeln('Ingin Menambah data transaksi? (Y/N)');
                        readln(red);
                        until(red='y') or (red='n');
                    end;
                end
                else
                begin
                    writeln('Nama barang tidak ditemukan');
                    repeat
                    write('Ingin melanjutkan transaksi?(Y/N): ');
                    readln(red);
                    until (red='y') or (red='n');
                end;
            until (red = 'n');
    end
    else
    begin
        writeln('Belum ada data yang di input');
        writeln();
        writeln();
        Write('Tekan Enter untuk kembali ke menu utama');
        readln();
    end;
end;
procedure lihatisitransaksi(var arrayt:tabeltransaksi);
{IS:---
FS: MENGEMBALIKAN/MENAMPILKAN ARRAY DATA TRANSAKSI KEDALAM PROGRAM UTAMA}
var
    i:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                MENU LIHAT DATA TRANSAKSI                   ');
    writeln('============================================================');
    i:=1;
    if (parrayt>0) then
    begin
        repeat
        begin 
            writeln('ID Transaksi           : ',tabtransaksi[i].idtransaksi);
            writeln('Nama Barang            : ',tabtransaksi[i].namab);
            writeln('Harga Barang           : ',tabtransaksi[i].hargab:0:0);
            writeln('Banyak Barang dibeli   : ',tabtransaksi[i].dibeli);
            writeln();
            i:=i+1;
        end;
        until (i=parrayt);
    end
    else if (parrayt=0) then
    begin
        writeln('Belum ada data yang di input');
        writeln();
    end;
    readln;
end;
procedure caribarang(var arraybd:tabelbarang);
{IS:------
FS: MENGEMBALIKAN NILAI YANG DICARI MENGGUNAKAN MEGUNAKAN METODE SEQUINTAL SEARCH }
var
    i,idd:integer;
    pil:char;
    mark:string;
begin
    clrscr;
    writeln('============================================================');
    writeln('                 MENU SEARCH DATA BARANG                    ');
    writeln('============================================================');
    i:=1;
    if(parrayb>0) then
    begin
        repeat
        begin
            Writeln('Search berdasarkan: A.Nama B.ID Barang');
            readln(pil);
        end;
        until (pil='a') or (pil='b');
        if (pil='a') then
        begin
            writeln('Nama barang yang dicari: ');
            readln(mark);
            while ((arraybd[i].nama) <> mark) and (i<parrayb) do
                begin
                    i:=i+1;
                end;
                if ((arraybd[i].nama) = mark) then
                begin
                    writeln();
                    writeln('=======================');
                    writeln('    Barang ditemukan   ');
                    writeln('Nama   : ',arraybd[i].nama);
                    writeln('Harga  : ',arraybd[i].harga:0:0);
                    writeln('Stok   : ',arraybd[i].stokb);
                    writeln('ID     : ',arraybd[i].idbarang);
                end
                else if ((arraybd[i].nama) <> mark) then
                begin
                    writeln('Data tidak ditemukan');
                end;
            end
        else if (pil='b') then
        begin
                writeln('ID barang yang dicari: ');
                readln(idd);
                while (arraybd[i].idbarang <> idd) and (i<parrayb) do
                    begin
                        i:=i+1;
                    end;
                    if (arraybd[i].idbarang = idd) then
                    begin
                        writeln();
                        writeln('=======================');
                        writeln('    Barang ditemukan   ');
                        writeln('ID     : ',arraybd[i].idbarang);
                        writeln('Nama   : ',arraybd[i].nama);
                        writeln('Harga  : ',arraybd[i].harga:0:0);
                        writeln('Stok   : ',arraybd[i].stokb);
                    end
                    else 
                        writeln('Data tidak ditemukan');
        end;
    end
    else if (parrayb=0) then
    begin
        writeln('Belum ada data yang di input');
        writeln();
    end;
    writeln();
    writeln('Tekan Enter untuk kembali ke menu utama');
    readln;
end;
procedure caritransaksi(var arraytb:tabeltransaksi);
{IS:------
FS: MENGEMBALIKAN ATAU MENAMPILKAN HASIL PENCARIAN DATA TRANSAKSI MENGGUNAKAN METODE SEQUINTAL SEARCH}
var
    i,idt:integer;
    pil:char;
    mark:string;
begin
    clrscr;
    writeln('============================================================');
    writeln('                MENU SEARCH DATA TRANSAKSI                  ');
    writeln('============================================================');
    i:=1;
    if (parrayt>0) then
    begin
        Writeln('Search berdasarkan: A.Nama B.ID Transaksi');
        readln(pil);
        if pil = 'a' then
        begin
            write('Nama barang yang akan dicari: ');
            readln(mark);
            while (arraytb[i].namab <> mark) and (i<parrayt) do
                begin
                    i:=i+1;
                end;
                if (arraytb[i].namab = mark) then
                    begin
                        writeln();
                        writeln('==========================');
                        writeln('    Transaksi ditemukan   ');
                        writeln('ID Transaksi       : ',arraytb[i].idtransaksi);
                        writeln('Nama               : ',arraytb[i].namab);
                        writeln('Harga              : ',arraytb[i].hargab:0:0);
                        writeln('Dibeli             : ',arraytb[i].dibeli);
                    end
                else 
                    writeln('Data tidak ditemukan');
        end
        else if (pil='b') then
        begin
                writeln('ID barang yang dicari: ');
                readln(idt);
                while (arraytb[i].idtransaksi <> idt) and (i<parrayb) do
                    begin
                        i:=i+1;
                    end;
                    if (arraytb[i].idtransaksi = idt) then
                    begin
                        writeln();
                        writeln('==========================');
                        writeln('   Transaksi ditemukan   ');
                        writeln('ID Transaksi   : ',arraytb[i].idtransaksi);
                        writeln('Nama           : ',arraytb[i].namab);
                        writeln('Harga          : ',arraytb[i].hargab:0:0);
                        writeln('Dibeli         : ',arraytb[i].dibeli);            
                    end
                    else 
                        writeln('Data tidak ditemukan');
        end;
    end
    else if (parrayt=0) then
    begin
        writeln('Belum ada data yang di input');
        Writeln();
    end;
    writeln();
    Writeln('Tekan Enter untuk kembali ke menu utama');
    readln;
end;
procedure sortb(var arraybs:tabelbarang);
{IS: MENGIMPUT PERINTAH SORTING ASCENDING/DESCENDING
FS: MENGEMBALIKAN NILAI SETELAH MELAKUKAN SORTING MENGGUNAKAN METODE SELECTION SORT}
var
    pass,hargam,i,idm,z:integer;
    tempc:barang;
    mark:integer;
    pil,pilb,q:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                 MENU SORTING DATA BARANG                   ');
    writeln('============================================================');
    if (parrayb>0) then
    begin
        repeat
            writeln('Sorting berdasarkan: 1.Harga 2.Nama');
            readln(pil);
        until(pil>0) and (pil<3);
        repeat
            writeln('1.Ascending 2.Descending');
            readln(pilb);
        until(pilb>0) and (pilb<3);
        if (pil = 1) and (pilb = 1) then
        begin
        pass:=1;
            while (pass<=(parrayb-1)) do
            begin
                hargam:=pass;
                i:=pass+1;
                while (i<parrayb) do
                begin
                    if arraybs[hargam].harga > arraybs[i].harga then
                    begin
                        hargam:=i;
                        tempc:=arraybs[pass];
                        arraybs[pass]:=arraybs[hargam];
                        arraybs[hargam]:=tempc;
                    end;
                    i:=i+1;
                end;
                pass:=pass+1;
            end;
        end
        else if (pil = 1) and (pilb = 2) then
            begin
            pass:=1;
            while (pass<=(parrayb-1)) do
            begin
                hargam:=pass;
                i:=pass+1;
                while (i<parrayb) do
                begin
                    if arraybs[hargam].harga < arraybs[i].harga then
                    begin
                        hargam:=i;
                        tempc:=arraybs[pass];
                        arraybs[pass]:=arraybs[hargam];
                        arraybs[hargam]:=tempc;
                    end;
                    i:=i+1;
                end;
                pass:=pass+1;
            end;
            end
        else if (pil=2) and (pilb=1) then
            begin
            pass:=1;
                while (pass<=(parrayb-1)) do
                begin
                    mark:=pass;
                    i:=pass+1;
                    while (i<parrayb) do
                    begin
                        if arraybs[mark].nama[1] > arraybs[i].nama[1] then
                        begin
                            mark:=i;
                            tempc:=arraybs[pass];
                            arraybs[pass]:=arraybs[mark];
                            arraybs[mark]:=tempc;
                        end;
                        i:=i+1;
                    end;
                    pass:=pass+1;
                end;
            end
        else if (pil=2) and (pilb=2) then
            begin
            pass:=1;
                while (pass<=(parrayb-1)) do
                begin
                    mark:=pass;
                    i:=pass+1;
                    while (i<parrayb) do
                    begin
                        if arraybs[mark].nama[1] < arraybs[i].nama[1] then
                        begin
                            mark:=i;
                            tempc:=arraybs[pass];
                            arraybs[pass]:=arraybs[mark];
                            arraybs[mark]:=tempc;
                        end;
                        i:=i+1;
                    end;
                    pass:=pass+1;
                end;
            end;
        q:=1;
        while q<parrayb do
        begin
        writeln('Nama barang    : ',arraybs[q].nama);
        writeln('Harga barang   : ',arraybs[q].harga:0:0);
        writeln('Stok Barang    : ',arraybs[q].stokb);
        writeln('ID Barang      : ',arraybs[q].idbarang);
        writeln();
        q:=q+1;
        end;
        readln();
    end
    else if (parrayb=0) then
    begin
        writeln('Belum ada data yang di input');
        writeln();
    end;
    pass:=1;
            while (pass<=(parrayb-1)) do
            begin
                idm:=pass;
                z:=pass+1;
                while (z<parrayb) do
                begin
                    if arraybs[idm].idbarang > arraybs[z].idbarang then
                    begin
                        idm:=z;
                        tempc:=arraybs[pass];
                        arraybs[pass]:=arraybs[idm];
                        arraybs[idm]:=tempc;
                    end;
                    z:=z+1;
                end;
                pass:=pass+1;
            end;
    writeln('Tekan Enter untk kembali ke menu utama');
    readln;
end;
procedure sortt(var arrayts:tabeltransaksi);
{IS: MENGIMPUT PERINTAH SORTING ASCENDING/DESCENDING
FS: MENGEMBALIKAN NILAI SETELAH MELAKUKAN SORTING MENGGUNAKAN METODE INSERTION SORT}
var
    pil,pilb,pass,cek,temp,q,idm,z:integer;
    bs:dtransaksi;
    mark:string;
    tempc:dtransaksi;
begin
    clrscr;
    writeln('============================================================');
    writeln('                MENU SORTING DATA TRANSAKSI                 ');
    writeln('============================================================');
    if(parrayt>0) then
    begin
        repeat
            writeln('Sorting berdasarkan: 1.ID 2.Nama');
            readln(pil);
        until(pil>0) and (pil<3);
        repeat
            Writeln('1.Ascending 2.Descending');
            readln(pilb);
        until(pilb>0) and (pilb<3);
        pass:=1;
        cek:=0;
        if (pil=1) and (pilb=1) then
        begin
            repeat
                begin
                    cek:=pass+1;
                    temp:=arrayts[cek].idtransaksi;
                    bs:=arrayts[cek];
                    if temp < arrayts[cek-1].idtransaksi then
                        begin
                            arrayts[cek]:=arrayts[cek-1];
                            cek:=cek-1;
                        end;
                    arrayts[cek]:=bs;
                    pass:=pass+1;
                end;
            until (pass = (parrayt-1));
        end
        else if (pil=1) and (pilb=2) then
        begin
            repeat
                begin
                    cek:=pass+1;
                    temp:=arrayts[cek].idtransaksi;
                    bs:=arrayts[cek];
                    if temp > arrayts[cek-1].idtransaksi then
                        begin
                            arrayts[cek]:=arrayts[cek-1];
                            cek:=cek-1;
                        end;
                    arrayts[cek]:=bs;
                    pass:=pass+1;
                end;
            until (pass = (parrayt-1));
        end
        else if (pil=2) and (pilb=1) then
        begin
            repeat
                begin
                    cek:=pass+1;
                    mark:=arrayts[cek].namab[1];
                    bs:=arrayts[cek];
                    if mark < arrayts[cek-1].namab[1] then
                        begin
                            arrayts[cek]:=arrayts[cek-1];
                            cek:=cek-1;
                        end;
                    arrayts[cek]:=bs;
                    pass:=pass+1;
                end;
            until (pass = (parrayt-1));
        end
        else if (pil=2) and (pilb=2) then
        begin
            repeat
                begin
                    cek:=pass+1;
                    mark:=arrayts[cek].namab[1];
                    bs:=arrayts[cek];
                    if mark > arrayts[cek-1].namab[1] then
                        begin
                            arrayts[cek]:=arrayts[cek-1];
                            cek:=cek-1;
                        end;
                    arrayts[cek]:=bs;
                    pass:=pass+1;
                end;
            until (pass = (parrayt-1));
        end;
        q:=1;
        while q<parrayt do
        begin
            writeln('ID Transaksi                   : ',arrayts[q].idtransaksi);
            writeln('Nama Barang                    : ',arrayts[q].namab);
            writeln('Harga Barang                   : ',arrayts[q].hargab:0:0);
            writeln('Banyaknya Barang yang dibeli   : ',arrayts[q].dibeli);
            writeln();
            q:=q+1;
        end;
        readln;
    end
    else if (parrayt=0) then
    begin
        writeln('Belum ada data yang di input');
        writeln();
    end;
    pass:=1;
            while (pass<=(parrayt-1)) do
            begin
                idm:=pass;
                z:=pass+1;
                while (z<parrayt) do
                begin
                    if arrayts[idm].idtransaksi > arrayts[z].idtransaksi then
                    begin
                        idm:=z;
                        tempc:=arrayts[pass];
                        arrayts[pass]:=arrayts[idm];
                        arrayts[idm]:=tempc;
                    end;
                    z:=z+1;
                end;
                pass:=pass+1;
            end;
    writeln('Tekan Enter untuk kembali kemenu utama');
    readln;
end;
procedure exitprog;
{IS:------
FS: Exit Program}
begin
    x:=false;
end;
procedure deletedb;
{IS:Menerima inputan user untuk memilih data mana yang akan dihapus
FS: Mengembalikan array ke program utama setelah ada array yang dihapus}
var
    i,n:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                        MENU HAPUS                          ');
    writeln('============================================================');
    writeln();
    writeln();
    repeat
        Writeln('Pilih data yang ingin dihapus: 1.Barang 2.Transaksi');
        readln(n);
    until(n>0) and (n<3);
    if (n=1) then
    begin
        lihatisibarang(tabbarang);
        Writeln('Pilih yang akan dihapus: ');
        readln(i);
        begin
            while i<parrayb do
            begin
                tabbarang[i]:=tabbarang[i+1];
                i:=i+1;
            end;
            parrayb:=parrayb-1;
            writeln('Data berhasil Dihapus');
        end;
    end
    else if (n=2) then
        begin
            lihatisitransaksi(tabtransaksi);
            writeln('Pilih data yang akan dihapus: ');
            readln(i);
            while i<parrayt do
            begin
                tabtransaksi[i]:=tabtransaksi[i+1];
                i:=i+1;
            end;
            parrayt:=parrayt-1;
            writeln('Data berhasil dihapus');
        end;
    readln;
end;
procedure editdata;
{IS:Menerima inputan dari user untuk mengedit data
FS: Mengembalikan array yang sudah di edit ke program utama}
var
    i,n,m:integer;
    namabaru,namabarut:string;
    stokbaru,dibelibaru:integer;
    hargabaru,hargabarut:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                        MENU EDIT                           ');
    writeln('============================================================');
    writeln();
    writeln();
    repeat
        Writeln('Pilih data yang ingin diedit: 1.Barang 2.Transaksi');
        readln(n);
    until(n>0) and (n<3);
    if (n=1) then
    begin
        if (parrayb>0) then
        begin  
            lihatisibarang(tabbarang);
            writeln('Pilih yang akan di edit: ');
            readln(i);
            repeat
            writeln('Pilih Yang akan di edit: 1.Nama 2.Harga 3.Stok');
            readln(m);
            until (m>0) and (m<4);
            if (m=1) then
            begin
                writeln('Nama Sebelumnya: ',tabbarang[i].nama);
                writeln('Nama Baru: ');
                readln(namabaru);
                tabbarang[i].nama:=namabaru;
                writeln('Data berhasil di edit');
            end
            else if (m=2) then
                begin
                    writeln('Harga Sebelumnya: ',tabbarang[i].harga:0:0);
                    writeln('Harga Baru: ');
                    readln(hargabaru);
                    tabbarang[i].harga:=hargabaru;
                    writeln('Data Berhasil di edit');
                end
            else if (m=3) then
                begin
                    writeln('Stok Sebelumnya: ',tabbarang[i].stokb);
                    writeln('Stok Baru: ');
                    readln(stokbaru);
                    tabbarang[i].stokb:=stokbaru;
                    writeln('Data Berhasil di edit');
                end;
        end
        else if (parrayb=0) then
        begin
            writeln('Belum ada data yang di input');
        end; 
    end
    else if (n=2) then
        begin
            if (parrayt>0) then
                lihatisitransaksi(tabtransaksi);
                writeln('Pilih data yang akan di edit');
                readln(i);
                repeat
                    writeln('Pilih data yang akan di edit: 1.Nama 2.Dibeli 3.Harga');
                    readln(m);
                until (m>0) and (m<4);
                if (m=1) then
                begin
                    writeln('Nama Sebelumnya: ',tabtransaksi[i].namab);
                    writeln('Nama Baru: ');
                    readln(namabarut);
                    tabtransaksi[i].namab:=namabarut;
                    writeln('Data Berhasil di edit');
                end
                else if (m=2) then
                begin
                writeln('Banyak Yang dibeli sebelumnya: ',tabtransaksi[i].dibeli);
                writeln('Banyak yang dibeli yang baru: ');
                readln(dibelibaru);
                tabtransaksi[i].dibeli:=dibelibaru;
                writeln('Data berhasil di edit'); 
                end
                else if (m=3) then
                begin
                    writeln('Harga sebelumnya: ',tabtransaksi[i].hargab:0:0);
                    writeln('Harga Baru: ');
                    readln(hargabarut);
                    tabtransaksi[i].hargab:=hargabarut;
                    writeln('Data berhasil diubah');
                end;
            end
            else if (parrayt=0) then
                begin
                    writeln('Belum ada data yang di input');
                    writeln();
                end;
            readln;    
end;
procedure editdb;
{IS: Menerima inputan dari user untuk menghapus data atau menedit data
FS: Memanggil prosedur hapus atau edit data}
var
    i:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                     MENU EDIT/HAPUS                        ');
    writeln('============================================================');
    writeln();
    writeln();
    writeln('1. EDIT data');
    writeln('2. Hapus data');
    writeln();
    if (parrayb>0) or (parrayt>0) then
    begin
        repeat
            writeln('Pilih Menu: ');
            readln(i);
            case i of
                1:editdata;
                2:deletedb;
            end;
            until (i>0) and (i<3);
    end
    else if (parrayb=0) or (parrayt=0) then
    begin
        writeln('Belum ada data yang di input');
        writeln();
    end;
    writeln('Tekan Enter untuk kembali ke menu utama');
    readln;
end;
procedure hitungtotb;
var
    hartot:real;
    i:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                 MENU TOTAL HARGA TRANSAKSI                 ');
    writeln('============================================================');
    Writeln();
    writeln();
    hartot:=0;
    lihatisitransaksi(tabtransaksi);
    writeln('=============================================================');
    repeat
    writeln('Pilih ID transaksi yang akan dilihat total harganya: ');
    readln(i);
    until (i>0) and (i<=parrayt);
    hartot:=((tabtransaksi[i].hargab)*(tabtransaksi[i].dibeli));
    writeln('=============================================================');
    writeln('Total transaksi Sebesar: ',hartot:0:0);
    writeln();
    writeln('Tekan Enter untuk kembali ke menu utama');
    readln;
end;
procedure menuutama;
{IS: Menerima inputan user untuk memilih menu
FS: Memanggil Prosedur yang sesuai dengan pilihan menu user}
var
    i:integer;
begin
    clrscr;
    writeln('============================================================');
    writeln('                        MENU UTAMA                          ');
    writeln('============================================================');
    Writeln();
    writeln();
    writeln('1. Menu Input data Barang');
    writeln('2. Menu Lihat data Barang');
    writeln('3. Menu Input data Transaksi');
    writeln('4. Menu Lihat data Transaksi');
    writeln('5. Menu Search data Barang');
    writeln('6. Menu Search data Transaksi');
    writeln('7. Menu Sorting data Barang');
    writeln('8. Menu Sorting data Transaksi');
    writeln('9. Menu Edit dan Hapus Data');
    writeln('10.Menu Total Harga Belanja');
    writeln();
    writeln('11.Exit');
    repeat
    writeln();
    write('Pilih menu : ');
    readln(i);
    case i of
        1:isidatabarang(tabbarang);
        2:lihatisibarang(tabbarang);
        3:isidatatransaksi(tabtransaksi);
        4:lihatisitransaksi(tabtransaksi);
        5:caribarang(tabbarang);
        6:caritransaksi(tabtransaksi);
        7:sortb(tabbarang);
        8:sortt(tabtransaksi);
        9:editdb;
        10:hitungtotb;
        11:exitprog;
    end;
    until (i>0) and (i<12);
end;
begin
    x:=true;
    while x = true do
        menuutama;
end.