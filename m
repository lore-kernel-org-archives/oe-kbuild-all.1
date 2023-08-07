Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2545BA40
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691423527; x=1722959527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVKLzrrushSEdPIOaadQo5BPqRmO2n4y934G75JJZ8k=;
  b=jR/5pI+qQq8EUpiL+iwl6ceGBO1fGdDqar0YQ/v4pG1J4yMkE8hvTcqz
   TbNfTg9xdr4CdfytR5Jvl5qUXV0Dt8Gbli32x2QzybEsjcczWJtJrI2bv
   Ibjf696Pa9wsB8zA48hNmylLTEmFXK4E+pTRE7R1EHbKPAdl9GpIt+yS9
   1S8YrQGdBWBe28lRVMY1xS5NoUFgBcYl0+SUxmlrJD7rmr0cKt937Bgqu
   kTpu3Mbza5FOj/7qUlu3MA9iEbXhRQafqOsq5fPtNYTte/vZr59lCwezg
   8Rj8tcllMTFILyYpxxXz26RQfB6Ew14vsxYKz7x09vaQ/UAcnuOY6TW9Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434427553"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="434427553"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 08:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821018766"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="821018766"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2023 08:52:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT2WW-0004jv-2X;
	Mon, 07 Aug 2023 15:52:00 +0000
Date: Mon, 7 Aug 2023 23:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2023-06 6543/10956]
 arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier
 'STRUCT_HYP_BUFFER_PAGE_SIZE'
Message-ID: <202308072320.OssTNOfH-lkp@intel.com>
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
head:   886f4b317ef198a14020e218b2f78cdc9b963b24
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [6543/10956] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r021-20230807 (https://download.01.org/0day-ci/archive/20230807/202308072320.OssTNOfH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308072320.OssTNOfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308072320.OssTNOfH-lkp@intel.com/

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
