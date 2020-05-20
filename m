Content-Type: multipart/mixed; boundary="===============7741063039992373676=="
MIME-Version: 1.0
From: Mike Snitzer <snitzer@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 8920/10701] drivers/md/dm-zoned-metadata.c:2468:6: warning: no previous prototype for function 'dmz_print_dev'
Date: Wed, 20 May 2020 15:52:39 -0400
Message-ID: <20200520195239.GB4926@redhat.com>
In-Reply-To: <202005210326.AIKCArlF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7741063039992373676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Wed, May 20 2020 at  3:31pm -0400,
kbuild test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 5990119677a94b79da19c01770d3fe0ceda77229 [8920/10701] dm zoned: a=
dd metadata logging functions
> config: arm64-randconfig-r005-20200520 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e665=
8079aca6d971b4e9d7137a3a2ecbc9c34aec)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         git checkout 5990119677a94b79da19c01770d3fe0ceda77229
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/md/dm-zoned-metadata.c:2468:6: warning: no previous prototype =
for function 'dmz_print_dev' [-Wmissing-prototypes]
> void dmz_print_dev(struct dmz_metadata *zmd, int num)
> ^
> drivers/md/dm-zoned-metadata.c:2468:1: note: declare 'static' if the func=
tion is not intended to be used outside of this translation unit
> void dmz_print_dev(struct dmz_metadata *zmd, int num)
> ^
> static
> 1 warning generated.

I've now made dmz_print_dev static.

Thanks,
Mike

--===============7741063039992373676==--

