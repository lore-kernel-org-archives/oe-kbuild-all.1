Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589A41C63
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708180837; cv=none; b=gYLIoDzLD6ttjd9yj5h7cHHUWLQrRreOUXJdyZeSQPGFEs5dHJViKXsgsoWY50z8IHjV+uVIJr0Oj07/9d1lYAxQTy0YEAZ6Ig1FCPWUyDrkkUAtvpEZZgyZreN4qx16BOod/XRbe82qUK1JjNg7YtxUxfWFqC2GoCtQTs6Iac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708180837; c=relaxed/simple;
	bh=cMh7z62GUQbosfwvwiQKhPpem5g1x+Xvr3AJ+YwE4Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NO6db/Z2p0d2mwQ5mtlOTExN+5cH+YehPU8pQjGAaQVR3BLiqhHrHY9XQhu9KPCtMhBKvXsDLHOPEOCNXmxstnR54BfiAideq1ZiSog4aVvHJzyIevvks6BP5D/BCwfy9oKASPSs/IcB7/5XHsb/jeYH8vKwvjcXeBFF9qnEyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCZ0BZ2/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCZ0BZ2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708180835; x=1739716835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMh7z62GUQbosfwvwiQKhPpem5g1x+Xvr3AJ+YwE4Xs=;
  b=NCZ0BZ2/XZ816kJT6PvVnm3DMpAEnjXormil/e/14Ycblx1EJCJqDDcL
   aXcABgmMO+qk1pV4mJrQVxnVDcDHuESjVPgoTgK3j21ao3cX5R+fPV0mQ
   Y59fjzIUK8wjCsAMP4HmLn12tZlph/RttnB1WRiOvW9/qtabio+//gZnL
   wwN4969Dt5A/5vVqENzYzZy/8yl/gt6Ns36k4DqxstUPbeDp2TW0awZLz
   oz/a7yQKOI9dKOx/x86616u+UZVNbubXu7xNvTKVfQ/axZ6eAyHYyrY6/
   4NG9u++O1rxtmFLaujXASTUteTcd7AirzxnlrnJmdV+V9dBby2n+taqfU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2169853"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2169853"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 06:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="3994387"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2024 06:40:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbLrj-0002Am-0x;
	Sat, 17 Feb 2024 14:40:31 +0000
Date: Sat, 17 Feb 2024 22:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 2/37]
 arch/loongarch/include/asm/kfence.h:22:16: error: implicit declaration of
 function '__get_vm_area_caller'
Message-ID: <202402172220.Sx7s1s6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   23633d13a520a9f34caf0f1a13820660b95406b5
commit: d55de34a38a9b226f04758efc2a7949bf81e39fc [2/37] asm-generic/io.h: Kill vmalloc.h dependency
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240217/202402172220.Sx7s1s6t-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402172220.Sx7s1s6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402172220.Sx7s1s6t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kfence/report.c:21:
   arch/loongarch/include/asm/kfence.h: In function 'arch_kfence_init_pool':
>> arch/loongarch/include/asm/kfence.h:22:16: error: implicit declaration of function '__get_vm_area_caller' [-Werror=implicit-function-declaration]
      22 |         area = __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/include/asm/kfence.h:22:55: error: 'VM_IOREMAP' undeclared (first use in this function)
      22 |         area = __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
         |                                                       ^~~~~~~~~~
   arch/loongarch/include/asm/kfence.h:22:55: note: each undeclared identifier is reported only once for each function it appears in
>> arch/loongarch/include/asm/kfence.h:28:37: error: invalid use of undefined type 'struct vm_struct'
      28 |         __kfence_pool = (char *)area->addr;
         |                                     ^~
>> arch/loongarch/include/asm/kfence.h:33:17: error: implicit declaration of function 'free_vm_area' [-Werror=implicit-function-declaration]
      33 |                 free_vm_area(area);
         |                 ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__get_vm_area_caller +22 arch/loongarch/include/asm/kfence.h

6ad3df56bb1991 Enze Li 2023-09-06  15  
6ad3df56bb1991 Enze Li 2023-09-06  16  static inline bool arch_kfence_init_pool(void)
6ad3df56bb1991 Enze Li 2023-09-06  17  {
6ad3df56bb1991 Enze Li 2023-09-06  18  	int err;
6ad3df56bb1991 Enze Li 2023-09-06  19  	char *kfence_pool = __kfence_pool;
6ad3df56bb1991 Enze Li 2023-09-06  20  	struct vm_struct *area;
6ad3df56bb1991 Enze Li 2023-09-06  21  
6ad3df56bb1991 Enze Li 2023-09-06 @22  	area = __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
6ad3df56bb1991 Enze Li 2023-09-06  23  				    KFENCE_AREA_START, KFENCE_AREA_END,
6ad3df56bb1991 Enze Li 2023-09-06  24  				    __builtin_return_address(0));
6ad3df56bb1991 Enze Li 2023-09-06  25  	if (!area)
6ad3df56bb1991 Enze Li 2023-09-06  26  		return false;
6ad3df56bb1991 Enze Li 2023-09-06  27  
6ad3df56bb1991 Enze Li 2023-09-06 @28  	__kfence_pool = (char *)area->addr;
6ad3df56bb1991 Enze Li 2023-09-06  29  	err = ioremap_page_range((unsigned long)__kfence_pool,
6ad3df56bb1991 Enze Li 2023-09-06  30  				 (unsigned long)__kfence_pool + KFENCE_POOL_SIZE,
6ad3df56bb1991 Enze Li 2023-09-06  31  				 virt_to_phys((void *)kfence_pool), PAGE_KERNEL);
6ad3df56bb1991 Enze Li 2023-09-06  32  	if (err) {
6ad3df56bb1991 Enze Li 2023-09-06 @33  		free_vm_area(area);
6ad3df56bb1991 Enze Li 2023-09-06  34  		__kfence_pool = kfence_pool;
6ad3df56bb1991 Enze Li 2023-09-06  35  		return false;
6ad3df56bb1991 Enze Li 2023-09-06  36  	}
6ad3df56bb1991 Enze Li 2023-09-06  37  
6ad3df56bb1991 Enze Li 2023-09-06  38  	return true;
6ad3df56bb1991 Enze Li 2023-09-06  39  }
6ad3df56bb1991 Enze Li 2023-09-06  40  

:::::: The code at line 22 was first introduced by commit
:::::: 6ad3df56bb199134800933df2afcd7df3b03ef33 LoongArch: Add KFENCE (Kernel Electric-Fence) support

:::::: TO: Enze Li <lienze@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
