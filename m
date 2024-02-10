Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12D3C30
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 04:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707540547; cv=none; b=guksyxKrGMwEvzbrGmJOor9q+cb2FCAA8PsnQ4RdtatNFlt17V5Jcm/jAAkVUY3zE0sBHdNZR0N/rhYBuo16j3yrualrGiv1nNi3L0jVMBbB8uHjA5KV1yFzDE6pS5jlV2LUY2vrkIop6IzZLwF83/9NlNMhCS1vl2Hy1Oj6vvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707540547; c=relaxed/simple;
	bh=Z0vm92kivIefrLmwWaR87y0W36mrt8Cv2eUigvqT1XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Izn06SCqGCSC8rxrxqKfRkaPTH4i7ofEViGsl9He1+kjv1bGlIE8Dl9S3VG/EznmEJrlWNzQ6uQm/TVpgt7emGap5+dzLtUZx36cEHFLTbX/SIqLRCVZTDvjFuUXr8xIPeGYOB4EiaF5t8XobXMd7I3L2/joj0cQc0JWER1hEp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fF910Z/1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fF910Z/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707540546; x=1739076546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0vm92kivIefrLmwWaR87y0W36mrt8Cv2eUigvqT1XQ=;
  b=fF910Z/112uh+EqdnB9NG+0hteZTuhplV9CamJMT/v+pCiEItN7eQiAF
   /bKAwpwf1ICZT0518tj4o7SE95ZyKCeZO/v6XB5ngTqdgxmGDNewjZu63
   ZR0WffkPnrmzmfRrGxJHJ+CopVupMtnuWR/Al3S73xlugbZX3MfzIJ0GE
   vuwbeOorNHaIpDrs2C2rQOqEPTJjv5tQtwgp47EyPsU9YzFzH78iAl9hl
   3W9cOaP7jV928JIgZCwCHzO5Aj3Xs4ByAAcwF8+Jpi/Z6NSX6dojYBLsL
   O6VxJmQaLm7S27ByC4d1WUrnxzhxVZj/Y92pb87Jv6QMFBp+K+06zQO1I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1861338"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1861338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 20:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="6860559"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2024 20:49:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYfIT-0005M4-1S;
	Sat, 10 Feb 2024 04:49:01 +0000
Date: Sat, 10 Feb 2024 12:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/dma-engine-constify-and-improvements 6/12]
 include/linux/preempt.h:55: warning: "SOFTIRQ_DISABLE_OFFSET" redefined
Message-ID: <202402101222.gkKsMYLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/dma-engine-constify-and-improvements
head:   2dcf4f0881ca216e8bb9531caf90d8e28963eb86
commit: 0cee571759f7b4ce88daf5ffe2c72ac65ddf7785 [6/12] serial: amba: use typedef for dma_filter_fn
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20240210/202402101222.gkKsMYLw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101222.gkKsMYLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101222.gkKsMYLw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler_attributes.h:91:20: error: missing binary operator before token "("
      91 | #if __has_attribute(__copy__)
         |                    ^
   include/linux/compiler_attributes.h:104:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     104 | #if __has_attribute(__counted_by__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:104:20: error: missing binary operator before token "("
     104 | #if __has_attribute(__counted_by__)
         |                    ^
   include/linux/compiler_attributes.h:116:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     116 | #if __has_attribute(__diagnose_as_builtin__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:116:20: error: missing binary operator before token "("
     116 | #if __has_attribute(__diagnose_as_builtin__)
         |                    ^
   include/linux/compiler_attributes.h:139:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     139 | #if __has_attribute(__designated_init__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:139:20: error: missing binary operator before token "("
     139 | #if __has_attribute(__designated_init__)
         |                    ^
   include/linux/compiler_attributes.h:150:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     150 | #if __has_attribute(__error__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:150:20: error: missing binary operator before token "("
     150 | #if __has_attribute(__error__)
         |                    ^
   include/linux/compiler_attributes.h:161:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     161 | #if __has_attribute(__externally_visible__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:161:20: error: missing binary operator before token "("
     161 | #if __has_attribute(__externally_visible__)
         |                    ^
   include/linux/compiler_attributes.h:198:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     198 | #if __has_attribute(__no_caller_saved_registers__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:198:20: error: missing binary operator before token "("
     198 | #if __has_attribute(__no_caller_saved_registers__)
         |                    ^
   include/linux/compiler_attributes.h:209:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     209 | #if __has_attribute(__noclone__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:209:20: error: missing binary operator before token "("
     209 | #if __has_attribute(__noclone__)
         |                    ^
   include/linux/compiler_attributes.h:226:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     226 | #if __has_attribute(__fallthrough__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:226:20: error: missing binary operator before token "("
     226 | #if __has_attribute(__fallthrough__)
         |                    ^
   include/linux/compiler_attributes.h:252:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     252 | #if __has_attribute(__nonstring__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:252:20: error: missing binary operator before token "("
     252 | #if __has_attribute(__nonstring__)
         |                    ^
   include/linux/compiler_attributes.h:264:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     264 | #if __has_attribute(__no_profile_instrument_function__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:264:20: error: missing binary operator before token "("
     264 | #if __has_attribute(__no_profile_instrument_function__)
         |                    ^
   include/linux/compiler_attributes.h:283:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     283 | #if __has_attribute(__no_stack_protector__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:283:20: error: missing binary operator before token "("
     283 | #if __has_attribute(__no_stack_protector__)
         |                    ^
   include/linux/compiler_attributes.h:294:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     294 | #if __has_attribute(__overloadable__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:294:20: error: missing binary operator before token "("
     294 | #if __has_attribute(__overloadable__)
         |                    ^
   include/linux/compiler_attributes.h:313:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     313 | #if __has_attribute(__pass_dynamic_object_size__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:20: error: missing binary operator before token "("
     313 | #if __has_attribute(__pass_dynamic_object_size__)
         |                    ^
   include/linux/compiler_attributes.h:318:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     318 | #if __has_attribute(__pass_object_size__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:318:20: error: missing binary operator before token "("
     318 | #if __has_attribute(__pass_object_size__)
         |                    ^
   include/linux/compiler_attributes.h:363:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     363 | #if __has_attribute(__warning__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:363:20: error: missing binary operator before token "("
     363 | #if __has_attribute(__warning__)
         |                    ^
   include/linux/compiler_attributes.h:380:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     380 | #if __has_attribute(disable_sanitizer_instrumentation)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:380:20: error: missing binary operator before token "("
     380 | #if __has_attribute(disable_sanitizer_instrumentation)
         |                    ^
   In file included from include/linux/sched.h:15:
>> include/linux/preempt.h:55: warning: "SOFTIRQ_DISABLE_OFFSET" redefined
      55 | #define SOFTIRQ_DISABLE_OFFSET  (2 * SOFTIRQ_OFFSET)
         | 
   In file included from arch/arm/include/asm/asm-offsets.h:1,
                    from arch/arm/include/asm/assembler.h:22,
                    from arch/arm/kernel/head.S:15:
   ./include/generated/asm-offsets.h:21: note: this is the location of the previous definition
      21 | #define SOFTIRQ_DISABLE_OFFSET 512 /* SOFTIRQ_DISABLE_OFFSET */
         | 
   In file included from include/linux/kernel.h:15,
                    from include/linux/cpumask.h:11,
                    from include/linux/sched.h:16:
   include/linux/align.h:8: warning: "ALIGN" redefined
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         | 
   In file included from arch/arm/kernel/head.S:11:
   include/linux/linkage.h:103: note: this is the location of the previous definition
     103 | #define ALIGN __ALIGN
         | 
   In file included from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16:
>> include/linux/gfp.h:95:25: warning: "ZONES_SHIFT" is not defined, evaluates to 0 [-Wundef]
      95 | #define GFP_ZONES_SHIFT ZONES_SHIFT
         |                         ^~~~~~~~~~~
   include/linux/gfp.h:98:10: note: in expansion of macro 'GFP_ZONES_SHIFT'
      98 | #if 16 * GFP_ZONES_SHIFT > BITS_PER_LONG
         |          ^~~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:8,
                    from include/linux/dmaengine.h:12:
>> include/linux/mm.h:268: warning: "VM_EXEC" redefined
     268 | #define VM_EXEC         0x00000004
         | 
   ./include/generated/asm-offsets.h:51: note: this is the location of the previous definition
      51 | #define VM_EXEC 4 /* VM_EXEC */
         | 
   In file included from include/linux/scatterlist.h:9:
>> arch/arm/include/asm/io.h:159: warning: "IOMEM" redefined
     159 | #define IOMEM(x)        ((void __force __iomem *)(x))
         | 
   arch/arm/include/asm/assembler.h:27: note: this is the location of the previous definition
      27 | #define IOMEM(x)        (x)
         | 


vim +/SOFTIRQ_DISABLE_OFFSET +55 include/linux/preempt.h

92cf211874e954 Frederic Weisbecker 2015-05-12  54  
92cf211874e954 Frederic Weisbecker 2015-05-12 @55  #define SOFTIRQ_DISABLE_OFFSET	(2 * SOFTIRQ_OFFSET)
92cf211874e954 Frederic Weisbecker 2015-05-12  56  

:::::: The code at line 55 was first introduced by commit
:::::: 92cf211874e954027b8e91cc9a15485a50b58d6b sched/preempt: Merge preempt_mask.h into preempt.h

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
