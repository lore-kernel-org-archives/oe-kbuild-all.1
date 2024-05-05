Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25114EA4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714872000; cv=none; b=LW00QwDIJCogsu29rQTs3orkOTfdOmY8++MIPVXccvKGvZHnEdWyTB68y3BlEMKG8mZ6fhPDdqkg0wc00bNT0+7SDp7BEy2VtqeC1NVD93UJXmIhmX2xESZ58wbuf41qyY/j9s+HS+ryK6uHUn1fOqbQdZ1dlwKR6TOF3Zl1ntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714872000; c=relaxed/simple;
	bh=VG5c86s5GCn9BBuhibgEFPhashKcbrmbvWIsiOoNY40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkBwcNDDYOJHyn9iGT2MhXa1/+xbawhiJJHX88mSG/VOAG9tBsL29LVWwLNhJWYbkgsVvZDdGghVZ1U+yZ3lG3JaIpUZgYQ/ExS+O4ezJvWrvrczrj6WSJ50hR6ECeQwzgoNE+r9kzwVRxKokNKTZz9KDOCna5qTpJgkavmLZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N26Byuu2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N26Byuu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714871998; x=1746407998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VG5c86s5GCn9BBuhibgEFPhashKcbrmbvWIsiOoNY40=;
  b=N26Byuu2QyCu/nhEkbmi264xiFqLCVc1flpxynGaqiINEgjJxEE/hyhm
   LgTXHw/Ec86OME+DkM8PDOisMbngkcAuyN/KFTgrsG5wte7jUA3agBhJk
   l0KuhtHs9Bf0pCDMKH3hffsIxUY7oetziVAggasl/7SnPIsSg6t1iNITm
   fDozSTNOlJIwKgSIcyu0vPbcqTO0UV0fzCGp+QUDw7vxhSS2aL5s/2G/1
   rXD0OoI3uZku6gu2Sbh6BWWa7n3i0bh7CeYuqj6mP3P8vlCVf6EepSkxV
   vMbwxnW0Ge/nOoR3+Ypyv5S/+kbXEFu0ue59Pgn7wgANGM8Eg9eAVUuoD
   w==;
X-CSE-ConnectionGUID: n5yd++C/RLSnxqfEBHLfUA==
X-CSE-MsgGUID: rMwX/icDTuWgnZOhmpQ+Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10774335"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10774335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 18:19:57 -0700
X-CSE-ConnectionGUID: FoG+kCCWSAaNm/c09Rbuxg==
X-CSE-MsgGUID: j5hZBLdlRhKt+SYplGHjdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="32317998"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 May 2024 18:19:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3QXi-000DLI-03;
	Sun, 05 May 2024 01:19:54 +0000
Date: Sun, 5 May 2024 09:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 824/1143]
 drivers/pci/controller/pcie-aspeed.c:198:6: warning: no previous prototype
 for 'aspeed_pcie_set_slot_power_limit'
Message-ID: <202405050947.pkC8Si4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 49060afdba7ac8b7a9bd1f0adb8d44c84f9bbe87 [824/1143] pcie:add ast2600 pcie rc driver
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405050947.pkC8Si4o-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050947.pkC8Si4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050947.pkC8Si4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pcie-aspeed.c:198:6: warning: no previous prototype for 'aspeed_pcie_set_slot_power_limit' [-Wmissing-prototypes]
     198 | void aspeed_pcie_set_slot_power_limit(struct aspeed_pcie *pcie)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/aspeed_pcie_set_slot_power_limit +198 drivers/pci/controller/pcie-aspeed.c

   196	
   197	//optional : set_slot_power_limit
 > 198	void aspeed_pcie_set_slot_power_limit(struct aspeed_pcie *pcie)
   199	{
   200		u32 cfg_val, isr;
   201		int ret;
   202	
   203		writel(BIT(4) | readl(pcie->reg), pcie->reg);
   204	
   205		pcie->tx_tag %= 0x7;
   206		regmap_write(pcie->cfg, 0x10, 0x74000001);
   207		switch (pcie->domain) {
   208		case 0: //write for 0.8.0
   209			regmap_write(pcie->cfg, 0x14, 0x00400050 | (pcie->tx_tag << 8));
   210			break;
   211		case 1: //write for 0.4.0
   212			regmap_write(pcie->cfg, 0x14, 0x00200050 | (pcie->tx_tag << 8));
   213			break;
   214		}
   215	
   216		regmap_write(pcie->cfg, 0x18, 0);
   217		regmap_write(pcie->cfg, 0x1C, 0);
   218		regmap_write(pcie->cfg, 0x20, 0x1a);
   219	
   220		//trigger tx
   221		regmap_write_bits(pcie->cfg, 0x24, PCIE_TRIGGER_TX, PCIE_TRIGGER_TX);
   222	
   223		//wait tx idle
   224		ret = regmap_read_poll_timeout(pcie->cfg, 0x24, cfg_val,
   225					       (cfg_val & PCIE_TX_IDLE), 0, 10);
   226		if (ret)
   227			goto out;
   228	
   229		//write clr tx idle
   230		regmap_write_bits(pcie->cfg, 0x08, PCIE_TX_IDLE_CLEAR,
   231				  PCIE_TX_IDLE_CLEAR);
   232	
   233		//check tx status
   234		regmap_read(pcie->cfg, 0x24, &cfg_val);
   235		switch (cfg_val & PCIE_STATUS_OF_TX) {
   236		case PCIE_RC_L_TX_COMPLETE:
   237		case PCIE_RC_H_TX_COMPLETE:
   238			ret = readl_poll_timeout(pcie->reg + 0x08, isr,
   239						 (isr & PCIE_RC_RX_DONE_ISR), 0, 10);
   240			if (ret)
   241				dev_err(pcie->dev, "[%d] : tx timeout [%x]\n",
   242					pcie->domain, isr);
   243	
   244			writel(readl(pcie->reg + 0x08), pcie->reg + 0x08);
   245			break;
   246		}
   247	out:
   248		pcie->tx_tag++;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
