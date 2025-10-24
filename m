Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225817C21C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 00:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761267502; cv=none; b=bK4KkQjWkhZ7/iHhfcPRrReHkiEW8+0M5A6P00qcIm7PU34+zR3CKJDgQ4v9GGapnGObB1ANZkbhAd2ClA39bkO0RmI6XnK6WWEpbWUxevd+B4kFpKuFoxcjKeJKbqcGcg9eEeZgKI5fU41BVDVICFdiQuNzBRcI2Kfi1MkeK6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761267502; c=relaxed/simple;
	bh=HNB9YU4g0tsB5ZkpUKb0k8Kume4MVfIFGvuhqIDQyFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmXkKDBY+q7i59MLQZWisflmZhsFTsRxWuRK2DR5lNzc0hMCzu7mmyk9thx1Sl3w8ZjbhpGZF0Oygf/YJswDfm5spxzDjYONef6txdjPAeJCgDp2fC63AmhqAf9dk9rrkCFHtQwkOumZ+YrzL4XjbJNPmSdfZ8tAT3bt7gRF+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQKngkpc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQKngkpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761267500; x=1792803500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNB9YU4g0tsB5ZkpUKb0k8Kume4MVfIFGvuhqIDQyFw=;
  b=QQKngkpci71JUgCG+wtWSX/krSUs3jO/0vs3hDBW9gEPwmwWx0O39vYO
   sqBpLiJp4iuUIbV2fw38K4hJfecIYiQbEG3JoREVV5/SFeRpnr3cWf81V
   SY6HjaEsSzAgX8u7+SIHvXgtMionxuC5fYF1f458cNkCUFvNmLE53dgxG
   lDd+wE9dms66ikt5zJ8tS5vV0z0VGaX3/4Lq3tkatJf8sE1Df4PQVTDYZ
   +3XZjRyqjZe9H8fuRGNLS0hTnmk+R8bAU+5j5i3/pHBwyt9kQQL4syokX
   0sOcJJ3EITNlsGlKK7Eb5woVl6XBvGFmlx2O61gcipRcibIOLG3iliA6+
   w==;
X-CSE-ConnectionGUID: PPV59g6KTXi/CO/sXQkalQ==
X-CSE-MsgGUID: 3R1uCU6FS721i5+1dr+skQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63153058"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63153058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 17:58:19 -0700
X-CSE-ConnectionGUID: LCRbWy63Q/CqaYdc7CFPKA==
X-CSE-MsgGUID: O1768s8HSaizwLavi03RTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184783644"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 17:58:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC68G-000E21-2k;
	Fri, 24 Oct 2025 00:58:16 +0000
Date: Fri, 24 Oct 2025 08:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-ucode-staging-ANBZ26616 6/6]
 include/linux/find.h:586:69: warning: left-hand operand of comma expression
 has no effect
Message-ID: <202510240805.llrYtVLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-ucode-staging-ANBZ26616
head:   100ed01fa824506a22d399f00670e0e0fab77243
commit: d636b67fff5ff4d0ef14ea9da9426ab76f6d57b6 [6/6] x86/microcode/intel: Establish staging control logic
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251024/202510240805.llrYtVLK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240805.llrYtVLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240805.llrYtVLK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from arch/x86/kernel/cpu/microcode/intel.c:15:
   arch/x86/kernel/cpu/microcode/intel.c: In function 'stage_microcode':
   arch/x86/kernel/cpu/microcode/intel.c:331:27: error: 'cpu_primary_thread_mask' undeclared (first use in this function)
     331 |         for_each_cpu(cpu, cpu_primary_thread_mask) {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:299:31: note: in expansion of macro 'cpumask_bits'
     299 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:331:9: note: in expansion of macro 'for_each_cpu'
     331 |         for_each_cpu(cpu, cpu_primary_thread_mask) {
         |         ^~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:331:27: note: each undeclared identifier is reported only once for each function it appears in
     331 |         for_each_cpu(cpu, cpu_primary_thread_mask) {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:299:31: note: in expansion of macro 'cpumask_bits'
     299 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:331:9: note: in expansion of macro 'for_each_cpu'
     331 |         for_each_cpu(cpu, cpu_primary_thread_mask) {
         |         ^~~~~~~~~~~~
>> include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:299:9: note: in expansion of macro 'for_each_set_bit'
     299 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:331:9: note: in expansion of macro 'for_each_cpu'
     331 |         for_each_cpu(cpu, cpu_primary_thread_mask) {
         |         ^~~~~~~~~~~~


vim +586 include/linux/find.h

6b8ecb84f8f640 include/asm-generic/bitops/find.h Yury Norov 2021-08-14  584  
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  585  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov 2022-09-19 @586  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  587  

:::::: The code at line 586 was first introduced by commit
:::::: fdae96a3fc7f70eb8ff9619550d7fa604719626a lib/find: optimize for_each() macros

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
