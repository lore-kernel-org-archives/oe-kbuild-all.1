Content-Type: multipart/mixed; boundary="===============0736884733099591103=="
MIME-Version: 1.0
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.4.y 2066/5257] ubsan.c:undefined reference to `__ashlti3'
Date: Wed, 20 May 2020 20:34:23 +0800
Message-ID: <aa2b91e9-17bc-3819-fea4-7ac1c64d011f@huawei.com>
In-Reply-To: <20200520065458.GC12637@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0736884733099591103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2020/5/20 14:54, kbuild test robot wrote:
> Hi Kefeng,
>
> It's probably a bug fix that unveils the link errors.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-5.4.y
> head:   cac6eb2794c85e7777fb0caac6fa75b6364d81a0
> commit: 1865d6440fb63ad979d7034b2d7c94937bfd2200 [2066/5257] PCI: mobivei=
l: Fix csr_read()/write() build issue
> config: riscv-allyesconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout 1865d6440fb63ad979d7034b2d7c94937bfd2200
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Driscv
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> riscv64-linux-ld: lib/ubsan.o: in function `.L2':
>>> ubsan.c:(.text.unlikely+0x38): undefined reference to `__ashlti3'
>>> riscv64-linux-ld: ubsan.c:(.text.unlikely+0x42): undefined reference to=
 `__ashrti3'

My patch is irrelevant=EF=BC=8Cit seems that the following patch fix build =
error.

commit fc585d4a5cf614727f64d86550b794bcad29d5c3
Author: Olof Johansson <olof@lixom.net>
Date:=C2=A0=C2=A0 Mon Dec 16 20:06:31 2019 -0800

 =C2=A0=C2=A0=C2=A0 riscv: Less inefficient gcc tishift helpers (and export=
 their symbols)


> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0736884733099591103==--

