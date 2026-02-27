Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4BC332624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184970; cv=none; b=mYWgdaG1jS6DkgyIP6f+vWTNGEBRLcZAG8zv1wAX9Zzr8/x/wqXq7W34GSZdu0mYXrRagBT7KQ2Ibotg4DPFuiDPv0myOCUSqG7r16k12iyp13NAXKNcBkYDcdO+E/ZjoO7sFuX3bt9gJ3JN21TwFAVo3ZOxbMEoX6ROM7udRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184970; c=relaxed/simple;
	bh=0bwXs3iO7LlbjcaPT6A75zspThbtCCkzqC25pRUa89M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js5Pi/AmakVNpAGSXoAS3cLtoy2XfNDcDLpDJ2RCK6ob86WvKvP5K++tpviLo3L3jS2ElGsUdgNrzA5IMg2jMN5iYcue49CpgyR4b9y5omzxfjae+mNiTcb4WHe+DyHJu+RLCOM4VeMXiUeM4Td9c0fBivfLTAk55d7u/vEgmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho7gDf8H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho7gDf8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772184969; x=1803720969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0bwXs3iO7LlbjcaPT6A75zspThbtCCkzqC25pRUa89M=;
  b=Ho7gDf8HlhjaTXAlUSG140GBvQpt12th20SEMwJT+XygeQ5LaMJApazL
   OxyKyLg46SdOSAnH3nueG0DzLOB1OlcvaxiWBYMpgbmLejK34kHM3xe+U
   S5er4MiGXl2lFw7xpFPOnUyHROKZWW6YBDTfJcfEu7Pru8WPkb18Tpk5Z
   iG20O8ERqPJ610qrDsdGWAwJKo/q/x3BC7MYUPNcBCEybYoR64ejQC+Gu
   RPAhN4e6is4g7rpPU/gk+ywuuxj3QTFi3jApXDSPinUeqAtf/JxvjEWZT
   sGHD/SY80CAO4Kmw1NW4iHjEpf3dK2vsP2xbSXjp+5q41lIMrhF4NplVE
   w==;
X-CSE-ConnectionGUID: NwKY2dItRtKonfq5JBKGFQ==
X-CSE-MsgGUID: LqjAuDK0QUmsojD6tscBSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73310173"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73310173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:36:08 -0800
X-CSE-ConnectionGUID: 44XjRSkURMWOmrKotPz4UA==
X-CSE-MsgGUID: hRy+ezX6T9yTL/r9Zd1EmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="221471572"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2026 01:36:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvuGT-00000000APv-05Fs;
	Fri, 27 Feb 2026 09:36:05 +0000
Date: Fri, 27 Feb 2026 17:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/2] powerpc/64s: Add support for huge pfnmaps
Message-ID: <202602271705.lJ7R2osL-lkp@intel.com>
References: <d159058a45ac5e225f2e64cc7c8bbbd1583e51f3.1772170860.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d159058a45ac5e225f2e64cc7c8bbbd1583e51f3.1772170860.git.ritesh.list@gmail.com>

Hi Ritesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc1 next-20260226]
[cannot apply to powerpc/next powerpc/fixes awilliam-vfio/next awilliam-vfio/for-linus riteshharjani/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/powerpc-64s-Add-support-for-huge-pfnmaps/20260227-141845
base:   linus/master
patch link:    https://lore.kernel.org/r/d159058a45ac5e225f2e64cc7c8bbbd1583e51f3.1772170860.git.ritesh.list%40gmail.com
patch subject: [RFC v1 2/2] powerpc/64s: Add support for huge pfnmaps
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602271705.lJ7R2osL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271705.lJ7R2osL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271705.lJ7R2osL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/powerpc/include/asm/kup.h:43,
                    from arch/powerpc/include/asm/uaccess.h:10,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:13:
   arch/powerpc/include/asm/pgtable.h: In function 'pmd_pgprot':
>> arch/powerpc/include/asm/pgtable.h:69:27: error: implicit declaration of function 'pmd_pte'; did you mean 'pfn_pte'? [-Wimplicit-function-declaration]
      69 |         return pte_pgprot(pmd_pte(pmd));
         |                           ^~~~~~~
         |                           pfn_pte
   arch/powerpc/include/asm/pgtable.h: In function 'pud_pgprot':
>> arch/powerpc/include/asm/pgtable.h:75:27: error: implicit declaration of function 'pud_pte'; did you mean 'pfn_pte'? [-Wimplicit-function-declaration]
      75 |         return pte_pgprot(pud_pte(pud));
         |                           ^~~~~~~
         |                           pfn_pte
   make[3]: *** [scripts/Makefile.build:184: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +69 arch/powerpc/include/asm/pgtable.h

    65	
    66	#define pmd_pgprot pmd_pgprot
    67	static inline pgprot_t pmd_pgprot(pmd_t pmd)
    68	{
  > 69		return pte_pgprot(pmd_pte(pmd));
    70	}
    71	
    72	#define pud_pgprot pud_pgprot
    73	static inline pgprot_t pud_pgprot(pud_t pud)
    74	{
  > 75		return pte_pgprot(pud_pte(pud));
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
