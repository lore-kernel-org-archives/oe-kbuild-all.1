Content-Type: multipart/mixed; boundary="===============8455534178407575470=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [avpatel:riscv_clint_v1 8/9] drivers/clocksource/timer-clint.c:45:15: error: variable 'clint_ipi_ops' has initializer but incomplete type
Date: Wed, 20 May 2020 21:31:52 +0800
Message-ID: <202005202151.Cj0uZb4o%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8455534178407575470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/avpatel/linux.git riscv_clint_v1
head:   a3dcfcb9ca3fec50ed0e957c648a050f934a7e70
commit: cae3a9a14e033b2c9ce074eb6ee6d607b5a7202b [8/9] clocksource/drivers:=
 Add CLINT driver
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout cae3a9a14e033b2c9ce074eb6ee6d607b5a7202b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/clocksource/timer-clint.c:45:15: error: variable 'clint_ipi_ops'=
 has initializer but incomplete type
45 | static struct riscv_ipi_ops clint_ipi_ops =3D {
|               ^~~~~~~~~~~~~
>> drivers/clocksource/timer-clint.c:46:3: error: 'struct riscv_ipi_ops' ha=
s no member named 'ipi_inject'
46 |  .ipi_inject =3D clint_send_ipi,
|   ^~~~~~~~~~
>> drivers/clocksource/timer-clint.c:46:16: warning: excess elements in str=
uct initializer
46 |  .ipi_inject =3D clint_send_ipi,
|                ^~~~~~~~~~~~~~
drivers/clocksource/timer-clint.c:46:16: note: (near initialization for 'cl=
int_ipi_ops')
>> drivers/clocksource/timer-clint.c:47:3: error: 'struct riscv_ipi_ops' ha=
s no member named 'ipi_clear'
47 |  .ipi_clear =3D clint_clear_ipi,
|   ^~~~~~~~~
drivers/clocksource/timer-clint.c:47:15: warning: excess elements in struct=
 initializer
47 |  .ipi_clear =3D clint_clear_ipi,
|               ^~~~~~~~~~~~~~~
drivers/clocksource/timer-clint.c:47:15: note: (near initialization for 'cl=
int_ipi_ops')
drivers/clocksource/timer-clint.c: In function 'clint_timer_init_dt':
>> drivers/clocksource/timer-clint.c:172:2: error: implicit declaration of =
function 'riscv_set_ipi_ops' [-Werror=3Dimplicit-function-declaration]
172 |  riscv_set_ipi_ops(&clint_ipi_ops);
|  ^~~~~~~~~~~~~~~~~
drivers/clocksource/timer-clint.c: At top level:
>> drivers/clocksource/timer-clint.c:45:29: error: storage size of 'clint_i=
pi_ops' isn't known
45 | static struct riscv_ipi_ops clint_ipi_ops =3D {
|                             ^~~~~~~~~~~~~
cc1: some warnings being treated as errors

vim +/clint_ipi_ops +45 drivers/clocksource/timer-clint.c

    44	=

  > 45	static struct riscv_ipi_ops clint_ipi_ops =3D {
  > 46		.ipi_inject =3D clint_send_ipi,
  > 47		.ipi_clear =3D clint_clear_ipi,
    48	};
    49	=

    50	#ifdef CONFIG_64BIT
    51	#define clint_get_cycles()	readq_relaxed(clint_time_val)
    52	#else
    53	#define clint_get_cycles()	readl_relaxed(clint_time_val)
    54	#define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_time_val) =
+ 1)
    55	#endif
    56	=

    57	#ifdef CONFIG_64BIT
    58	static u64 clint_get_cycles64(void)
    59	{
    60		return clint_get_cycles();
    61	}
    62	#else /* CONFIG_64BIT */
    63	static u64 clint_get_cycles64(void)
    64	{
    65		u32 hi, lo;
    66	=

    67		do {
    68			hi =3D clint_get_cycles_hi();
    69			lo =3D clint_get_cycles();
    70		} while (hi !=3D clint_get_cycles_hi());
    71	=

    72		return ((u64)hi << 32) | lo;
    73	}
    74	#endif /* CONFIG_64BIT */
    75	=

    76	static int clint_clock_next_event(unsigned long delta,
    77					   struct clock_event_device *ce)
    78	{
    79		void __iomem *r =3D clint_time_cmp +
    80				  cpuid_to_hartid_map(smp_processor_id());
    81	=

    82		csr_set(CSR_IE, IE_TIE);
    83		writeq_relaxed(clint_get_cycles64() + delta, r);
    84		return 0;
    85	}
    86	=

    87	static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) =
=3D {
    88		.name			=3D "clint_clockevent",
    89		.features		=3D CLOCK_EVT_FEAT_ONESHOT,
    90		.rating		=3D 100,
    91		.set_next_event	=3D clint_clock_next_event,
    92	};
    93	=

    94	static u64 clint_rdtime(struct clocksource *cs)
    95	{
    96		return readq_relaxed(clint_time_val);
    97	}
    98	=

    99	static u64 notrace clint_sched_clock(void)
   100	{
   101		return readq_relaxed(clint_time_val);
   102	}
   103	=

   104	static struct clocksource clint_clocksource =3D {
   105		.name		=3D "clint_clocksource",
   106		.rating	=3D 300,
   107		.mask		=3D CLOCKSOURCE_MASK(64),
   108		.flags		=3D CLOCK_SOURCE_IS_CONTINUOUS,
   109		.read		=3D clint_rdtime,
   110	};
   111	=

   112	static int clint_timer_starting_cpu(unsigned int cpu)
   113	{
   114		struct clock_event_device *ce =3D per_cpu_ptr(&clint_clock_event, c=
pu);
   115	=

   116		ce->cpumask =3D cpumask_of(cpu);
   117		clockevents_config_and_register(ce, clint_freq, 100, 0x7fffffff);
   118	=

   119		csr_set(CSR_IE, IE_TIE);
   120		return 0;
   121	}
   122	=

   123	static int clint_timer_dying_cpu(unsigned int cpu)
   124	{
   125		csr_clear(CSR_IE, IE_TIE);
   126		return 0;
   127	}
   128	=

   129	/* called directly from the low-level interrupt handler */
   130	void riscv_timer_interrupt(void)
   131	{
   132		struct clock_event_device *evdev =3D this_cpu_ptr(&clint_clock_even=
t);
   133	=

   134		csr_clear(CSR_IE, IE_TIE);
   135		evdev->event_handler(evdev);
   136	}
   137	=

   138	static int __init clint_timer_init_dt(struct device_node *np)
   139	{
   140		int rc;
   141		void __iomem *base;
   142	=

   143		base =3D of_iomap(np, 0);
   144		if (!base) {
   145			pr_err("%pOFP: could not map registers\n", np);
   146			return -ENODEV;
   147		}
   148	=

   149		clint_ipi_base =3D base + CLINT_IPI_OFF;
   150		clint_time_cmp =3D base + CLINT_TIME_CMP_OFF;
   151		clint_time_val =3D base + CLINT_TIME_VAL_OFF;
   152		clint_freq =3D riscv_timebase;
   153	=

   154		rc =3D clocksource_register_hz(&clint_clocksource, clint_freq);
   155		if (rc) {
   156			iounmap(base);
   157			pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
   158			return rc;
   159		}
   160	=

   161		sched_clock_register(clint_sched_clock, 64, clint_freq);
   162	=

   163		rc =3D cpuhp_setup_state(CPUHP_AP_CLINT_TIMER_STARTING,
   164				 "clockevents/clint/timer:starting",
   165				 clint_timer_starting_cpu, clint_timer_dying_cpu);
   166		if (rc) {
   167			iounmap(base);
   168			pr_err("%pOFP: cpuhp setup state failed [%d]\n", np, rc);
   169			return rc;
   170		}
   171	=

 > 172		riscv_set_ipi_ops(&clint_ipi_ops);
   173		clint_clear_ipi();
   174	=

   175		pr_info("%pOFP: timer running at %ld Hz\n", np, clint_freq);
   176	=

   177		return 0;
   178	}
   179	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8455534178407575470==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8455534178407575470==--

