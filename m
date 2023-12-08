Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7D515BE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 04:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLItjYes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702010184; x=1733546184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=juZTmDbHgitCRZRaA/47vtgPpie+gV2Z7odPgNF6PUY=;
  b=BLItjYesJ4Q0TC3s5K1pTvr9EwG31C6753KZeNcrowkpgmANnW/F3Ht3
   xPWS7HWVJJ8lHpUAyd4nDJPhXlM/2chQrhrUQB0ZqJJxPhMsSlK+S5J6U
   7wr2xn7DcNVHxCXc1+e3V0J0avu5/J6RVErjzOCB3cBP+yzFvYwX6GHcc
   ok9mROCXJbqvflIJ5GmPjjyo65nqN1gCsF9LmOqtO7xq9pAV+TvItCYZk
   bR3lXEtemH08CsEPS4Tug9lXaGBKAGH7Q9SgjrHVHZkYGh5AwRCXkGavz
   8uf6u0K0ZoSu1iTkugHo94fh4f7uLReMrOGVM++hcr1/6GA5LzkWi/0yH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379357978"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="379357978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 20:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="806270324"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="806270324"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2023 20:36:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBSaz-000DGB-0a;
	Fri, 08 Dec 2023 04:36:13 +0000
Date: Fri, 8 Dec 2023 12:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2023-08 6543/11250]
 arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier
 'STRUCT_HYP_BUFFER_PAGE_SIZE'
Message-ID: <202312081245.FdsknFA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2023-08
head:   82e136314a0ab3db85c8e05ac32d7961f84a5cb2
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [6543/11250] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-004-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081245.FdsknFA4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081245.FdsknFA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312081245.FdsknFA4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier 'STRUCT_HYP_BUFFER_PAGE_SIZE'
      38 |         backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
         |                        ^
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^
   arch/arm64/kvm/hyp_trace.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         | ^
         | static 
   1 warning and 1 error generated.


vim +/STRUCT_HYP_BUFFER_PAGE_SIZE +38 arch/arm64/kvm/hyp_trace.c

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
