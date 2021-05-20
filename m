Content-Type: multipart/mixed; boundary="===============8893555028838995425=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:pending-fixes 118/395] extable.c:undefined reference to `arm64_bpf_fixup_exception'
Date: Thu, 20 May 2021 23:57:43 +0200
Message-ID: <020bb9c5-e029-80ef-aa01-784cb34e2b58@iogearbox.net>
In-Reply-To: <202105191005.n805ieKd-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8893555028838995425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/19/21 4:20 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it pending-fixes
> head:   8bb1ba5daf09803b0c243a53d34f6ae1da8acc23
> commit: b24abcff918a5cbf44b0c982bd3477a93e8e4911 [118/395] bpf, kconfig: =
Add consolidated menu entry for bpf with core options
> config: arm64-randconfig-r034-20210519 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project ceb1=
ac9812cb0972cfa34cecc5e5704ae2a22063)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm64 cross compiling tool for clang build
>          # apt-get install binutils-aarch64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/commit/?id=3Db24abcff918a5cbf44b0c982bd3477a93e8e4911
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/next/linux-next.git
>          git fetch --no-tags linux-next pending-fixes
>          git checkout b24abcff918a5cbf44b0c982bd3477a93e8e4911
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Darm64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>     aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
>     aarch64-linux-gnu-ld: arch/arm64/mm/extable.o: in function `fixup_exc=
eption':
>>> extable.c:(.text+0x44): undefined reference to `arm64_bpf_fixup_excepti=
on'

Reproduced, fixed and squashed into:

https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=3D6b=
dacdb48e94ff26c03c6eeeef48c03c5e2f7dd4

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============8893555028838995425==--

