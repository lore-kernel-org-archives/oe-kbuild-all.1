Content-Type: multipart/mixed; boundary="===============2515441510157313415=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 1891/4016] riscv64-linux-ld: bpf_jit_core.c:undefined reference to `bpf_jit_enable'
Date: Thu, 20 May 2021 23:04:17 +0200
Message-ID: <3e55e194-710d-70d8-7e5c-6c89a5eea918@iogearbox.net>
In-Reply-To: <202105202104.iGoWgy8R-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2515441510157313415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/20/21 3:23 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   7a42b92b6d30c3f09629c7d5ada9e3de2aba01af
> commit: b24abcff918a5cbf44b0c982bd3477a93e8e4911 [1891/4016] bpf, kconfig=
: Add consolidated menu entry for bpf with core options
> config: riscv-randconfig-c004-20210520 (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/commit/?id=3Db24abcff918a5cbf44b0c982bd3477a93e8e4911
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout b24abcff918a5cbf44b0c982bd3477a93e8e4911
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Driscv
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> Note: the linux-next/master HEAD 7a42b92b6d30c3f09629c7d5ada9e3de2aba01af=
 builds fine.
>        It may have been fixed somewhere.
> =

> All errors (new ones prefixed by >>):
> =

>     riscv64-linux-ld: arch/riscv/net/bpf_jit_core.o: in function `bpf_int=
_jit_compile':
>>> bpf_jit_core.c:(.text+0x13a): undefined reference to `bpf_jit_blind_con=
stants'
>>> riscv64-linux-ld: bpf_jit_core.c:(.text+0x190): undefined reference to =
`bpf_jit_enable'
>>> riscv64-linux-ld: bpf_jit_core.c:(.text+0x1e6): undefined reference to =
`bpf_jit_prog_release_other'
>>> riscv64-linux-ld: bpf_jit_core.c:(.text+0x20a): undefined reference to =
`bpf_jit_binary_free'
>>> riscv64-linux-ld: bpf_jit_core.c:(.text+0x2e6): undefined reference to =
`bpf_jit_binary_alloc'
>     riscv64-linux-ld: arch/riscv/net/bpf_jit_comp64.o: in function `.L750=
':
>>> bpf_jit_comp64.c:(.text+0x234c): undefined reference to `bpf_jit_get_fu=
nc_addr'

I tried on bpf tree and it seems fixed there via:

https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=3Dc8=
7db2405fe8e53e145e2d1e142d3b509644006b

So this might be an old report.

>     riscv64-linux-ld: kernel/extable.o: in function `.L0 ':
>     extable.c:(.text+0x9c): undefined reference to `search_bpf_extables'
>     riscv64-linux-ld: kernel/extable.o: in function `.L31':
>     extable.c:(.text+0x208): undefined reference to `is_bpf_text_address'
>     riscv64-linux-ld: kernel/kallsyms.o: in function `.L69':
>     kallsyms.c:(.text+0x2e6): undefined reference to `__bpf_address_looku=
p'
>     riscv64-linux-ld: kernel/kallsyms.o: in function `.L75':
>     kallsyms.c:(.text+0x3d2): undefined reference to `__bpf_address_looku=
p'
> =

> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for LOCKDEP
>     Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER |=
| MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
>     Selected by
>     - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
>     - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
>     - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============2515441510157313415==--

