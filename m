Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1828101DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734169195; cv=none; b=BMkcn8NAQJCL/ysIN5WHnB3fMsIdqu3LJUomRd2OjYhs6cmU/6tPZO329qls2lxam3l9c66RilNPhPw0Eidw5FWYbVZcoEpsZ0rN+4OwflN0teWxFcsTqJE6xDTfxpJ9d2jS1VG5YnRwnEWyJO3AVlPDqV11c9/IpwhJMEGC82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734169195; c=relaxed/simple;
	bh=38QKrU+I2ID3waSMM9M3GW1CK0O68b0D6RvfQ6ahVVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boHAwM6M1zPaoJOW//G29ZB59luzUyH9D9s3kfcnEdAf+PZASG7P4+fxL91Pzr06T2NYxIS2vZ1rxu/XOgcpmdkIkYrOcRvSFM7Gl9RmwQwKM14bV3G//LnhEHd4WfZl1VHSsbrmWKttNfb0C6ztk9pwA+g6usKsMzPODk/YU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DreDu/eM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DreDu/eM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734169193; x=1765705193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=38QKrU+I2ID3waSMM9M3GW1CK0O68b0D6RvfQ6ahVVU=;
  b=DreDu/eMq0KawcXyGVguV92huvBDLjKxaeZ7xa2I9aVMG/E7kUQABUpf
   duIj7lU1moS2IQR0bHbEz5CcTozhWfT40bqcCVi3PMLun6A7Fu45mZ7yd
   yB4DHdiKIQh6k8xccmfw57iDR+fcLRDCIbK9GO+kg15WT3IlJMOHrePME
   rfGRyK+PYi+lDAgvpRfFl+cfex5cZnrQz+tBpIotQPHha72QdL89kwqB5
   np1EBY1KSkWVsXy76oTJ+uI00yLgMZbHuvAT+lPL5Rnauv7gOTZ2dPtOR
   y2KCU0QqiuJJEJBgqtCq/QW6KsDIEjLzofWKbWLsKZqrIU8xCegoThwv9
   A==;
X-CSE-ConnectionGUID: uqxRfq0nSySV46xy1wCC5A==
X-CSE-MsgGUID: diogchOaSQip32wGT84Nkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38551664"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38551664"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 01:39:52 -0800
X-CSE-ConnectionGUID: GirTdDhyS4eYGr9RGxlRhQ==
X-CSE-MsgGUID: EyYqCyB3QXuHmFCYBNqK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100906501"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Dec 2024 01:39:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMOcn-000Cp9-0f;
	Sat, 14 Dec 2024 09:39:49 +0000
Date: Sat, 14 Dec 2024 17:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] cxl: add support for cxl reset
Message-ID: <202412141749.12WRnc38-lkp@intel.com>
References: <20241213074143.374-1-smadhavan@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213074143.374-1-smadhavan@nvidia.com>

Hi Srirangan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus cxl/next linus/master v6.13-rc2 next-20241213]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srirangan-Madhavan/cxl-add-support-for-cxl-reset/20241213-154303
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241213074143.374-1-smadhavan%40nvidia.com
patch subject: [RFC PATCH v1] cxl: add support for cxl reset
config: s390-randconfig-002-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141749.12WRnc38-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141749.12WRnc38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141749.12WRnc38-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci.c:5197: warning: Function parameter or struct member 'dvsec' not described in 'cxl_reset_init'


vim +5197 drivers/pci/pci.c

  5189	
  5190	/**
  5191	 * cxl_reset_init - initiate a cxl reset
  5192	 * @dev: device to reset
  5193	 *
  5194	 * Initiate a cxl reset.
  5195	 */
  5196	static int cxl_reset_init(struct pci_dev *dev, u16 dvsec)
> 5197	{
  5198		u16 reg, val;
  5199		u32 timeout_ms;
  5200		int rc;
  5201		u32 reset_timeouts_ms[] = {10, 100, 1000, 10000, 100000};
  5202	
  5203		/*
  5204		 * Check if CXL Reset MEM CLR is supported.
  5205		 * TODO: Add check to do MEM CLR only if requested.
  5206		 */
  5207		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCAP,
  5208					  &reg);
  5209		if (rc)
  5210			return rc;
  5211	
  5212		if (reg & PCI_DVSEC_CXL_DEVCAP_CXL_RST_MEM_CLR) {
  5213			rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCTL2,
  5214						  &reg);
  5215			if (rc)
  5216				return rc;
  5217	
  5218			val = reg | PCI_DVSEC_CXL_DEVCTL2_CXL_RST_MEM_CLR_ENABLE;
  5219			pci_write_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCTL2,
  5220					      val);
  5221		}
  5222	
  5223		/*
  5224		 * Read timeout value
  5225		 */
  5226		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCAP,
  5227					  &reg);
  5228		if (rc)
  5229			return rc;
  5230		timeout_ms = reset_timeouts_ms[FIELD_GET(PCI_DVSEC_CXL_DEVCAP_CXL_RST_TIMEOUT_MASK, reg)];
  5231	
  5232		/*
  5233		 * Write reset config
  5234		 */
  5235		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCTL2,
  5236					  &reg);
  5237		if (rc)
  5238			return rc;
  5239	
  5240		val = reg | PCI_DVSEC_CXL_DEVCTL2_CXL_INIT_RST;
  5241		pci_write_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCTL2,
  5242				      val);
  5243	
  5244		/*
  5245		 *  Wait till timeout and then check reset status is complete.
  5246		 */
  5247		msleep(timeout_ms);
  5248		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVSTATUS2,
  5249					  &reg);
  5250		if (rc)
  5251			return rc;
  5252		if (reg & PCI_DVSEC_CXL_DEVSTATUS2_RST_ERR ||
  5253		    ~reg & PCI_DVSEC_CXL_DEVSTATUS2_RST_COMPLETE)
  5254			return -ETIMEDOUT;
  5255	
  5256		/*
  5257		 * Revert cashing disable.
  5258		 */
  5259		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCTL2,
  5260					  &reg);
  5261		if (rc)
  5262			return rc;
  5263		val = (reg & (~PCI_DVSEC_CXL_DEVCTL2_DISABLE_CACHING));
  5264		pci_write_config_word(dev, dvsec + PCI_DVSEC_CXL_DEVCTL2,
  5265				      val);
  5266	
  5267		return 0;
  5268	}
  5269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
