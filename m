Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63066436A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695417161; x=1726953161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFPKwZk1NbjDwDVDtHwF+mPLJg8l413Mpf89HDe8BQ4=;
  b=dLTdr/r6pxEovX+iXBnu9oO3POSgiiyVQyg7Ck2+1XjBW8/MDcX9/xvp
   AcmRQVNyTrhqiXu4UvYkf8//AasOYStw5U5BNQlnGA07wzGJTtUcDIYHW
   //4yKZ6SQY3GttAqBuE03C4gsqkf8ePX4EzUa9UW0dyYkj2/UUedEg26b
   S6EX32smbfx7I1etkROM4nMZZ1TKrluiouH6xaUWpGiFqroPYLJe4NdIV
   Xpe2Xoj3YYUJ+jtAX3pZFii3QIZeBQYuMloWJbs5MeE+ieLDoCjKrs26Y
   DBpf8wmG271pNGnVwKoq39E5MFNzSF8w3QIsZOOagWpOJH6O/MWsAdkF/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="383696522"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="383696522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 14:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="776985851"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="776985851"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2023 14:12:30 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjnRs-0001K9-1w;
	Fri, 22 Sep 2023 21:12:28 +0000
Date: Sat, 23 Sep 2023 05:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2023-06 6543/10999]
 arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE'
 undeclared; did you mean 'STRUCT_HYP_PAGE_SIZE'?
Message-ID: <202309230522.k2CXa00N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2023-06
head:   b476219dea3d7cce24c57dd022b33285045fe073
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [6543/10999] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-001-20230923 (https://download.01.org/0day-ci/archive/20230923/202309230522.k2CXa00N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230522.k2CXa00N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230522.k2CXa00N-lkp@intel.com/

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
