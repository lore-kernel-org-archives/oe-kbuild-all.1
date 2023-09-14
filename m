Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160A15E83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694682426; x=1726218426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=01I1I7GqBC1Q5UxicFhLDuQTGY+HuvIqglYsv//iM7Q=;
  b=OK8Pt1vkdFwp14qz9Y08KjJhboOKmO2Jf8Ma6KgkSdnPUcyx3KqWJ56u
   c+4Uyf0ZBdrNY5yYcWj/9YxqpFqbeiC0kE42KpD9E4/0vKuWlzKZs59zU
   Q1wjmwbx5c7i85Mgt3lLo5cipWRT5NIkIEOFvTI0+K/E2fL1CC5t1wqnM
   Q31nRodnDX/juB5isTN5reWaLSCiDGzfw5IHrPsAKSCsK4m3z+coAD9Vq
   ZzdDJLP41qx5H/Fe2uVQ5QrhYmxNoOi8mXimc7hvyH8FZr0UvmW3FEBtN
   lBEhx+1BjGApLLTLaLCmrdevlh/iueg1RD8nV3oXcFshV4e8diYhc37ux
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369171073"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="369171073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 02:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918184531"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="918184531"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 02:07:04 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgiJS-0001PS-1v;
	Thu, 14 Sep 2023 09:07:02 +0000
Date: Thu, 14 Sep 2023 17:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Weijiang <weijiang.yang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/8] x86/fpu/xstate: Tweak guest fpstate to support
 kernel dynamic xfeatures
Message-ID: <202309141610.x0Q8QRPE-lkp@intel.com>
References: <20230914032334.75212-8-weijiang.yang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914032334.75212-8-weijiang.yang@intel.com>

Hi Yang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Weijiang/x86-fpu-xstate-Manually-check-and-add-XFEATURE_CET_USER-xstate-bit/20230914-142957
base:   linus/master
patch link:    https://lore.kernel.org/r/20230914032334.75212-8-weijiang.yang%40intel.com
patch subject: [RFC PATCH 7/8] x86/fpu/xstate: Tweak guest fpstate to support kernel dynamic xfeatures
config: x86_64-buildonly-randconfig-002-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141610.x0Q8QRPE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141610.x0Q8QRPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141610.x0Q8QRPE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.c:564:14: warning: no previous prototype for 'xstate_calculate_size' [-Wmissing-prototypes]
     564 | unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
         |              ^~~~~~~~~~~~~~~~~~~~~


vim +/xstate_calculate_size +564 arch/x86/kernel/fpu/xstate.c

   563	
 > 564	unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
   565	{
   566		unsigned int topmost = fls64(xfeatures) -  1;
   567		unsigned int offset = xstate_offsets[topmost];
   568	
   569		if (topmost <= XFEATURE_SSE)
   570			return sizeof(struct xregs_state);
   571	
   572		if (compacted)
   573			offset = xfeature_get_offset(xfeatures, topmost);
   574		return offset + xstate_sizes[topmost];
   575	}
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
