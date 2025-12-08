Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8722DCBE0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185070; cv=none; b=MxdrJlBACvTF0TPzRiODQ04o8+0TQ4cYHI80wdDqi/kZzf328i/s4xTVbyVHnmq05fhlqY9wuJbzPIJeFKmYGYxl47ul0tCNEAn5vf/BbR+UuZWzdUcP8TwfFVTCuOw5HUFNweMh87mkBrZXD9XGYFmoQaqaHlhHVQE41dq0o4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185070; c=relaxed/simple;
	bh=CoIpJyemv5OuT8sTcm2vZwF3iDgiXRXvdRAPFs/MtTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asvDEbeVPbdvXgDbtwce3xLQWiKLmEYaEstE29jEG2XtiEOsI2uJlkGHQVx2WXH4WVO0GaVsDZUqU5bMGEivHaDn+/MTS/l9qWDR98N9yHTSDEaajNKjufkB60goGvv4pvItkKta4XFqrP8jW8lqlbcPZdCB0Z6x+8pA1VShmIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDHcigi1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDHcigi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765185065; x=1796721065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CoIpJyemv5OuT8sTcm2vZwF3iDgiXRXvdRAPFs/MtTA=;
  b=CDHcigi1I7m7Wmy+RGwn6eslvbtOVrz265iuN2+IiJWdX80ljicbEJol
   fYZT3rJsCUSdH/d7pzLUKc4f6WwXn9/b6X3rlcQXLQfn5LtJ0rNMp6da8
   f+g1DLHJLKwx2dnAJ0ncKCULUoIs+OvUcF86qoKogXaMUvCpJcry89Ol9
   eghohT8Q2dRYcm6aQxOBc9d5xSJjdXGeDdjjCagL0HX/nEhtaMG7FU24i
   UqCJ5Jg7IvtxhnZ8Y95sL95Rn45VnAHU8G3TRmOkn+3ETZgSVg0ffGI1v
   lR/cjTCMWK3JGCMZoMhQekSI90DKrvliWtqZ4eGUjoFpS0Wk6DZmI/f+R
   Q==;
X-CSE-ConnectionGUID: yiHQ3SB3Rc2WLL87e/YvUQ==
X-CSE-MsgGUID: qnfxY/nrSUCEWvqXmLHKgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67159386"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67159386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:11:04 -0800
X-CSE-ConnectionGUID: ef4xsranRVuJoehOZJ0KLQ==
X-CSE-MsgGUID: A6U8F4vpRzCplAfdXeG8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="194939048"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2025 01:11:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSXGl-0000000003V-3UmS;
	Mon, 08 Dec 2025 09:10:59 +0000
Date: Mon, 8 Dec 2025 17:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
	Zong Li <zong.li@sifive.com>
Subject: [linux-next:master 11881/13721]
 arch/riscv/kernel/vdso_cfi/vgettimeofday.c:15:16: error: implicit
 declaration of function '__cvdso_clock_gettime'; did you mean
 '__vdso_clock_gettime'?
Message-ID: <202512081711.HA5UTd9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: c5f5ce714457370edb6a309d0c07c0bbb6432662 [11881/13721] riscv: create a Kconfig for shadow stack and landing pad support
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20251208/202512081711.HA5UTd9C-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081711.HA5UTd9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081711.HA5UTd9C-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kernel/vdso_cfi/vgettimeofday.c: In function '__vdso_clock_gettime':
>> arch/riscv/kernel/vdso_cfi/vgettimeofday.c:15:16: error: implicit declaration of function '__cvdso_clock_gettime'; did you mean '__vdso_clock_gettime'? [-Wimplicit-function-declaration]
      15 |         return __cvdso_clock_gettime(clock, ts);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                __vdso_clock_gettime
   arch/riscv/kernel/vdso_cfi/vgettimeofday.c: In function '__vdso_gettimeofday':
>> arch/riscv/kernel/vdso_cfi/vgettimeofday.c:20:16: error: implicit declaration of function '__cvdso_gettimeofday'; did you mean '__vdso_gettimeofday'? [-Wimplicit-function-declaration]
      20 |         return __cvdso_gettimeofday(tv, tz);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                __vdso_gettimeofday
   arch/riscv/kernel/vdso_cfi/vgettimeofday.c: In function '__vdso_clock_getres':
>> arch/riscv/kernel/vdso_cfi/vgettimeofday.c:25:16: error: implicit declaration of function '__cvdso_clock_getres'; did you mean '__vdso_clock_getres'? [-Wimplicit-function-declaration]
      25 |         return __cvdso_clock_getres(clock_id, res);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                __vdso_clock_getres
--
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:11:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:15:41: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                         ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c: In function 'riscv_vdso_get_values':
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:22:43: error: invalid use of undefined type 'struct riscv_hwprobe'
      22 |         struct riscv_hwprobe *end = pairs + pair_count;
         |                                           ^
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:30:45: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
      30 |         if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
         |                                             ^~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from arch/riscv/kernel/vdso_cfi/hwprobe.c:6:
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:30:81: error: 'const struct vdso_arch_data' has no member named 'ready'
      30 |         if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
         |                                                                                 ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:31:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
      31 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso_cfi/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:35:21: error: implicit declaration of function 'riscv_hwprobe_key_is_valid' [-Wimplicit-function-declaration]
      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:35:49: error: invalid use of undefined type 'struct riscv_hwprobe'
      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                                 ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:36:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                          ^~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:36:39: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                                       ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:36:65: error: invalid use of undefined type 'struct riscv_hwprobe'
      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
         |                                                                 ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:39:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      39 |                         p->key = -1;
         |                          ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:40:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      40 |                         p->value = 0;
         |                          ^~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:43:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
      43 |                 p++;
         |                  ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c: At top level:
   arch/riscv/kernel/vdso_cfi/hwprobe.c:49:39: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                       ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c: In function 'riscv_vdso_get_cpus':
   arch/riscv/kernel/vdso_cfi/hwprobe.c:55:43: error: invalid use of undefined type 'struct riscv_hwprobe'
      55 |         struct riscv_hwprobe *end = pairs + pair_count;
         |                                           ^
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:71:36: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:71:36: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/vdso_cfi/hwprobe.c:71:68: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                                                                    ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:72:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
      72 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso_cfi/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:75:49: error: invalid use of undefined type 'struct riscv_hwprobe'
      75 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                                 ^~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:76:32: error: variable 't' has initializer but incomplete type
      76 |                         struct riscv_hwprobe t = {
         |                                ^~~~~~~~~~~~~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:77:34: error: 'struct riscv_hwprobe' has no member named 'key'
      77 |                                 .key = p->key,
         |                                  ^~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:77:41: error: invalid use of undefined type 'struct riscv_hwprobe'
      77 |                                 .key = p->key,
         |                                         ^~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:77:40: warning: excess elements in struct initializer
      77 |                                 .key = p->key,
         |                                        ^
   arch/riscv/kernel/vdso_cfi/hwprobe.c:77:40: note: (near initialization for 't')
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:78:34: error: 'struct riscv_hwprobe' has no member named 'value'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                  ^~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:45: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                             ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:71: error: invalid use of undefined type 'struct riscv_hwprobe'
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                                                       ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:42: warning: excess elements in struct initializer
      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
         |                                          ^~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:42: note: (near initialization for 't')
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:76:46: error: storage size of 't' isn't known
      76 |                         struct riscv_hwprobe t = {
         |                                              ^
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:81:30: error: implicit declaration of function 'riscv_hwprobe_pair_cmp' [-Wimplicit-function-declaration]
      81 |                         if (!riscv_hwprobe_pair_cmp(&t, p))
         |                              ^~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:76:46: warning: unused variable 't' [-Wunused-variable]
      76 |                         struct riscv_hwprobe t = {
         |                                              ^
   arch/riscv/kernel/vdso_cfi/hwprobe.c:85:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      85 |                         p->key = -1;
         |                          ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:86:26: error: invalid use of undefined type 'struct riscv_hwprobe'
      86 |                         p->value = 0;
         |                          ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:88:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
      88 |                 p++;
         |                  ^~
   arch/riscv/kernel/vdso_cfi/hwprobe.c: At top level:
   arch/riscv/kernel/vdso_cfi/hwprobe.c:100:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:104:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:104:5: error: conflicting types for '__vdso_riscv_hwprobe'; have 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, long unsigned int,  long unsigned int,  long unsigned int *, unsigned int)'}
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c:100:5: note: previous declaration of '__vdso_riscv_hwprobe' with type 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, long unsigned int,  long unsigned int,  long unsigned int *, unsigned int)'}
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso_cfi/hwprobe.c: In function '__vdso_riscv_hwprobe':
   arch/riscv/kernel/vdso_cfi/hwprobe.c:108:21: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
     108 |         if (flags & RISCV_HWPROBE_WHICH_CPUS)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:109:44: error: passing argument 1 of 'riscv_vdso_get_cpus' from incompatible pointer type [-Wincompatible-pointer-types]
     109 |                 return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
         |                                            ^~~~~
         |                                            |
         |                                            struct riscv_hwprobe *
   arch/riscv/kernel/vdso_cfi/hwprobe.c:49:54: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/riscv/kernel/vdso_cfi/hwprobe.c:112:38: error: passing argument 1 of 'riscv_vdso_get_values' from incompatible pointer type [-Wincompatible-pointer-types]
     112 |         return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
         |                                      ^~~~~
         |                                      |
         |                                      struct riscv_hwprobe *
   arch/riscv/kernel/vdso_cfi/hwprobe.c:15:56: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RISCV_SBI
   Depends on [n]: !RISCV_M_MODE [=y]
   Selected by [y]:
   - RISCV_USER_CFI [=y] && 64BIT [=y] && RISCV_ALTERNATIVE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
