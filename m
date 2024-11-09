Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFBBC8FF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731161990; cv=none; b=jFgH9NNEY2hUcQuCz3MIs2UyRvDA4JMkAYdo7kvj8xOJnu1hJTNMve8M7+KMEbqgMBl9fwF1F9R+zg2fKsTS6Rgp2RGG39VRIX6p3Am6ym3buenlLH3QIVJy+6DghfyDcrZSJPQyTLQzxAHffbflDyFvy7CIX0+lrnkixs29LL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731161990; c=relaxed/simple;
	bh=KzAMOBMPqWFkSe7wXFQWsv7FyIi6jNtNbD0utuSCrJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=opC22EN+pu/KUXG3WpvL8RQXXByaltgGGXpaI3QGqDJIE4XN0R7zunjHBhYOdcYTVimXYJwnwqya4rqEDI29QWGwrzNvMy87AEgk0pgTgQHZKLvB0c2i2eM/rLGAElCoUSov7UV5NeUKDI1Dml/qz6O55AXffnp+y0N0c94WI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAkuzwjy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAkuzwjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731161988; x=1762697988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KzAMOBMPqWFkSe7wXFQWsv7FyIi6jNtNbD0utuSCrJk=;
  b=RAkuzwjyoAn0gAIKjwzak4+icC1o5ravydHcnw4Ftd5qnXbRDftzi2eR
   7wjiW3Kd6YMLMvlfLzUeTkiZThnN3Zw1eAnicJzkrdk2xb+IR9jArtiHt
   Hd+V7WfVoqpeMkSF6rZxn932SrWPEurwQiT+kTA2xHgD+0XT7WWn6DXha
   gbJJ+FYVIVa8mXXpjfcch2qEYfyaE+7EKiEkXkY8J6J05gJ8ghCepqAra
   mcTTO6ZMJkfuQGVmIJRFyQBTI6w+6CcYoSgsuSR4V9evD8EyZbXIkzNGN
   KPcLw37acy8ATosyQxioUUNm61vC1tPXZvUJNZQxWrq7S33ax8IDf7p1r
   Q==;
X-CSE-ConnectionGUID: hrzah58NT1mIEerGZsu+vg==
X-CSE-MsgGUID: WYv1VoY5TIG7hRxb0j5A0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31188605"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31188605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 06:19:47 -0800
X-CSE-ConnectionGUID: e3En9C4FTHWOjlqwJQ52ZQ==
X-CSE-MsgGUID: lHrKfx66Qyes2WNweDoU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="90939914"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Nov 2024 06:19:46 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9mJT-000sP0-2V;
	Sat, 09 Nov 2024 14:19:43 +0000
Date: Sat, 9 Nov 2024 22:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1438/1438] include/linux/mmzone.h:1788:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202411092211.P2HT5L3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhangtianyang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36c1a71a1d2064b5fe3b05c035cc0104992c8c73
commit: c93eb12529e21dbb59796132f4fdf75fad4eddaf [1438/1438] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-002-20241109 (https://download.01.org/0day-ci/archive/20241109/202411092211.P2HT5L3S-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411092211.P2HT5L3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411092211.P2HT5L3S-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/loongarch/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:1788:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
    1788 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
         |  ^~~~~
   arch/loongarch/kernel/asm-offsets.c:18:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      18 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:65:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      65 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:80:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      80 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:96:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      96 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:132:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     132 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:173:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     173 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:183:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     183 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:215:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     215 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:223:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     223 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:261:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     261 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=1449408134
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=1449408134
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1449408134
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1449408134
   make: Target 'prepare' not remade because of errors.


vim +1788 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft     2005-06-23  1783  
835c134ec4dd75 Mel Gorman         2007-10-16  1784  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman         2007-10-16  1785  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman         2007-10-16  1786  
23baf831a32c04 Kirill A. Shutemov 2023-03-15  1787  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
d41dee369bff3b Andy Whitcroft     2005-06-23 @1788  #error Allocator MAX_ORDER exceeds SECTION_SIZE
d41dee369bff3b Andy Whitcroft     2005-06-23  1789  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1790  

:::::: The code at line 1788 was first introduced by commit
:::::: d41dee369bff3b9dcb6328d4d822926c28cc2594 [PATCH] sparsemem memory model

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
