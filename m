Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ABE25393B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 02:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271308; cv=none; b=RXcExrwzW8NmoEsqpeFMOROmO39F2mZT7B8OlcVqCvy+Y42GPhEZx/zSYBbCtEKJK0Y3gsCoZtMHIyCCsHypT/cFZ9Os7+QJ/hAe/RzJpqiBj5ruThjkMTqkWBHC/oYpGdrGcBQ6w4zpEH4N14b1qYcSGKU6YiGMFX3MFNtCYqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271308; c=relaxed/simple;
	bh=YUgVSeUA/8CTaYWTMBE856Vpz1T0v3KAk9ruq/Cqcx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kO/gQmHc3hou7dKlFNN4BiHoclI5rtrukIFwvFzz94uS41v0pTlbf3aDFka+7yqdGMADLptRV8PZHIfNUGNpTGvykfYUyz3pXB8C9wjMljf/13TCmPk9yVe4c3Ol17JmBhUG467F9I8mVJ9mcRFZOk3YdtnKsTvTFIkVt63lwgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVg0l8QU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVg0l8QU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768271307; x=1799807307;
  h=date:from:to:cc:subject:message-id;
  bh=YUgVSeUA/8CTaYWTMBE856Vpz1T0v3KAk9ruq/Cqcx4=;
  b=EVg0l8QU54Pi80dOWjJbFSd/YHUts22E1sLvFKODRnteY7l7YO7CK++Y
   QJuNVSDIl/v/NF+z+aB63zfkvPBAqySBVdg3cTbCilJVAmIB+N1JBoYmF
   7iSMTVjHyHqBJArD+RpnsLil1bW0W/zYdgQ840F369MQ+OAck+ahdR0oR
   JxcBc7BLBw4TIaf4Ni0kuIp4JIjTcdNMjsziOZRLFIXPSnTyyG0kIDZxG
   4b4BaDMnoT8ToiUQPsUg99e8pQOtH2zmCcFbXBRYWSyfyuHO50Jja7Bfu
   PutxowSSA32KUviYsPizOGnTE6XeGcT4ymwvBupHtdHfRtrCKOruQlmeb
   g==;
X-CSE-ConnectionGUID: qRSPm6CxTNiE/+BHh6LdGw==
X-CSE-MsgGUID: zucltjOjQs2hvcKJPobYbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69537997"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69537997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:28:27 -0800
X-CSE-ConnectionGUID: uBi0MN17SG2L5r7DMCfCqA==
X-CSE-MsgGUID: UJEDWCl6SzeD6mSbImNL8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208414571"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 18:28:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfU8s-00000000E6W-3GmB;
	Tue, 13 Jan 2026 02:28:22 +0000
Date: Tue, 13 Jan 2026 10:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:slf/mercury_test 1/5]
 arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:817:17: error:
 unknown type name 'u128'
Message-ID: <202601131048.yDtytwl8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux slf/mercury_test
head:   ee15dac15976899b3b20ee0300633c984be79a91
commit: e27bbe8a422c0f45db71dd9eb2e2a064c61d0107 [1/5] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: i386-randconfig-004-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131048.yDtytwl8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131048.yDtytwl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131048.yDtytwl8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:32:
>> arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:817:17: error: unknown type name 'u128'
     817 |                 u128 data128[2];
         |                 ^~~~
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:982:17: error: unknown type name 'u128'
     982 |                 u128 irte;
         |                 ^~~~


vim +/u128 +817 arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h

8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  810  
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  811  /*
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  812   * Structure defining one entry in the device table
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  813   */
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  814  struct dev_table_entry {
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18  815  	union {
ee6c28684585a6 drivers/iommu/amd_iommu_types.h     Joerg Roedel          2011-11-09  816  		u64 data[4];
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18 @817  		u128 data128[2];
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18  818  	};
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  819  };
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  820  

:::::: The code at line 817 was first introduced by commit
:::::: 8b3f78733814b180089a400743b6f19d118aec62 iommu/amd: Introduce helper function to update 256-bit DTE

:::::: TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
