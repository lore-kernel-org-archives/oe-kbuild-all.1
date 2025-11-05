Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45DE3F9FB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333340; cv=none; b=TJM9xsxpQQIu3x5pkh78cocd+KEd9AdBoP9B9Pet6zSKHve90Xgjj2GXeN9APDNX7tWAtYtaROSThf9oq+BOkz1x10ZoqurYB8MWX758Qx251yyKIRqZVbCJJgLTbdfUaL2ZFLntplaDG/g7HUJCyRzjoDB/FI9ZTD7mJC7Rzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333340; c=relaxed/simple;
	bh=xpzCbyFk9aBQRewO8JvVIvUjJRxnCDiXM29nOuOa4VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZtGQJHMRVhPbGWPexYAEhgIMt4I3+eVlfplQbw2SCPiMQ08S5deSNqXHq3qZkDHzdbUHpWbYUn8byE4jHGg2IgvBJWkcAMIwbaaDpTl23pPwwPEO4Vz2rpr/ZFLZ6ZR8K4Xfzfk6fU9UZkTNtbqFRKSkab/IQKkBochQe0rke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoRereab; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoRereab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762333339; x=1793869339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpzCbyFk9aBQRewO8JvVIvUjJRxnCDiXM29nOuOa4VI=;
  b=QoRereabvQynzgf/G8DTfrruLs4bfTYMkBf3n85TtayjaDda9ZYuS3UF
   gaQiVhJwvHyUqHfcJsdqLDyzaYsoAtqngfU7BqrCLtcoiWz8FY1VT2sDc
   lN3YQeWFO8iDyb2mLPIo0WNWVyOhxLUk1tNsxQgH1sR0gahMFQOF93cyj
   VgHq2010T4A0sPpPiE8ZKzaiR9puv/KYDS0ABH1CVVk7BV/5G5Xte50uZ
   yNON7GuRltIJmvgN40muZSewS5pxzrlhht3mQDvoNZccGr5KQoYJOGitL
   1U38eGBi4UCj9ZViBQnbGjj1/95AVIbGp60c+DbL27JTx/brQi621tAYl
   A==;
X-CSE-ConnectionGUID: y6tv0mnTQXe7TWp0YAchnA==
X-CSE-MsgGUID: Eq8jlOICT3evi6Z8gFr+6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75047440"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="75047440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:02:18 -0800
X-CSE-ConnectionGUID: sPXkg+7kT7ysYY0aPPds6A==
X-CSE-MsgGUID: vWcJxFTXRgi+uHEcTuZ4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="188126363"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2025 01:02:17 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGZPD-000SLM-0C;
	Wed, 05 Nov 2025 09:02:15 +0000
Date: Wed, 5 Nov 2025 17:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/6 v7] ACPI: extlog: Trace CPER CXL Protocol Error
 Section
Message-ID: <202511051610.Shh8WKBG-lkp@intel.com>
References: <20251104182446.863422-7-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104182446.863422-7-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on c9cfc122f03711a5124b4aafab3211cf4d35a2ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251105-022733
base:   c9cfc122f03711a5124b4aafab3211cf4d35a2ac
patch link:    https://lore.kernel.org/r/20251104182446.863422-7-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 6/6 v7] ACPI: extlog: Trace CPER CXL Protocol Error Section
config: x86_64-buildonly-randconfig-006-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051610.Shh8WKBG-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051610.Shh8WKBG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051610.Shh8WKBG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/pci.c:10:
   drivers/cxl/cxlpci.h: In function 'cxl_pci_flit_256':
   drivers/cxl/cxlpci.h:126:9: error: implicit declaration of function 'pcie_capability_read_word' [-Werror=implicit-function-declaration]
     126 |         pcie_capability_read_word(pdev, PCI_EXP_LNKSTA2, &lnksta2);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/pci.c: In function 'devm_cxl_port_enumerate_dports':
   drivers/cxl/core/pci.c:143:9: error: implicit declaration of function 'pci_walk_bus' [-Werror=implicit-function-declaration]
     143 |         pci_walk_bus(bus, match_add_dports, &ctx);
         |         ^~~~~~~~~~~~
   drivers/cxl/core/pci.c: In function 'cxl_pci_get_latency':
   drivers/cxl/core/pci.c:1059:14: error: implicit declaration of function 'pcie_link_speed_mbps'; did you mean 'pcie_get_speed_cap'? [-Werror=implicit-function-declaration]
    1059 |         bw = pcie_link_speed_mbps(pdev);
         |              ^~~~~~~~~~~~~~~~~~~~
         |              pcie_get_speed_cap
   drivers/cxl/core/pci.c: In function 'cxl_gpf_get_dvsec':
>> drivers/cxl/core/pci.c:1149:17: error: implicit declaration of function 'pci_find_dvsec_capability'; did you mean 'pci_find_ext_capability'? [-Werror=implicit-function-declaration]
    1149 |         dvsec = pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pci_find_ext_capability
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCIEAER
   Depends on [n]: PCI [=n] && PCIEPORTBUS [=n]
   Selected by [m]:
   - ACPI_EXTLOG [=m] && ACPI [=y] && X86_MCE [=y] && X86_LOCAL_APIC [=y]
   WARNING: unmet direct dependencies detected for CXL_BUS
   Depends on [n]: PCI [=n]
   Selected by [m]:
   - ACPI_EXTLOG [=m] && ACPI [=y] && X86_MCE [=y] && X86_LOCAL_APIC [=y]


vim +1149 drivers/cxl/core/pci.c

a52b6a2c1c997b Davidlohr Bueso 2025-01-24  1135  
36aace15d9bdcf Li Ming         2025-03-23  1136  u16 cxl_gpf_get_dvsec(struct device *dev)
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1137  {
36aace15d9bdcf Li Ming         2025-03-23  1138  	struct pci_dev *pdev;
36aace15d9bdcf Li Ming         2025-03-23  1139  	bool is_port = true;
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1140  	u16 dvsec;
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1141  
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1142  	if (!dev_is_pci(dev))
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1143  		return 0;
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1144  
36aace15d9bdcf Li Ming         2025-03-23  1145  	pdev = to_pci_dev(dev);
36aace15d9bdcf Li Ming         2025-03-23  1146  	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ENDPOINT)
36aace15d9bdcf Li Ming         2025-03-23  1147  		is_port = false;
36aace15d9bdcf Li Ming         2025-03-23  1148  
36aace15d9bdcf Li Ming         2025-03-23 @1149  	dvsec = pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1150  			is_port ? CXL_DVSEC_PORT_GPF : CXL_DVSEC_DEVICE_GPF);
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1151  	if (!dvsec)
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1152  		dev_warn(dev, "%s GPF DVSEC not present\n",
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1153  			 is_port ? "Port" : "Device");
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1154  	return dvsec;
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1155  }
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1156  EXPORT_SYMBOL_NS_GPL(cxl_gpf_get_dvsec, "CXL");
021b7e42fa7bc2 Davidlohr Bueso 2025-02-20  1157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
