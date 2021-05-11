Content-Type: multipart/mixed; boundary="===============8531014034770990943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf] bpf: Fix nested bpf_bprintf_prepare with more per-cpu buffers
Date: Tue, 11 May 2021 09:57:56 +0800
Message-ID: <202105110911.f084GH7J-lkp@intel.com>
In-Reply-To: <20210510213709.2004366-1-revest@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8531014034770990943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Florent,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf/master]

url:    https://github.com/0day-ci/linux/commits/Florent-Revest/bpf-Fix-nes=
ted-bpf_bprintf_prepare-with-more-per-cpu-buffers/20210511-053835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: s390-randconfig-r013-20210510 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fed6=
35fe1701470062495a6ffee1c608f3f1bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/1f5d45d9243d8ca8ece81e778=
579fc46a1946887
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Florent-Revest/bpf-Fix-nested-bpf_=
bprintf_prepare-with-more-per-cpu-buffers/20210511-053835
        git checkout 1f5d45d9243d8ca8ece81e778579fc46a1946887
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:52: note: expanded from macro '__verify_=
pcpu_ptr'
           const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL;  =
  \
                                                       ~~~~~ ^
   kernel/bpf/helpers.c:703:30: note: forward declaration of 'struct bpf_bp=
rintf_bufs'
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                ^
   kernel/bpf/helpers.c:718:23: error: use of undeclared identifier 'bpf_bp=
rintf_buf'; did you mean 'bpf_bprintf_bufs'?
           bufs =3D this_cpu_ptr(&bpf_bprintf_buf);
                                ^~~~~~~~~~~~~~~
                                bpf_bprintf_bufs
   include/linux/percpu-defs.h:252:39: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                                         ^
   include/linux/percpu-defs.h:242:19: note: expanded from macro 'raw_cpu_p=
tr'
           arch_raw_cpu_ptr(ptr);                                          \
                            ^
   include/asm-generic/percpu.h:44:48: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                                  ^
   include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PER=
CPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                ^
   include/linux/compiler.h:181:31: note: expanded from macro 'RELOC_HIDE'
        __ptr =3D (unsigned long) (ptr);                             \
                                 ^
   kernel/bpf/helpers.c:703:48: note: 'bpf_bprintf_bufs' declared here
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                                  ^
   kernel/bpf/helpers.c:718:23: error: use of undeclared identifier 'bpf_bp=
rintf_buf'; did you mean 'bpf_bprintf_bufs'?
           bufs =3D this_cpu_ptr(&bpf_bprintf_buf);
                                ^~~~~~~~~~~~~~~
                                bpf_bprintf_bufs
   include/linux/percpu-defs.h:252:39: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                                         ^
   include/linux/percpu-defs.h:242:19: note: expanded from macro 'raw_cpu_p=
tr'
           arch_raw_cpu_ptr(ptr);                                          \
                            ^
   include/asm-generic/percpu.h:44:48: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                                  ^
   include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PER=
CPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                                          ^
   include/linux/compiler.h:181:31: note: expanded from macro 'RELOC_HIDE'
        __ptr =3D (unsigned long) (ptr);                             \
                                 ^
   kernel/bpf/helpers.c:703:48: note: 'bpf_bprintf_bufs' declared here
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                                  ^
   kernel/bpf/helpers.c:718:23: error: use of undeclared identifier 'bpf_bp=
rintf_buf'; did you mean 'bpf_bprintf_bufs'?
           bufs =3D this_cpu_ptr(&bpf_bprintf_buf);
                                ^~~~~~~~~~~~~~~
                                bpf_bprintf_bufs
   include/linux/percpu-defs.h:252:39: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                                         ^
   include/linux/percpu-defs.h:242:19: note: expanded from macro 'raw_cpu_p=
tr'
           arch_raw_cpu_ptr(ptr);                                          \
                            ^
   include/asm-generic/percpu.h:44:48: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                                  ^
   include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PER=
CPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                ^
   include/linux/compiler.h:182:13: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
               ^
   kernel/bpf/helpers.c:703:48: note: 'bpf_bprintf_bufs' declared here
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                                  ^
   kernel/bpf/helpers.c:718:23: error: use of undeclared identifier 'bpf_bp=
rintf_buf'; did you mean 'bpf_bprintf_bufs'?
           bufs =3D this_cpu_ptr(&bpf_bprintf_buf);
                                ^~~~~~~~~~~~~~~
                                bpf_bprintf_bufs
   include/linux/percpu-defs.h:252:39: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                                         ^
   include/linux/percpu-defs.h:242:19: note: expanded from macro 'raw_cpu_p=
tr'
           arch_raw_cpu_ptr(ptr);                                          \
                            ^
   include/asm-generic/percpu.h:44:48: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                                  ^
   include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PER=
CPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                                          ^
   include/linux/compiler.h:182:13: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
               ^
   kernel/bpf/helpers.c:703:48: note: 'bpf_bprintf_bufs' declared here
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                                  ^
>> kernel/bpf/helpers.c:718:7: error: incompatible pointer types assigning =
to 'struct bpf_bprintf_buffers *' from 'typeof ((typeof (*(&bpf_bprintf_buf=
s)) *)(&bpf_bprintf_bufs))' (aka 'struct bpf_bprintf_bufs *') [-Werror,-Win=
compatible-pointer-types]
           bufs =3D this_cpu_ptr(&bpf_bprintf_buf);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:703:48: error: tentative definition has type 'typeo=
f(struct bpf_bprintf_bufs)' (aka 'struct bpf_bprintf_bufs') that is never c=
ompleted
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                                  ^
   kernel/bpf/helpers.c:703:30: note: forward declaration of 'struct bpf_bp=
rintf_bufs'
   static DEFINE_PER_CPU(struct bpf_bprintf_bufs, bpf_bprintf_bufs);
                                ^
   12 warnings and 8 errors generated.


vim +718 kernel/bpf/helpers.c

   705	=

   706	static int try_get_fmt_tmp_buf(char **tmp_buf)
   707	{
   708		struct bpf_bprintf_buffers *bufs;
   709		int nest_level;
   710	=

   711		preempt_disable();
   712		nest_level =3D this_cpu_inc_return(bpf_bprintf_nest_level);
   713		if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(bufs->tmp_bufs))) {
   714			this_cpu_dec(bpf_bprintf_nest_level);
   715			preempt_enable();
   716			return -EBUSY;
   717		}
 > 718		bufs =3D this_cpu_ptr(&bpf_bprintf_buf);
   719		*tmp_buf =3D bufs->tmp_bufs[nest_level - 1];
   720	=

   721		return 0;
   722	}
   723	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8531014034770990943==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/UmN5+y9EjmH8Xvr/wHUH7mxNOEAAA==
--===============8531014034770990943==--

