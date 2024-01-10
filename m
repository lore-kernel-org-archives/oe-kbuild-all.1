Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F814F880
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9e92C2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704921696; x=1736457696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixSNYRRThROghBuDMo+Dc5zY4pf61FMAGhnVtdCKkQ8=;
  b=K9e92C2zjhGHvR3qYhYCXAC/yffwsa6qJ2KwQDdypAQtGHMITeuJmtoR
   h8NM8hMIqxyuKNXyGQyTyKPYVSMduPv12ZCEnZjY+pqAYG5Jif7KO6leQ
   eaMAReMDtmKz4hXODq+2lCcGvaLyWRon7XZr1S3txLkFLkxqQOu0GJ+3h
   6ycYntoBHiIgPBHSf2gC3RWh71/KeMCCVD7Mi2bVNGZyWLbOpsz4rbStY
   389SlEhylBGM0f71rVWo/CaRyDTCSv2V9dWXFJNJedR82fqxG9BOLcLDV
   586gqUER2BO0X4Tp+sgOsGJXes3LHLLlnsR47/DKSbkDeDmEiH/zsF+uP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="398349898"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="398349898"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 13:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="785745093"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="785745093"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jan 2024 13:21:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNg0x-0007VC-37;
	Wed, 10 Jan 2024 21:21:31 +0000
Date: Thu, 11 Jan 2024 05:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [ls-zhu:v6.7-rc6-tdx 233/264] lib/x86_64/tdx/tdx_util.c:402:27:
 error: 'struct kvm_userspace_memory_region2' has no member named 'gmem_fd'
Message-ID: <202401110525.ZGmgThCp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ackerley,

First bad commit (maybe != root cause):

tree:   https://github.com/ls-zhu/linux v6.7-rc6-tdx
head:   ffe2774ac14a3b9d7cc50ad2a6f9a549755dc245
commit: 3bff324aa8c4e339af49c49aceda04369042ce61 [233/264] KVM: selftests: TDX: Update load_td_memory_region for VM memory backed by guest memfd
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110525.ZGmgThCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110525.ZGmgThCp-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/x86_64/tdx/tdx_util.c:98: warning: "XFEATURE_MASK_LBR" redefined
      98 | #define XFEATURE_MASK_LBR (1 << XFEATURE_LBR)
         | 
   In file included from lib/x86_64/tdx/tdx_util.c:15:
   include/x86_64/processor.h:77: note: this is the location of the previous definition
      77 | #define XFEATURE_MASK_LBR               BIT_ULL(15)
         | 
   lib/x86_64/tdx/tdx_util.c: In function 'tdx_check_attributes':
   lib/x86_64/tdx/tdx_util.c:141:9: warning: implicit declaration of function 'ASSERT_EQ'; did you mean 'TEST_ASSERT_EQ'? [-Wimplicit-function-declaration]
     141 |         ASSERT_EQ(attributes & ~tdx_cap->attrs_fixed0, 0);
         |         ^~~~~~~~~
         |         TEST_ASSERT_EQ
   lib/x86_64/tdx/tdx_util.c: In function 'load_td_memory_region':
>> lib/x86_64/tdx/tdx_util.c:402:27: error: 'struct kvm_userspace_memory_region2' has no member named 'gmem_fd'
     402 |         if (region->region.gmem_fd != -1)
         |                           ^
   lib/x86_64/tdx/tdx_util.c:418:35: error: 'struct kvm_userspace_memory_region2' has no member named 'gmem_fd'
     418 |                 if (region->region.gmem_fd == -1) {
         |                                   ^
   lib/x86_64/tdx/tdx_util.c:431:35: error: 'struct kvm_userspace_memory_region2' has no member named 'gmem_fd'
     431 |                 if (region->region.gmem_fd == -1)
         |                                   ^
   lib/x86_64/tdx/tdx_util.c: In function 'td_create':
   lib/x86_64/tdx/tdx_util.c:451:22: error: 'KVM_X86_PROTECTED_VM' undeclared (first use in this function); did you mean 'KVM_X86_SW_PROTECTED_VM'?
     451 |         shape.type = KVM_X86_PROTECTED_VM;
         |                      ^~~~~~~~~~~~~~~~~~~~
         |                      KVM_X86_SW_PROTECTED_VM
   lib/x86_64/tdx/tdx_util.c:451:22: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
