Content-Type: multipart/mixed; boundary="===============4016428623970808623=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_8) is being placed in '.data..L__unnamed_8'
Date: Sun, 25 Oct 2020 04:08:40 +0000
Message-ID: <ce6e42caf2fb44f4ba082e1302da819b@intel.com>
In-Reply-To: <CAKwvOdkhcrifOeHY9VjpHbmHjRazxajoj7nV1QrRKx6kQdF15w@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4016428623970808623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild-all] Re: ld.lld: warning: fs/built-
> in.a(afs/cell.o):(.data..L__unnamed_8) is being placed in
> '.data..L__unnamed_8'
> =

> https://github.com/ClangBuiltLinux/linux/issues/1185
sorry for false positive, we will ignore all lld warning related to "being =
placed in", the initial
ignore of similar warning is kind too specific for known issue.

Thanks

> =

> On Fri, Oct 23, 2020 at 10:24 AM kernel test robot <lkp@intel.com> wrot=
e:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
> master
> > head:   f9893351acaecf0a414baf9942b48d5bb5c688c6
> > commit: 88c853c3f5c0a07c5db61b494ee25152535cfeee afs: Fix cell refcount=
ing
> by splitting the usage counter
> > date:   7 days ago
> > config: powerpc64-randconfig-r004-20201022 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> ee6abef5323d59b983129bf3514ef6775d1d6cd5)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install powerpc64 cross compiling tool for clang build
> >         # apt-get install binutils-powerpc64-linux-gnu
> >         #
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?i
> d=3D88c853c3f5c0a07c5db61b494ee25152535cfeee
> >         git remote add linus
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 88c853c3f5c0a07c5db61b494ee25152535cfeee
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> ARCH=3Dpowerpc64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_20) =
is
> being placed in '.data..L__unnamed_20'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_21) =
is
> being placed in '.data..L__unnamed_21'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_23) =
is
> being placed in '.data..L__unnamed_23'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_22) =
is
> being placed in '.data..L__unnamed_22'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_26) =
is
> being placed in '.data..L__unnamed_26'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_25) =
is
> being placed in '.data..L__unnamed_25'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_24) =
is
> being placed in '.data..L__unnamed_24'
> >    ld.lld: warning: fs/built-in.a(ubifs/journal.o):(.data..L__unnamed_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_4) =
is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_2) =
is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_3) =
is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(ubifs/master.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/master.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/scan.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/scan.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/replay.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/tnc_commit.o):(.data..L__unname=
d_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/tnc_commit.o):(.data..L__unname=
d_2)
> is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/tnc_commit.o):(.data..L__unname=
d_3)
> is being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_15) is
> being placed in '.data..L__unnamed_15'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_16) is
> being placed in '.data..L__unnamed_16'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_17) is
> being placed in '.data..L__unnamed_17'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_18) is
> being placed in '.data..L__unnamed_18'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_12) is
> being placed in '.data..L__unnamed_12'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_19) is
> being placed in '.data..L__unnamed_19'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_2)
> is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_3)
> is being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_4)
> is being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_5)
> is being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_6)
> is being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(ubifs/debug.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/debug.o):(.data..L__unnamed_2) =
is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/dev.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/dev.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/dir.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(fuse/inode.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/readdir.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/readdir.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/virtio_fs.o):(.data..L__unnamed_=
1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/virtio_fs.o):(.data..L__unnamed_=
2)
> is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(orangefs/inode.o):(.data..L__unnamed_=
1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(orangefs/devorangefs-
> req.o):(.data..L__unnamed_1) is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(orangefs/devorangefs-
> req.o):(.data..L__unnamed_2) is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(orangefs/orangefs-
> bufmap.o):(.data..L__unnamed_1) is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(orangefs/orangefs-
> bufmap.o):(.data..L__unnamed_2) is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(9p/vfs_super.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(9p/vfs_file.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/addr_list.o):(.data..L__unnamed_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/callback.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> > >> ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/cmservice.o):(.data..L__unnamed_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_12) is
> being placed in '.data..L__unnamed_12'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_15) is
> being placed in '.data..L__unnamed_15'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_5)=
 is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_6)=
 is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/dynroot.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/file.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/file.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_5)=
 is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_6)=
 is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/fs_operation.o):(.data..L__unname=
d_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/misc.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/mntpt.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_15) is
> being placed in '.data..L__unnamed_15'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_21) is
> being placed in '.data..L__unnamed_21'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_12) is
> being placed in '.data..L__unnamed_12'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_18) is
> being placed in '.data..L__unnamed_18'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_19) is
> being placed in '.data..L__unnamed_19'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_17) is
> being placed in '.data..L__unnamed_17'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_16) is
> being placed in '.data..L__unnamed_16'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_20) is
> being placed in '.data..L__unnamed_20'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_5)=
 is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> > --
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_20) =
is
> being placed in '.data..L__unnamed_20'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_21) =
is
> being placed in '.data..L__unnamed_21'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_23) =
is
> being placed in '.data..L__unnamed_23'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_22) =
is
> being placed in '.data..L__unnamed_22'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_26) =
is
> being placed in '.data..L__unnamed_26'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_25) =
is
> being placed in '.data..L__unnamed_25'
> >    ld.lld: warning: fs/built-in.a(jffs2/wbuf.o):(.data..L__unnamed_24) =
is
> being placed in '.data..L__unnamed_24'
> >    ld.lld: warning: fs/built-in.a(ubifs/journal.o):(.data..L__unnamed_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/dir.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_4) =
is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_2) =
is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/super.o):(.data..L__unnamed_3) =
is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/sb.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(ubifs/io.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(ubifs/master.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/master.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/scan.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/scan.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/replay.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/budget.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/tnc_commit.o):(.data..L__unname=
d_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/tnc_commit.o):(.data..L__unname=
d_2)
> is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/tnc_commit.o):(.data..L__unname=
d_3)
> is being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_15) is
> being placed in '.data..L__unnamed_15'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_16) is
> being placed in '.data..L__unnamed_16'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_17) is
> being placed in '.data..L__unnamed_17'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_18) is
> being placed in '.data..L__unnamed_18'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_12) is
> being placed in '.data..L__unnamed_12'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt.o):(.data..L__unnamed_19) is
> being placed in '.data..L__unnamed_19'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_2)
> is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_3)
> is being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_4)
> is being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_5)
> is being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(ubifs/lpt_commit.o):(.data..L__unname=
d_6)
> is being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(ubifs/debug.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(ubifs/debug.o):(.data..L__unnamed_2) =
is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/dev.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/dev.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/dir.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(fuse/file.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(fuse/inode.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/readdir.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/readdir.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(fuse/virtio_fs.o):(.data..L__unnamed_=
1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(fuse/virtio_fs.o):(.data..L__unnamed_=
2)
> is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(orangefs/inode.o):(.data..L__unnamed_=
1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(orangefs/devorangefs-
> req.o):(.data..L__unnamed_1) is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(orangefs/devorangefs-
> req.o):(.data..L__unnamed_2) is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(orangefs/orangefs-
> bufmap.o):(.data..L__unnamed_1) is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(orangefs/orangefs-
> bufmap.o):(.data..L__unnamed_2) is being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(9p/vfs_super.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(9p/vfs_file.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/addr_list.o):(.data..L__unnamed_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/callback.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> > >> ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/cell.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/cmservice.o):(.data..L__unnamed_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_12) is
> being placed in '.data..L__unnamed_12'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(afs/dir.o):(.data..L__unnamed_15) is
> being placed in '.data..L__unnamed_15'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_5)=
 is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/dir_edit.o):(.data..L__unnamed_6)=
 is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/dynroot.o):(.data..L__unnamed_1) =
is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/file.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/file.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/flock.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_5)=
 is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_6)=
 is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/fsclient.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/fs_operation.o):(.data..L__unname=
d_1)
> is being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/fs_probe.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/inode.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/misc.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/mntpt.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/rotate.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_11) is
> being placed in '.data..L__unnamed_11'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_15) is
> being placed in '.data..L__unnamed_15'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_21) is
> being placed in '.data..L__unnamed_21'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_12) is
> being placed in '.data..L__unnamed_12'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_18) is
> being placed in '.data..L__unnamed_18'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_19) is
> being placed in '.data..L__unnamed_19'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_17) is
> being placed in '.data..L__unnamed_17'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_16) is
> being placed in '.data..L__unnamed_16'
> >    ld.lld: warning: fs/built-in.a(afs/rxrpc.o):(.data..L__unnamed_20) is
> being placed in '.data..L__unnamed_20'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_2)=
 is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_3)=
 is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_1)=
 is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_4)=
 is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/security.o):(.data..L__unnamed_5)=
 is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/server.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_2) is
> being placed in '.data..L__unnamed_2'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_1) is
> being placed in '.data..L__unnamed_1'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_7) is
> being placed in '.data..L__unnamed_7'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_3) is
> being placed in '.data..L__unnamed_3'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_4) is
> being placed in '.data..L__unnamed_4'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_5) is
> being placed in '.data..L__unnamed_5'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_6) is
> being placed in '.data..L__unnamed_6'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_13) is
> being placed in '.data..L__unnamed_13'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_14) is
> being placed in '.data..L__unnamed_14'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_8) is
> being placed in '.data..L__unnamed_8'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_9) is
> being placed in '.data..L__unnamed_9'
> >    ld.lld: warning: fs/built-in.a(afs/super.o):(.data..L__unnamed_10) is
> being placed in '.data..L__unnamed_10'
> > ..
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps
> "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an
> email to clang-built-linux+unsubscribe(a)googlegroups.com.
> > To view this discussion on the web visit
> https://groups.google.com/d/msgid/clang-built-linux/202010240159.IPld6mlB-
> lkp%40intel.com.
> =

> =

> =

> --
> Thanks,
> ~Nick Desaulniers
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============4016428623970808623==--

