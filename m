Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFD1B960
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711446899; cv=none; b=ESThJSvKQ/Uzy6d3+alt1JmsEmchGREF4F06CDcBhdRe7mZqKJCqbi56M1NGkSFJVj5GPufoJCk0IWdMu5OI/CU2T0A789vGWXElUkgESov9Q7uwJ6vdkSYbZFG7NTjCj8oPIN4mepPRYrsbAoHXV31CfV5gwJORIgqhbK+bBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711446899; c=relaxed/simple;
	bh=neOrCbv29aOEGyPLveb5y41xgnoY7u5YJapcaSyoc+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERNCcuREv9NlTYeltF6B4POhdaCfZ7dbirsE7orXcjxRbNPlktOwQ8QyFyJKIXuKTv43jFadq1q4cuEuPMu3/trmbRVzTbKXHPzYB9ZrVGWuqvWudnyfkEFvWPvNWTThEnAj9zTDeF4Mgidu2q3oU6VVnwuWLFDBwzkcSmjQSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDIcgIs1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDIcgIs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711446897; x=1742982897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neOrCbv29aOEGyPLveb5y41xgnoY7u5YJapcaSyoc+Q=;
  b=eDIcgIs1i7criCt8jR6xA0P3w1Qz6mxIcLUIB0g3f+PmN2vDWfZjGUUm
   X5kKpKfJe77ey0DCdc/3kJsVqPxPIPykvgxGdt5W8yVvZCrAVm+MZzER8
   glq0j1R9f6vsHWfHEqH662mYmFDlJEpZK+hEKLeGiQR2GDk2REkY+M3Hu
   QKCFBbnQbKy4UHC1oN8KcrelzAWD0ydxiZbfHVf1+CfWwl+S/K1I0XRB/
   a3GlnF7/nc5+GPU0zqLskh4DxOoR9KAFjZCVNrS2eIAYmq5UjUh0RmYge
   3DLaJDD7ULUOwWpVbZjsT4HosLgqcTgdgmlbZKUQNAvIEh50SQl78vbqu
   g==;
X-CSE-ConnectionGUID: Som9vzYMSCyA5BW/zkw5nw==
X-CSE-MsgGUID: +3WSibUqToiPdlG8YQ9/lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23974121"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="23974121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 02:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="47072669"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2024 02:54:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp3W7-000NHO-3D;
	Tue, 26 Mar 2024 09:54:51 +0000
Date: Tue, 26 Mar 2024 17:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm32-cfi 4/10] arch/arm/mm/proc-xscale.S:415:
 Error: bad instruction `define_cache_functions xscale'
Message-ID: <202403261700.b6M4kFIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   2fd3a7956b8a603c5d59b5851265a693536d9c35
commit: 4c65b5257d3f8b2264b4b1c22d12f43127da740d [4/10] ARM: mm: Rewrite cacheflush vtables in CFI safe C
config: arm-spitz_defconfig (https://download.01.org/0day-ci/archive/20240326/202403261700.b6M4kFIT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261700.b6M4kFIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261700.b6M4kFIT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mm/proc-xscale.S: Assembler messages:
>> arch/arm/mm/proc-xscale.S:415: Error: bad instruction `define_cache_functions xscale'
>> arch/arm/mm/proc-xscale.S:452: Error: bad instruction `define_cache_functions xscale_80200_A0_A1'


vim +415 arch/arm/mm/proc-xscale.S

a9c9147eb9b1db Russell King      2009-11-26  410  
031bd879f79d59 Lorenzo Pieralisi 2012-09-06  411  	.globl	xscale_flush_kern_cache_louis
031bd879f79d59 Lorenzo Pieralisi 2012-09-06  412  	.equ	xscale_flush_kern_cache_louis, xscale_flush_kern_cache_all
031bd879f79d59 Lorenzo Pieralisi 2012-09-06  413  
ab1a746da9dd19 Dave Martin       2011-06-23  414  	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
ab1a746da9dd19 Dave Martin       2011-06-23 @415  	define_cache_functions xscale
^1da177e4c3f41 Linus Torvalds    2005-04-16  416  
197c9444d6093b Lennert Buytenhek 2006-09-16  417  /*
197c9444d6093b Lennert Buytenhek 2006-09-16  418   * On stepping A0/A1 of the 80200, invalidating D-cache by line doesn't
197c9444d6093b Lennert Buytenhek 2006-09-16  419   * clear the dirty bits, which means that if we invalidate a dirty line,
197c9444d6093b Lennert Buytenhek 2006-09-16  420   * the dirty data can still be written back to external memory later on.
197c9444d6093b Lennert Buytenhek 2006-09-16  421   *
197c9444d6093b Lennert Buytenhek 2006-09-16  422   * The recommended workaround is to always do a clean D-cache line before
197c9444d6093b Lennert Buytenhek 2006-09-16  423   * doing an invalidate D-cache line, so on the affected processors,
197c9444d6093b Lennert Buytenhek 2006-09-16  424   * dma_inv_range() is implemented as dma_flush_range().
197c9444d6093b Lennert Buytenhek 2006-09-16  425   *
197c9444d6093b Lennert Buytenhek 2006-09-16  426   * See erratum #25 of "Intel 80200 Processor Specification Update",
197c9444d6093b Lennert Buytenhek 2006-09-16  427   * revision January 22, 2003, available at:
197c9444d6093b Lennert Buytenhek 2006-09-16  428   *     http://www.intel.com/design/iio/specupdt/273415.htm
197c9444d6093b Lennert Buytenhek 2006-09-16  429   */
ab1a746da9dd19 Dave Martin       2011-06-23  430  .macro a0_alias basename
ab1a746da9dd19 Dave Martin       2011-06-23  431  	.globl xscale_80200_A0_A1_\basename
ab1a746da9dd19 Dave Martin       2011-06-23  432  	.type xscale_80200_A0_A1_\basename , %function
ab1a746da9dd19 Dave Martin       2011-06-23  433  	.equ xscale_80200_A0_A1_\basename , xscale_\basename
ab1a746da9dd19 Dave Martin       2011-06-23  434  .endm
ab1a746da9dd19 Dave Martin       2011-06-23  435  
ab1a746da9dd19 Dave Martin       2011-06-23  436  /*
ab1a746da9dd19 Dave Martin       2011-06-23  437   * Most of the cache functions are unchanged for these processor revisions.
ab1a746da9dd19 Dave Martin       2011-06-23  438   * Export suitable alias symbols for the unchanged functions:
ab1a746da9dd19 Dave Martin       2011-06-23  439   */
ab1a746da9dd19 Dave Martin       2011-06-23  440  	a0_alias flush_icache_all
ab1a746da9dd19 Dave Martin       2011-06-23  441  	a0_alias flush_user_cache_all
ab1a746da9dd19 Dave Martin       2011-06-23  442  	a0_alias flush_kern_cache_all
8ee777fd915b0e Lorenzo Pieralisi 2012-09-28  443  	a0_alias flush_kern_cache_louis
ab1a746da9dd19 Dave Martin       2011-06-23  444  	a0_alias flush_user_cache_range
ab1a746da9dd19 Dave Martin       2011-06-23  445  	a0_alias coherent_kern_range
ab1a746da9dd19 Dave Martin       2011-06-23  446  	a0_alias coherent_user_range
ab1a746da9dd19 Dave Martin       2011-06-23  447  	a0_alias flush_kern_dcache_area
ab1a746da9dd19 Dave Martin       2011-06-23  448  	a0_alias dma_flush_range
ab1a746da9dd19 Dave Martin       2011-06-23  449  	a0_alias dma_unmap_area
ab1a746da9dd19 Dave Martin       2011-06-23  450  
ab1a746da9dd19 Dave Martin       2011-06-23  451  	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
ab1a746da9dd19 Dave Martin       2011-06-23 @452  	define_cache_functions xscale_80200_A0_A1
197c9444d6093b Lennert Buytenhek 2006-09-16  453  

:::::: The code at line 415 was first introduced by commit
:::::: ab1a746da9dd19e30a98d9744d5c7dc6df597fb0 ARM: mm: proc-xscale: Use new generic struct definition macros

:::::: TO: Dave Martin <dave.martin@linaro.org>
:::::: CC: Dave Martin <dave.martin@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
