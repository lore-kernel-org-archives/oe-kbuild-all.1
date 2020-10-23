Content-Type: multipart/mixed; boundary="===============3460780058597030196=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [cifs:for-next 10/32] ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_17) is being placed in '.data..L__unnamed_17'
Date: Fri, 23 Oct 2020 11:34:30 -0700
Message-ID: <CAKwvOd=Y+PxTci0ChrH1U_TvaCb+Yfb=DgdkHjacRi9QRmHgrQ@mail.gmail.com>
In-Reply-To: <202010240235.eqelQLfG-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3460780058597030196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

https://github.com/ClangBuiltLinux/linux/issues/1185

On Fri, Oct 23, 2020 at 11:08 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   1bfcaa4b7f0b84d397f0080aec64c4c948fc84c0
> commit: fbfd0b46afa9a8b50a061b0f28204fc94c7bddcf [10/32] smb3.1.1: add ne=
w module load parm require_gcm_256
> config: powerpc64-randconfig-r004-20201022 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 147b=
9497e79a98a8614b2b5eb4ba653b44f6b6f0)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
>         git fetch --no-tags cifs for-next
>         git checkout fbfd0b46afa9a8b50a061b0f28204fc94c7bddcf
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_23) =
is being placed in '.data..L__unnamed_23'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_24) =
is being placed in '.data..L__unnamed_24'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_25) =
is being placed in '.data..L__unnamed_25'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_26) =
is being placed in '.data..L__unnamed_26'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_20) =
is being placed in '.data..L__unnamed_20'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_21) =
is being placed in '.data..L__unnamed_21'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_27) =
is being placed in '.data..L__unnamed_27'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_33) =
is being placed in '.data..L__unnamed_33'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_29) =
is being placed in '.data..L__unnamed_29'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_30) =
is being placed in '.data..L__unnamed_30'
>    ld.lld: warning: fs/built-in.a(cifs/dir.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/dir.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/dir.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_4) is b=
eing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_7) is b=
eing placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_8) is b=
eing placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_11) is =
being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_12) is =
being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_5) is b=
eing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_6) is b=
eing placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_9) is b=
eing placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_10) is =
being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_14) is =
being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_13) is =
being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_15) is =
being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_16) is =
being placed in '.data..L__unnamed_16'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_18) is =
being placed in '.data..L__unnamed_18'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_17) is =
being placed in '.data..L__unnamed_17'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_20) is =
being placed in '.data..L__unnamed_20'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_19) is =
being placed in '.data..L__unnamed_19'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_21) is =
being placed in '.data..L__unnamed_21'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_22) is =
being placed in '.data..L__unnamed_22'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/link.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/misc.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/misc.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/misc.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_3)=
 is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_4)=
 is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_7)=
 is being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_6)=
 is being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_5)=
 is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/cifsencrypt.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/cifsencrypt.o):(.data..L__unnamed_=
2) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/readdir.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_4) is b=
eing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_5) is b=
eing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_6) is b=
eing placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_7) is b=
eing placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_8) is b=
eing placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_9) is b=
eing placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_10) is =
being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_11) is =
being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_12) is =
being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_13) is =
being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_14) is =
being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_15) is =
being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_16) is =
being placed in '.data..L__unnamed_16'
>    ld.lld: warning: fs/built-in.a(cifs/smb1ops.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb1ops.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb1ops.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_6) i=
s being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_4) i=
s being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_5) i=
s being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/smb2transport.o):(.data..L__unname=
d_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2transport.o):(.data..L__unname=
d_2) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb2transport.o):(.data..L__unname=
d_3) is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2misc.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_4) i=
s being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_5) i=
s being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_6) i=
s being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_7) i=
s being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_8) i=
s being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_9) i=
s being placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_10) =
is being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_11) =
is being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_15) =
is being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_16) =
is being placed in '.data..L__unnamed_16'
> >> ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_17) =
is being placed in '.data..L__unnamed_17'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_12) =
is being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_14) =
is being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_13) =
is being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(cifs/smb2file.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/cifs_spnego.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/cifs_spnego.o):(.data..L__unnamed_=
2) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/compr.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_3)=
 is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_4)=
 is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_7)=
 is being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_8)=
 is being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_5)=
 is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_6)=
 is being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_3)=
 is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_4)=
 is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_5)=
 is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_1=
) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_4=
) is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_3=
) is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_2=
) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_6=
) is being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_8=
) is being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_7=
) is being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_5=
) is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/write.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/write.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_4) is be=
ing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_5) is be=
ing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_6) is be=
ing placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_12) is b=
eing placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_13) is b=
eing placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_14) is b=
eing placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_10) is b=
eing placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_11) is b=
eing placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_8) is be=
ing placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_9) is be=
ing placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_7) is be=
ing placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/build.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/build.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/build.o):(.data..L__unnamed_3) is=
 being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/erase.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/erase.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/background.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/fs.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/fs.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/super.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/debug.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/debug.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_10) is=
 being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_11) is=
 being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_12) is=
 being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_13) is=
 being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_15) is=
 being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_14) is=
 being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_16) is=
 being placed in '.data..L__unnamed_16'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_17) is=
 being placed in '.data..L__unnamed_17'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_18) is=
 being placed in '.data..L__unnamed_18'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_19) is=
 being placed in '.data..L__unnamed_19'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_20) is=
 being placed in '.data..L__unnamed_20'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_21) is=
 being placed in '.data..L__unnamed_21'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_23) is=
 being placed in '.data..L__unnamed_23'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_22) is=
 being placed in '.data..L__unnamed_22'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_26) is=
 being placed in '.data..L__unnamed_26'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_25) is=
 being placed in '.data..L__unnamed_25'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_24) is=
 being placed in '.data..L__unnamed_24'
>    ld.lld: warning: fs/built-in.a(ubifs/journal.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_4) is=
 being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_3) is=
 being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_4) is be=
ing placed in '.data..L__unnamed_4'
> --
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_23) =
is being placed in '.data..L__unnamed_23'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_24) =
is being placed in '.data..L__unnamed_24'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_25) =
is being placed in '.data..L__unnamed_25'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_26) =
is being placed in '.data..L__unnamed_26'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_20) =
is being placed in '.data..L__unnamed_20'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_21) =
is being placed in '.data..L__unnamed_21'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_27) =
is being placed in '.data..L__unnamed_27'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_33) =
is being placed in '.data..L__unnamed_33'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_29) =
is being placed in '.data..L__unnamed_29'
>    ld.lld: warning: fs/built-in.a(cifs/connect.o):(.data..L__unnamed_30) =
is being placed in '.data..L__unnamed_30'
>    ld.lld: warning: fs/built-in.a(cifs/dir.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/dir.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/dir.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_4) is b=
eing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_7) is b=
eing placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_8) is b=
eing placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_11) is =
being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_12) is =
being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_5) is b=
eing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_6) is b=
eing placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_9) is b=
eing placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_10) is =
being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_14) is =
being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_13) is =
being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_15) is =
being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_16) is =
being placed in '.data..L__unnamed_16'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_18) is =
being placed in '.data..L__unnamed_18'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_17) is =
being placed in '.data..L__unnamed_17'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_20) is =
being placed in '.data..L__unnamed_20'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_19) is =
being placed in '.data..L__unnamed_19'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_21) is =
being placed in '.data..L__unnamed_21'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_22) is =
being placed in '.data..L__unnamed_22'
>    ld.lld: warning: fs/built-in.a(cifs/file.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/inode.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/link.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/misc.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/misc.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/misc.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_3)=
 is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_4)=
 is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_7)=
 is being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_6)=
 is being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/transport.o):(.data..L__unnamed_5)=
 is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/cifsencrypt.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/cifsencrypt.o):(.data..L__unnamed_=
2) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/readdir.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_4) is b=
eing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_5) is b=
eing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_6) is b=
eing placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_7) is b=
eing placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_8) is b=
eing placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_9) is b=
eing placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_10) is =
being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_11) is =
being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_12) is =
being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_13) is =
being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_14) is =
being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_15) is =
being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(cifs/sess.o):(.data..L__unnamed_16) is =
being placed in '.data..L__unnamed_16'
>    ld.lld: warning: fs/built-in.a(cifs/smb1ops.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb1ops.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb1ops.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_6) i=
s being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_4) i=
s being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/smb2ops.o):(.data..L__unnamed_5) i=
s being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/smb2transport.o):(.data..L__unname=
d_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2transport.o):(.data..L__unname=
d_2) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb2transport.o):(.data..L__unname=
d_3) is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2misc.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_4) i=
s being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_5) i=
s being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_6) i=
s being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_7) i=
s being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_8) i=
s being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_9) i=
s being placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_10) =
is being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_11) =
is being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_15) =
is being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_16) =
is being placed in '.data..L__unnamed_16'
> >> ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_17) =
is being placed in '.data..L__unnamed_17'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_12) =
is being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_14) =
is being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(cifs/smb2pdu.o):(.data..L__unnamed_13) =
is being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(cifs/smb2file.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/cifs_spnego.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(cifs/cifs_spnego.o):(.data..L__unnamed_=
2) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/compr.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_3)=
 is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_4)=
 is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_7)=
 is being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_8)=
 is being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_5)=
 is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/nodelist.o):(.data..L__unnamed_6)=
 is being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_3)=
 is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_4)=
 is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_5)=
 is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/nodemgmt.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_1=
) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_4=
) is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_3=
) is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_2=
) is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_6=
) is being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_8=
) is being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_7=
) is being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/readinode.o):(.data..L__unnamed_5=
) is being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/write.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/write.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/scan.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_4) is be=
ing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_5) is be=
ing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_6) is be=
ing placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_12) is b=
eing placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_13) is b=
eing placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_14) is b=
eing placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_10) is b=
eing placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_11) is b=
eing placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_8) is be=
ing placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_9) is be=
ing placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(jffs2/gc.o):(.data..L__unnamed_7) is be=
ing placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/build.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/build.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/build.o):(.data..L__unnamed_3) is=
 being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/erase.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/erase.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/background.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/fs.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/fs.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/super.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/debug.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/debug.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_10) is=
 being placed in '.data..L__unnamed_10'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_11) is=
 being placed in '.data..L__unnamed_11'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_12) is=
 being placed in '.data..L__unnamed_12'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_13) is=
 being placed in '.data..L__unnamed_13'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_15) is=
 being placed in '.data..L__unnamed_15'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_14) is=
 being placed in '.data..L__unnamed_14'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_16) is=
 being placed in '.data..L__unnamed_16'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_17) is=
 being placed in '.data..L__unnamed_17'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_18) is=
 being placed in '.data..L__unnamed_18'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_19) is=
 being placed in '.data..L__unnamed_19'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_20) is=
 being placed in '.data..L__unnamed_20'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_21) is=
 being placed in '.data..L__unnamed_21'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_23) is=
 being placed in '.data..L__unnamed_23'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_22) is=
 being placed in '.data..L__unnamed_22'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_26) is=
 being placed in '.data..L__unnamed_26'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_25) is=
 being placed in '.data..L__unnamed_25'
>    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_24) is=
 being placed in '.data..L__unnamed_24'
>    ld.lld: warning: fs/built-in.a(ubifs/journal.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_4) is=
 being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_3) is=
 being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_4) is be=
ing placed in '.data..L__unnamed_4'
> ..
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202010240235.eqelQLfG-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============3460780058597030196==--

