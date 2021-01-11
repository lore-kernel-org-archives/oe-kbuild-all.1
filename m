Content-Type: multipart/mixed; boundary="===============3151792782770898739=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 1441/2773] drivers/base/node.c:429:5: warning: no previous prototype for function 'register_mem_block_under_node_early'
Date: Mon, 11 Jan 2021 21:03:40 +0100
Message-ID: <X/yvHIekJZV9WLvO@kroah.com>
In-Reply-To: <CAFqt6zaAd1Oe7FmD8HfumbssyuFO=DkVDzLuq=_Ficg10LRzrg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3151792782770898739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 12:48:22AM +0530, Souptick Joarder wrote:
> On Sun, Jan 10, 2021 at 6:33 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-4.19.y
> > head:   610bdbf6a174c9a91e34e276a9594114b44bef74
> > commit: b6f69f72c15d7f973f5709c5351f378f235b3654 [1441/2773] mm: don't =
rely on system state to detect hot-plug operations
> > config: x86_64-randconfig-a001-20210110 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bc=
556e5685c0f97e79fb7b3c6f15cc5062db8e36)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git/commit/?id=3Db6f69f72c15d7f973f5709c5351f378f235b3654
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/l=
inux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-4.19.y
> >         git checkout b6f69f72c15d7f973f5709c5351f378f235b3654
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/base/node.c:429:5: warning: no previous prototype for functi=
on 'register_mem_block_under_node_early' [-Wmissing-prototypes]
> >    int register_mem_block_under_node_early(struct memory_block *mem_blk=
, void *arg)
> >        ^
> >    drivers/base/node.c:429:1: note: declare 'static' if the function is=
 not intended to be used outside of this translation unit
> >    int register_mem_block_under_node_early(struct memory_block *mem_blk=
, void *arg)
> >    ^
> >    static
> >    1 warning generated.
> =

> It is fixed in the mainline. Will stable tree pick it from there ?

What is the git commit id for this?

thanks,

greg k-h
--===============3151792782770898739==--

