Content-Type: multipart/mixed; boundary="===============5825018163903804443=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [sashal-linux-stable:queue-4.14 70/79] Warning: ffffffff819d7582: 0f ff 48 8d ud0 -0x73(%rax), %ecx
Date: Mon, 18 May 2020 15:03:06 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E662495263DD03@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <202005182129.xclMYRyy%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5825018163903804443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild-all] [sashal-linux-stable:queue-4.14 70/79] Warning:
> ffffffff819d7582: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git queue-
> 4.14
> head:   7a7ddea1b419e20931152e388252c661b6fca95c
> commit: cd2ac280c3cfcb76e71439deb9928a10e029f1dc [70/79] pnp: Use
> list_for_each_entry() instead of open coding
> config: x86_64-randconfig-a013-20200517 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project
> 135b877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout cd2ac280c3cfcb76e71439deb9928a10e029f1dc
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> Warning: ffffffff819d7582: 0f ff 48 8d ud0 -0x73(%rax),%ecx
Sorry for this continuous false positive, we will resolve this in earliest =
time.

> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at
> <memcpy_page_flushcache>:ffffffff819d6b20
> --
> >> Warning: ffffffff819d79ab: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at
> <memcpy_page_flushcache>:ffffffff819d6b20
> --
> >> Warning: ffffffff819d85ac: 0f ff 49 8d ud0 -0x73(%rcx),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at
> <memcpy_page_flushcache>:ffffffff819d6b20
> --
> >> Warning: ffffffff819d7111: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at
> <memcpy_page_flushcache>:ffffffff819d6b20
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5825018163903804443==--

