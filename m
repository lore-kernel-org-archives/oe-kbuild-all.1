Content-Type: multipart/mixed; boundary="===============5637971063594420222=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm-platforms:irq/domain_cleanup 14/20] include/linux/irqdesc.h:56:25: error: field 'irq_common_data' has incomplete type
Date: Fri, 14 May 2021 17:08:00 +0800
Message-ID: <202105141751.u2BnRnQY-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5637971063594420222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it irq/domain_cleanup
head:   76a98e310bbd7bada3f24d6fda08858460fd6cd4
commit: 5dd760fc3140b85b7d8cf1ad003238c5a223fc76 [14/20] irqdomain: Introdu=
ce irq_resolve_mapping()
config: mips-randconfig-m031-20210514 (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms=
.git/commit/?id=3D5dd760fc3140b85b7d8cf1ad003238c5a223fc76
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/k=
ernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/domain_cleanup
        git checkout 5dd760fc3140b85b7d8cf1ad003238c5a223fc76
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/irqdomain.h:35,
                    from arch/mips/include/asm/irq.h:14,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/mips/kernel/asm-offsets.c:17:
>> include/linux/irqdesc.h:56:25: error: field 'irq_common_data' has incomp=
lete type
      56 |  struct irq_common_data irq_common_data;
         |                         ^~~~~~~~~~~~~~~
>> include/linux/irqdesc.h:57:19: error: field 'irq_data' has incomplete ty=
pe
      57 |  struct irq_data  irq_data;
         |                   ^~~~~~~~
>> include/linux/irqdesc.h:113:33: error: 'NR_IRQS' undeclared here (not in=
 a function)
     113 | extern struct irq_desc irq_desc[NR_IRQS];
         |                                 ^~~~~~~
   In file included from include/linux/list.h:9,
                    from include/linux/smp.h:12,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
   include/linux/irqdesc.h: In function 'irq_data_to_desc':
>> include/linux/irqdesc.h:124:26: error: dereferencing pointer to incomple=
te type 'struct irq_data'
     124 |  return container_of(data->common, struct irq_desc, irq_common_d=
ata);
         |                          ^~
   include/linux/kernel.h:703:26: note: in definition of macro 'container_o=
f'
     703 |  void *__mptr =3D (void *)(ptr);     \
         |                          ^~~
   In file included from include/linux/irqdomain.h:35,
                    from arch/mips/include/asm/irq.h:14,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/mips/kernel/asm-offsets.c:17:
   include/linux/irqdesc.h: In function 'irq_balancing_disabled':
>> include/linux/irqdesc.h:236:35: error: 'IRQ_NO_BALANCING_MASK' undeclare=
d (first use in this function)
     236 |  return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqdesc.h:236:35: note: each undeclared identifier is repo=
rted only once for each function it appears in
   include/linux/irqdesc.h: In function 'irq_is_percpu':
>> include/linux/irqdesc.h:241:35: error: 'IRQ_PER_CPU' undeclared (first u=
se in this function)
     241 |  return irq_check_status_bit(irq, IRQ_PER_CPU);
         |                                   ^~~~~~~~~~~
   include/linux/irqdesc.h: In function 'irq_is_percpu_devid':
>> include/linux/irqdesc.h:246:35: error: 'IRQ_PER_CPU_DEVID' undeclared (f=
irst use in this function)
     246 |  return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
         |                                   ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c: At top level:
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for =
'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for =
'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for =
'output_thread_info_defines' [-Wmissing-prototypes]
      93 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for=
 'output_thread_defines' [-Wmissing-prototypes]
     109 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for=
 'output_thread_fpu_defines' [-Wmissing-prototypes]
     137 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for=
 'output_mm_defines' [-Wmissing-prototypes]
     180 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for=
 'output_sc_defines' [-Wmissing-prototypes]
     219 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for=
 'output_signal_defined' [-Wmissing-prototypes]
     254 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:333:6: warning: no previous prototype for=
 'output_pm_defines' [-Wmissing-prototypes]
     333 | void output_pm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for=
 'output_kvm_defines' [-Wmissing-prototypes]
     347 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/irqdomain.h:35,
                    from arch/mips/include/asm/irq.h:14,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/mips/kernel/asm-offsets.c:17:
>> include/linux/irqdesc.h:56:25: error: field 'irq_common_data' has incomp=
lete type
      56 |  struct irq_common_data irq_common_data;
         |                         ^~~~~~~~~~~~~~~
>> include/linux/irqdesc.h:57:19: error: field 'irq_data' has incomplete ty=
pe
      57 |  struct irq_data  irq_data;
         |                   ^~~~~~~~
>> include/linux/irqdesc.h:113:33: error: 'NR_IRQS' undeclared here (not in=
 a function)
     113 | extern struct irq_desc irq_desc[NR_IRQS];
         |                                 ^~~~~~~
   In file included from include/linux/list.h:9,
                    from include/linux/smp.h:12,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
   include/linux/irqdesc.h: In function 'irq_data_to_desc':
>> include/linux/irqdesc.h:124:26: error: dereferencing pointer to incomple=
te type 'struct irq_data'
     124 |  return container_of(data->common, struct irq_desc, irq_common_d=
ata);
         |                          ^~
   include/linux/kernel.h:703:26: note: in definition of macro 'container_o=
f'
     703 |  void *__mptr =3D (void *)(ptr);     \
         |                          ^~~
   In file included from include/linux/irqdomain.h:35,
                    from arch/mips/include/asm/irq.h:14,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/mips/kernel/asm-offsets.c:17:
   include/linux/irqdesc.h: In function 'irq_balancing_disabled':
>> include/linux/irqdesc.h:236:35: error: 'IRQ_NO_BALANCING_MASK' undeclare=
d (first use in this function)
     236 |  return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqdesc.h:236:35: note: each undeclared identifier is repo=
rted only once for each function it appears in
   include/linux/irqdesc.h: In function 'irq_is_percpu':
>> include/linux/irqdesc.h:241:35: error: 'IRQ_PER_CPU' undeclared (first u=
se in this function)
     241 |  return irq_check_status_bit(irq, IRQ_PER_CPU);
         |                                   ^~~~~~~~~~~
   include/linux/irqdesc.h: In function 'irq_is_percpu_devid':
>> include/linux/irqdesc.h:246:35: error: 'IRQ_PER_CPU_DEVID' undeclared (f=
irst use in this function)
     246 |  return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
         |                                   ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c: At top level:
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for =
'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for =
'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for =
'output_thread_info_defines' [-Wmissing-prototypes]
      93 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for=
 'output_thread_defines' [-Wmissing-prototypes]
     109 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for=
 'output_thread_fpu_defines' [-Wmissing-prototypes]
     137 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for=
 'output_mm_defines' [-Wmissing-prototypes]
     180 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for=
 'output_sc_defines' [-Wmissing-prototypes]
     219 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for=
 'output_signal_defined' [-Wmissing-prototypes]
     254 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:333:6: warning: no previous prototype for=
 'output_pm_defines' [-Wmissing-prototypes]
     333 | void output_pm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for=
 'output_kvm_defines' [-Wmissing-prototypes]
     347 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:117: arch/mips/kernel/asm-offsets.s=
] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1227: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:215: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/irq_common_data +56 include/linux/irqdesc.h

293a7a0a165c4f Thomas Gleixner           2012-10-16   19  =

e144710b302525 Thomas Gleixner           2010-10-01   20  /**
e144710b302525 Thomas Gleixner           2010-10-01   21   * struct irq_des=
c - interrupt descriptor
0d0b4c866bcce6 Jiang Liu                 2015-06-01   22   * @irq_common_da=
ta:	per irq and chip data passed down to chip functions
e144710b302525 Thomas Gleixner           2010-10-01   23   * @kstat_irqs:		=
irq stats per cpu
770767787c2304 Geert Uytterhoeven        2011-04-10   24   * @handle_irq:		=
highlevel irq-events handler
e144710b302525 Thomas Gleixner           2010-10-01   25   * @action:		the =
irq action chain
80ebc420ec59a7 Yunfeng Ye                2019-09-18   26   * @status_use_ac=
cessors: status information
dbec07bac614a6 Thomas Gleixner           2011-02-07   27   * @core_internal=
_state__do_not_mess_with_it: core internal status information
e144710b302525 Thomas Gleixner           2010-10-01   28   * @depth:		disab=
le-depth, for nested irq_disable() calls
0911f124bf5535 Geert Uytterhoeven        2011-04-10   29   * @wake_depth:		=
enable depth, for multiple irq_set_irq_wake() callers
030fc443aef663 Waiman Long               2019-02-12   30   * @tot_count:		s=
tats field for non-percpu irqs
e144710b302525 Thomas Gleixner           2010-10-01   31   * @irq_count:		s=
tats field to detect stalled irqs
e144710b302525 Thomas Gleixner           2010-10-01   32   * @last_unhandle=
d:	aging timer for unhandled count
e144710b302525 Thomas Gleixner           2010-10-01   33   * @irqs_unhandle=
d:	stats field for spurious unhandled interrupts
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   34   * @threads_handl=
ed:	stats field for deferred spurious detection of threaded handlers
a359f757965aaf Ingo Molnar               2021-03-22   35   * @threads_handl=
ed_last: comparator field for deferred spurious detection of threaded handl=
ers
e144710b302525 Thomas Gleixner           2010-10-01   36   * @lock:		lockin=
g for SMP
770767787c2304 Geert Uytterhoeven        2011-04-10   37   * @affinity_hint=
:	hint to user space for preferred irq affinity
cd7eab44e9946c Ben Hutchings             2011-01-19   38   * @affinity_noti=
fy:	context for notification of affinity changes
e144710b302525 Thomas Gleixner           2010-10-01   39   * @pending_mask:=
	pending rebalanced interrupts
b5faba21a6805c Thomas Gleixner           2011-02-23   40   * @threads_onesh=
ot:	bitfield to handle shared oneshot threads
e144710b302525 Thomas Gleixner           2010-10-01   41   * @threads_activ=
e:	number of irqaction threads currently running
e144710b302525 Thomas Gleixner           2010-10-01   42   * @wait_for_thre=
ads:	wait queue for sync_irq to wait for threaded handlers
cab303be91dc47 Thomas Gleixner           2014-08-28   43   * @nr_actions:		=
number of installed actions on this descriptor
cab303be91dc47 Thomas Gleixner           2014-08-28   44   * @no_suspend_de=
pth:	number of irqactions on a irq descriptor with
cab303be91dc47 Thomas Gleixner           2014-08-28   45   *			IRQF_NO_SUSP=
END set
cab303be91dc47 Thomas Gleixner           2014-08-28   46   * @force_resume_=
depth:	number of irqactions on a irq descriptor with
cab303be91dc47 Thomas Gleixner           2014-08-28   47   *			IRQF_FORCE_R=
ESUME set
425a5072dcd1bd Thomas Gleixner           2015-12-13   48   * @rcu:		rcu hea=
d for delayed free
ecb3f394c5dba8 Craig Gallek              2016-09-13   49   * @kobj:		kobjec=
t used to represent this struct in sysfs
9114014cf4e6df Thomas Gleixner           2017-06-29   50   * @request_mutex=
:	mutex to protect request/free before locking desc->lock
e144710b302525 Thomas Gleixner           2010-10-01   51   * @dir:		/proc/i=
rq/ procfs entry
087cdfb662ae50 Thomas Gleixner           2017-06-20   52   * @debugfs_file:=
	dentry for the debugfs file
e144710b302525 Thomas Gleixner           2010-10-01   53   * @name:		flow h=
andler name for /proc/interrupts output
e144710b302525 Thomas Gleixner           2010-10-01   54   */
e144710b302525 Thomas Gleixner           2010-10-01   55  struct irq_desc {
0d0b4c866bcce6 Jiang Liu                 2015-06-01  @56  	struct irq_commo=
n_data	irq_common_data;
e144710b302525 Thomas Gleixner           2010-10-01  @57  	struct irq_data	=
	irq_data;
6c9ae009b29875 Eric Dumazet              2011-01-13   58  	unsigned int __p=
ercpu	*kstat_irqs;
e144710b302525 Thomas Gleixner           2010-10-01   59  	irq_flow_handler=
_t	handle_irq;
e144710b302525 Thomas Gleixner           2010-10-01   60  	struct irqaction=
	*action;	/* IRQ action list */
a6967caf00ebbb Thomas Gleixner           2011-02-10   61  	unsigned int		st=
atus_use_accessors;
dbec07bac614a6 Thomas Gleixner           2011-02-07   62  	unsigned int		co=
re_internal_state__do_not_mess_with_it;
e144710b302525 Thomas Gleixner           2010-10-01   63  	unsigned int		de=
pth;		/* nested irq disables */
e144710b302525 Thomas Gleixner           2010-10-01   64  	unsigned int		wa=
ke_depth;	/* nested wake enables */
1136b072896990 Thomas Gleixner           2019-02-08   65  	unsigned int		to=
t_count;
e144710b302525 Thomas Gleixner           2010-10-01   66  	unsigned int		ir=
q_count;	/* For detecting broken IRQs */
e144710b302525 Thomas Gleixner           2010-10-01   67  	unsigned long		l=
ast_unhandled;	/* Aging timer for unhandled count */
e144710b302525 Thomas Gleixner           2010-10-01   68  	unsigned int		ir=
qs_unhandled;
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   69  	atomic_t		thread=
s_handled;
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   70  	int			threads_ha=
ndled_last;
e144710b302525 Thomas Gleixner           2010-10-01   71  	raw_spinlock_t		=
lock;
31d9d9b6d83030 Marc Zyngier              2011-09-23   72  	struct cpumask		=
*percpu_enabled;
222df54fd8b764 Marc Zyngier              2016-04-11   73  	const struct cpu=
mask	*percpu_affinity;
e144710b302525 Thomas Gleixner           2010-10-01   74  #ifdef CONFIG_SMP
e144710b302525 Thomas Gleixner           2010-10-01   75  	const struct cpu=
mask	*affinity_hint;
cd7eab44e9946c Ben Hutchings             2011-01-19   76  	struct irq_affin=
ity_notify *affinity_notify;
e144710b302525 Thomas Gleixner           2010-10-01   77  #ifdef CONFIG_GEN=
ERIC_PENDING_IRQ
e144710b302525 Thomas Gleixner           2010-10-01   78  	cpumask_var_t		p=
ending_mask;
e144710b302525 Thomas Gleixner           2010-10-01   79  #endif
e144710b302525 Thomas Gleixner           2010-10-01   80  #endif
b5faba21a6805c Thomas Gleixner           2011-02-23   81  	unsigned long		t=
hreads_oneshot;
e144710b302525 Thomas Gleixner           2010-10-01   82  	atomic_t		thread=
s_active;
e144710b302525 Thomas Gleixner           2010-10-01   83  	wait_queue_head_=
t       wait_for_threads;
cab303be91dc47 Thomas Gleixner           2014-08-28   84  #ifdef CONFIG_PM_=
SLEEP
cab303be91dc47 Thomas Gleixner           2014-08-28   85  	unsigned int		nr=
_actions;
cab303be91dc47 Thomas Gleixner           2014-08-28   86  	unsigned int		no=
_suspend_depth;
17f480342026e5 Rafael J. Wysocki         2015-02-27   87  	unsigned int		co=
nd_suspend_depth;
cab303be91dc47 Thomas Gleixner           2014-08-28   88  	unsigned int		fo=
rce_resume_depth;
cab303be91dc47 Thomas Gleixner           2014-08-28   89  #endif
e144710b302525 Thomas Gleixner           2010-10-01   90  #ifdef CONFIG_PRO=
C_FS
e144710b302525 Thomas Gleixner           2010-10-01   91  	struct proc_dir_=
entry	*dir;
425a5072dcd1bd Thomas Gleixner           2015-12-13   92  #endif
087cdfb662ae50 Thomas Gleixner           2017-06-20   93  #ifdef CONFIG_GEN=
ERIC_IRQ_DEBUGFS
087cdfb662ae50 Thomas Gleixner           2017-06-20   94  	struct dentry		*=
debugfs_file;
07557ccb8c83f3 Thomas Gleixner           2017-09-13   95  	const char		*dev=
_name;
087cdfb662ae50 Thomas Gleixner           2017-06-20   96  #endif
425a5072dcd1bd Thomas Gleixner           2015-12-13   97  #ifdef CONFIG_SPA=
RSE_IRQ
425a5072dcd1bd Thomas Gleixner           2015-12-13   98  	struct rcu_head	=
	rcu;
ecb3f394c5dba8 Craig Gallek              2016-09-13   99  	struct kobject		=
kobj;
e144710b302525 Thomas Gleixner           2010-10-01  100  #endif
9114014cf4e6df Thomas Gleixner           2017-06-29  101  	struct mutex		re=
quest_mutex;
293a7a0a165c4f Thomas Gleixner           2012-10-16  102  	int			parent_irq;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  103  	struct module		*=
owner;
e144710b302525 Thomas Gleixner           2010-10-01  104  	const char		*nam=
e;
e144710b302525 Thomas Gleixner           2010-10-01  105  } ____cacheline_i=
nternodealigned_in_smp;
e144710b302525 Thomas Gleixner           2010-10-01  106  =

a899418167264c Thomas Gleixner           2015-07-05  107  #ifdef CONFIG_SPA=
RSE_IRQ
a899418167264c Thomas Gleixner           2015-07-05  108  extern void irq_l=
ock_sparse(void);
a899418167264c Thomas Gleixner           2015-07-05  109  extern void irq_u=
nlock_sparse(void);
a899418167264c Thomas Gleixner           2015-07-05  110  #else
a899418167264c Thomas Gleixner           2015-07-05  111  static inline voi=
d irq_lock_sparse(void) { }
a899418167264c Thomas Gleixner           2015-07-05  112  static inline voi=
d irq_unlock_sparse(void) { }
e144710b302525 Thomas Gleixner           2010-10-01 @113  extern struct irq=
_desc irq_desc[NR_IRQS];
e144710b302525 Thomas Gleixner           2010-10-01  114  #endif
e144710b302525 Thomas Gleixner           2010-10-01  115  =

501e2db67fa426 Thomas Gleixner           2020-12-10  116  static inline uns=
igned int irq_desc_kstat_cpu(struct irq_desc *desc,
501e2db67fa426 Thomas Gleixner           2020-12-10  117  					      unsign=
ed int cpu)
501e2db67fa426 Thomas Gleixner           2020-12-10  118  {
501e2db67fa426 Thomas Gleixner           2020-12-10  119  	return desc->kst=
at_irqs ? *per_cpu_ptr(desc->kstat_irqs, cpu) : 0;
501e2db67fa426 Thomas Gleixner           2020-12-10  120  }
501e2db67fa426 Thomas Gleixner           2020-12-10  121  =

7bbf1dd24b17b9 Jiang Liu                 2015-06-01  122  static inline str=
uct irq_desc *irq_data_to_desc(struct irq_data *data)
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  123  {
755d119a620497 Thomas Gleixner           2015-09-16 @124  	return container=
_of(data->common, struct irq_desc, irq_common_data);
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  125  }
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  126  =

304adf8a8fff97 Jiang Liu                 2015-06-04  127  static inline uns=
igned int irq_desc_get_irq(struct irq_desc *desc)
304adf8a8fff97 Jiang Liu                 2015-06-04  128  {
304adf8a8fff97 Jiang Liu                 2015-06-04  129  	return desc->irq=
_data.irq;
304adf8a8fff97 Jiang Liu                 2015-06-04  130  }
304adf8a8fff97 Jiang Liu                 2015-06-04  131  =

d9936bb3952a08 Thomas Gleixner           2011-03-11  132  static inline str=
uct irq_data *irq_desc_get_irq_data(struct irq_desc *desc)
d9936bb3952a08 Thomas Gleixner           2011-03-11  133  {
d9936bb3952a08 Thomas Gleixner           2011-03-11  134  	return &desc->ir=
q_data;
d9936bb3952a08 Thomas Gleixner           2011-03-11  135  }
d9936bb3952a08 Thomas Gleixner           2011-03-11  136  =

a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  137  static inline str=
uct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  138  {
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  139  	return desc->irq=
_data.chip;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  140  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  141  =

a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  142  static inline voi=
d *irq_desc_get_chip_data(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  143  {
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  144  	return desc->irq=
_data.chip_data;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  145  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  146  =

a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  147  static inline voi=
d *irq_desc_get_handler_data(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  148  {
af7080e040d223 Jiang Liu                 2015-06-01  149  	return desc->irq=
_common_data.handler_data;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  150  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  151  =

e144710b302525 Thomas Gleixner           2010-10-01  152  /*
e144710b302525 Thomas Gleixner           2010-10-01  153   * Architectures =
call this to let the generic IRQ layer
6584d84c3e504c Huang Shijie              2015-09-01  154   * handle an inte=
rrupt.
e144710b302525 Thomas Gleixner           2010-10-01  155   */
bd0b9ac405e179 Thomas Gleixner           2015-09-14  156  static inline voi=
d generic_handle_irq_desc(struct irq_desc *desc)
e144710b302525 Thomas Gleixner           2010-10-01  157  {
bd0b9ac405e179 Thomas Gleixner           2015-09-14  158  	desc->handle_irq=
(desc);
e144710b302525 Thomas Gleixner           2010-10-01  159  }
e144710b302525 Thomas Gleixner           2010-10-01  160  =

fe12bc2c996d3e Thomas Gleixner           2011-05-18  161  int generic_handl=
e_irq(unsigned int irq);
e144710b302525 Thomas Gleixner           2010-10-01  162  =

76ba59f8366f2d Marc Zyngier              2014-08-26  163  #ifdef CONFIG_HAN=
DLE_DOMAIN_IRQ
76ba59f8366f2d Marc Zyngier              2014-08-26  164  /*
76ba59f8366f2d Marc Zyngier              2014-08-26  165   * Convert a HW i=
nterrupt number to a logical one using a IRQ domain,
76ba59f8366f2d Marc Zyngier              2014-08-26  166   * and handle the=
 result interrupt number. Return -EINVAL if
76ba59f8366f2d Marc Zyngier              2014-08-26  167   * conversion fai=
led. Providing a NULL domain indicates that the
76ba59f8366f2d Marc Zyngier              2014-08-26  168   * conversion has=
 already been done.
76ba59f8366f2d Marc Zyngier              2014-08-26  169   */
76ba59f8366f2d Marc Zyngier              2014-08-26  170  int __handle_doma=
in_irq(struct irq_domain *domain, unsigned int hwirq,
76ba59f8366f2d Marc Zyngier              2014-08-26  171  			bool lookup, s=
truct pt_regs *regs);
76ba59f8366f2d Marc Zyngier              2014-08-26  172  =

76ba59f8366f2d Marc Zyngier              2014-08-26  173  static inline int=
 handle_domain_irq(struct irq_domain *domain,
76ba59f8366f2d Marc Zyngier              2014-08-26  174  				    unsigned =
int hwirq, struct pt_regs *regs)
76ba59f8366f2d Marc Zyngier              2014-08-26  175  {
76ba59f8366f2d Marc Zyngier              2014-08-26  176  	return __handle_=
domain_irq(domain, hwirq, true, regs);
76ba59f8366f2d Marc Zyngier              2014-08-26  177  }
6e4933a0066163 Julien Thierry            2019-01-31  178  =

6e4933a0066163 Julien Thierry            2019-01-31  179  #ifdef CONFIG_IRQ=
_DOMAIN
6e4933a0066163 Julien Thierry            2019-01-31  180  int handle_domain=
_nmi(struct irq_domain *domain, unsigned int hwirq,
6e4933a0066163 Julien Thierry            2019-01-31  181  		      struct pt=
_regs *regs);
6e4933a0066163 Julien Thierry            2019-01-31  182  #endif
76ba59f8366f2d Marc Zyngier              2014-08-26  183  #endif
76ba59f8366f2d Marc Zyngier              2014-08-26  184  =

e144710b302525 Thomas Gleixner           2010-10-01  185  /* Test to see if=
 a driver has successfully requested an irq */
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  186  static inline int=
 irq_desc_has_action(struct irq_desc *desc)
e144710b302525 Thomas Gleixner           2010-10-01  187  {
a313357e704f26 Thomas Gleixner           2020-12-10  188  	return desc && d=
esc->action !=3D NULL;
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  189  }
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  190  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  191  /**
bbc9d21fc0071c Thomas Gleixner           2015-06-23  192   * irq_set_handle=
r_locked - Set irq handler from a locked region
bbc9d21fc0071c Thomas Gleixner           2015-06-23  193   * @data:	Pointer=
 to the irq_data structure which identifies the irq
bbc9d21fc0071c Thomas Gleixner           2015-06-23  194   * @handler:	Flow=
 control handler function for this interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  195   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  196   * Sets the handl=
er in the irq descriptor associated to @data.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  197   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  198   * Must be called=
 with irq_desc locked and valid parameters. Typical
bbc9d21fc0071c Thomas Gleixner           2015-06-23  199   * call site is t=
he irq_set_type() callback.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  200   */
bbc9d21fc0071c Thomas Gleixner           2015-06-23  201  static inline voi=
d irq_set_handler_locked(struct irq_data *data,
bbc9d21fc0071c Thomas Gleixner           2015-06-23  202  					  irq_flow_h=
andler_t handler)
bbc9d21fc0071c Thomas Gleixner           2015-06-23  203  {
bbc9d21fc0071c Thomas Gleixner           2015-06-23  204  	struct irq_desc =
*desc =3D irq_data_to_desc(data);
bbc9d21fc0071c Thomas Gleixner           2015-06-23  205  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  206  	desc->handle_irq=
 =3D handler;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  207  }
bbc9d21fc0071c Thomas Gleixner           2015-06-23  208  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  209  /**
bbc9d21fc0071c Thomas Gleixner           2015-06-23  210   * irq_set_chip_h=
andler_name_locked - Set chip, handler and name from a locked region
bbc9d21fc0071c Thomas Gleixner           2015-06-23  211   * @data:	Pointer=
 to the irq_data structure for which the chip is set
bbc9d21fc0071c Thomas Gleixner           2015-06-23  212   * @chip:	Pointer=
 to the new irq chip
bbc9d21fc0071c Thomas Gleixner           2015-06-23  213   * @handler:	Flow=
 control handler function for this interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  214   * @name:	Name of=
 the interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  215   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  216   * Replace the ir=
q chip at the proper hierarchy level in @data and
bbc9d21fc0071c Thomas Gleixner           2015-06-23  217   * sets the handl=
er and name in the associated irq descriptor.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  218   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  219   * Must be called=
 with irq_desc locked and valid parameters.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  220   */
bbc9d21fc0071c Thomas Gleixner           2015-06-23  221  static inline void
bbc9d21fc0071c Thomas Gleixner           2015-06-23  222  irq_set_chip_hand=
ler_name_locked(struct irq_data *data, struct irq_chip *chip,
bbc9d21fc0071c Thomas Gleixner           2015-06-23  223  				 irq_flow_han=
dler_t handler, const char *name)
bbc9d21fc0071c Thomas Gleixner           2015-06-23  224  {
bbc9d21fc0071c Thomas Gleixner           2015-06-23  225  	struct irq_desc =
*desc =3D irq_data_to_desc(data);
bbc9d21fc0071c Thomas Gleixner           2015-06-23  226  =

bbc9d21fc0071c Thomas Gleixner           2015-06-23  227  	desc->handle_irq=
 =3D handler;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  228  	desc->name =3D n=
ame;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  229  	data->chip =3D c=
hip;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  230  }
bbc9d21fc0071c Thomas Gleixner           2015-06-23  231  =

fdd029630434b4 Thomas Gleixner           2020-12-10  232  bool irq_check_st=
atus_bit(unsigned int irq, unsigned int bitmask);
fdd029630434b4 Thomas Gleixner           2020-12-10  233  =

4ce413d1840b25 Will Deacon               2017-12-01  234  static inline boo=
l irq_balancing_disabled(unsigned int irq)
e144710b302525 Thomas Gleixner           2010-10-01  235  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @236  	return irq_check=
_status_bit(irq, IRQ_NO_BALANCING_MASK);
e144710b302525 Thomas Gleixner           2010-10-01  237  }
781295762defc7 Thomas Gleixner           2011-02-10  238  =

4ce413d1840b25 Will Deacon               2017-12-01  239  static inline boo=
l irq_is_percpu(unsigned int irq)
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  240  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @241  	return irq_check=
_status_bit(irq, IRQ_PER_CPU);
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  242  }
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  243  =

4ce413d1840b25 Will Deacon               2017-12-01  244  static inline boo=
l irq_is_percpu_devid(unsigned int irq)
08395c7f4d9f58 Julien Thierry            2017-10-13  245  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @246  	return irq_check=
_status_bit(irq, IRQ_PER_CPU_DEVID);
08395c7f4d9f58 Julien Thierry            2017-10-13  247  }
08395c7f4d9f58 Julien Thierry            2017-10-13  248  =


:::::: The code at line 56 was first introduced by commit
:::::: 0d0b4c866bcce647f40d73efe5e90aeeb079050a genirq: Introduce struct ir=
q_common_data to host shared irq data

:::::: TO: Jiang Liu <jiang.liu@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5637971063594420222==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
m+awZMuqjlTf2/3/ARiu6o4m7wEA
--===============5637971063594420222==--

