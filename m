Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C8315D48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766661491; cv=none; b=ol6Fms1o6T8LpraTlImG3EK3rpaz/wZhUKrFzKb2NXOgoIiu/YGveF7mCZUzQ1zvcChjAzjmw8hcvbPESJnjrc+ahviz/rBkZgLDS7ugs/o0s3e+cxCijCCQcCrmI/b6JY7juCE9LeBsEpto5ykGd2DtnYABKmdD3NC6f0zurIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766661491; c=relaxed/simple;
	bh=9v7kdfBX8fTXDif1DF8SNqOuuLGbNFwukQPyIg/UU6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jyEVj0HmfIo4+U/E4z/k4flshLOFR3Wxg9qLyT6oMxLbuCcTvD/3cXi1isU9R71vTCcGIii0SuB7YrkBh/UKxqrqb61yL4o3KogXbC/7ZEMSGUVXneGXnr3wMDSylXbw5QSkJMhYgns1tqT/LW4Ub6T3o+cODiegqjKUh7OfW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms8rPBZj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms8rPBZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766661489; x=1798197489;
  h=date:from:to:cc:subject:message-id;
  bh=9v7kdfBX8fTXDif1DF8SNqOuuLGbNFwukQPyIg/UU6Q=;
  b=Ms8rPBZjaQTqAbHKdYHj5G3hNGkCUjcwV2lJAm9dL09pt88sezQ+krpw
   GPQUOudQpU+7Ejq9WYpsZ3Aje4KHgV6cMpKpfe6SkPO7vnL36e2qyJmtd
   TtJ7IPECtILcXFa4ZgjArV7Dl6rpb4hXOc9cq4EpnLeRaUCqySLnNo+KL
   qCPIYKL04XpTn5uknxhaMdysSugsqsbMHSqo2ixMzuIs+PkU7oWNMF0GN
   WtPbDa3m7lwNf/EArZ3CRmDRX505GWj1fRTW/AF6DRFh39YhOlnUGITFd
   yF9+lSSClJLEO/LZY7we8il79AOrsEiqRwbdUr3Fi0EuonDlQ28Z2SP1Z
   Q==;
X-CSE-ConnectionGUID: YUmKRT8OT5yMoSOvu6rHYw==
X-CSE-MsgGUID: wxXPLIQ+RoWiX4k19vkc7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68221779"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68221779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 03:18:08 -0800
X-CSE-ConnectionGUID: 98JvMxmtTxGJRogOMkkaAQ==
X-CSE-MsgGUID: h/iU+ePpTFSfDj385emU8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="199949092"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Dec 2025 03:18:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYjM4-0000000041Z-0CUA;
	Thu, 25 Dec 2025 11:18:04 +0000
Date: Thu, 25 Dec 2025 19:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Kishon <kishon@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: [phy:next 13/81] drivers/phy/phy-spacemit-k1-pcie.c:299:
 undefined reference to `devm_clk_hw_register'
Message-ID: <202512251903.sTVZgg6c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   27287e3b52b5954b73203d32ee76ffd5f53f5074
commit: 57e920b92724dd568526990c04e79ed54241c5fc [13/81] phy: spacemit: Introduce PCIe/combo PHY
config: sparc-randconfig-r131-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251903.sTVZgg6c-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251903.sTVZgg6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/phy/phy-spacemit-k1-pcie.o: in function `k1_pcie_phy_pll_setup':
>> drivers/phy/phy-spacemit-k1-pcie.c:299: undefined reference to `devm_clk_hw_register'
>> sparc64-linux-ld: drivers/phy/phy-spacemit-k1-pcie.c:306: undefined reference to `devm_clk_hw_get_clk'


vim +299 drivers/phy/phy-spacemit-k1-pcie.c

   278	
   279	/* We represent the PHY PLL as a private clock */
   280	static int k1_pcie_phy_pll_setup(struct k1_pcie_phy *k1_phy)
   281	{
   282		struct clk_hw *hw = &k1_phy->pll_hw;
   283		struct device *dev = k1_phy->dev;
   284		struct clk_init_data init = { };
   285		char *name;
   286		int ret;
   287	
   288		name = kasprintf(GFP_KERNEL, "pcie%u_phy_pll", k1_phy->phy->id);
   289		if (!name)
   290			return -ENOMEM;
   291	
   292		init.name = name;
   293		init.ops = &k1_pcie_phy_pll_ops;
   294		init.parent_data = k1_pcie_phy_data;
   295		init.num_parents = ARRAY_SIZE(k1_pcie_phy_data);
   296	
   297		hw->init = &init;
   298	
 > 299		ret = devm_clk_hw_register(dev, hw);
   300	
   301		kfree(name);	/* __clk_register() duplicates the name we provide */
   302	
   303		if (ret)
   304			return ret;
   305	
 > 306		k1_phy->pll = devm_clk_hw_get_clk(dev, hw, "pll");
   307		if (IS_ERR(k1_phy->pll))
   308			return PTR_ERR(k1_phy->pll);
   309	
   310		return 0;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
