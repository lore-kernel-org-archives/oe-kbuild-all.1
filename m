Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5117B4FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 23:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726009338; cv=none; b=Yy3GHFH8osxhOI5ulBWewssLNvNfZV9vAtD7Pm8MJUTfAtVkPg4/fQPQhmg0VuC7Ohz9iUuUZhxQvEfW0+fFDz7GIb/lziTh6Bs5J61Pwx9Vjol9wQCb4QQYvtcTZiPUpCjP9WpeJ4Nq55uhwv2sNBVw89/fKsPl5wrTAsLwc2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726009338; c=relaxed/simple;
	bh=MJqmmIu4LD0eanxrCWDYsidBW2Ch6SDvr9a4Ar6PE+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElhGlxdiXWQAtUcl3Eb25cxbxlvprAYHO1zwV61d6s8NL7mnWceeacDFYO71zs2+wTMKSLqtJ8zG02D0QPKXh1YQDWArv3aHNQey40nT8cGn2WUyjSvFnq/ajD5gwWY7C2FQ0WSciCfYJ3nYQzv7cTqIxbdNPI8vCdjFqbkpuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNr1odPr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNr1odPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726009337; x=1757545337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJqmmIu4LD0eanxrCWDYsidBW2Ch6SDvr9a4Ar6PE+Y=;
  b=lNr1odPrFML24GPHHwKneWDQ5lK094IUl7K8tsovfumpXOb8vorKI206
   svFb4FJlZeM4pAOKWwQMDy68e56Zq183kDg0JjqvdpOxzN0PfmiCv9Ijc
   vuqnhEULxCYQ+F40w9aBLtkmmZTU32Cyk/LOP68dsRTd69s34ACzqQIiD
   eBwEtSNV1u2ueQzG03j/U15bQUyc6/JSOQ+2z1Ur92idsMzvFKGG5PJ6+
   ojwLUXq7u7/DX9h/u02/kQ1g/oi0LrvS9uJNzbXnbKJGKwnQF4JTJR9z4
   q4aDAKg+m56riZOscehTr7vwmrGv06ulRj/J3kGifYKCJgMCIbO+iJX/t
   w==;
X-CSE-ConnectionGUID: TvT1ukgARrKfjxqvnvmhlg==
X-CSE-MsgGUID: e1OHKHbWSwuGGg5grERt6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24725147"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24725147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 16:02:16 -0700
X-CSE-ConnectionGUID: jkmk9AqsSGiFSXRviYvVsg==
X-CSE-MsgGUID: CKVEPZRWQfuQ8G0cXKW0uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="97867033"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2024 16:02:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so9sC-0002oG-24;
	Tue, 10 Sep 2024 23:02:12 +0000
Date: Wed, 11 Sep 2024 07:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240910 36/37]
 drivers/pci/ats.c:523: warning: Excess function parameter 'status'
 description in 'pci_pasid_ctrl_status'
Message-ID: <202409110604.2DwF1POv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240910
head:   47bd94563684b36d40cac3c558ca963539dd5980
commit: 9b356346d2c4a9eed8c3e87785f19f944c4098db [36/37] iommufd: Extend IOMMU_GET_HW_INFO to report PASID support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240911/202409110604.2DwF1POv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110604.2DwF1POv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110604.2DwF1POv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/ats.c:523: warning: Excess function parameter 'status' description in 'pci_pasid_ctrl_status'


vim +523 drivers/pci/ats.c

   508	
   509	/**
   510	 * pci_pasid_ctrl_status - Check the PASID status
   511	 * @pdev: PCI device structure
   512	 * @status: The status of PASID capability
   513	 *
   514	 * Returns a negative value when no PASI capability is present.
   515	 * Otherwise the value of the control register is returned.
   516	 * Status reported are:
   517	 *
   518	 * PCI_PASID_CTRL_ENABLE - PASID enabled
   519	 * PCI_PASID_CTRL_EXEC - Execute permission enabled
   520	 * PCI_PASID_CTRL_PRIV - Privileged mode enabled
   521	 */
   522	int pci_pasid_ctrl_status(struct pci_dev *pdev)
 > 523	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
