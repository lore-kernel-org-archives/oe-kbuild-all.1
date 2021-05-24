Content-Type: multipart/mixed; boundary="===============6892471078670875527=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-5.12 32/35] arch/x86/events/intel/lbr.c:729:16: error: too many arguments to function 'x86_get_pmu'
Date: Mon, 24 May 2021 08:48:34 +0800
Message-ID: <202105240831.E4Pzig46-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6892471078670875527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-5.12
head:   ac24f18ba7b235ec30919c2b1e84fb2a2033be47
commit: b7c724b23139e432dbef68d45b19607c6b069356 [32/35] perf/x86/lbr: Remo=
ve cpuc->lbr_xsave allocation from atomic context
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3Db7c724b23139e432dbef68d45b19607c6b069356
        git remote add sashal-linux-stable https://git.kernel.org/pub/scm/l=
inux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-linux-stable queue-5.12
        git checkout b7c724b23139e432dbef68d45b19607c6b069356
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/events/intel/lbr.c: In function 'reserve_lbr_buffers':
>> arch/x86/events/intel/lbr.c:729:16: error: too many arguments to functio=
n 'x86_get_pmu'
     729 |   kmem_cache =3D x86_get_pmu(cpu)->task_ctx_cache;
         |                ^~~~~~~~~~~
   In file included from arch/x86/events/intel/lbr.c:9:
   arch/x86/events/intel/../perf_event.h:908:13: note: declared here
     908 | struct pmu *x86_get_pmu(void);
         |             ^~~~~~~~~~~


vim +/x86_get_pmu +729 arch/x86/events/intel/lbr.c

   717	=

   718	void reserve_lbr_buffers(void)
   719	{
   720		struct kmem_cache *kmem_cache;
   721		struct cpu_hw_events *cpuc;
   722		int cpu;
   723	=

   724		if (!static_cpu_has(X86_FEATURE_ARCH_LBR))
   725			return;
   726	=

   727		for_each_possible_cpu(cpu) {
   728			cpuc =3D per_cpu_ptr(&cpu_hw_events, cpu);
 > 729			kmem_cache =3D x86_get_pmu(cpu)->task_ctx_cache;
   730			if (!kmem_cache || cpuc->lbr_xsave)
   731				continue;
   732	=

   733			cpuc->lbr_xsave =3D kmem_cache_alloc_node(kmem_cache, GFP_KERNEL,
   734								cpu_to_node(cpu));
   735		}
   736	}
   737	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6892471078670875527==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6892471078670875527==--

