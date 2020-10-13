Content-Type: multipart/mixed; boundary="===============2057052555878793438=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [wtarreau-prandom:prandom-5.10-v3 2/2] include/asm-generic/percpu.h:128:2: error: implicit declaration of function 'raw_local_irq_save'
Date: Tue, 13 Oct 2020 08:05:55 +0800
Message-ID: <202010130850.Ab2YPjRN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2057052555878793438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/prandom.gi=
t prandom-5.10-v3
head:   3486a21c7e5bafbdbc0f7ea5d40f3dad39022bf4
commit: 3486a21c7e5bafbdbc0f7ea5d40f3dad39022bf4 [2/2] random32: add noise =
from network and scheduling activity
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/prandom.=
git/commit/?id=3D3486a21c7e5bafbdbc0f7ea5d40f3dad39022bf4
        git remote add wtarreau-prandom https://git.kernel.org/pub/scm/linu=
x/kernel/git/wtarreau/prandom.git
        git fetch --no-tags wtarreau-prandom prandom-5.10-v3
        git checkout 3486a21c7e5bafbdbc0f7ea5d40f3dad39022bf4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/percpu.h:1,
                    from include/linux/percpu.h:13,
                    from include/linux/prandom.h:12,
                    from include/linux/random.h:118,
                    from include/linux/net.h:18,
                    from fs/nfs/mount_clnt.c:13:
   include/linux/prandom.h: In function 'prandom_u32_add_noise':
>> include/asm-generic/percpu.h:128:2: error: implicit declaration of funct=
ion 'raw_local_irq_save' [-Werror=3Dimplicit-function-declaration]
     128 |  raw_local_irq_save(__flags);     \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:140:11: note: in expansion of macro '__this=
_cpu_generic_read_noirq'
     140 |   __ret =3D __this_cpu_generic_read_noirq(pcp);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:320:31: note: in expansion of macro 'this_c=
pu_generic_read'
     320 | #define this_cpu_read_1(pcp)  this_cpu_generic_read(pcp)
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:321:23: note: in expansion of macro 'this_cp=
u_read_1'
     321 |  case 1: pscr_ret__ =3D stem##1(variable); break;   \
         |                       ^~~~
   include/linux/percpu-defs.h:507:29: note: in expansion of macro '__pcpu_=
size_call_return'
     507 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_rea=
d_, pcp)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/prandom.h:66:7: note: in expansion of macro 'this_cpu_read'
      66 |  a ^=3D this_cpu_read(net_rand_noise);
         |       ^~~~~~~~~~~~~
>> include/asm-generic/percpu.h:130:2: error: implicit declaration of funct=
ion 'raw_local_irq_restore' [-Werror=3Dimplicit-function-declaration]
     130 |  raw_local_irq_restore(__flags);     \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:140:11: note: in expansion of macro '__this=
_cpu_generic_read_noirq'
     140 |   __ret =3D __this_cpu_generic_read_noirq(pcp);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:320:31: note: in expansion of macro 'this_c=
pu_generic_read'
     320 | #define this_cpu_read_1(pcp)  this_cpu_generic_read(pcp)
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:321:23: note: in expansion of macro 'this_cp=
u_read_1'
     321 |  case 1: pscr_ret__ =3D stem##1(variable); break;   \
         |                       ^~~~
   include/linux/percpu-defs.h:507:29: note: in expansion of macro '__pcpu_=
size_call_return'
     507 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_rea=
d_, pcp)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/prandom.h:66:7: note: in expansion of macro 'this_cpu_read'
      66 |  a ^=3D this_cpu_read(net_rand_noise);
         |       ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/raw_local_irq_save +128 include/asm-generic/percpu.h

9c28278a24c01c0 Tejun Heo    2014-06-17  123  =

e88d62cd4b2f0b1 Mark Rutland 2017-09-26  124  #define __this_cpu_generic_re=
ad_noirq(pcp)				\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  125  ({									\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  126  	typeof(pcp) __ret;						\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  127  	unsigned long __flags;						\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26 @128  	raw_local_irq_save(__flags);=
					\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  129  	__ret =3D raw_cpu_generic_re=
ad(pcp);				\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26 @130  	raw_local_irq_restore(__flag=
s);					\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  131  	__ret;								\
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  132  })
e88d62cd4b2f0b1 Mark Rutland 2017-09-26  133  =


:::::: The code at line 128 was first introduced by commit
:::::: e88d62cd4b2f0b1ae55e9008e79c2794b1fc914d percpu: make this_cpu_gener=
ic_read() atomic w.r.t. interrupts

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Tejun Heo <tj@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2057052555878793438==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
SlgGSWMVcu+m77hyq2v2/wFPZy4P7o4AAA==
--===============2057052555878793438==--

