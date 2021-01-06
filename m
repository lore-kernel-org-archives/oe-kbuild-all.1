Content-Type: multipart/mixed; boundary="===============4601851862905639636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next 2/4] bpf: support BPF ksym variables in kernel modules
Date: Wed, 06 Jan 2021 16:16:31 +0800
Message-ID: <202101061625.D0C0F3ZJ-lkp@intel.com>
In-Reply-To: <20210106064048.2554276-3-andrii@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4601851862905639636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrii,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Andrii-Nakryiko/Support-ke=
rnel-module-ksym-variables/20210106-144531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1dde2eabb1a7670d0e764e46d=
ae1ef0a9abf0466
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andrii-Nakryiko/Support-kernel-mod=
ule-ksym-variables/20210106-144531
        git checkout 1dde2eabb1a7670d0e764e46dae1ef0a9abf0466
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1350:12: warning: no previous prototype for 'bpf_probe=
_read_kernel' [-Wmissing-prototypes]
    1350 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void=
 *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/core.c:21:
   kernel/bpf/core.c: In function '___bpf_prog_run':
   include/linux/filter.h:888:3: warning: cast between incompatible functio=
n types from 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigne=
d int (*)(long long unsigned int,  long long unsigned int,  long long unsig=
ned int,  long long unsigned int,  long long unsigned int)'} to 'u64 (*)(u6=
4,  u64,  u64,  u64,  u64,  const struct bpf_insn *)' {aka 'long long unsig=
ned int (*)(long long unsigned int,  long long unsigned int,  long long uns=
igned int,  long long unsigned int,  long long unsigned int,  const struct =
bpf_insn *)'} [-Wcast-function-type]
     888 |  ((u64 (*)(u64, u64, u64, u64, u64, const struct bpf_insn *)) \
         |   ^
   kernel/bpf/core.c:1518:13: note: in expansion of macro '__bpf_call_base_=
args'
    1518 |   BPF_R0 =3D (__bpf_call_base_args + insn->imm)(BPF_R1, BPF_R2,
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: At top level:
   kernel/bpf/core.c:1704:6: warning: no previous prototype for 'bpf_patch_=
call_args' [-Wmissing-prototypes]
    1704 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/core.c:21:
   kernel/bpf/core.c: In function 'bpf_patch_call_args':
   include/linux/filter.h:888:3: warning: cast between incompatible functio=
n types from 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigne=
d int (*)(long long unsigned int,  long long unsigned int,  long long unsig=
ned int,  long long unsigned int,  long long unsigned int)'} to 'u64 (*)(u6=
4,  u64,  u64,  u64,  u64,  const struct bpf_insn *)' {aka 'long long unsig=
ned int (*)(long long unsigned int,  long long unsigned int,  long long uns=
igned int,  long long unsigned int,  long long unsigned int,  const struct =
bpf_insn *)'} [-Wcast-function-type]
     888 |  ((u64 (*)(u64, u64, u64, u64, u64, const struct bpf_insn *)) \
         |   ^
   kernel/bpf/core.c:1709:3: note: in expansion of macro '__bpf_call_base_a=
rgs'
    1709 |   __bpf_call_base_args;
         |   ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: At top level:
   kernel/bpf/core.c:2102:6: warning: no previous prototype for '__bpf_free=
_used_maps' [-Wmissing-prototypes]
    2102 | void __bpf_free_used_maps(struct bpf_prog_aux *aux,
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/core.c:2122:6: warning: no previous prototype for '__bpf_free=
_used_btfs' [-Wmissing-prototypes]
    2122 | void __bpf_free_used_btfs(struct bpf_prog_aux *aux,
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/__bpf_free_used_btfs +2122 kernel/bpf/core.c

  2121	=

> 2122	void __bpf_free_used_btfs(struct bpf_prog_aux *aux,
  2123				  struct btf_mod_pair *used_btfs, u32 len)
  2124	{
  2125	#ifdef CONFIG_BPF_SYSCALL
  2126		struct btf_mod_pair *btf_mod;
  2127		u32 i;
  2128	=

  2129		for (i =3D 0; i < len; i++) {
  2130			btf_mod =3D &used_btfs[i];
  2131			if (btf_mod->module)
  2132				module_put(btf_mod->module);
  2133			btf_put(btf_mod->btf);
  2134		}
  2135	#endif
  2136	}
  2137	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4601851862905639636==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
1cqk/D8Hj9ii+qgAAA==
--===============4601851862905639636==--

