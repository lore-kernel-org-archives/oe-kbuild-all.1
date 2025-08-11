Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786D2D6E59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754942365; cv=none; b=jQY3If3uxk6Y72YnQYIB7cQiiB5DUKu8oJNRs/sZQHrk0e7GYeFDq7cVIyhyo4OeY0+PAn62+FwtjnuCJse99fduriMfLTIHVlgmQ+DyCRQZ6y+9l5M+AVaZ2hg3sbgcAlmLE4G0rO4PigmMpeYRQC4bE9LmJ0+HZEaL+e5uAPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754942365; c=relaxed/simple;
	bh=BBeuGYWoFXZOs7zxGtJ7dNqmCuCce3SSsomyJAI2Bg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMNA4uGc+TOEH1E3yYseoG/AHAYhDcl0rYTL6XT2xBdjm/DdiPjDl06/FN7HQZEp4b/97I8PCblpjXr5+wqgHtIytFNn07cCJcCP30ajuF77aJBfuUZshzmj9UO/Pdq6JnbAH/RP9hMZGuJjNnqDYpPlkiErc3Zbvd6maBEzcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6Zaq5Nj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6Zaq5Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754942364; x=1786478364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BBeuGYWoFXZOs7zxGtJ7dNqmCuCce3SSsomyJAI2Bg8=;
  b=I6Zaq5NjR3I12G2le7BtA+f8zOT09BXAhl155VvlbClkXnQfnkIqb1X9
   anR5wirjsiHwYwBaH+wiCb+4DrdB1kynSGdo54GGSpMci9Z0eOUPRio+i
   Oa7ysheIdQkKyK7sKMXS5LABcS423vDzh9CS37LcpmEH2rQ2AsIvaD27s
   OPI8nvfSYDaG01KgnFkc89HsBJWMo0arAPzrb6iMnPmaui3PkEIUtOsfz
   vDRuHiGqJycoy8V3erhJNs+vkMY94W9+D/5eOVCTA9qYJsvz+DTqAw+6L
   wAGgiQd+dAc4ppkvBVaOGiQ5Ih2f3/mS2MG5nOIIOzTMfiYhhc/WbWeul
   A==;
X-CSE-ConnectionGUID: r6Aek+a3SSqY4fUqO+U1cg==
X-CSE-MsgGUID: fbKLYeqERWi7mluBhusAXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59817333"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="59817333"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 12:59:24 -0700
X-CSE-ConnectionGUID: TMmA5tDmQgOvYDO/jhsKtA==
X-CSE-MsgGUID: BtCZS0hQRQS1NeaIbZ1Q8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170221946"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Aug 2025 12:59:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulYfw-0006BE-25;
	Mon, 11 Aug 2025 19:59:20 +0000
Date: Tue, 12 Aug 2025 03:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 15/22] drivers/platform/x86/intel/vsec.c:636:20:
 warning: 'info' is used uninitialized
Message-ID: <202508120326.VLgSmb5t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/l1k/linux aer_reset_v1
head:   c15c36116f28d4140610e9adc79a2e6d1ac44b70
commit: b5ca27e962b7ddf6259461fb7409b7f6bb994d0d [15/22] platform/x86/intel/vsec: Fix enable_cnt imbalance on PCIe error recovery
config: x86_64-buildonly-randconfig-003-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120326.VLgSmb5t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120326.VLgSmb5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120326.VLgSmb5t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/intel/vsec.c: In function 'intel_vsec_pci_init':
>> drivers/platform/x86/intel/vsec.c:636:20: warning: 'info' is used uninitialized [-Wuninitialized]
     636 |         num_caps = hweight_long(info->caps);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/intel/vsec.c:629:42: note: 'info' was declared here
     629 |         struct intel_vsec_platform_info *info;
         |                                          ^~~~


vim +/info +636 drivers/platform/x86/intel/vsec.c

1f3855ea7d6b03 David E. Box    2025-07-02  625  
b5ca27e962b7dd Lukas Wunner    2025-08-04  626  static int intel_vsec_pci_init(struct pci_dev *pdev)
a3c8f906ed5fc1 David E. Box    2021-12-07  627  {
b5ca27e962b7dd Lukas Wunner    2025-08-04  628  	struct vsec_priv *priv = pci_get_drvdata(pdev);
a3c8f906ed5fc1 David E. Box    2021-12-07  629  	struct intel_vsec_platform_info *info;
1f3855ea7d6b03 David E. Box    2025-07-02  630  	int run_once = 0;
8a67d4b49bbdeb David E. Box    2025-07-02  631  	bool found_any = false;
b5ca27e962b7dd Lukas Wunner    2025-08-04  632  	int num_caps;
a3c8f906ed5fc1 David E. Box    2021-12-07  633  
936874b77dd0a8 Gayatri Kammela 2022-06-29  634  	pci_save_state(pdev);
dc957ab6aa05c1 David E. Box    2025-07-02  635  
8a67d4b49bbdeb David E. Box    2025-07-02 @636  	num_caps = hweight_long(info->caps);
8a67d4b49bbdeb David E. Box    2025-07-02  637  	while (num_caps--) {
8a67d4b49bbdeb David E. Box    2025-07-02  638  		found_any |= intel_vsec_get_features(pdev, info);
8a67d4b49bbdeb David E. Box    2025-07-02  639  
8a67d4b49bbdeb David E. Box    2025-07-02  640  		if (priv->found_caps == info->caps)
8a67d4b49bbdeb David E. Box    2025-07-02  641  			break;
1f3855ea7d6b03 David E. Box    2025-07-02  642  
1f3855ea7d6b03 David E. Box    2025-07-02  643  		if (!run_once) {
1f3855ea7d6b03 David E. Box    2025-07-02  644  			intel_vsec_skip_missing_dependencies(pdev);
1f3855ea7d6b03 David E. Box    2025-07-02  645  			run_once = 1;
1f3855ea7d6b03 David E. Box    2025-07-02  646  		}
8a67d4b49bbdeb David E. Box    2025-07-02  647  	}
8a67d4b49bbdeb David E. Box    2025-07-02  648  
8a67d4b49bbdeb David E. Box    2025-07-02  649  	if (!found_any)
a3c8f906ed5fc1 David E. Box    2021-12-07  650  		return -ENODEV;
a3c8f906ed5fc1 David E. Box    2021-12-07  651  
a3c8f906ed5fc1 David E. Box    2021-12-07  652  	return 0;
a3c8f906ed5fc1 David E. Box    2021-12-07  653  }
a3c8f906ed5fc1 David E. Box    2021-12-07  654  

:::::: The code at line 636 was first introduced by commit
:::::: 8a67d4b49bbdebcd255abde9e652092c3de3b657 platform/x86/intel/vsec: Add device links to enforce dependencies

:::::: TO: David E. Box <david.e.box@linux.intel.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
