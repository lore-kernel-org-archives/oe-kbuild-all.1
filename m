Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40C4414
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 01:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507787; cv=none; b=VuR1drlkc6agVjm9N4QfPTvbL0eOY6YTwv4KWrdKGjAP4nuCEVg/NaDOTF7L/T99FW7ZFiORGzK7qXJ5guA6+X6y/cgSaEEs4AP9F/awliONs8kJ+MohRmQgXIEaIJySrV8Ux7VnVtOJ9pa84m4S1Vn++A3tCgoK6M+lXsPX5Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507787; c=relaxed/simple;
	bh=G5fj72XiEviANNV/8XNBqUyaKbqo1v/lAOfLC1xh45Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pi92GObbWGAvJSdQqI+NObqCLHA5IPHbhzy3ByvfJSYZqAyInEQMOjn2UmkDpsgQPA4z6yRFDu6DAh5byWi/lbHpqTMJDeXn+foC+uHiHyn+ODT9InaTdkYXhtIwJT5PxtH0e/kIGV4ocPDnAXoA6IFMCdsgE8U4YcF2X0BpuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLQDPA9z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLQDPA9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751507785; x=1783043785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5fj72XiEviANNV/8XNBqUyaKbqo1v/lAOfLC1xh45Q=;
  b=gLQDPA9z8Biy/FWhZs4lKFbq1UTqRfgigb3zL+00Ojlmgq2Q4oJ9rNms
   83peuLJqclFMoZRSrJv8l41PcwPqJVbCLeNvRDAR2jpeWbKnPKeWZjSQe
   IOfBHiQE20lKmhqdhr8ZmKf+GVpjJlLr2V3id+OBIRjAqwovHP2LpbmNQ
   fbQ/YvDScLdTVrwhailsqz4124M8rXlW0/9tlFozhQ9PFOkxOKNmzDgW3
   JCkNaVGhaw9h4AGxMTRcYWFQtrYM+Zuq8ukomd7pw3qzv35CDMdMUOzGq
   sJ4x8G6EyYWiTXcWy70b0oxv1QnKgYRQ+1qUAQzmyo71Q8VZerK6RfefX
   Q==;
X-CSE-ConnectionGUID: LB3yqCymStm5ACe+fqMjFA==
X-CSE-MsgGUID: qSG3r1Q+QHWSRBIdd5Ovpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71393610"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="71393610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 18:56:23 -0700
X-CSE-ConnectionGUID: /NkZPhdCQ7K2G2F2M5sbdA==
X-CSE-MsgGUID: WvzIgjoSRrO+ulrPmZ3f0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158798119"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 18:56:23 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX9BU-0001N5-1M;
	Thu, 03 Jul 2025 01:56:20 +0000
Date: Thu, 3 Jul 2025 09:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 3/13] include/linux/pci.h:2075:15:
 error: unknown type name 'truct'
Message-ID: <202507030959.t8kxvpHA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   df8f78cea2b77ef8d5e138f89e58fcb31e575da4
commit: 53e73347d85fb062580a7b31496948e766a1bfcc [3/13] iommu: Compute iommu_groups properly for PCIe switches
config: s390-randconfig-001-20250703 (https://download.01.org/0day-ci/archive/20250703/202507030959.t8kxvpHA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030959.t8kxvpHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030959.t8kxvpHA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/hw_irq.h:6,
                    from include/linux/irq.h:586,
                    from arch/s390/kernel/irq.c:24:
>> include/linux/pci.h:2075:15: error: unknown type name 'truct'
    2075 | static inline truct pci_dev *pci_real_dma_dev(struct pci_dev *dev)
         |               ^~~~~
>> include/linux/pci.h:2075:29: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
    2075 | static inline truct pci_dev *pci_real_dma_dev(struct pci_dev *dev)
         |                             ^


vim +/truct +2075 include/linux/pci.h

  2074	
> 2075	static inline truct pci_dev *pci_real_dma_dev(struct pci_dev *dev)
  2076	{ return dev; }
  2077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
