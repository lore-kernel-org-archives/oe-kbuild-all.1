Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7049815574E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734505641; cv=none; b=Z0ROQF8ogPIU/xf8T7JcnEQr9P21d39YFJ41ckDMNu0QVtFdmVO3uk66Y0amSV5ED5aDy0j2i+8EOUBEOuHJS0Xd0RmWRIcg7cAY2k7K1K8I8SIcP6xHnET9ZO+zwwEnjf8KISAFa/IeaFdceyN3S5sUUkzw/TtImwdqe3Y0IxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734505641; c=relaxed/simple;
	bh=KONQnE3TSC4Nj3uu9En0ilRUAlijL6Xo18zgP74ooq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIjGmRNQm8352on4Uc9GlHg+JEc3vhrMwBVJR709xXUnbCAyepDjBY4M8XPxInT2aZRM4fdzK7G8BQeCFsMVBO3JRRwJU0vImbTGFDTjfyn8OQIX6qcr7nH3Hr7QCEMowVKnX7uVBIGATnpTu3EARZDzCs5bpZRXaMpSDeL7JT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRk3KFgG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRk3KFgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734505640; x=1766041640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KONQnE3TSC4Nj3uu9En0ilRUAlijL6Xo18zgP74ooq0=;
  b=gRk3KFgGPy0N5+jtKVqXrTD+tyBCNmCeENRAcJ8JTrsL6cudTvb2TBab
   6M+vPm5XSyf/dygceRYUzq8ru1xaxnLLWNFVAILoy55GoP4i/tf6kQ6D4
   4FpQbhI3nI1BNquRSCXegfY3tEe9t1FS9CyoO8qFectx9qlKwGPHgbX86
   8VAwtnDkfuR7iMDsnjza4cUnd995/UuWbrtjqkqet17N52Fu2brwnxlxf
   16bE7WKVNFzUYekCg9XOKwKfgnK8UjbDQeVU2qo1My/68XY6IluUzpZ79
   idEMmpM+yUngIG3+/gTIePgtFkB/NNQJkyVpQ58n3wBZefWRZaFI3PTb3
   g==;
X-CSE-ConnectionGUID: UIEPI1twSL+B0qmixb9OUQ==
X-CSE-MsgGUID: NddweGKSQ7aj2NhIrd1pmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35183460"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35183460"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 23:07:18 -0800
X-CSE-ConnectionGUID: C2WbjF1pRV6F+eEpcV+ERg==
X-CSE-MsgGUID: lm3oUupFSY68nS5JYqA5xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135101531"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2024 23:07:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNo9K-000GAk-0H;
	Wed, 18 Dec 2024 07:07:14 +0000
Date: Wed, 18 Dec 2024 15:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 7/51]
 arch/riscv/kernel/vdso/hwprobe.c:19:44: error: implicit declaration of
 function '__arch_get_vdso_u_arch_data'
Message-ID: <202412181538.TGmLPgWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   5eff74c3b09e18763969160fcfa8bf80f513f49f
commit: 050a00b58981a2d66cff6076a4545d94cfc91743 [7/51] riscv: vdso: Switch to generic storage implementation
config: riscv-randconfig-001-20241213 (https://download.01.org/0day-ci/archive/20241218/202412181538.TGmLPgWh-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181538.TGmLPgWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181538.TGmLPgWh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                         ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function 'riscv_vdso_get_values':
>> arch/riscv/kernel/vdso/hwprobe.c:19:44: error: implicit declaration of function '__arch_get_vdso_u_arch_data' [-Wimplicit-function-declaration]
      19 |         const struct vdso_arch_data *avd = __arch_get_vdso_u_arch_data();
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:19:44: error: initialization of 'const struct vdso_arch_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> arch/riscv/kernel/vdso/hwprobe.c:22:43: error: invalid use of undefined type 'struct riscv_hwprobe'
      22 |         struct riscv_hwprobe *end = pairs + pair_count;
         |                                           ^
   arch/riscv/kernel/vdso/hwprobe.c:30:47: error: invalid use of undefined type 'const struct vdso_arch_data'
      30 |         if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
         |                                               ^~
>> arch/riscv/kernel/vdso/hwprobe.c:31:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
      31 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:35:21: error: implicit declaration of function 'riscv_hwprobe_key_is_valid' [-Wimplicit-function-declaration]
      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:35:49: error: invalid use of undefined type 'struct riscv_hwprobe'
      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                                 ^~
   arch/riscv/kernel/vdso/hwprobe.c:36:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                          ^~
   arch/riscv/kernel/vdso/hwprobe.c:36:39: error: invalid use of undefined type 'const struct vdso_arch_data'
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
>> arch/riscv/kernel/vdso/hwprobe.c:43:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
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
>> arch/riscv/kernel/vdso/hwprobe.c:71:36: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:71:36: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/vdso/hwprobe.c:71:68: error: invalid use of undefined type 'const struct vdso_arch_data'
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
>> arch/riscv/kernel/vdso/hwprobe.c:76:32: error: variable 't' has initializer but incomplete type
      76 |                         struct riscv_hwprobe t = {
         |                                ^~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:77:34: error: 'struct riscv_hwprobe' has no member named 'key'
      77 |                                 .key = p->key,
         |                                  ^~~
   arch/riscv/kernel/vdso/hwprobe.c:77:41: error: invalid use of undefined type 'struct riscv_hwprobe'
      77 |                                 .key = p->key,
         |                                         ^~
>> arch/riscv/kernel/vdso/hwprobe.c:77:40: warning: excess elements in struct initializer
      77 |                                 .key = p->key,
         |                                        ^
   arch/riscv/kernel/vdso/hwprobe.c:77:40: note: (near initialization for 't')
>> arch/riscv/kernel/vdso/hwprobe.c:78:34: error: 'struct riscv_hwprobe' has no member named 'value'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                  ^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:78:45: error: invalid use of undefined type 'const struct vdso_arch_data'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                             ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:71: error: invalid use of undefined type 'struct riscv_hwprobe'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                                                       ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:42: warning: excess elements in struct initializer
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                          ^~~
   arch/riscv/kernel/vdso/hwprobe.c:78:42: note: (near initialization for 't')
>> arch/riscv/kernel/vdso/hwprobe.c:76:46: error: storage size of 't' isn't known
      76 |                         struct riscv_hwprobe t = {
         |                                              ^
>> arch/riscv/kernel/vdso/hwprobe.c:81:30: error: implicit declaration of function 'riscv_hwprobe_pair_cmp' [-Wimplicit-function-declaration]
      81 |                         if (!riscv_hwprobe_pair_cmp(&t, p))
         |                              ^~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:76:46: warning: unused variable 't' [-Wunused-variable]
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
>> arch/riscv/kernel/vdso/hwprobe.c:104:5: error: conflicting types for '__vdso_riscv_hwprobe'; have 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, unsigned int,  unsigned int,  long unsigned int *, unsigned int)'}
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:100:5: note: previous declaration of '__vdso_riscv_hwprobe' with type 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, unsigned int,  unsigned int,  long unsigned int *, unsigned int)'}
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function '__vdso_riscv_hwprobe':
   arch/riscv/kernel/vdso/hwprobe.c:108:21: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
     108 |         if (flags & RISCV_HWPROBE_WHICH_CPUS)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:109:44: error: passing argument 1 of 'riscv_vdso_get_cpus' from incompatible pointer type [-Wincompatible-pointer-types]
     109 |                 return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
         |                                            ^~~~~
         |                                            |
         |                                            struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:49:54: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:112:38: error: passing argument 1 of 'riscv_vdso_get_values' from incompatible pointer type [-Wincompatible-pointer-types]
     112 |         return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:15:56: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   make[3]: *** [scripts/Makefile.build:194: arch/riscv/kernel/vdso/hwprobe.o] Error 1 shuffle=621611230
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:183: vdso_prepare] Error 2 shuffle=621611230
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=621611230
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=621611230
   make: Target 'prepare' not remade because of errors.


vim +/__arch_get_vdso_u_arch_data +19 arch/riscv/kernel/vdso/hwprobe.c

    10	
  > 11	extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
    12				 size_t cpusetsize, unsigned long *cpus,
    13				 unsigned int flags);
    14	
    15	static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
    16					 size_t cpusetsize, unsigned long *cpus,
    17					 unsigned int flags)
    18	{
  > 19		const struct vdso_arch_data *avd = __arch_get_vdso_u_arch_data();
    20		bool all_cpus = !cpusetsize && !cpus;
    21		struct riscv_hwprobe *p = pairs;
  > 22		struct riscv_hwprobe *end = pairs + pair_count;
    23	
    24		/*
    25		 * Defer to the syscall for exotic requests. The vdso has answers
    26		 * stashed away only for the "all cpus" case. If all CPUs are
    27		 * homogeneous, then this function can handle requests for arbitrary
    28		 * masks.
    29		 */
    30		if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
  > 31			return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
    32	
    33		/* This is something we can handle, fill out the pairs. */
    34		while (p < end) {
  > 35			if (riscv_hwprobe_key_is_valid(p->key)) {
    36				p->value = avd->all_cpu_hwprobe_values[p->key];
    37	
    38			} else {
    39				p->key = -1;
    40				p->value = 0;
    41			}
    42	
  > 43			p++;
    44		}
    45	
    46		return 0;
    47	}
    48	
    49	static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
    50				       size_t cpusetsize, unsigned long *cpus,
    51				       unsigned int flags)
    52	{
    53		const struct vdso_arch_data *avd = __arch_get_vdso_u_arch_data();
    54		struct riscv_hwprobe *p = pairs;
    55		struct riscv_hwprobe *end = pairs + pair_count;
    56		unsigned char *c = (unsigned char *)cpus;
    57		bool empty_cpus = true;
    58		bool clear_all = false;
    59		int i;
    60	
    61		if (!cpusetsize || !cpus)
    62			return -EINVAL;
    63	
    64		for (i = 0; i < cpusetsize; i++) {
    65			if (c[i]) {
    66				empty_cpus = false;
    67				break;
    68			}
    69		}
    70	
  > 71		if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
    72			return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
    73	
    74		while (p < end) {
    75			if (riscv_hwprobe_key_is_valid(p->key)) {
  > 76				struct riscv_hwprobe t = {
  > 77					.key = p->key,
  > 78					.value = avd->all_cpu_hwprobe_values[p->key],
    79				};
    80	
  > 81				if (!riscv_hwprobe_pair_cmp(&t, p))
    82					clear_all = true;
    83			} else {
    84				clear_all = true;
    85				p->key = -1;
    86				p->value = 0;
    87			}
    88			p++;
    89		}
    90	
    91		if (clear_all) {
    92			for (i = 0; i < cpusetsize; i++)
    93				c[i] = 0;
    94		}
    95	
    96		return 0;
    97	}
    98	
    99	/* Add a prototype to avoid -Wmissing-prototypes warning. */
   100	int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
   101				 size_t cpusetsize, unsigned long *cpus,
   102				 unsigned int flags);
   103	
 > 104	int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
   105				 size_t cpusetsize, unsigned long *cpus,
   106				 unsigned int flags)
   107	{
   108		if (flags & RISCV_HWPROBE_WHICH_CPUS)
 > 109			return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
   110						   cpus, flags);
   111	
 > 112		return riscv_vdso_get_values(pairs, pair_count, cpusetsize,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
