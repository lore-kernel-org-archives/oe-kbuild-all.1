Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C481E49F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728440009; cv=none; b=J0q5Oo72OH9SGzbNi5ph4IjMMr5ONhI3MMCB5y+03+CuJCTgd3ATUHytZIFL+EXHGWESQu9SFYNNwXafbXUVyDIe8w65DJm8W7em8X4KCTJcSmt23Iw+5kLOwZKBxpiwUjiPcAFw6+HceRfy/UuohRScbKAHvIygtk8MGy8jo2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728440009; c=relaxed/simple;
	bh=vQMulf4awjipnv2OcgKktvAJdKcER+pOWOanNdC+OBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODVS8AY9iBZNFZhlDdlzbuzi7HtvlNs5kWToZjb2zJkSGTZQdlxt4ADZ5xeugoEETAqNG3uV8uIAdtJQBbgmQm08jg7R1BrNkL20Ouuw4Xk1BzVqMnk9MbEFii8iMf1TgCW9gPuBmBTNLuVl0E28M2XsVj6dJwlh9hcEEQ8mfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHj835vu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHj835vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728440007; x=1759976007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQMulf4awjipnv2OcgKktvAJdKcER+pOWOanNdC+OBM=;
  b=bHj835vupUVngnRqg3nUTkpDqpT2jq44cuP9RV1WbbE/UDvsddIHrg8x
   Ld7tsUuN5WSYtxjDWH66Rtwm8K9xxbna1SFtGUoqLzwURSE5kLdwNTeXq
   16ECWvxTTICtHBD/a6xT5o00qlBSQuFFV52aX+a94NXMZ8Psi13BTCvxx
   NbXdtItFwxGtqc1mlN2YeEFUZWFmoIOJkXqm4n0QVmaWjkuYQZqdYW9Em
   nBdZJG3/bSGZ+nxHQGj9M+kvKihGDJKf0UqBmBuhF/YTN9PzcCpx9YLGK
   xWSPRek1YpW6mbdYWlhpyCbp4gqG8W/Ott3bh9TGhZisqm3fzIE0kT9oi
   w==;
X-CSE-ConnectionGUID: ZClFFSW/Q+S6a39Of/czyQ==
X-CSE-MsgGUID: vCFDmq8RSBOhYUA8135ZiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38299507"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="38299507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 19:13:22 -0700
X-CSE-ConnectionGUID: XYMLABGZR8qvGaL3i9CcUQ==
X-CSE-MsgGUID: 9FBjf7aLRJydvzDHixGfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="80884919"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 19:13:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syMCU-0008bk-2H;
	Wed, 09 Oct 2024 02:13:18 +0000
Date: Wed, 9 Oct 2024 10:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3892/14286] include/linux/mmzone.h:1788:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202410091038.th2Iv8Hi-lkp@intel.com>
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
head:   fb512ada4da1a8aefba17392d87452a37796a0f2
commit: c93eb12529e21dbb59796132f4fdf75fad4eddaf [3892/14286] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-002-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091038.th2Iv8Hi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091038.th2Iv8Hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091038.th2Iv8Hi-lkp@intel.com/

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
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=526995723
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=526995723
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=526995723
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=526995723
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
