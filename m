Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763631FA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209221; cv=none; b=W1FlyZf8E988Yg/N/+tk8s+wGXUnByVrsj6yuLNzEZ+6uxMv/LnDgG3W5jhkaGdMXzNa2aToEEEdNjL1LDoRxHKI/grGxI5A98Q1OsSET8QamGv3eXf1Q1IhYE7GwKNOqRdha58a81LXzBihS0NMSYpd5T1YHQHSvv3n4yqHgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209221; c=relaxed/simple;
	bh=XpXH1a1EHT3qU8Y1JEqqB2K3x6wWZKja9/Qr3xBHJOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZF0BG/kOPEGd6+LS76hzBhPvgr9GLXv7Vf3zxd4HZhNS370s6cBIljkIytGVY290uoP4NADRe8lQ+YuXAqgRxC2o5JJ0KNaaTRT9qJH4B8Y0Wvrgqia9UUFWDFmYgWqRTnJiq+oeV7LqGIiZHAYaVrWbjrNNT8JIDJvhYXwXjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8K6LecA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8K6LecA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709209219; x=1740745219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XpXH1a1EHT3qU8Y1JEqqB2K3x6wWZKja9/Qr3xBHJOo=;
  b=a8K6LecAa8JEorisQkZ98u+Z3AQ05Laz9Va1TyHy6FdQ+aCIVo3SYocI
   /YqS7Yq6bSO4uIlYWx2bAbzsLrqbFcUNtexoTECwa4Bcipwo065DMx1bg
   ScVLm0MfNPc2FGbxe4cn8iF3aEQORVkFw6FiP4MWBkhMkpbO8GVXw3H8g
   FsqhH2SKE2eu9uKBcCaJILHpgv7/vobKGzeLGRXSztGZj7rmM8pnVcIMU
   SAk+/HqYdkTIN992NHA1+7gTO+bJqWDq2wQZTlpIk8CfT/IfnYFIWW3Zx
   kegqlkAL7zPMw2MYQZkfPUXHEY98ZcIolGHiBNO/SvY8lAAGoV9NpR9LW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3520040"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3520040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:20:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7680956"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 04:20:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rffOR-000CvL-1D;
	Thu, 29 Feb 2024 12:20:09 +0000
Date: Thu, 29 Feb 2024 20:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 36/36] arch/x86/coco/tdx/filter.c:126:33:
 warning: unused variable 'pdev'
Message-ID: <202402292034.5PqAPooQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   765f146fe3ca453ecbec8aaa4545f82f6878c488
commit: 765f146fe3ca453ecbec8aaa4545f82f6878c488 [36/36] tdx: Fix wrong pci device error state setting from filter
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240229/202402292034.5PqAPooQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292034.5PqAPooQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292034.5PqAPooQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/coco/tdx/filter.c: In function 'authorized_node_match':
>> arch/x86/coco/tdx/filter.c:126:33: warning: unused variable 'pdev' [-Wunused-variable]
     126 |                 struct pci_dev *pdev = to_pci_dev(dev);
         |                                 ^~~~


vim +/pdev +126 arch/x86/coco/tdx/filter.c

10ed08896cf831 Sebastien Boeuf            2022-09-01   98  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21   99  static bool authorized_node_match(struct device *dev,
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  100  				  struct authorize_node *node)
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  101  {
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  102  	int i;
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  103  
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  104  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  105  	/* If bus matches "ALL" and dev_list is NULL, return true */
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  106  	if (!strcmp(node->bus, "ALL") && !node->dev_list)
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  107  		return true;
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  108  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  109  	/*
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  110  	 * Since next step involves bus specific comparison, make
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  111  	 * sure the bus name matches with filter node. If not
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  112  	 * return false.
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  113  	 */
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  114  	if (strcmp(node->bus, dev->bus->name))
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  115  		return false;
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  116  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  117  	/* If dev_list is NULL, allow all and return true */
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  118  	if (!node->dev_list)
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  119  		return true;
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  120  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  121  	/*
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  122  	 * Do bus specific device ID match. Currently only PCI
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  123  	 * and ACPI bus is supported.
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  124  	 */
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  125  	if (dev_is_pci(dev)) {
3106226f028497 Andi Kleen                 2021-11-10 @126  		struct pci_dev *pdev = to_pci_dev(dev);
3106226f028497 Andi Kleen                 2021-11-10  127  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  128  		if (pci_match_id((struct pci_device_id *)node->dev_list,
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  129  				 to_pci_dev(dev)))
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  130  			return true;
3106226f028497 Andi Kleen                 2021-11-10  131  
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  132  	} else if (dev_is_acpi(dev)) {
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  133  		for (i = 0; i < ARRAY_SIZE(acpi_allow_hids); i++) {
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  134  			if (!strncmp(acpi_allow_hids[i], dev_name(dev),
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  135  						strlen(acpi_allow_hids[i])))
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  136  				return true;
6b2e047f2a73b4 Kuppuswamy Sathyanarayanan 2022-03-13  137  		}
10ed08896cf831 Sebastien Boeuf            2022-09-01  138  	} else if (dev_is_platform(dev)) {
10ed08896cf831 Sebastien Boeuf            2022-09-01  139  		for (i = 0; i < ARRAY_SIZE(platform_allow_hids); i++) {
10ed08896cf831 Sebastien Boeuf            2022-09-01  140  			if (!strncmp(platform_allow_hids[i], dev_name(dev),
10ed08896cf831 Sebastien Boeuf            2022-09-01  141  						strlen(platform_allow_hids[i])))
10ed08896cf831 Sebastien Boeuf            2022-09-01  142  				return true;
10ed08896cf831 Sebastien Boeuf            2022-09-01  143  		}
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  144  	}
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  145  
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  146  	return false;
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  147  }
e621120050dd06 Kuppuswamy Sathyanarayanan 2021-09-21  148  

:::::: The code at line 126 was first introduced by commit
:::::: 3106226f028497f0e1ed0f1072bc442a84147c03 tdx: Add basic pci config space filter

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
