Content-Type: multipart/mixed; boundary="===============8233419780827858498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] smp: Modify 'int' to 'bool' in smp_call_function_single()
Date: Wed, 20 Jan 2021 19:43:03 +0800
Message-ID: <202101201916.VfPnemgs-lkp@intel.com>
In-Reply-To: <20210119141350.80522-1-yejune.deng@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8233419780827858498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yejune,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.11-rc4 next-20210120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yejune-Deng/smp-Modify-int=
-to-bool-in-smp_call_function_single/20210120-154807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
45dfb8a5659ad286c28fa59008271dbc4e5e3f2d
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/856e1f8de78bcf1c02ffa0f33=
a5047172bd0d0c9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yejune-Deng/smp-Modify-int-to-bool=
-in-smp_call_function_single/20210120-154807
        git checkout 856e1f8de78bcf1c02ffa0f33a5047172bd0d0c9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/up.c:12:5: error: conflicting types for 'smp_call_function_single'
      12 | int smp_call_function_single(int cpu, void (*func) (void *info),=
 void *info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from kernel/up.c:6:
   include/linux/smp.h:50:5: note: previous declaration of 'smp_call_functi=
on_single' was here
      50 | int smp_call_function_single(int cpuid, smp_call_func_t func, vo=
id *info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:7,
                    from include/linux/interrupt.h:6,
                    from kernel/up.c:6:
   kernel/up.c:26:15: error: conflicting types for 'smp_call_function_singl=
e'
      26 | EXPORT_SYMBOL(smp_call_function_single);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:98:21: note: in definition of macro '___EXPORT_SY=
MBOL'
      98 |  extern typeof(sym) sym;       \
         |                     ^~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYM=
BOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMB=
OL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   kernel/up.c:26:1: note: in expansion of macro 'EXPORT_SYMBOL'
      26 | EXPORT_SYMBOL(smp_call_function_single);
         | ^~~~~~~~~~~~~
   In file included from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from kernel/up.c:6:
   include/linux/smp.h:50:5: note: previous declaration of 'smp_call_functi=
on_single' was here
      50 | int smp_call_function_single(int cpuid, smp_call_func_t func, vo=
id *info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/up.c:39:6: error: conflicting types for 'on_each_cpu'
      39 | void on_each_cpu(smp_call_func_t func, void *info, int wait)
         |      ^~~~~~~~~~~
   In file included from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from kernel/up.c:6:
   include/linux/smp.h:56:6: note: previous declaration of 'on_each_cpu' wa=
s here
      56 | void on_each_cpu(smp_call_func_t func, void *info, bool wait);
         |      ^~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:7,
                    from include/linux/interrupt.h:6,
                    from kernel/up.c:6:
   kernel/up.c:47:15: error: conflicting types for 'on_each_cpu'
      47 | EXPORT_SYMBOL(on_each_cpu);
         |               ^~~~~~~~~~~
   include/linux/export.h:98:21: note: in definition of macro '___EXPORT_SY=
MBOL'
      98 |  extern typeof(sym) sym;       \
         |                     ^~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYM=
BOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:158:29: note: in expansion of macro '_EXPORT_SYMB=
OL'
     158 | #define EXPORT_SYMBOL(sym)  _EXPORT_SYMBOL(sym, "")
         |                             ^~~~~~~~~~~~~~
   kernel/up.c:47:1: note: in expansion of macro 'EXPORT_SYMBOL'
      47 | EXPORT_SYMBOL(on_each_cpu);
         | ^~~~~~~~~~~~~
   In file included from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from kernel/up.c:6:
   include/linux/smp.h:56:6: note: previous declaration of 'on_each_cpu' wa=
s here
      56 | void on_each_cpu(smp_call_func_t func, void *info, bool wait);
         |      ^~~~~~~~~~~


vim +/smp_call_function_single +12 kernel/up.c

53ce3d956490879 Andrew Morton       2009-01-09  11  =

53ce3d956490879 Andrew Morton       2009-01-09 @12  int smp_call_function_s=
ingle(int cpu, void (*func) (void *info), void *info,
53ce3d956490879 Andrew Morton       2009-01-09  13  				int wait)
53ce3d956490879 Andrew Morton       2009-01-09  14  {
081192b25c2d462 David Daney         2013-09-11  15  	unsigned long flags;
081192b25c2d462 David Daney         2013-09-11  16  =

1e474b28e78897d Paul E. McKenney    2020-02-05  17  	if (cpu !=3D 0)
1e474b28e78897d Paul E. McKenney    2020-02-05  18  		return -ENXIO;
93423b8665f43a0 Ingo Molnar         2009-01-11  19  =

081192b25c2d462 David Daney         2013-09-11  20  	local_irq_save(flags);
081192b25c2d462 David Daney         2013-09-11  21  	func(info);
081192b25c2d462 David Daney         2013-09-11  22  	local_irq_restore(flag=
s);
93423b8665f43a0 Ingo Molnar         2009-01-11  23  =

53ce3d956490879 Andrew Morton       2009-01-09  24  	return 0;
53ce3d956490879 Andrew Morton       2009-01-09  25  }
53ce3d956490879 Andrew Morton       2009-01-09  26  EXPORT_SYMBOL(smp_call_=
function_single);
fa688207c9db48b David Daney         2013-09-11  27  =

966a967116e6997 Ying Huang          2017-08-08  28  int smp_call_function_s=
ingle_async(int cpu, call_single_data_t *csd)
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  29  {
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  30  	unsigned long flags;
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  31  =

40c01e8bd5575e3 Christoph Hellwig   2013-11-14  32  	local_irq_save(flags);
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  33  	csd->func(csd->info);
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  34  	local_irq_restore(flag=
s);
08eed44c7249d38 Jan Kara            2014-02-24  35  	return 0;
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  36  }
c46fff2a3b29794 Frederic Weisbecker 2014-02-24  37  EXPORT_SYMBOL(smp_call_=
function_single_async);
40c01e8bd5575e3 Christoph Hellwig   2013-11-14  38  =

caa759323c73676 Nadav Amit          2019-06-12 @39  void on_each_cpu(smp_ca=
ll_func_t func, void *info, int wait)
bff2dc42bcafdd7 David Daney         2013-09-11  40  {
bff2dc42bcafdd7 David Daney         2013-09-11  41  	unsigned long flags;
bff2dc42bcafdd7 David Daney         2013-09-11  42  =

bff2dc42bcafdd7 David Daney         2013-09-11  43  	local_irq_save(flags);
bff2dc42bcafdd7 David Daney         2013-09-11  44  	func(info);
bff2dc42bcafdd7 David Daney         2013-09-11  45  	local_irq_restore(flag=
s);
bff2dc42bcafdd7 David Daney         2013-09-11  46  }
bff2dc42bcafdd7 David Daney         2013-09-11  47  EXPORT_SYMBOL(on_each_c=
pu);
bff2dc42bcafdd7 David Daney         2013-09-11  48  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8233419780827858498==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8233419780827858498==--

