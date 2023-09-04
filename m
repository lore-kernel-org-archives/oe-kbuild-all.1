Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2CD1FBD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 21:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693864336; x=1725400336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+w9CvXX+1Rx/aTBCDs7z8g8noWHJKus56EUrtV2JYDk=;
  b=HEYrVUkLQ1gMcxxKLhCCNox6WXSHnibwHNDMsuBAKkHAe0/rblGHgv1R
   +vRFytRmBz44mJyFoOBPskJEuXTdDWGzSYqt0EVNGjAbhVC9NCzu9HDgx
   Exy0yLm8Dsbaj3QWIkwBQse8KDqXG5Fy5PJ6TFZM7WNSlePz/tPioShSy
   5jU5dzU1YWfkdxd+Dk4P1oAvMcddkP2wat+VNXwOaAGGA0p66RTWH6qwC
   qK1H8qjsF4BmoWNyEPUcuFxA7bPepBI6RnwW6szYzP0g64qu9JULBFCI+
   j5Idrayrt3Ni798vnTCGgMf9AMivfmI9vqcI4oaiFEIEzW5nehcP0wh8l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356970431"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="356970431"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 14:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="811004457"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="811004457"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2023 14:52:14 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdHUS-0000rj-0g;
	Mon, 04 Sep 2023 21:52:12 +0000
Date: Tue, 5 Sep 2023 05:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6543/11266]
 arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE'
 undeclared; did you mean 'STRUCT_HYP_PAGE_SIZE'?
Message-ID: <202309050522.Tshc1grN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   4b3ab91671d89c3bb00d82c7c7b746d53c1688cd
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [6543/11266] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r016-20230905 (https://download.01.org/0day-ci/archive/20230905/202309050522.Tshc1grN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050522.Tshc1grN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050522.Tshc1grN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'bpage_backing_setup':
>> arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE' undeclared (first use in this function); did you mean 'STRUCT_HYP_PAGE_SIZE'?
      38 |         backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        STRUCT_HYP_PAGE_SIZE
   arch/arm64/kvm/hyp_trace.c:38:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp_trace.c: At top level:
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~


vim +38 arch/arm64/kvm/hyp_trace.c

    29	
    30	static int bpage_backing_setup(struct hyp_trace_pack *pack)
    31	{
    32		size_t backing_size;
    33		void *start;
    34	
    35		if (hyp_buffer_pages_backing.start)
    36			return -EBUSY;
    37	
  > 38		backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
    39			       pack->trace_buffer_pack.total_pages;
    40		backing_size = PAGE_ALIGN(backing_size);
    41	
    42		start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
    43		if (!start)
    44			return -ENOMEM;
    45	
    46		hyp_buffer_pages_backing.start = (unsigned long)start;
    47		hyp_buffer_pages_backing.size = backing_size;
    48		pack->backing.start = (unsigned long)start;
    49		pack->backing.size = backing_size;
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
