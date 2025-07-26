Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798CD28682
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753511357; cv=none; b=QdWkOfc6Er+VMe1KYfXtkD3aAOpR5rf6MW06/aSXRne2d91YqPhTwcy7q34Uz6WgHPfnYA4gyJrx9yVOHwGLCqzT2vEXmXGJDjj2OZRqC7Ogu8ngq233zlXjMXEdDUwb9gB6UgwsP+/qMIs0PXWsV3tG3MCyYzGyJ/K8tkOcv9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753511357; c=relaxed/simple;
	bh=Q1UepaPvxWbwucw2XL96odCtpC4nU3z3AzbyFVU1R0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mf9XQjISEv/5j+S8gs0bIqLeKspiXc3eZWawq3R2FVmmACdVf0pvH6s0irf2u/lTl7hcuofQcCtiU9JOauN9uCjCta5w+KcoWTE9L1W/NIieeMVbljpBs6lwS/ae0ByPNnNDA4MMyduhqd2TRCC8OvlGX2Isb5Nywp3I/obiNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DY9gRPCj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DY9gRPCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753511355; x=1785047355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1UepaPvxWbwucw2XL96odCtpC4nU3z3AzbyFVU1R0w=;
  b=DY9gRPCjqWhbxzPOlMbJR0F0u4OpS5XNHbrNH3+VMJPPKdP9m9DqRfmR
   4TDcPpJMltnNEfQcjRuLjQbtKM0D7f9/yk24uD5APHoHtWHj+DtojDvXL
   QBA6YP9HrBog+1Otna1ZQbswFd7aK+jNbjktL5/sTeg8Eb4KHX0A8KDLl
   /62ZpSUMb1JDbfa5JcaROYhJcwwP6KFaSi7Vrqx1ztk1PG+c4KHxR+knq
   JbnygCTlxDDKNUKQEN3lgNoOSl0L1dd0gzqqLtbdHjpptCBjhTdSOXsT3
   obnoTe5N67OZFNzpGmBwMMzrpFOmVZPIB9qevK0YOoVGAF53Pp0FtQSjS
   g==;
X-CSE-ConnectionGUID: 84DmRJyRSxui2JR89lmmng==
X-CSE-MsgGUID: oJ2yKmHKRUiHC6TY9KuxKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="67192106"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67192106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 23:29:14 -0700
X-CSE-ConnectionGUID: 7sTSacF+RYag1kXyw3oMkQ==
X-CSE-MsgGUID: vfWxupD2SnW/vl/HKC2Oow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161060773"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 25 Jul 2025 23:29:13 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufYP9-0000F9-1J;
	Sat, 26 Jul 2025 06:29:11 +0000
Date: Sat, 26 Jul 2025 08:28:24 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 92/112] include/linux/pci.h:2073:6: warning: no
 previous prototype for 'pci_reachable_set'
Message-ID: <202507260808.shBvt0dl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   aea452cc27ca9e5169f7279d7b524190c39e7260
commit: 186070c6c42a9a2d11dea2ee55891fd7d9ea1ccf [92/112] PCI: Add pci_reachable_set()
config: arm-randconfig-2002-20250720 (https://download.01.org/0day-ci/archive/20250726/202507260808.shBvt0dl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507260808.shBvt0dl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507260808.shBvt0dl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/hwmon.c:22:
>> include/linux/pci.h:2073:6: warning: no previous prototype for 'pci_reachable_set' [-Wmissing-prototypes]
    void pci_reachable_set(struct pci_dev *start, struct pci_alias_set *devfns,
         ^~~~~~~~~~~~~~~~~
   include/linux/pci.h:2078:24: warning: no previous prototype for 'pci_bus_isolated' [-Wmissing-prototypes]
    enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
                           ^~~~~~~~~~~~~~~~
   include/linux/pci.h: In function 'pci_bus_isolated':
   include/linux/pci.h:2079:10: error: 'PCI_NON_ISOLATED' undeclared (first use in this function); did you mean 'PCIE_NON_ISOLATED'?
    { return PCI_NON_ISOLATED; }
             ^~~~~~~~~~~~~~~~
             PCIE_NON_ISOLATED
   include/linux/pci.h:2079:10: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/pci.h:2079:1: warning: control reaches end of non-void function [-Wreturn-type]
    { return PCI_NON_ISOLATED; }
    ^


vim +/pci_reachable_set +2073 include/linux/pci.h

  2072	
> 2073	void pci_reachable_set(struct pci_dev *start, struct pci_alias_set *devfns,
  2074			       bool (*reachable)(struct pci_dev *deva,
  2075						 struct pci_dev *devb))
  2076	{ }
  2077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
