Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB4266AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 21:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694727472; x=1726263472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IMDycsnXMCsmEiBMFNnUQkkLigow3fm+g7dBa+9j1z4=;
  b=n3jhKsYvDKDi6JDOaBBR0yuABMhTac0RqfuCi9IqcO0VPxAEieneXzpx
   6GJyG0xx6nVAD2XSL6HXL0gG50ZzXEiz6e72OZO5mxhlW8uzFpSylQyXW
   bVm4BXGQ8gElVGfS+JEUaD1550Ak83lyZuy5gxaQbA+Dn5z8WY91BFryH
   cuEBnatoz1gq45339EZ17PMnC7YXUEwzNJkzbRzRzxUdtsUVNjjMNPsdC
   vd97I6fnJ+N2G8XaZlnrln/qFjrpCtsvXZR1b34FCgU+NLjBQGt39I1Bs
   qCwMVAAstJy6L8jlfg0LL7SxdcFBTrNtgI/nCf+/W9gT3G1t5U4My+Ron
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381796296"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="381796296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 14:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="887969816"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="887969816"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2023 14:37:16 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgu20-00025a-0f;
	Thu, 14 Sep 2023 21:37:48 +0000
Date: Fri, 15 Sep 2023 05:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/9] x86: kdump: use generic interface to simplify
 crashkernel reservation code
Message-ID: <202309150538.TyCUwATI-lkp@intel.com>
References: <20230914033142.676708-7-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914033142.676708-7-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.6-rc1 next-20230914]
[cannot apply to arm64/for-next/core tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/crash_core-c-remove-unnecessary-parameter-of-function/20230914-113546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230914033142.676708-7-bhe%40redhat.com
patch subject: [PATCH v3 6/9] x86: kdump: use generic interface to simplify crashkernel reservation code
config: i386-randconfig-003-20230915 (https://download.01.org/0day-ci/archive/20230915/202309150538.TyCUwATI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150538.TyCUwATI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150538.TyCUwATI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/setup.c:476:15: warning: no previous declaration for 'crash_low_size_default' [-Wmissing-declarations]
    unsigned long crash_low_size_default(void)
                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/crash_low_size_default +476 arch/x86/kernel/setup.c

   472	
   473	/*
   474	 * --------- Crashkernel reservation ------------------------------
   475	 */
 > 476	unsigned long crash_low_size_default(void)
   477	{
   478	#ifdef CONFIG_X86_64
   479		return max(swiotlb_size_or_default() + (8UL << 20), 256UL << 20);
   480	#else
   481		return 0;
   482	#endif
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
