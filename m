Content-Type: multipart/mixed; boundary="===============8988298284480430659=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 7640/10763] drivers/cpufreq/tegra186-cpufreq.c:108:18: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Mon, 05 Oct 2020 10:34:46 +0530
Message-ID: <20201005050446.l34khuavbb24ndhx@vireshk-i7>
In-Reply-To: <202009251730.7KAszdTF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8988298284480430659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25-09-20, 17:15, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   d1d2220c7f39d0fca302c4ba6cca4ede01660a2b
> commit: b89c01c960511dcffe3666d89645c95445d00902 [7640/10763] cpufreq: te=
gra186: Fix initial frequency
> config: arm64-randconfig-s031-20200923 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.2-201-g24bdaac6-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Db89c01c960511dcffe3666d89645c95445d00902
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout b89c01c960511dcffe3666d89645c95445d00902
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> sparse warnings: (new ones prefixed by >>)
> =

>    drivers/cpufreq/tegra186-cpufreq.c:72:37: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected void *driver_da=
ta @@     got void [noderef] __iomem * @@
>    drivers/cpufreq/tegra186-cpufreq.c:72:37: sparse:     expected void *d=
river_data
>    drivers/cpufreq/tegra186-cpufreq.c:72:37: sparse:     got void [nodere=
f] __iomem *
>    drivers/cpufreq/tegra186-cpufreq.c:87:40: sparse: sparse: incorrect ty=
pe in initializer (different address spaces) @@     expected void [noderef]=
 __iomem *edvd_reg @@     got void *driver_data @@
>    drivers/cpufreq/tegra186-cpufreq.c:87:40: sparse:     expected void [n=
oderef] __iomem *edvd_reg
>    drivers/cpufreq/tegra186-cpufreq.c:87:40: sparse:     got void *driver=
_data
> >> drivers/cpufreq/tegra186-cpufreq.c:108:18: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected void [noderef]=
 __iomem *edvd_reg @@     got void *driver_data @@
>    drivers/cpufreq/tegra186-cpufreq.c:108:18: sparse:     expected void [=
noderef] __iomem *edvd_reg
>    drivers/cpufreq/tegra186-cpufreq.c:108:18: sparse:     got void *drive=
r_data
> =

> vim +108 drivers/cpufreq/tegra186-cpufreq.c
> =

>     53	=

>     54	static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>     55	{
>     56		struct tegra186_cpufreq_data *data =3D cpufreq_get_driver_data();
>     57		unsigned int i;
>     58	=

>     59		for (i =3D 0; i < data->num_clusters; i++) {
>     60			struct tegra186_cpufreq_cluster *cluster =3D &data->clusters[i];
>     61			const struct tegra186_cpufreq_cluster_info *info =3D
>     62				cluster->info;
>     63			int core;
>     64	=

>     65			for (core =3D 0; core < ARRAY_SIZE(info->cpus); core++) {
>     66				if (info->cpus[core] =3D=3D policy->cpu)
>     67					break;
>     68			}
>     69			if (core =3D=3D ARRAY_SIZE(info->cpus))
>     70				continue;
>     71	=

>   > 72			policy->driver_data =3D
>     73				data->regs + info->offset + EDVD_CORE_VOLT_FREQ(core);
>     74			policy->freq_table =3D cluster->table;
>     75			break;
>     76		}
>     77	=

>     78		policy->cpuinfo.transition_latency =3D 300 * 1000;
>     79	=

>     80		return 0;
>     81	}
>     82	=

>     83	static int tegra186_cpufreq_set_target(struct cpufreq_policy *poli=
cy,
>     84					       unsigned int index)
>     85	{
>     86		struct cpufreq_frequency_table *tbl =3D policy->freq_table + inde=
x;
>     87		void __iomem *edvd_reg =3D policy->driver_data;
>     88		u32 edvd_val =3D tbl->driver_data;
>     89	=

>     90		writel(edvd_val, edvd_reg);
>     91	=

>     92		return 0;
>     93	}
>     94	=

>     95	static unsigned int tegra186_cpufreq_get(unsigned int cpu)
>     96	{
>     97		struct cpufreq_frequency_table *tbl;
>     98		struct cpufreq_policy *policy;
>     99		void __iomem *edvd_reg;
>    100		unsigned int i, freq =3D 0;
>    101		u32 ndiv;
>    102	=

>    103		policy =3D cpufreq_cpu_get(cpu);
>    104		if (!policy)
>    105			return 0;
>    106	=

>    107		tbl =3D policy->freq_table;
>  > 108		edvd_reg =3D policy->driver_data;
>    109		ndiv =3D readl(edvd_reg) & EDVD_CORE_VOLT_FREQ_F_MASK;
>    110	=

>    111		for (i =3D 0; tbl[i].frequency !=3D CPUFREQ_TABLE_END; i++) {
>    112			if ((tbl[i].driver_data & EDVD_CORE_VOLT_FREQ_F_MASK) =3D=3D ndi=
v) {
>    113				freq =3D tbl[i].frequency;
>    114				break;
>    115			}
>    116		}
>    117	=

>    118		cpufreq_cpu_put(policy);
>    119	=

>    120		return freq;
>    121	}
>    122	=


Jon,

Please send a fix for this.

-- =

viresh
--===============8988298284480430659==--

