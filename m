Content-Type: multipart/mixed; boundary="===============2694152169787870183=="
MIME-Version: 1.0
From: Mike Snitzer <snitzer@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 8923/10701] drivers/md/dm-zoned-metadata.c:224:14: warning: no previous prototype for function 'dmz_dev_zone_id'
Date: Wed, 20 May 2020 17:12:50 -0400
Message-ID: <20200520211249.GA5802@redhat.com>
In-Reply-To: <202005210514.4YeeHabo%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2694152169787870183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20 2020 at  5:00pm -0400,
kbuild test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 58f6902a2eba7313d37d30bce18a331460f19699 [8923/10701] dm zoned: m=
etadata version 2
> config: arm64-randconfig-r005-20200520 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e665=
8079aca6d971b4e9d7137a3a2ecbc9c34aec)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         git checkout 58f6902a2eba7313d37d30bce18a331460f19699
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/md/dm-zoned-metadata.c:224:14: warning: no previous prototype =
for function 'dmz_dev_zone_id' [-Wmissing-prototypes]
> unsigned int dmz_dev_zone_id(struct dmz_metadata *zmd, struct dm_zone *zo=
ne)
> ^
> drivers/md/dm-zoned-metadata.c:224:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
> unsigned int dmz_dev_zone_id(struct dmz_metadata *zmd, struct dm_zone *zo=
ne)
> ^

Fixed by making dmz_dev_zone_id static.

Thanks,
Mike

--===============2694152169787870183==--

