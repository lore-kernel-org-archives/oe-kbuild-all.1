Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FADC3FDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683844496; x=1715380496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BvXqgyxyKRGN+Hy/L89ReRf+bzr9J6NYOKnGKreb3Bc=;
  b=YpgyRkTcmeuld4NTerwV9sXDI8aTXOc1u/uZsqWbQvjczWppYx1HJGC3
   t2PXCGrbbB6FEQmhgGHpODlDAA0fQJO/Kga4vfngR1A6SVEAUKdOjRzGt
   Naozg0vV48k+8A95sOvMqDwvrdEn9/Rme9fG5fZlkUnJlEs/3VbRkfRMr
   37JPmeBPhbmTcjLsbNgclNXB9bRgyGeMi61S30OpoltDpUe1fGbqfIEYG
   4EFpuoF5DjMRQPzJslI2fRutKDP4IKvmYhyFbM4zwrYM1NCPZnnFsYWOJ
   Kx5Bg0dD3aMqhDRvjlw29XV9ElajW6TkE5XqWjcbJeyzw7qkGgL2sKR0M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330268231"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="330268231"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 15:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029810634"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="1029810634"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 15:34:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxEs2-0004Ho-13;
	Thu, 11 May 2023 22:34:46 +0000
Date: Fri, 12 May 2023 06:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:atomics/fallback-rework 3/4]
 include/linux/atomic/atomic-arch-fallback.h:1139:2: error: #error "Unable to
 define arch_atomic_xchg"
Message-ID: <202305120628.npWSSP7N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/fallback-rework
head:   7e9269c286142bde291716fc2c1aaffb41072472
commit: 275f1f833afb4afc3b1eac69d62e9eb4309ce447 [3/4] scripts: atomic: restructure fallback ifdeffery
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230512/202305120628.npWSSP7N-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=275f1f833afb4afc3b1eac69d62e9eb4309ce447
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark atomics/fallback-rework
        git checkout 275f1f833afb4afc3b1eac69d62e9eb4309ce447
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120628.npWSSP7N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/atomic/atomic-arch-fallback.h:1139:2: error: #error "Unable to define arch_atomic_xchg"
    1139 | #error "Unable to define arch_atomic_xchg"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1156:2: error: #error "Unable to define arch_atomic_xchg_acquire"
    1156 | #error "Unable to define arch_atomic_xchg_acquire"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1172:2: error: #error "Unable to define arch_atomic_xchg_release"
    1172 | #error "Unable to define arch_atomic_xchg_release"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1180:2: error: #error "Unable to define arch_atomic_xchg_relaxed"
    1180 | #error "Unable to define arch_atomic_xchg_relaxed"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1197:2: error: #error "Unable to define arch_atomic_cmpxchg"
    1197 | #error "Unable to define arch_atomic_cmpxchg"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1214:2: error: #error "Unable to define arch_atomic_cmpxchg_acquire"
    1214 | #error "Unable to define arch_atomic_cmpxchg_acquire"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1230:2: error: #error "Unable to define arch_atomic_cmpxchg_release"
    1230 | #error "Unable to define arch_atomic_cmpxchg_release"
         |  ^~~~~
>> include/linux/atomic/atomic-arch-fallback.h:1238:2: error: #error "Unable to define arch_atomic_cmpxchg_relaxed"
    1238 | #error "Unable to define arch_atomic_cmpxchg_relaxed"
         |  ^~~~~
   In file included from include/linux/atomic.h:81:
   include/linux/atomic/atomic-long.h: In function 'arch_atomic_long_xchg_acquire':
>> include/linux/atomic/atomic-long.h:907:16: error: implicit declaration of function 'arch_atomic_xchg_acquire'; did you mean 'arch_atomic64_xchg_acquire'? [-Werror=implicit-function-declaration]
     907 |         return arch_atomic_xchg_acquire(v, i);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_atomic64_xchg_acquire
   include/linux/atomic/atomic-long.h: In function 'arch_atomic_long_xchg_release':
>> include/linux/atomic/atomic-long.h:913:16: error: implicit declaration of function 'arch_atomic_xchg_release'; did you mean 'arch_atomic64_xchg_release'? [-Werror=implicit-function-declaration]
     913 |         return arch_atomic_xchg_release(v, i);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_atomic64_xchg_release
   include/linux/atomic/atomic-long.h: In function 'arch_atomic_long_xchg_relaxed':
>> include/linux/atomic/atomic-long.h:919:16: error: implicit declaration of function 'arch_atomic_xchg_relaxed'; did you mean 'arch_atomic64_xchg_relaxed'? [-Werror=implicit-function-declaration]
     919 |         return arch_atomic_xchg_relaxed(v, i);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_atomic64_xchg_relaxed
   include/linux/atomic/atomic-long.h: In function 'arch_atomic_long_cmpxchg_acquire':
>> include/linux/atomic/atomic-long.h:931:16: error: implicit declaration of function 'arch_atomic_cmpxchg_acquire'; did you mean 'arch_atomic64_cmpxchg_acquire'? [-Werror=implicit-function-declaration]
     931 |         return arch_atomic_cmpxchg_acquire(v, old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_atomic64_cmpxchg_acquire
   include/linux/atomic/atomic-long.h: In function 'arch_atomic_long_cmpxchg_release':
>> include/linux/atomic/atomic-long.h:937:16: error: implicit declaration of function 'arch_atomic_cmpxchg_release'; did you mean 'arch_atomic64_cmpxchg_release'? [-Werror=implicit-function-declaration]
     937 |         return arch_atomic_cmpxchg_release(v, old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_atomic64_cmpxchg_release
   include/linux/atomic/atomic-long.h: In function 'arch_atomic_long_cmpxchg_relaxed':
>> include/linux/atomic/atomic-long.h:943:16: error: implicit declaration of function 'arch_atomic_cmpxchg_relaxed'; did you mean 'arch_atomic64_cmpxchg_relaxed'? [-Werror=implicit-function-declaration]
     943 |         return arch_atomic_cmpxchg_relaxed(v, old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_atomic64_cmpxchg_relaxed
   arch/mips/kernel/asm-offsets.c: At top level:
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      92 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     108 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     136 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     179 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     213 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     248 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:318:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     318 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:330:6: warning: no previous prototype for 'output_pm_defines' [-Wmissing-prototypes]
     330 | void output_pm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:344:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     344 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:388:6: warning: no previous prototype for 'output_cps_defines' [-Wmissing-prototypes]
     388 | void output_cps_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1139 include/linux/atomic/atomic-arch-fallback.h

  1124	
  1125	#if defined(arch_atomic_xchg)
  1126	/* Provided directly by arch code -- no fallback necessary. */
  1127	#elif defined(arch_atomic_xchg_relaxed)
  1128	static __always_inline int
  1129	arch_atomic_xchg(atomic_t *v, int i)
  1130	{
  1131		int ret;
  1132		__atomic_pre_full_fence();
  1133		ret = arch_atomic_xchg_relaxed(v, i);
  1134		__atomic_post_full_fence();
  1135		return ret;
  1136	}
  1137	#define arch_atomic_xchg arch_atomic_xchg
  1138	#else
> 1139	#error "Unable to define arch_atomic_xchg"
  1140	#endif /* arch_atomic_xchg */
  1141	
  1142	#if defined(arch_atomic_xchg_acquire)
  1143	/* Provided directly by arch code -- no fallback necessary. */
  1144	#elif defined(arch_atomic_xchg_relaxed)
  1145	static __always_inline int
  1146	arch_atomic_xchg_acquire(atomic_t *v, int i)
  1147	{
  1148		int ret = arch_atomic_xchg_relaxed(v, i);
  1149		__atomic_acquire_fence();
  1150		return ret;
  1151	}
  1152	#define arch_atomic_xchg_acquire arch_atomic_xchg_acquire
  1153	#elif defined(arch_atomic_xchg)
  1154	#define arch_atomic_xchg_acquire arch_atomic_xchg
  1155	#else
> 1156	#error "Unable to define arch_atomic_xchg_acquire"
  1157	#endif /* arch_atomic_xchg_acquire */
  1158	
  1159	#if defined(arch_atomic_xchg_release)
  1160	/* Provided directly by arch code -- no fallback necessary. */
  1161	#elif defined(arch_atomic_xchg_relaxed)
  1162	static __always_inline int
  1163	arch_atomic_xchg_release(atomic_t *v, int i)
  1164	{
  1165		__atomic_release_fence();
  1166		return arch_atomic_xchg_relaxed(v, i);
  1167	}
  1168	#define arch_atomic_xchg_release arch_atomic_xchg_release
  1169	#elif defined(arch_atomic_xchg)
  1170	#define arch_atomic_xchg_release arch_atomic_xchg
  1171	#else
> 1172	#error "Unable to define arch_atomic_xchg_release"
  1173	#endif /* arch_atomic_xchg_release */
  1174	
  1175	#if defined(arch_atomic_xchg_relaxed)
  1176	/* Provided directly by arch code -- no fallback necessary. */
  1177	#elif defined(arch_atomic_xchg)
  1178	#define arch_atomic_xchg_relaxed arch_atomic_xchg
  1179	#else
> 1180	#error "Unable to define arch_atomic_xchg_relaxed"
  1181	#endif /* arch_atomic_xchg_relaxed */
  1182	
  1183	#if defined(arch_atomic_cmpxchg)
  1184	/* Provided directly by arch code -- no fallback necessary. */
  1185	#elif defined(arch_atomic_cmpxchg_relaxed)
  1186	static __always_inline int
  1187	arch_atomic_cmpxchg(atomic_t *v, int old, int new)
  1188	{
  1189		int ret;
  1190		__atomic_pre_full_fence();
  1191		ret = arch_atomic_cmpxchg_relaxed(v, old, new);
  1192		__atomic_post_full_fence();
  1193		return ret;
  1194	}
  1195	#define arch_atomic_cmpxchg arch_atomic_cmpxchg
  1196	#else
> 1197	#error "Unable to define arch_atomic_cmpxchg"
  1198	#endif /* arch_atomic_cmpxchg */
  1199	
  1200	#if defined(arch_atomic_cmpxchg_acquire)
  1201	/* Provided directly by arch code -- no fallback necessary. */
  1202	#elif defined(arch_atomic_cmpxchg_relaxed)
  1203	static __always_inline int
  1204	arch_atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
  1205	{
  1206		int ret = arch_atomic_cmpxchg_relaxed(v, old, new);
  1207		__atomic_acquire_fence();
  1208		return ret;
  1209	}
  1210	#define arch_atomic_cmpxchg_acquire arch_atomic_cmpxchg_acquire
  1211	#elif defined(arch_atomic_cmpxchg)
  1212	#define arch_atomic_cmpxchg_acquire arch_atomic_cmpxchg
  1213	#else
> 1214	#error "Unable to define arch_atomic_cmpxchg_acquire"
  1215	#endif /* arch_atomic_cmpxchg_acquire */
  1216	
  1217	#if defined(arch_atomic_cmpxchg_release)
  1218	/* Provided directly by arch code -- no fallback necessary. */
  1219	#elif defined(arch_atomic_cmpxchg_relaxed)
  1220	static __always_inline int
  1221	arch_atomic_cmpxchg_release(atomic_t *v, int old, int new)
  1222	{
  1223		__atomic_release_fence();
  1224		return arch_atomic_cmpxchg_relaxed(v, old, new);
  1225	}
  1226	#define arch_atomic_cmpxchg_release arch_atomic_cmpxchg_release
  1227	#elif defined(arch_atomic_cmpxchg)
  1228	#define arch_atomic_cmpxchg_release arch_atomic_cmpxchg
  1229	#else
> 1230	#error "Unable to define arch_atomic_cmpxchg_release"
  1231	#endif /* arch_atomic_cmpxchg_release */
  1232	
  1233	#if defined(arch_atomic_cmpxchg_relaxed)
  1234	/* Provided directly by arch code -- no fallback necessary. */
  1235	#elif defined(arch_atomic_cmpxchg)
  1236	#define arch_atomic_cmpxchg_relaxed arch_atomic_cmpxchg
  1237	#else
> 1238	#error "Unable to define arch_atomic_cmpxchg_relaxed"
  1239	#endif /* arch_atomic_cmpxchg_relaxed */
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
