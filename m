Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372303BB23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720980688; cv=none; b=E/ysjh2++11i/t0Lp/lVOuR+LDRW0pCvbmpMozksdrhMRxsZbcBpHN6Yzd/kMHv3oCBuobYudURCIc+UrwEbMGXyOuozk9pHwig8bX/s1wnu40AdtItMXX2jYUXNHBNIGew3eu5+Li4I4lN2f33OTBdHgtt4be7YL/hJ+PS+Gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720980688; c=relaxed/simple;
	bh=OU14h7GzqNX5jEm9Wvd7Gc+gN5JV0yaWcRBkINoGaYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dODUlNKTtRdMIwTdcI1BDwfKVVOP5Uru1SfwMbx6B78RXonpqcJfEfZjg7Q/ywGtODoxs/7g4RJcIVjptGdgE1eR4HGOayCOKcBHa/NI52Lf602gcjbTqtjyC3AXaXxEwSRDeMu7ECAbZyvwJu9n8paJqszEB3srO7zcBJdlxVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/Q7HVQA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/Q7HVQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720980686; x=1752516686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OU14h7GzqNX5jEm9Wvd7Gc+gN5JV0yaWcRBkINoGaYQ=;
  b=W/Q7HVQAaK3y8NAHJc5bmPH/lQeJ8Y2KXimnhV3LXnLckJxqu1+cI/u2
   DtTXzSdgNfXjKCcjCQGxNMqRxyiy1omocYy5ThrP2TXkgkedE2oVY3Ukj
   k939TlAt0mbvGMKDco6khSc0CkPGxNBlbkC1tx5FE04TYOgSx0oFQHZ7j
   ymViEWtV+PX6P35G45yCjeg/Sl71ZYBkWKSzD5zLMjOaQexvVshwSFgkW
   zwahuLFAEYW7GLlCBtvHPyJtdmhEPDwWqT1FgYXXfjsBXYVK6xaAeEbBl
   zL9qt4dUrG1VV4KWo0isAm+2WvijjhqcNrQ9Jq9gj0N2OFcBbewfeWYKC
   A==;
X-CSE-ConnectionGUID: VoKxXoTkSQWuHvryDvjwoQ==
X-CSE-MsgGUID: AImF5GFCTR2+6KKcpjxuRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18555739"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18555739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 11:11:25 -0700
X-CSE-ConnectionGUID: /404EdxMQXm2cWyX3/RNuA==
X-CSE-MsgGUID: uBm6moO8S4CS382qkC2x6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="54580160"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jul 2024 11:11:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT3gw-000dec-0I;
	Sun, 14 Jul 2024 18:11:22 +0000
Date: Mon, 15 Jul 2024 02:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240714 22/22]
 drivers/vfio/pci/vfio_pci.c:85:13: warning: 'vfio_pci_is_denylisted' defined
 but not used
Message-ID: <202407150254.upyjcJmJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240714
head:   d39032654710dfe496616b6df763fa99ba89021d
commit: d39032654710dfe496616b6df763fa99ba89021d [22/22] vfio/pci: Report PASID capability to userspace
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240715/202407150254.upyjcJmJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150254.upyjcJmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150254.upyjcJmJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci.c:85:13: warning: 'vfio_pci_is_denylisted' defined but not used [-Wunused-function]
      85 | static bool vfio_pci_is_denylisted(struct pci_dev *pdev)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/vfio_pci_is_denylisted +85 drivers/vfio/pci/vfio_pci.c

ff53edf6d6ab09 Max Gurtovoy 2021-08-26   84  
ff53edf6d6ab09 Max Gurtovoy 2021-08-26  @85  static bool vfio_pci_is_denylisted(struct pci_dev *pdev)
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   86  {
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   87  	if (!vfio_pci_dev_in_denylist(pdev))
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   88  		return false;
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   89  
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   90  	if (disable_denylist) {
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   91  		pci_warn(pdev,
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   92  			 "device denylist disabled - allowing device %04x:%04x.\n",
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   93  			 pdev->vendor, pdev->device);
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   94  		return false;
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   95  	}
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   96  
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   97  	pci_warn(pdev, "%04x:%04x exists in vfio-pci device denylist, driver probing disallowed.\n",
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   98  		 pdev->vendor, pdev->device);
ff53edf6d6ab09 Max Gurtovoy 2021-08-26   99  
ff53edf6d6ab09 Max Gurtovoy 2021-08-26  100  	return true;
ff53edf6d6ab09 Max Gurtovoy 2021-08-26  101  }
ff53edf6d6ab09 Max Gurtovoy 2021-08-26  102  

:::::: The code at line 85 was first introduced by commit
:::::: ff53edf6d6ab0970f86595b3f5d179df51848723 vfio/pci: Split the pci_driver code out of vfio_pci_core.c

:::::: TO: Max Gurtovoy <mgurtovoy@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
