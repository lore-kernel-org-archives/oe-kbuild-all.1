Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88E198822
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524147; cv=none; b=bILbiB3YulWRbwhUmmf0R7uzBcx/NsDlcLd3RM6wP8uZjy8axdHgjrJTDpgjPiUw0uK13vbTQbktF7eBkJhIKRtiVcNwVeIHksMYNK3quK3A08zk+IV+9tqbl9LmhLdQ2Y41A6GyowGHlnXsdyHc4GhSJeuw22zDhlPWtYaM9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524147; c=relaxed/simple;
	bh=bVYv3nfMhgxHN6aS8RxjsHGPKttIfCNglK8XYWf03yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbfS2zenKhEkHhB1kGmT60iooa1kaaM3Yxw56V43tjOy5E3UqSHwXXWkyQiyEYEcX8yGT0amdTbyH6EV/9B7EdDf4oEXlkwbFdJDbYjF/+Xc77NBhJpRr1C0VZw3kbFSt2TW3w/iHshBcdDc39CGICyzTogeV4FPHzXFVAls/rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPsf1vjH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPsf1vjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734524145; x=1766060145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bVYv3nfMhgxHN6aS8RxjsHGPKttIfCNglK8XYWf03yg=;
  b=aPsf1vjHD4dEGs9OVLPR9aUkupMsG64HUAOKmtoTcTmq/9iaYvEnN2U0
   gvFzKT3gcKgBt+2kh0gj8yyj0SeUE9smeepsozUnc0IMnEv+eUhbpmN+E
   WrLc9RrzKd35x5DRSvv8jSfdc1yD/g9+JWYngRLnsK/x5M2lHG2G8J7yB
   UvynnJn68RRSjhtDt+2DjG4EmDvzztqqF0V7mYJtC2aCuYNWMpfLI8VTf
   CbW57w+5yOLKTNJeLykQZbhqg7duj+94TDYMccuAv3pY8EyA1wCLLWPx1
   aJmLkp55L1yVRA6v22Kg/0X0TqGKqDqy6DTsl28rVn5wqYNzeiYD/gpor
   g==;
X-CSE-ConnectionGUID: 60xxF6JJQG+lhhpyaJJgQg==
X-CSE-MsgGUID: x/42aNXkTF2FRF9Jjwb0oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35027719"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35027719"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 04:15:44 -0800
X-CSE-ConnectionGUID: SpjQgIuYTiqRZ/l/rIh6Jg==
X-CSE-MsgGUID: 72qKSebtSiGuzXE4xUh7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102937506"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Dec 2024 04:15:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNsxp-000GKY-1S;
	Wed, 18 Dec 2024 12:15:41 +0000
Date: Wed, 18 Dec 2024 20:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 17/51]
 arch/riscv/kernel/vdso/hwprobe.c:30:47: error: 'const struct vdso_arch_data'
 has no member named 'homogeneous_cpus'
Message-ID: <202412182021.egAMMTpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   5eff74c3b09e18763969160fcfa8bf80f513f49f
commit: 21d9fd902e1f514c8bbdc4987d7d2f1403e6c419 [17/51] vdso: Remove kconfig symbol GENERIC_VDSO_DATA_STORE
config: riscv-randconfig-001-20241213 (https://download.01.org/0day-ci/archive/20241218/202412182021.egAMMTpR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182021.egAMMTpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182021.egAMMTpR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                         ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function 'riscv_vdso_get_values':
   arch/riscv/kernel/vdso/hwprobe.c:19:44: error: implicit declaration of function '__arch_get_vdso_u_arch_data'; did you mean '__arch_get_vdso_u_time_data'? [-Wimplicit-function-declaration]
      19 |         const struct vdso_arch_data *avd = __arch_get_vdso_u_arch_data();
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            __arch_get_vdso_u_time_data
   arch/riscv/kernel/vdso/hwprobe.c:19:44: error: initialization of 'const struct vdso_arch_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/riscv/kernel/vdso/hwprobe.c:22:43: error: invalid use of undefined type 'struct riscv_hwprobe'
      22 |         struct riscv_hwprobe *end = pairs + pair_count;
         |                                           ^
>> arch/riscv/kernel/vdso/hwprobe.c:30:47: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
      30 |         if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
         |                                               ^~
   arch/riscv/kernel/vdso/hwprobe.c:31:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
      31 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:35:21: error: implicit declaration of function 'riscv_hwprobe_key_is_valid' [-Wimplicit-function-declaration]
      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:35:49: error: invalid use of undefined type 'struct riscv_hwprobe'
      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                                 ^~
   arch/riscv/kernel/vdso/hwprobe.c:36:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                          ^~
>> arch/riscv/kernel/vdso/hwprobe.c:36:39: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                                       ^~
   arch/riscv/kernel/vdso/hwprobe.c:36:65: error: invalid use of undefined type 'struct riscv_hwprobe'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                                                                 ^~
   arch/riscv/kernel/vdso/hwprobe.c:39:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      39 |                         p->key = -1;
         |                          ^~
   arch/riscv/kernel/vdso/hwprobe.c:40:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      40 |                         p->value = 0;
         |                          ^~
   arch/riscv/kernel/vdso/hwprobe.c:43:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
      43 |                 p++;
         |                  ^~
   arch/riscv/kernel/vdso/hwprobe.c: At top level:
   arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                       ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function 'riscv_vdso_get_cpus':
   arch/riscv/kernel/vdso/hwprobe.c:53:44: error: initialization of 'const struct vdso_arch_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      53 |         const struct vdso_arch_data *avd = __arch_get_vdso_u_arch_data();
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:55:43: error: invalid use of undefined type 'struct riscv_hwprobe'
      55 |         struct riscv_hwprobe *end = pairs + pair_count;
         |                                           ^
   arch/riscv/kernel/vdso/hwprobe.c:71:36: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:71:36: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/vdso/hwprobe.c:71:68: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                                                                    ^~
   arch/riscv/kernel/vdso/hwprobe.c:72:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
      72 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:75:49: error: invalid use of undefined type 'struct riscv_hwprobe'
      75 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                                 ^~
   arch/riscv/kernel/vdso/hwprobe.c:76:32: error: variable 't' has initializer but incomplete type
      76 |                         struct riscv_hwprobe t = {
         |                                ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:77:34: error: 'struct riscv_hwprobe' has no member named 'key'
      77 |                                 .key = p->key,
         |                                  ^~~
   arch/riscv/kernel/vdso/hwprobe.c:77:41: error: invalid use of undefined type 'struct riscv_hwprobe'
      77 |                                 .key = p->key,
         |                                         ^~
   arch/riscv/kernel/vdso/hwprobe.c:77:40: warning: excess elements in struct initializer
      77 |                                 .key = p->key,
         |                                        ^
   arch/riscv/kernel/vdso/hwprobe.c:77:40: note: (near initialization for 't')
   arch/riscv/kernel/vdso/hwprobe.c:78:34: error: 'struct riscv_hwprobe' has no member named 'value'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                  ^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:78:45: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                             ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:71: error: invalid use of undefined type 'struct riscv_hwprobe'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                                                       ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:42: warning: excess elements in struct initializer
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                          ^~~
   arch/riscv/kernel/vdso/hwprobe.c:78:42: note: (near initialization for 't')
   arch/riscv/kernel/vdso/hwprobe.c:76:46: error: storage size of 't' isn't known
      76 |                         struct riscv_hwprobe t = {
         |                                              ^
   arch/riscv/kernel/vdso/hwprobe.c:81:30: error: implicit declaration of function 'riscv_hwprobe_pair_cmp' [-Wimplicit-function-declaration]
      81 |                         if (!riscv_hwprobe_pair_cmp(&t, p))
         |                              ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:76:46: warning: unused variable 't' [-Wunused-variable]
      76 |                         struct riscv_hwprobe t = {
         |                                              ^
   arch/riscv/kernel/vdso/hwprobe.c:85:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      85 |                         p->key = -1;
         |                          ^~
   arch/riscv/kernel/vdso/hwprobe.c:86:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      86 |                         p->value = 0;
         |                          ^~
   arch/riscv/kernel/vdso/hwprobe.c:88:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
      88 |                 p++;
         |                  ^~
   arch/riscv/kernel/vdso/hwprobe.c: At top level:
   arch/riscv/kernel/vdso/hwprobe.c:100:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:104:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:104:5: error: conflicting types for '__vdso_riscv_hwprobe'; have 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, unsigned int,  unsigned int,  long unsigned int *, unsigned int)'}
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:100:5: note: previous declaration of '__vdso_riscv_hwprobe' with type 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, unsigned int,  unsigned int,  long unsigned int *, unsigned int)'}
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +30 arch/riscv/kernel/vdso/hwprobe.c

aa5af0aa90bad3f Evan Green       2023-04-07  10  
aa5af0aa90bad3f Evan Green       2023-04-07  11  extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
36d842d654beba9 Andrew Jones     2023-11-22  12  			 size_t cpusetsize, unsigned long *cpus,
aa5af0aa90bad3f Evan Green       2023-04-07  13  			 unsigned int flags);
aa5af0aa90bad3f Evan Green       2023-04-07  14  
e178bf146e4b8c7 Andrew Jones     2023-11-22  15  static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
36d842d654beba9 Andrew Jones     2023-11-22  16  				 size_t cpusetsize, unsigned long *cpus,
aa5af0aa90bad3f Evan Green       2023-04-07  17  				 unsigned int flags)
aa5af0aa90bad3f Evan Green       2023-04-07  18  {
050a00b58981a2d Thomas Weißschuh 2024-09-12  19  	const struct vdso_arch_data *avd = __arch_get_vdso_u_arch_data();
36d842d654beba9 Andrew Jones     2023-11-22  20  	bool all_cpus = !cpusetsize && !cpus;
aa5af0aa90bad3f Evan Green       2023-04-07  21  	struct riscv_hwprobe *p = pairs;
aa5af0aa90bad3f Evan Green       2023-04-07  22  	struct riscv_hwprobe *end = pairs + pair_count;
aa5af0aa90bad3f Evan Green       2023-04-07  23  
aa5af0aa90bad3f Evan Green       2023-04-07  24  	/*
aa5af0aa90bad3f Evan Green       2023-04-07  25  	 * Defer to the syscall for exotic requests. The vdso has answers
aa5af0aa90bad3f Evan Green       2023-04-07  26  	 * stashed away only for the "all cpus" case. If all CPUs are
aa5af0aa90bad3f Evan Green       2023-04-07  27  	 * homogeneous, then this function can handle requests for arbitrary
aa5af0aa90bad3f Evan Green       2023-04-07  28  	 * masks.
aa5af0aa90bad3f Evan Green       2023-04-07  29  	 */
aa5af0aa90bad3f Evan Green       2023-04-07 @30  	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
36d842d654beba9 Andrew Jones     2023-11-22  31  		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
aa5af0aa90bad3f Evan Green       2023-04-07  32  
aa5af0aa90bad3f Evan Green       2023-04-07  33  	/* This is something we can handle, fill out the pairs. */
aa5af0aa90bad3f Evan Green       2023-04-07  34  	while (p < end) {
e1c05b3bf80f829 Andrew Jones     2023-10-10  35  		if (riscv_hwprobe_key_is_valid(p->key)) {
aa5af0aa90bad3f Evan Green       2023-04-07 @36  			p->value = avd->all_cpu_hwprobe_values[p->key];
aa5af0aa90bad3f Evan Green       2023-04-07  37  
aa5af0aa90bad3f Evan Green       2023-04-07  38  		} else {
aa5af0aa90bad3f Evan Green       2023-04-07  39  			p->key = -1;
aa5af0aa90bad3f Evan Green       2023-04-07  40  			p->value = 0;
aa5af0aa90bad3f Evan Green       2023-04-07  41  		}
aa5af0aa90bad3f Evan Green       2023-04-07  42  
aa5af0aa90bad3f Evan Green       2023-04-07  43  		p++;
aa5af0aa90bad3f Evan Green       2023-04-07  44  	}
aa5af0aa90bad3f Evan Green       2023-04-07  45  
aa5af0aa90bad3f Evan Green       2023-04-07  46  	return 0;
aa5af0aa90bad3f Evan Green       2023-04-07  47  }
e178bf146e4b8c7 Andrew Jones     2023-11-22  48  

:::::: The code at line 30 was first introduced by commit
:::::: aa5af0aa90bad3f1cad5a90ee5eecd92ac9f3096 RISC-V: Add hwprobe vDSO function and data

:::::: TO: Evan Green <evan@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
