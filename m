Content-Type: multipart/mixed; boundary="===============8583787480599543750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-5.10 48/65] drivers/devfreq/governor_passive.c:59:28: error: 'struct cpuinfo_um' has no member named 'first_cpu'
Date: Tue, 25 May 2021 16:32:21 +0800
Message-ID: <202105251613.GTc3WPyl-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8583787480599543750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   e1751868ad53dfd435aa55492137bb0e95675412
commit: e69e681fc9f255d4011bd2e708467c35d3de508f [48/65] FROMGIT: PM / devf=
req: Add cpu based scaling support to passive governor
config: um-randconfig-r035-20210525 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout e69e681fc9f255d4011bd2e708467c35d3de508f
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dum =


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
                    from drivers/devfreq/devfreq.c:11:
>> arch/um/include/asm/processor-generic.h:97:19: error: expected identifie=
r or '(' before '&' token
      97 | #define cpu_data (&boot_cpu_data)
         |                   ^
   include/linux/devfreq.h:331:27: note: in expansion of macro 'cpu_data'
     331 |  struct devfreq_cpu_data *cpu_data[NR_CPUS];
         |                           ^~~~~~~~
   In file included from include/linux/devfreq_cooling.h:13,
                    from drivers/devfreq/devfreq.c:14:
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

--===============8583787480599543750==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8583787480599543750==--

