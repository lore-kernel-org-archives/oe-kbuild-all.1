Content-Type: multipart/mixed; boundary="===============4333819975343968667=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [chanwoo:devfreq-testing-passive-gov 2/3] drivers/devfreq/governor_passive.c:59:28: error: 'struct cpuinfo_um' has no member named 'first_cpu'
Date: Fri, 07 May 2021 03:24:37 +0800
Message-ID: <202105070332.kXnkizuw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4333819975343968667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing-passive-gov
head:   6d4e4f9ca6cc295239851e29297a5499d41dea5e
commit: 583d8a1093b76e53f615ef3c7962e3849242a9ba [2/3] PM / devfreq: Add cp=
u based scaling support to passive governor
config: um-allmodconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git=
/commit/?id=3D583d8a1093b76e53f615ef3c7962e3849242a9ba
        git remote add chanwoo https://git.kernel.org/pub/scm/linux/kernel/=
git/chanwoo/linux.git
        git fetch --no-tags chanwoo devfreq-testing-passive-gov
        git checkout 583d8a1093b76e53f615ef3c7962e3849242a9ba
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing=
-include-dirs]
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:92,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/devfreq/governor_simpleondemand.c:10:
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   include/linux/devfreq.h:331:27: note: in expansion of macro 'cpu_data'
     331 |  struct devfreq_cpu_data *cpu_data[NR_CPUS];
         |                           ^~~~~~~~
   In file included from drivers/devfreq/governor_simpleondemand.c:11:
   include/linux/devfreq.h:332:1: warning: no semicolon at end of struct or=
 union
     332 | };
         | ^
--
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing=
-include-dirs]
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:92,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/devfreq/governor_passive.c:10:
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   include/linux/devfreq.h:331:27: note: in expansion of macro 'cpu_data'
     331 |  struct devfreq_cpu_data *cpu_data[NR_CPUS];
         |                           ^~~~~~~~
   In file included from drivers/devfreq/governor_passive.c:16:
   include/linux/devfreq.h:332:1: warning: no semicolon at end of struct or=
 union
     332 | };
         | ^
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:92,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/devfreq/governor_passive.c:10:
   drivers/devfreq/governor_passive.c: In function 'get_target_freq_with_cp=
ufreq':
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   drivers/devfreq/governor_passive.c:52:27: note: in expansion of macro 'c=
pu_data'
      52 |  struct devfreq_cpu_data *cpu_data;
         |                           ^~~~~~~~
>> arch/um/include/asm/processor-generic.h:97:18: error: expected identifie=
r before '(' token
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:58:22: note: in expansion of macro 'c=
pu_data'
      58 |   cpu_data =3D p_data->cpu_data[cpu];
         |                      ^~~~~~~~
   drivers/devfreq/governor_passive.c:59:7: warning: the address of 'boot_c=
pu_data' will always evaluate as 'true' [-Waddress]
      59 |   if (!cpu_data || cpu_data->first_cpu !=3D cpu)
         |       ^
>> drivers/devfreq/governor_passive.c:59:28: error: 'struct cpuinfo_um' has=
 no member named 'first_cpu'
      59 |   if (!cpu_data || cpu_data->first_cpu !=3D cpu)
         |                            ^~
>> drivers/devfreq/governor_passive.c:63:21: error: 'struct cpuinfo_um' has=
 no member named 'cur_freq'
      63 |   cpu_cur =3D cpu_data->cur_freq * HZ_PER_KHZ;
         |                     ^~
>> drivers/devfreq/governor_passive.c:64:49: error: 'struct cpuinfo_um' has=
 no member named 'dev'
      64 |   freq =3D get_taget_freq_by_required_opp(cpu_data->dev,
         |                                                 ^~
>> drivers/devfreq/governor_passive.c:65:14: error: 'struct cpuinfo_um' has=
 no member named 'opp_table'
      65 |      cpu_data->opp_table,
         |              ^~
>> drivers/devfreq/governor_passive.c:75:21: error: 'struct cpuinfo_um' has=
 no member named 'min_freq'
      75 |   cpu_min =3D cpu_data->min_freq;
         |                     ^~
>> drivers/devfreq/governor_passive.c:76:21: error: 'struct cpuinfo_um' has=
 no member named 'max_freq'
      76 |   cpu_max =3D cpu_data->max_freq;
         |                     ^~
   drivers/devfreq/governor_passive.c:77:21: error: 'struct cpuinfo_um' has=
 no member named 'cur_freq'
      77 |   cpu_cur =3D cpu_data->cur_freq;
         |                     ^~
   drivers/devfreq/governor_passive.c:50:31: warning: variable 'p_data' set=
 but not used [-Wunused-but-set-variable]
      50 |  struct devfreq_passive_data *p_data =3D
         |                               ^~~~~~
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:92,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/devfreq/governor_passive.c:10:
   drivers/devfreq/governor_passive.c: In function 'cpufreq_passive_notifie=
r_call':
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   drivers/devfreq/governor_passive.c:214:27: note: in expansion of macro '=
cpu_data'
     214 |  struct devfreq_cpu_data *cpu_data;
         |                           ^~~~~~~~
>> arch/um/include/asm/processor-generic.h:97:18: error: expected identifie=
r before '(' token
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:220:10: note: in expansion of macro '=
cpu_data'
     220 |   !data->cpu_data[freqs->policy->cpu])
         |          ^~~~~~~~
>> arch/um/include/asm/processor-generic.h:97:18: error: expected identifie=
r before '(' token
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:223:19: note: in expansion of macro '=
cpu_data'
     223 |  cpu_data =3D data->cpu_data[freqs->policy->cpu];
         |                   ^~~~~~~~
   drivers/devfreq/governor_passive.c:224:14: error: 'struct cpuinfo_um' ha=
s no member named 'cur_freq'
     224 |  if (cpu_data->cur_freq =3D=3D freqs->new)
         |              ^~
   drivers/devfreq/governor_passive.c:227:21: error: 'struct cpuinfo_um' ha=
s no member named 'cur_freq'
     227 |  cur_freq =3D cpu_data->cur_freq;
         |                     ^~
   drivers/devfreq/governor_passive.c:228:10: error: 'struct cpuinfo_um' ha=
s no member named 'cur_freq'
     228 |  cpu_data->cur_freq =3D freqs->new;
         |          ^~
   drivers/devfreq/governor_passive.c:234:11: error: 'struct cpuinfo_um' ha=
s no member named 'cur_freq'
     234 |   cpu_data->cur_freq =3D cur_freq;
         |           ^~
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:92,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/devfreq/governor_passive.c:10:
   drivers/devfreq/governor_passive.c: In function 'cpufreq_passive_registe=
r_notifier':
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   drivers/devfreq/governor_passive.c:248:27: note: in expansion of macro '=
cpu_data'
     248 |  struct devfreq_cpu_data *cpu_data;
         |                           ^~~~~~~~
>> arch/um/include/asm/processor-generic.h:97:18: error: expected identifie=
r before '(' token
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:265:15: note: in expansion of macro '=
cpu_data'
     265 |   if (p_data->cpu_data[cpu])
         |               ^~~~~~~~
>> drivers/devfreq/governor_passive.c:270:13: error: lvalue required as lef=
t operand of assignment
     270 |    cpu_data =3D kzalloc(sizeof(*cpu_data), GFP_KERNEL);
         |             ^
   drivers/devfreq/governor_passive.c:271:8: warning: the address of 'boot_=
cpu_data' will always evaluate as 'true' [-Waddress]
     271 |    if (!cpu_data) {
         |        ^
   drivers/devfreq/governor_passive.c:289:12: error: 'struct cpuinfo_um' ha=
s no member named 'dev'
     289 |    cpu_data->dev =3D cpu_dev;
         |            ^~
   drivers/devfreq/governor_passive.c:290:12: error: 'struct cpuinfo_um' ha=
s no member named 'opp_table'
     290 |    cpu_data->opp_table =3D opp_table;
         |            ^~
   drivers/devfreq/governor_passive.c:291:12: error: 'struct cpuinfo_um' ha=
s no member named 'first_cpu'
     291 |    cpu_data->first_cpu =3D cpumask_first(policy->related_cpus);
         |            ^~
   drivers/devfreq/governor_passive.c:292:12: error: 'struct cpuinfo_um' ha=
s no member named 'cur_freq'
     292 |    cpu_data->cur_freq =3D policy->cur;
         |            ^~
   drivers/devfreq/governor_passive.c:293:12: error: 'struct cpuinfo_um' ha=
s no member named 'min_freq'
     293 |    cpu_data->min_freq =3D policy->cpuinfo.min_freq;
         |            ^~
   drivers/devfreq/governor_passive.c:294:12: error: 'struct cpuinfo_um' ha=
s no member named 'max_freq'
     294 |    cpu_data->max_freq =3D policy->cpuinfo.max_freq;
         |            ^~
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:92,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/devfreq/governor_passive.c:10:
>> arch/um/include/asm/processor-generic.h:97:18: error: expected identifie=
r before '(' token
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:296:12: note: in expansion of macro '=
cpu_data'
     296 |    p_data->cpu_data[cpu] =3D cpu_data;
         |            ^~~~~~~~
   drivers/devfreq/governor_passive.c: In function 'cpufreq_passive_unregis=
ter_notifier':
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   drivers/devfreq/governor_passive.c:321:27: note: in expansion of macro '=
cpu_data'
     321 |  struct devfreq_cpu_data *cpu_data;
         |                           ^~~~~~~~
>> arch/um/include/asm/processor-generic.h:97:18: error: expected identifie=
r before '(' token
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:328:22: note: in expansion of macro '=
cpu_data'
     328 |   cpu_data =3D p_data->cpu_data[cpu];
         |                      ^~~~~~~~
   arch/um/include/asm/processor-generic.h:97:18: warning: the address of '=
boot_cpu_data' will always evaluate as 'true' [-Waddress]
      97 | #define cpu_data (&boot_cpu_data)
         |                  ^
   drivers/devfreq/governor_passive.c:329:7: note: in expansion of macro 'c=
pu_data'
     329 |   if (cpu_data) {
         |       ^~~~~~~~
   drivers/devfreq/governor_passive.c:330:16: error: 'struct cpuinfo_um' ha=
s no member named 'opp_table'
     330 |    if (cpu_data->opp_table)
         |                ^~
   drivers/devfreq/governor_passive.c:331:38: error: 'struct cpuinfo_um' ha=
s no member named 'opp_table'
     331 |     dev_pm_opp_put_opp_table(cpu_data->opp_table);
         |                                      ^~
   drivers/devfreq/governor_passive.c:333:13: error: lvalue required as lef=
t operand of assignment
     333 |    cpu_data =3D NULL;
         |             ^


vim +59 drivers/devfreq/governor_passive.c

    46	=

    47	static int get_target_freq_with_cpufreq(struct devfreq *devfreq,
    48						unsigned long *target_freq)
    49	{
    50		struct devfreq_passive_data *p_data =3D
    51					(struct devfreq_passive_data *)devfreq->data;
    52		struct devfreq_cpu_data *cpu_data;
    53		unsigned long cpu, cpu_cur, cpu_min, cpu_max, cpu_percent;
    54		unsigned long dev_min, dev_max;
    55		unsigned long freq =3D 0;
    56	=

    57		for_each_online_cpu(cpu) {
    58			cpu_data =3D p_data->cpu_data[cpu];
  > 59			if (!cpu_data || cpu_data->first_cpu !=3D cpu)
    60				continue;
    61	=

    62			/* Get target freq via required opps */
  > 63			cpu_cur =3D cpu_data->cur_freq * HZ_PER_KHZ;
  > 64			freq =3D get_taget_freq_by_required_opp(cpu_data->dev,
  > 65						cpu_data->opp_table,
    66						devfreq->opp_table, cpu_cur);
    67			if (freq) {
    68				*target_freq =3D max(freq, *target_freq);
    69				continue;
    70			}
    71	=

    72			/* Use Interpolation if required opps is not available */
    73			devfreq_get_freq_range(devfreq, &dev_min, &dev_max);
    74	=

  > 75			cpu_min =3D cpu_data->min_freq;
  > 76			cpu_max =3D cpu_data->max_freq;
    77			cpu_cur =3D cpu_data->cur_freq;
    78	=

    79			cpu_percent =3D ((cpu_cur - cpu_min) * 100) / (cpu_max - cpu_min);
    80			freq =3D dev_min + mult_frac(dev_max - dev_min, cpu_percent, 100);
    81	=

    82			*target_freq =3D max(freq, *target_freq);
    83		}
    84	=

    85		return 0;
    86	}
    87	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4333819975343968667==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
YRoFtIiVmqp8jeffAp0ne+r+9/8A/NccWWd5AQA=
--===============4333819975343968667==--

