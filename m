Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CE33ADAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 23:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777418623; cv=none; b=nHQQZItEnpJ/1K2Ch2wtsQulO3tzigNLoiT1Cfi1VdrpHjC/Flfw8yMWzQ4fE4aYOFBAX7QF8jvcqma4StFNEsXiP15UweihTzS3yf2Y8vScjAdcLG+ZVTxRgUYJvet2RYG7bIlDW22G58zKYVtQA+azug4x+28g8hjP00gGNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777418623; c=relaxed/simple;
	bh=E9Siu4RJV7aSiONIOwOc2kL30WYE/31zrnT6ybRf/Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIKIYbIwZQzYxhnKyt8L+t2MDErvSsP4LVCUZv2en3I2vnSYak8PjPbYq1LtqDP16yPDVV72qh88fB/mAcKmuwkUL7xQjbvidhfAKB/MmiceDX6jPnRkKL40+/m/7I0CUnYhqdVOmJDuJqTZ+NHML+5oi5o7WHDV/08EF+TS0+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpEDWBjM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpEDWBjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777418621; x=1808954621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E9Siu4RJV7aSiONIOwOc2kL30WYE/31zrnT6ybRf/Zk=;
  b=TpEDWBjMchES5Kkp9H7t+Ge3OmgRvq0nJW0m5pWKURfCjzdQm7kBy3I9
   JPx5tFHf8bx9UwNhICdII1rQT6Mv7xLvsILSSMhJw1BqE9jry/NbyxSKT
   KXNW4DKziD7knXaark4UA7CIYe+1gCFX0O7fG06VYifcgxhE6BMfzqRWc
   RKQ4AAcnzvhaOS7fM0mkrdzW3piU+TXd6aHf15P6IwgEqsMXancqF/YYh
   fwPL9cSagtuQPz8Y/M0SqXxa37Vh5zmSX/qDTv2giDLnJjZnUq/PL3Y9g
   HxDgVUibcimHm69wZgQ1MBmkU8OV+f3iegH2G4xwH6Jbs+dzlLfhzabhh
   w==;
X-CSE-ConnectionGUID: pFOrtM/CQJeVZ2MPrpz2AA==
X-CSE-MsgGUID: xx/M+lDXS0WIUSut4sCkjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="101004227"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="101004227"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 16:23:41 -0700
X-CSE-ConnectionGUID: nEUv64XgT52TgGxKtvmKIA==
X-CSE-MsgGUID: oFQS2JSESt2MEfwi5wAwaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="235864571"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2026 16:23:40 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHrmD-00000000ALw-3M7x;
	Tue, 28 Apr 2026 23:23:37 +0000
Date: Wed, 29 Apr 2026 07:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm/hugetlb_cma: round up per_node before logging it
Message-ID: <202604290752.kPjM1Hkb-lkp@intel.com>
References: <20260421230220.4122996-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421230220.4122996-1-ekffu200098@gmail.com>

Hi Sang-Heon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0]
[also build test ERROR on linus/master]
[cannot apply to akpm-mm/mm-everything next-20260428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sang-Heon-Jeon/mm-hugetlb_cma-round-up-per_node-before-logging-it/20260427-012923
base:   v7.0
patch link:    https://lore.kernel.org/r/20260421230220.4122996-1-ekffu200098%40gmail.com
patch subject: [RFC PATCH] mm/hugetlb_cma: round up per_node before logging it
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604290752.kPjM1Hkb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290752.kPjM1Hkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290752.kPjM1Hkb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/hugetlb_cma.c:3:
   mm/hugetlb_cma.c: In function 'hugetlb_cma_reserve':
>> include/linux/printk.h:481:10: error: expected expression before '{' token
     481 |         ({                                                              \
         |          ^
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   mm/hugetlb_cma.c:208:17: note: in expansion of macro 'pr_info'
     208 |                 pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
         |                 ^~~~~~~
   In file included from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8:
>> include/linux/math.h:25:55: error: called object is not a function or function pointer
      25 | #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/hugetlb_cma.c:207:28: note: in expansion of macro 'round_up'
     207 |                 per_node = round_up(per_node, PAGE_SIZE << order)
         |                            ^~~~~~~~


vim +481 include/linux/printk.h

337015573718b1 Chris Down 2021-06-15  459  
337015573718b1 Chris Down 2021-06-15  460  /*
337015573718b1 Chris Down 2021-06-15  461   * Some subsystems have their own custom printk that applies a va_format to a
337015573718b1 Chris Down 2021-06-15  462   * generic format, for example, to include a device number or other metadata
337015573718b1 Chris Down 2021-06-15  463   * alongside the format supplied by the caller.
337015573718b1 Chris Down 2021-06-15  464   *
337015573718b1 Chris Down 2021-06-15  465   * In order to store these in the way they would be emitted by the printk
337015573718b1 Chris Down 2021-06-15  466   * infrastructure, the subsystem provides us with the start, fixed string, and
337015573718b1 Chris Down 2021-06-15  467   * any subsequent text in the format string.
337015573718b1 Chris Down 2021-06-15  468   *
337015573718b1 Chris Down 2021-06-15  469   * We take a variable argument list as pr_fmt/dev_fmt/etc are sometimes passed
337015573718b1 Chris Down 2021-06-15  470   * as multiple arguments (eg: `"%s: ", "blah"`), and we must only take the
337015573718b1 Chris Down 2021-06-15  471   * first one.
337015573718b1 Chris Down 2021-06-15  472   *
337015573718b1 Chris Down 2021-06-15  473   * subsys_fmt_prefix must be known at compile time, or compilation will fail
337015573718b1 Chris Down 2021-06-15  474   * (since this is a mistake). If fmt or level is not known at compile time, no
337015573718b1 Chris Down 2021-06-15  475   * index entry will be made (since this can legitimately happen).
337015573718b1 Chris Down 2021-06-15  476   */
337015573718b1 Chris Down 2021-06-15  477  #define printk_index_subsys_emit(subsys_fmt_prefix, level, fmt, ...) \
337015573718b1 Chris Down 2021-06-15  478  	__printk_index_emit(fmt, level, subsys_fmt_prefix)
337015573718b1 Chris Down 2021-06-15  479  
337015573718b1 Chris Down 2021-06-15  480  #define printk_index_wrap(_p_func, _fmt, ...)				\
337015573718b1 Chris Down 2021-06-15 @481  	({								\
337015573718b1 Chris Down 2021-06-15  482  		__printk_index_emit(_fmt, NULL, NULL);			\
337015573718b1 Chris Down 2021-06-15  483  		_p_func(_fmt, ##__VA_ARGS__);				\
337015573718b1 Chris Down 2021-06-15  484  	})
337015573718b1 Chris Down 2021-06-15  485  
337015573718b1 Chris Down 2021-06-15  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
