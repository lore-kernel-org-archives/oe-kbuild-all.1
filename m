Content-Type: multipart/mixed; boundary="===============4312714070749622617=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 1027/3956] arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is modified but its new value is never used.
Date: Fri, 15 Jan 2021 23:33:38 +0800
Message-ID: <20210115153338.GB399595@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4312714070749622617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b3a3cbdec55b090d22a09f75efb7c7d34cb97f25
commit: e8bb8f28233d88f4ad89fdf83d54bbc4a8ee40f2 [1027/3956] MIPS: cacheinf=
o: Add missing VCache
compiler: mips-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <rong.a.chen@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is modifie=
d but its new value is never used. [unreadVariable]
     level++;
     ^

vim +/level +112 arch/mips/kernel/cacheinfo.c

3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24   76  =

ef462f3b64e9fb0c Justin Chen         2016-12-07   77  static int __populate=
_cache_leaves(unsigned int cpu)
ef462f3b64e9fb0c Justin Chen         2016-12-07   78  {
ef462f3b64e9fb0c Justin Chen         2016-12-07   79  	struct cpuinfo_mips =
*c =3D &current_cpu_data;
ef462f3b64e9fb0c Justin Chen         2016-12-07   80  	struct cpu_cacheinfo=
 *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
ef462f3b64e9fb0c Justin Chen         2016-12-07   81  	struct cacheinfo *th=
is_leaf =3D this_cpu_ci->info_list;
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   82  	int level =3D 1;
ef462f3b64e9fb0c Justin Chen         2016-12-07   83  =

ef462f3b64e9fb0c Justin Chen         2016-12-07   84  	if (c->icache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   85  		/* I/D caches are p=
er core */
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24   86  		fill_cpumask_siblin=
gs(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   87  		populate_cache(dcac=
he, this_leaf, level, CACHE_TYPE_DATA);
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24   88  		fill_cpumask_siblin=
gs(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   89  		populate_cache(icac=
he, this_leaf, level, CACHE_TYPE_INST);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   90  		level++;
ef462f3b64e9fb0c Justin Chen         2016-12-07   91  	} else {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   92  		populate_cache(dcac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   93  		level++;
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   94  	}
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   95  =

e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   96  	if (c->vcache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   97  		/* Vcache is per co=
re as well */
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   98  		fill_cpumask_siblin=
gs(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30   99  		populate_cache(vcac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  100  		level++;
ef462f3b64e9fb0c Justin Chen         2016-12-07  101  	}
ef462f3b64e9fb0c Justin Chen         2016-12-07  102  =

3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24  103  	if (c->scache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  104  		/* Scache is per cl=
uster */
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24  105  		fill_cpumask_cluste=
r(cpu, &this_leaf->shared_cpu_map);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  106  		populate_cache(scac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  107  		level++;
3b1313eb32c499d4 Vladimir Kondratiev 2019-11-24  108  	}
ef462f3b64e9fb0c Justin Chen         2016-12-07  109  =

e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  110  	if (c->tcache.waysiz=
e) {
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  111  		populate_cache(tcac=
he, this_leaf, level, CACHE_TYPE_UNIFIED);
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30 @112  		level++;
e8bb8f28233d88f4 Jiaxun Yang         2020-12-30  113  	}
ef462f3b64e9fb0c Justin Chen         2016-12-07  114  =

b8bea8a5e5d942e6 Vladimir Kondratiev 2019-07-16  115  	this_cpu_ci->cpu_map=
_populated =3D true;
b8bea8a5e5d942e6 Vladimir Kondratiev 2019-07-16  116  =

ef462f3b64e9fb0c Justin Chen         2016-12-07  117  	return 0;
ef462f3b64e9fb0c Justin Chen         2016-12-07  118  }
ef462f3b64e9fb0c Justin Chen         2016-12-07  119  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4312714070749622617==--

