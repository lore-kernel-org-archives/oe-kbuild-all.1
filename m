Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC14501E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 20:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720817873; cv=none; b=VvuRECTYIrVuD0XaFrnUsPnxaapzbXuaNqISlIrwysE4a5uL/Te17uxjtLvobKUcy4gEskjzQjD5I+F/8URansjn9gq+YPR+E81XEjHLsO+3vGyNNoeF+DWC5/mRkfWejGuzUd0+kMaZOgqOycgYn8MikfmR2pJe6hdXOlcrRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720817873; c=relaxed/simple;
	bh=2fgGTjsg+sCv90GdFMmh3uvbdd6lOq9+d8XmoGDJjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwPM7JT2Hbqy6mhF3HYKe0E+6VWEzhdwuGzALf7zeWVSvF3JzSmbh8FVJxNFawIO90udX+5Qs0RbMMN6T5dklxwMzW2/NvqV6ZZnA/EoMrrD2CzqafUmtJ1xmTHx4b+6hEZNW2rhi/NPrxWXdOAGKZnVaz7Nw7JOqpzCbh3b20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZNX2nJr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZNX2nJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720817871; x=1752353871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fgGTjsg+sCv90GdFMmh3uvbdd6lOq9+d8XmoGDJjAc=;
  b=BZNX2nJrqv+XiI0Yqx5g9qymJ+aQYpv4PhEVIgpXt27vaq0+az6v8/UW
   fgNd5JGzeIWxi80G1oR35QztdE2cwufci042W/h47GS+X0RzkNeERs3Bp
   b35QjFfZjDUhWhd3xVUPC69E2V+iFFYTUFUY2wq22mAgSIcQtVyjHd7E3
   fxlwLREEGQlNQgpsjJ4bhYFusjECpM58+iQOe0sqP9IwoD5c3FFf2ImG4
   keDIh1AF/IDQSwcnahJZJXRqZ3SFxMaFrJnUZgWi2cxq9Ki1ZW0Bt9vZU
   VY0B/4zovu3rO5h/uh3c+AkY41crFgDCUSAPNmY+FBFWoH+Prj1sgKjS3
   A==;
X-CSE-ConnectionGUID: 6tWMCLyASkS7QZS1oWWOuw==
X-CSE-MsgGUID: mw+pod4NReuUgovxcWDDHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="40808586"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="40808586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 13:57:48 -0700
X-CSE-ConnectionGUID: k9f0uvLgRUq3Z/ioAOshyw==
X-CSE-MsgGUID: 5cuxf0gDTlmiHulC3Bjjug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="53594248"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2024 13:57:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSNKr-000bGu-0A;
	Fri, 12 Jul 2024 20:57:45 +0000
Date: Sat, 13 Jul 2024 04:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3892/10681] include/linux/mmzone.h:1788:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202407130439.z4HZgaFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   10bfbd53c8aa4c81829876b20e654c4e7c4e7aa7
commit: c93eb12529e21dbb59796132f4fdf75fad4eddaf [3892/10681] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130439.z4HZgaFv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130439.z4HZgaFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130439.z4HZgaFv-lkp@intel.com/

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
   arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=784060646
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=784060646
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=784060646
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=784060646
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
