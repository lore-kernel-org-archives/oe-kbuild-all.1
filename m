Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E592D8773
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783534573; cv=none; b=OqaznI3c6NcTQ1T0Hb0msm+Gc6UHiO+PjhdcSnau51wHdN6r/2z/pbdLhKsX62A0LxrlfsIlqthGT0BP54qHepRvihYh21Y/cwxYrpSLaoKTtP0SCoxv3OLGPCkfd16/IiDvRvcGTR00KpiXbPC+Q+RxTQrGRca1V/h7Lh9qw5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783534573; c=relaxed/simple;
	bh=bJYViAWDqqxfDxalW40czCNOQBu/06EEW6/8snQ5ro4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hzq9WUUQueU9VO5pgAYgZgzdV4f/Xi7OMZN6JrGBj/Dh5lZkSVcudJo2IjCL1fLeNAT4uW0mHy2RN0fxmvX7TIv9NleT9rxuVa0+/721iI+3COKtQ5VVH+l6tI/dBlU5V7Gtkr37j8cDcqqNYxZeg8a3d+cxZ81c/+LoHx/teT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjd6htcg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjd6htcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783534571; x=1815070571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJYViAWDqqxfDxalW40czCNOQBu/06EEW6/8snQ5ro4=;
  b=Hjd6htcgWgYTrD465WB1nRr488/AhPWddUkg5pDG/sA6rGc2P/xlrxBW
   CFCBxFQvjOyICHz4SxPNeKT9qNEV1Bj8weZLoSCnOOZ4a4qQFnc+M4sO4
   j7J+u3j2UFPAzfYMrw09UpUau/tKVimXWsAnmM7n9X0VymCNLHP46JqED
   6IQMOG/wNg9VLY8U05nS8q+T8IQAjwLdOC+HuYpMY1Myus5VUaU4xrSEb
   Ig22HHfJiVydQwGXLSfw+ynuBYJbJwT601HsM/tz/KiQCi6zgMfQRZT6s
   uz+fTQK2gKDG6/HhaQdzBLP8WH+hDJmzKGNd/TmI8yRuogqsptlys4Epv
   g==;
X-CSE-ConnectionGUID: YFy5y9YuSKG55mI8iCyj3w==
X-CSE-MsgGUID: AMKcZjTwRMyMa+r4NPO7Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107003303"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="107003303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 11:16:11 -0700
X-CSE-ConnectionGUID: UeA1cpH4Sb+3fo2fC0oqHg==
X-CSE-MsgGUID: imENJcoBSRS3t9GAffH8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="259259657"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2026 11:16:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whWoZ-00000000Git-0Wde;
	Wed, 08 Jul 2026 18:16:07 +0000
Date: Thu, 09 Jul 2026 02:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sysfs 2/2]
 arch/riscv/kernel/vdso/vgettimeofday.c:15:9: error: implicit declaration of
 function '__cvdso_clock_gettime'; did you mean '__vdso_clock_gettime'?
Message-ID: <202607090258.iSAUYlO1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sysfs
head:   b186f35d4f4cdb6063d48192faa54c8ca0773543
commit: b186f35d4f4cdb6063d48192faa54c8ca0773543 [2/2] vDSO, kbuild: Provide debug variants of vDSO at runtime
config: riscv-randconfig-002-20260709 (https://download.01.org/0day-ci/archive/20260709/202607090258.iSAUYlO1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090258.iSAUYlO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090258.iSAUYlO1-lkp@intel.com/

All errors (new ones prefixed by >>):

      55 |  struct riscv_hwprobe *end = pairs + pair_count;
         |                                    ^
   arch/riscv/kernel/vdso/hwprobe.c:71:29: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
      71 |  if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:71:29: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/vdso/hwprobe.c:71:61: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
      71 |  if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
         |                                                             ^~
   arch/riscv/kernel/vdso/hwprobe.c:72:24: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Werror=incompatible-pointer-types]
      72 |   return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
         |                        ^~~~~
         |                        |
         |                        struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:75:35: error: invalid use of undefined type 'struct riscv_hwprobe'
      75 |   if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                   ^~
   arch/riscv/kernel/vdso/hwprobe.c:76:11: error: variable 't' has initializer but incomplete type
      76 |    struct riscv_hwprobe t = {
         |           ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:77:6: error: 'struct riscv_hwprobe' has no member named 'key'
      77 |     .key = p->key,
         |      ^~~
   arch/riscv/kernel/vdso/hwprobe.c:77:13: error: invalid use of undefined type 'struct riscv_hwprobe'
      77 |     .key = p->key,
         |             ^~
   arch/riscv/kernel/vdso/hwprobe.c:77:12: warning: excess elements in struct initializer
      77 |     .key = p->key,
         |            ^
   arch/riscv/kernel/vdso/hwprobe.c:77:12: note: (near initialization for 't')
   arch/riscv/kernel/vdso/hwprobe.c:78:6: error: 'struct riscv_hwprobe' has no member named 'value'
      78 |     .value = avd->all_cpu_hwprobe_values[p->key],
         |      ^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:78:17: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
      78 |     .value = avd->all_cpu_hwprobe_values[p->key],
         |                 ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:43: error: invalid use of undefined type 'struct riscv_hwprobe'
      78 |     .value = avd->all_cpu_hwprobe_values[p->key],
         |                                           ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:14: warning: excess elements in struct initializer
      78 |     .value = avd->all_cpu_hwprobe_values[p->key],
         |              ^~~
   arch/riscv/kernel/vdso/hwprobe.c:78:14: note: (near initialization for 't')
   arch/riscv/kernel/vdso/hwprobe.c:76:25: error: storage size of 't' isn't known
      76 |    struct riscv_hwprobe t = {
         |                         ^
   arch/riscv/kernel/vdso/hwprobe.c:81:9: error: implicit declaration of function 'riscv_hwprobe_pair_cmp' [-Werror=implicit-function-declaration]
      81 |    if (!riscv_hwprobe_pair_cmp(&t, p))
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:76:25: warning: unused variable 't' [-Wunused-variable]
      76 |    struct riscv_hwprobe t = {
         |                         ^
   arch/riscv/kernel/vdso/hwprobe.c:85:5: error: invalid use of undefined type 'struct riscv_hwprobe'
      85 |    p->key = -1;
         |     ^~
   arch/riscv/kernel/vdso/hwprobe.c:86:5: error: invalid use of undefined type 'struct riscv_hwprobe'
      86 |    p->value = 0;
         |     ^~
   arch/riscv/kernel/vdso/hwprobe.c:88:4: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
      88 |   p++;
         |    ^~
   arch/riscv/kernel/vdso/hwprobe.c: At top level:
   arch/riscv/kernel/vdso/hwprobe.c:100:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:104:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:104:5: error: conflicting types for '__vdso_riscv_hwprobe'
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:100:5: note: previous declaration of '__vdso_riscv_hwprobe' was here
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function '__vdso_riscv_hwprobe':
   arch/riscv/kernel/vdso/hwprobe.c:108:14: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
     108 |  if (flags & RISCV_HWPROBE_WHICH_CPUS)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:109:30: error: passing argument 1 of 'riscv_vdso_get_cpus' from incompatible pointer type [-Werror=incompatible-pointer-types]
     109 |   return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
         |                              ^~~~~
         |                              |
         |                              struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:49:54: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:112:31: error: passing argument 1 of 'riscv_vdso_get_values' from incompatible pointer type [-Werror=incompatible-pointer-types]
     112 |  return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
         |                               ^~~~~
         |                               |
         |                               struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:15:56: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:289: arch/riscv/kernel/vdso/hwprobe.o] Error 1 shuffle=275821313
   arch/riscv/kernel/vdso/vgettimeofday.c: In function '__vdso_clock_gettime':
>> arch/riscv/kernel/vdso/vgettimeofday.c:15:9: error: implicit declaration of function '__cvdso_clock_gettime'; did you mean '__vdso_clock_gettime'? [-Werror=implicit-function-declaration]
      15 |  return __cvdso_clock_gettime(clock, ts);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         __vdso_clock_gettime
   arch/riscv/kernel/vdso/vgettimeofday.c: In function '__vdso_gettimeofday':
>> arch/riscv/kernel/vdso/vgettimeofday.c:20:9: error: implicit declaration of function '__cvdso_gettimeofday'; did you mean '__vdso_gettimeofday'? [-Werror=implicit-function-declaration]
      20 |  return __cvdso_gettimeofday(tv, tz);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         __vdso_gettimeofday
   arch/riscv/kernel/vdso/vgettimeofday.c: In function '__vdso_clock_getres':
>> arch/riscv/kernel/vdso/vgettimeofday.c:25:9: error: implicit declaration of function '__cvdso_clock_getres'; did you mean '__vdso_clock_getres'? [-Werror=implicit-function-declaration]
      25 |  return __cvdso_clock_getres(clock_id, res);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         __vdso_clock_getres
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:289: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1 shuffle=275821313
   make[3]: Target 'arch/riscv/kernel/vdso/vdso.so.dbg' not remade because of errors.
   make[2]: *** [Makefile:1551: arch/riscv/kernel/vdso/vdso.so.dbg] Error 2 shuffle=275821313
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=275821313
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=275821313
   make: Target 'prepare' not remade because of errors.


vim +15 arch/riscv/kernel/vdso/vgettimeofday.c

ad5d1122b82fbd Vincent Chen 2020-06-09  12  
ad5d1122b82fbd Vincent Chen 2020-06-09  13  int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
ad5d1122b82fbd Vincent Chen 2020-06-09  14  {
ad5d1122b82fbd Vincent Chen 2020-06-09 @15  	return __cvdso_clock_gettime(clock, ts);
ad5d1122b82fbd Vincent Chen 2020-06-09  16  }
ad5d1122b82fbd Vincent Chen 2020-06-09  17  
ad5d1122b82fbd Vincent Chen 2020-06-09  18  int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
ad5d1122b82fbd Vincent Chen 2020-06-09  19  {
ad5d1122b82fbd Vincent Chen 2020-06-09 @20  	return __cvdso_gettimeofday(tv, tz);
ad5d1122b82fbd Vincent Chen 2020-06-09  21  }
ad5d1122b82fbd Vincent Chen 2020-06-09  22  
ad5d1122b82fbd Vincent Chen 2020-06-09  23  int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
ad5d1122b82fbd Vincent Chen 2020-06-09  24  {
ad5d1122b82fbd Vincent Chen 2020-06-09 @25  	return __cvdso_clock_getres(clock_id, res);

:::::: The code at line 15 was first introduced by commit
:::::: ad5d1122b82fbd6a816d1b9d26ee01a6dbc2d757 riscv: use vDSO common flow to reduce the latency of the time-related functions

:::::: TO: Vincent Chen <vincent.chen@sifive.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
