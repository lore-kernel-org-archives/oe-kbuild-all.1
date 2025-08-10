Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0970808
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754858199; cv=none; b=nNb4dBjc8uiJkIu+IgmN+hvWblxeFNKzMqiqGgygh2F6n1WTPj2CU9Ufhpqxm4pew3Wi1vwSLrk7BCnn5tSUTQgWvg0mh3FO28iwZqMvjDo0iRfhX8ThnmoWADDeIS6yaX+zHHwAZVTXWqu9wU6KKl0JNoTdymIKzD0C/9eoA2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754858199; c=relaxed/simple;
	bh=iY1IaOTqg7LoRtu2vaSgiR2RnoORHzLeVjHSbxIg92o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5ahRDy0+jwUesA66GABroVI6by3geOg6Ny+CkO8ajNqdz2sVOfKYyDTcSDiA3ggAgIzzna+pLRjDMyPlP8D8xAG2R6c5vAuq4HOUiVz+sJjnOAsYFi1JmHydVbC4q+iPZuHPrZHt2yN/Sv2fRS0I9wv+EUzJ2qvBFdvjskzz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eC4ZTGhp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eC4ZTGhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754858198; x=1786394198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iY1IaOTqg7LoRtu2vaSgiR2RnoORHzLeVjHSbxIg92o=;
  b=eC4ZTGhpi1m6666yDSHpSq9S2hiSEA/bI0jzYdHlXxZsWvV47fLsgbmr
   dF1jOCb04SBmZ+ZmpgvJypG8RbG6b3jiuoEavssRM0Q9c86u/kZTzB4y9
   GmGRSddMvkq3ZdJVOgLxlELLQEtODE+/Zy6rK3BFVnBcoUVHLDAkqBbpj
   po2HuKLK+K+u1s7rEbQxcU5MMqolJfVf+DDktOLV0QOZLlNKUO+TOQZd7
   qKeCqhA6nhUnxZiarY5ClmfU5qtUO7bLIHfn4SgdgtRjj15C0iiZAyj8N
   iM7xIIFntpMIUy8YouRKAjkUzi6MqonJPvPVSWSmux3ExPspFPVaeRBfj
   g==;
X-CSE-ConnectionGUID: yCxOvgjrTTmKSWJ/wAEyZA==
X-CSE-MsgGUID: gKjOLtuxTJWCZRJGLdhc2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56829079"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56829079"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 13:36:38 -0700
X-CSE-ConnectionGUID: iI/claFVRZiN6pa2YDx7Rw==
X-CSE-MsgGUID: 2GMs9HlEQF60Oz4fMcTWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166110034"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2025 13:36:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulCln-0005R2-02;
	Sun, 10 Aug 2025 20:36:03 +0000
Date: Mon, 11 Aug 2025 04:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 8/9]
 drivers/net/ethernet/intel/ice/ice_main.c:5765:9: error: implicit
 declaration of function 'pci_update_current_state'; did you mean
 'pci_bus_set_current_state'?
Message-ID: <202508110416.tnArFNMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux aer_reset_v1
head:   8662972f7327af599ea9fc6299a7b539db1cb461
commit: f522276bfd4031fcf8dbd92dd71111c68ba6f9aa [8/9] ice: Fix enable_cnt imbalance on PCIe error recovery
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20250811/202508110416.tnArFNMS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110416.tnArFNMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110416.tnArFNMS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_pci_err_slot_reset':
>> drivers/net/ethernet/intel/ice/ice_main.c:5765:9: error: implicit declaration of function 'pci_update_current_state'; did you mean 'pci_bus_set_current_state'? [-Wimplicit-function-declaration]
    5765 |         pci_update_current_state(pci_dev, PCI_D0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_bus_set_current_state
>> drivers/net/ethernet/intel/ice/ice_main.c:5765:34: error: 'pci_dev' undeclared (first use in this function)
    5765 |         pci_update_current_state(pci_dev, PCI_D0);
         |                                  ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:5765:34: note: each undeclared identifier is reported only once for each function it appears in


vim +5765 drivers/net/ethernet/intel/ice/ice_main.c

  5752	
  5753	/**
  5754	 * ice_pci_err_slot_reset - a PCI slot reset has just happened
  5755	 * @pdev: PCI device information struct
  5756	 *
  5757	 * Called to determine if the driver can recover from the PCI slot reset by
  5758	 * using a register read to determine if the device is recoverable.
  5759	 */
  5760	static pci_ers_result_t ice_pci_err_slot_reset(struct pci_dev *pdev)
  5761	{
  5762		struct ice_pf *pf = pci_get_drvdata(pdev);
  5763		u32 reg;
  5764	
> 5765		pci_update_current_state(pci_dev, PCI_D0);
  5766		pci_set_master(pdev);
  5767		pci_restore_state(pdev);
  5768		pci_save_state(pdev);
  5769		pci_wake_from_d3(pdev, false);
  5770	
  5771		/* Check for life */
  5772		reg = rd32(&pf->hw, GLGEN_RTRIG);
  5773		if (!reg)
  5774			return PCI_ERS_RESULT_RECOVERED;
  5775		else
  5776			return PCI_ERS_RESULT_DISCONNECT;
  5777	}
  5778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
