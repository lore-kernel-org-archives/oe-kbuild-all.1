Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10220F1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 01:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709946738; cv=none; b=tSkewegApz5Xdj9N7RUd2hdJHdF+T4GEt2Zy6AOJ6LEdALm2sWhtkhD6IpwFpeh9sUsq18hsfKfoPCewyF4XcGWMB71Dgt1mrAaaNsULW4xE14+HogtO/3v2sIbQLUlHU1/qsuskHAZkzRpMqyaJYYHInBrnvzVC8alCbUHPTEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709946738; c=relaxed/simple;
	bh=Xg/M25L2zD7Y701nYjxZCqXpAlEYyOgdsXikfpW61y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMY9uqIqCooMyBPtlGYaPQ4OomhVkhUM3+70pa7qVkHx9xoHE5Nm7q5VrC7WcCmIZ/K9Zh1JavYppE17/+C8iTi0mhkGnGyfI0JTmDEophx8o2oY+V3kNw16MdcxZcMMXhBERwfwwV/X7CYRZZGV1sPN58MA5eoeE+RVE1MO2yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtGwFxKX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtGwFxKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709946733; x=1741482733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xg/M25L2zD7Y701nYjxZCqXpAlEYyOgdsXikfpW61y0=;
  b=PtGwFxKXpt0N/nX4ThI18lMGjh8ckLHsWnLsMR2Dqdx+xBoT1BHSWxn8
   90SmkzRfZkvuYZwS9nCsYICdFwXs20zcHvNMk7O55r3vCgT3IR4FZeRdJ
   t1vSwg8wESZEHxeLfPqhUDhQiwMvFdNRoB2FIn/JA8pFjVhlclVIdp/yE
   JPs6HTDIoLW/xYam+rSTR4IwGibz83sHkycdXg12NTErUBaasuS8g8nBz
   Qgfw8WRoKsCb0xfi06uLMAKP7ctJkA3a7XpBYjxmIYivh92zTMpXrlbza
   NFDNMFwmQfPkBqL/eCdnrWj3ML45hab/FU/O0p3Ul0ZLCuODIq58DonuD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15413679"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15413679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 17:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="33776136"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2024 17:12:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rilFu-0006qh-19;
	Sat, 09 Mar 2024 01:12:06 +0000
Date: Sat, 9 Mar 2024 09:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: [linux-next:master 12265/12944]
 arch/riscv/include/asm/pgtable.h:735:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-ID: <202403090900.OwPqmRuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 924bd6a8c96767a05323d575bdefd664631dce73 [12265/12944] mm/x86: drop two unnecessary pud_leaf() definitions
config: riscv-randconfig-r042-20230330 (https://download.01.org/0day-ci/archive/20240309/202403090900.OwPqmRuI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090900.OwPqmRuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090900.OwPqmRuI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/riscv/include/asm/pgtable.h:735:16: error: implicit declaration of function 'pud_leaf'; did you mean 'pmd_leaf'? [-Werror=implicit-function-declaration]
     735 |         return pud_leaf(pud) && pud_user(pud);
         |                ^~~~~~~~
         |                pmd_leaf
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +735 arch/riscv/include/asm/pgtable.h

3332f419067411 Jisheng Zhang 2021-04-17  732  
3fee229a8eb936 Tong Tiangen  2022-05-12  733  static inline bool pud_user_accessible_page(pud_t pud)
3fee229a8eb936 Tong Tiangen  2022-05-12  734  {
3fee229a8eb936 Tong Tiangen  2022-05-12 @735  	return pud_leaf(pud) && pud_user(pud);
3fee229a8eb936 Tong Tiangen  2022-05-12  736  }
3fee229a8eb936 Tong Tiangen  2022-05-12  737  #endif
3fee229a8eb936 Tong Tiangen  2022-05-12  738  

:::::: The code at line 735 was first introduced by commit
:::::: 3fee229a8eb936b96933c6b2cd02d2e87a4cc997 riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK

:::::: TO: Tong Tiangen <tongtiangen@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
