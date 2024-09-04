Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1763C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 01:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725413029; cv=none; b=PiJ5to/cokCCs22kIoMs1o3/vcQ/Q95vkpnoX36UEacBWEOGVYlUgT0geplyhHxg6pSlDvcbuhuwmSR6NT2xbeYJoJgV+DZi97bFqQED2RYI2+bTFZVCM8o99Hb0X3BuFy731Quh37czCoAk3PjYexkZH+hL1kXNf8KoB9dfgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725413029; c=relaxed/simple;
	bh=lUuuxNNWrlYNSJ527a0KA/c54PV+R31myx1brEupaX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TP+T2AAZZrsbXcEmtKh0+VD39OOiRMlbKETbl8ReuwH1FHXYp4tFp9PHbeMBXUnrSPd/IX7g8i/ecHPsGIz5j5zywhHlamBBxmVgSUaWXjWEGRxI78F6CZ59jpy7epIOZtUen9kLjnWqMNW0fKBz6qci8hXH37yePiCPeBe5IMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCdK490B; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCdK490B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725413028; x=1756949028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUuuxNNWrlYNSJ527a0KA/c54PV+R31myx1brEupaX8=;
  b=fCdK490Bs/yzlVjP/8F5hGk11RFM9mYAY544/sRq8pFPoc5AHnmJ6HQa
   Vx7EfzpV84vlAvqqWRlOAWvzMNzGp+EGapFTrWtajTTnNjSChqoztJ0cH
   2WbrxzceNr/vWHsQZ0JaZij6e/thLl9w5vxls60TemirKHx41GD7sJHzH
   +PQBVJXEc+DRr2zAMB7vJdXkHWO/8wNMVClXmCzivxfyO0yRp+QOzsV7n
   3tI7+699zBVWEhnU9N59QG+wW/7PR6NJPYMscRCRNaN27z9zKmsVqIs+U
   Q58IERjk81Qd6qaHfpVntMNqXtf/Xetas396ZGqSuTNuOWVlFXl2DCgVm
   Q==;
X-CSE-ConnectionGUID: 5MYk95KsQjmfpRvIAFeQGw==
X-CSE-MsgGUID: K2jWDpctT1yvaiW+4VEuIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23908514"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23908514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 18:23:47 -0700
X-CSE-ConnectionGUID: wDhuc6BVTwmj/biUgWVsOg==
X-CSE-MsgGUID: QVkv+cy2Qse7gyJ+KgGUsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="95834696"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Sep 2024 18:23:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slekH-0007Pa-0l;
	Wed, 04 Sep 2024 01:23:41 +0000
Date: Wed, 4 Sep 2024 09:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 35/48] include/linux/mmzone.h:1763:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202409040939.f3kgP6r8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95e99651a23c1ccc103007c3b0532ff97d7c357d
commit: 7015dd0470102719333d813a59f569b0922a53e5 [35/48] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-001-20240904 (https://download.01.org/0day-ci/archive/20240904/202409040939.f3kgP6r8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040939.f3kgP6r8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040939.f3kgP6r8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/loongarch/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:1763:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
    1763 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
         |  ^~~~~
   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:131:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     131 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     172 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:182:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     182 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     214 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:222:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     222 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:260:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     260 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:282:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     282 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=214000465
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1209: prepare0] Error 2 shuffle=214000465
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:241: __sub-make] Error 2 shuffle=214000465
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:241: __sub-make] Error 2 shuffle=214000465
   make: Target 'prepare' not remade because of errors.


vim +1763 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft     2005-06-23  1758  
835c134ec4dd75 Mel Gorman         2007-10-16  1759  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman         2007-10-16  1760  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman         2007-10-16  1761  
23baf831a32c04 Kirill A. Shutemov 2023-03-15  1762  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
d41dee369bff3b Andy Whitcroft     2005-06-23 @1763  #error Allocator MAX_ORDER exceeds SECTION_SIZE
d41dee369bff3b Andy Whitcroft     2005-06-23  1764  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1765  

:::::: The code at line 1763 was first introduced by commit
:::::: d41dee369bff3b9dcb6328d4d822926c28cc2594 [PATCH] sparsemem memory model

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
