Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8217996
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743217222; cv=none; b=mwpdVNkBaKxTDFYuwUz+vAJ9v3gXngqBmIL48WxAxzu2JrxhyS0gyVG38Vh9kklSDAQmc+78i917a9gVPL4JAi1tclPnazdFFwbFChE9WwtcyO7cf6/+R9oGhNav1c9wFhr39JQ0DtR5mlrXq7mZz4v+t5ykqChz8efK7WXOP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743217222; c=relaxed/simple;
	bh=IXbFgV2toDLyFxlN2BcwT8wiQo/s/XFbd7LvBGbQHe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ymyu9AQ5rO58zI6lMaXJircIsz4XiCLOFryCX9nGeocWDVLERwetfOW688pt6RC7wDEYlfYVOdq8Wpy+J/ZFA0s+v1Bb2/0dOUr65dw6p9fHY/aXUyS7dDUBQ53CnFp3/K+6mktEq67a6SLR4OWFGnIaQp8cuL5yxN9PdRn9Wyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4QKj6mQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4QKj6mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743217220; x=1774753220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXbFgV2toDLyFxlN2BcwT8wiQo/s/XFbd7LvBGbQHe8=;
  b=a4QKj6mQXaAco8ckzQZzvJkb6jX5IHRCrefCoY3fAyGO+O3qIfNCuKgH
   l6+4Gd2f6K0lUu7DYvBotdzV/Clat7YMKmHe5rNwxQAtdfoVwVD6lf9S6
   NRWv1aHjLMT4s8Gh7B+ZrTn/lqxxSVTjeJHVUFxKLhricmcI7MaWlHZtE
   Au4uVoVOnFQVCooejk/7HyJyhCi4QTk8FVgwx+Ty+hKgQHt9qIWqDBazn
   AAThThbQ/kiDvOWxaJjY62FJARGcqaK6Y43tAZEsSpFFwLIVrP32gPef7
   tBOi0LqFv9M4abQPARslk/+oocKvPVcM2zr5zUNH33Lns+NRAehmh5CRL
   w==;
X-CSE-ConnectionGUID: R4FE7h3vTvq4l6k3wOnLRw==
X-CSE-MsgGUID: PWQenwByQNCMJpvMzsnZrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44498822"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44498822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 20:00:19 -0700
X-CSE-ConnectionGUID: dW6geo3hSbueAH5wfTWELg==
X-CSE-MsgGUID: oiNjGvfURp+xRfG+MuzYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="156536754"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2025 20:00:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyMQh-0007rh-32;
	Sat, 29 Mar 2025 03:00:15 +0000
Date: Sat, 29 Mar 2025 10:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 71/72]
 arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:892:17: error:
 unknown type name 'u128'
Message-ID: <202503291028.YXCWKQE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   4f099563d661ed8fc857fa56cae7425fa4ad306d
commit: bbe82c73f0093dfe41aecd96de0fa95b6a014be9 [71/72] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: i386-buildonly-randconfig-004-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291028.YXCWKQE5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291028.YXCWKQE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291028.YXCWKQE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:31:
>> arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:892:17: error: unknown type name 'u128'
     892 |                 u128 data128[2];
         |                 ^~~~
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:1053:17: error: unknown type name 'u128'
    1053 |                 u128 irte;
         |                 ^~~~


vim +/u128 +892 arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h

8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  885  
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  886  /*
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  887   * Structure defining one entry in the device table
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  888   */
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  889  struct dev_table_entry {
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18  890  	union {
ee6c28684585a6 drivers/iommu/amd_iommu_types.h     Joerg Roedel          2011-11-09  891  		u64 data[4];
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18 @892  		u128 data128[2];
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18  893  	};
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  894  };
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  895  

:::::: The code at line 892 was first introduced by commit
:::::: 8b3f78733814b180089a400743b6f19d118aec62 iommu/amd: Introduce helper function to update 256-bit DTE

:::::: TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
