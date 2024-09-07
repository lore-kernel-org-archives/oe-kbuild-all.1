Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A848215ADA6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725710082; cv=none; b=XLw+kdzEqLFAo9z7cZZ2po397K0u/daglcN0LFmA9fGZZ+WT9jOscVZz/nWsRe/Xju5fQQpnYXi2h83htSVv8fyz/iB9NkWV44nF0Cv9FA6m5x31fWbTr97svs6f+2Qe0ReQkBBnYOTVp8yVDSTXLC6kkWyoczbIBpKFYjdGiVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725710082; c=relaxed/simple;
	bh=cygSOr6RYeF71/Q288YDnTBkp37sC9GEheLsS7lTfIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDUt/D4O/WdaVMeP6q3F9fOtt9spgPMF9US9ZulNGvaSJbLjC4/k2vozJLaTci9ijZY+iTEVo9PfvhDKZu/d1BDT2tCHhzz+wu6pGAoNKEH6sc9CfTDLQN/xiswo/AB1jZJruimUN/foun55tR8BFkbnIljiPYnmH2HbD9s9y2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNgM6t5x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNgM6t5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725710081; x=1757246081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cygSOr6RYeF71/Q288YDnTBkp37sC9GEheLsS7lTfIc=;
  b=dNgM6t5xNGIXSdQcT1hXW/Hd12JIyjW9UhWyrAt1hSZXSdu3iYycrZyz
   skHI4sgMAbthdFh7nER3gyiOXBYkua1hFFwLVpnqY5wb00/UQDDMGh3Qi
   F06V2fEy2hkl1Rvj9nI2d3T4ddPzZd+hPFIRoOfbBTX3/dT2WOrjhSUT2
   HWyW/zigKjIiqGOEzYM7BpIdOz4v1oHihvvUM1PHqdFBgpavlj5A/1LOr
   BJlnPMez0I4EL2sPSZVOkvxilVZ95gST5gIrEl0YFEy2MhrBJk7/gDpEM
   QFdp6uOhlNV1LE7rh0CJ2fGT2o3VZnDwiETW+G28xbYzdxHgs9uB2l+up
   w==;
X-CSE-ConnectionGUID: cwEp/F+aSRyLEkmrepVZzA==
X-CSE-MsgGUID: YoKckjT/R0eDxc0y7niFHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28202413"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="28202413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:54:38 -0700
X-CSE-ConnectionGUID: 5E1McmrCQ6uazV76dL/gsg==
X-CSE-MsgGUID: a9IGfGCHQJuVGtDYyvqBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="71013916"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Sep 2024 04:54:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smu1S-000CWp-0P;
	Sat, 07 Sep 2024 11:54:34 +0000
Date: Sat, 7 Sep 2024 19:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 08/10] mm/mshare: Add basic page table sharing
 support
Message-ID: <202409071921.6XYP21Jo-lkp@intel.com>
References: <20240903232241.43995-9-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903232241.43995-9-anthony.yznaga@oracle.com>

Hi Anthony,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc6 next-20240906]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Yznaga/mm-Add-msharefs-filesystem/20240904-072513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240903232241.43995-9-anthony.yznaga%40oracle.com
patch subject: [RFC PATCH v3 08/10] mm/mshare: Add basic page table sharing support
config: powerpc64-randconfig-003-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071921.6XYP21Jo-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071921.6XYP21Jo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071921.6XYP21Jo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:5,
                    from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:377,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from mm/mshare.c:17:
   mm/mshare.c: In function 'find_shared_vma':
>> include/asm-generic/pgtable-nop4d.h:33:33: error: implicit declaration of function 'set_p4d'; did you mean 'set_pgd'? [-Werror=implicit-function-declaration]
      33 | #define set_pgd(pgdptr, pgdval) set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
         |                                 ^~~~~~~
   mm/mshare.c:52:17: note: in expansion of macro 'set_pgd'
      52 |                 set_pgd(guest_pgd, *pgd);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors


vim +33 include/asm-generic/pgtable-nop4d.h

048456dcf2c56a Kirill A. Shutemov 2017-03-09  26  
048456dcf2c56a Kirill A. Shutemov 2017-03-09  27  #define pgd_populate(mm, pgd, p4d)		do { } while (0)
0a9fe8ca844d43 Dan Williams       2018-12-04  28  #define pgd_populate_safe(mm, pgd, p4d)		do { } while (0)
048456dcf2c56a Kirill A. Shutemov 2017-03-09  29  /*
048456dcf2c56a Kirill A. Shutemov 2017-03-09  30   * (p4ds are folded into pgds so this doesn't get actually called,
048456dcf2c56a Kirill A. Shutemov 2017-03-09  31   * but the define is needed for a generic inline function.)
048456dcf2c56a Kirill A. Shutemov 2017-03-09  32   */
048456dcf2c56a Kirill A. Shutemov 2017-03-09 @33  #define set_pgd(pgdptr, pgdval)	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
048456dcf2c56a Kirill A. Shutemov 2017-03-09  34  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
