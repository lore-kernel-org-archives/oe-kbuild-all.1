Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40691581F8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720988; cv=none; b=Tth8q3Og8aguLUA1EtBnM8/b8spnN/5Y1xm+7ws4aLFOraqX787kQUn6IYQwBFiG/iaZze47S+jBfLjkndvMmYoRjt0sliKHTUIPV0tBljM6VkmyntCuBN7hXauJETcCkc3xB2q1kz7WgaxWR0K9peLnrFcEuVQDac4fsCImxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720988; c=relaxed/simple;
	bh=ZNrupPILGC9C46x9sKjJ6mh7dmj5FIPdsrJCFQi11UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIFX+GI0Bcm4eq8z1M/OQ+tVMYHF/JyqszIBNGExe3qu4lzg9B0wLTGEc/fd6yzM9XZW/Ccq353L4uH/Ib/56e2afNlLyYedZHhA8JJog7TXaoq1NPg8ZTFIT6IVmQW9Hl15HtHhCQJwOyWxPNwJ32pgRoz+WoLbkY5pguZ8b/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEGKFiWE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEGKFiWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720987; x=1765256987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNrupPILGC9C46x9sKjJ6mh7dmj5FIPdsrJCFQi11UM=;
  b=PEGKFiWEIjLzEYN5moFlHA6bNDV5rtOfQn5CCMObBiJLiTkvFJyTnaXi
   vG6Fx0zfjfj+zmFpgHeYtTuw1yUiFOa2Z39vwTkG2gX98LMUH6SMjIgwN
   nBMHTKx1ZSUrN0ptNO3Wkim3a1lsX9iNrtFyors5efq5/exaKc9yjb5JO
   3/mkMDkU9Lwa9QASGWuw5aQ3ZPZNGyG0s5M0pBPfUWKXDh/6Xn9YJtowP
   OS54MEL8T1KWgZyphBbK8TWQnkLKcHEp0Bars452hmT1c7ERWQ15HgGYn
   IMTHpoYaNvxjn1EdWNU6J4P6qKVbusWHGPLPi24pKi8cmvNxKqjF9Zhss
   g==;
X-CSE-ConnectionGUID: pObfG/ceRPqqGBIaJh0VpQ==
X-CSE-MsgGUID: az0BaUXmQayk0t0L1wAa5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45383757"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45383757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:46 -0800
X-CSE-ConnectionGUID: 9lWnx3CEQ2W+Z/3S3GIfCg==
X-CSE-MsgGUID: 1AOSv+4zQ0qESYIKMgSd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95053901"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yN-1W;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1610/1610] include/linux/mmzone.h:1788:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202412091235.rrPD4MTM-lkp@intel.com>
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
head:   31c4fffa86e17e8a946c944e91e7412db7f8427b
commit: c93eb12529e21dbb59796132f4fdf75fad4eddaf [1610/1610] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-001-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091235.rrPD4MTM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091235.rrPD4MTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091235.rrPD4MTM-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   arch/loongarch/kernel/asm-offsets.c:283:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     283 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=2238233371
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=2238233371
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2238233371
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2238233371
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
