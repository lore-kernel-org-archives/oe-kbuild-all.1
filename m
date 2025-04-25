Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0028E5F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619426; cv=none; b=FcVwbmQkEUiiT2+BxdXIfZjK7MLxveA8fzikBc878InaIauubdnQ69KnoqdQpNY7cXkTcGRTuIMjek4j0hnEN5MytvIm5QrJkk/Ee5qXfpsRywl6uLFsNl7jeC0ZEdLbJ88n1/mkR6dTZbAvkonjK4NSgdPO9TzX34/JkgWuWLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619426; c=relaxed/simple;
	bh=paQQyzXqtXUAGXXldxEGqUvfTa2lbpO/0Hob6Najhvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i20jR/e/LX7N7fcgxXyfC00+r7uUERVrWX6PCQ8dA7poJxZCX0AZvvGoc6CYSVX+82L7HbKLDWbsHoxpbY8msRNk+sZ/+N/xVUtS83blN8FSonAXAAZGtwRT6JfaYkm1e84eWDE6MmrHpYzsEePCdMsu0WEs4js4MRjmvzxVuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKpEuuSr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKpEuuSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745619423; x=1777155423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=paQQyzXqtXUAGXXldxEGqUvfTa2lbpO/0Hob6Najhvs=;
  b=hKpEuuSrM1mIar8reusARv4u4kehzdoNb8xbV8HC2Cu5VJfjIlUFahbb
   E6eyV+yqH61GMlDelhzXA2oMrVEHkiM5PiW0Yl1OsDc3lWP58H40rTvme
   +3wOBrTMbfMSvSo8T9nTAORqW0xiK10iUy1d//JES44KcNB5L9gn2YtUM
   ZkHaSRi6SZtR/r/TMOhH47xrGtL4Yw+o1dIUzAHF2lL6idqK7fgrEcksZ
   TFjWBXf0fuuGrljeI1/27Z/baOo/tAtH4nO1hf8lqelLiNANiSC6Bl67C
   /KVk+FQ7jFEfJOJlTZ/PqMuGPiEdq1UsmKWOX1bPs6ZjVgTWwY9p64dnm
   Q==;
X-CSE-ConnectionGUID: tjWm7e54RYGcmlNiKA+Eog==
X-CSE-MsgGUID: ulSTH9b7R16xriIP48gjhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58654576"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="58654576"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 15:17:03 -0700
X-CSE-ConnectionGUID: TuheRHWqSoCcplztf4B/Sw==
X-CSE-MsgGUID: AurSEGRpT6Wpbkmkrt4ZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="164069049"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Apr 2025 15:17:02 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8RLv-0005YN-2D;
	Fri, 25 Apr 2025 22:16:59 +0000
Date: Sat, 26 Apr 2025 06:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-main 74/81]
 drivers/net/phy/mediatek/mtk-2p5ge.c:92:24: warning: unused variable
 'pm_dev'
Message-ID: <202504260616.BPqRIEcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-main
head:   e1fb0102e1d7178a0110247bd75df738336948e2
commit: 0d3880fd0565b134a4637d6856c916d95e470b16 [74/81] net: phy: mediatek: drop pm code from 2g5 driver
config: loongarch-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504260616.BPqRIEcL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260616.BPqRIEcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260616.BPqRIEcL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/mediatek/mtk-2p5ge.c: In function 'mt7988_2p5ge_phy_config_init':
>> drivers/net/phy/mediatek/mtk-2p5ge.c:92:24: warning: unused variable 'pm_dev' [-Wunused-variable]
      92 |         struct device *pm_dev;
         |                        ^~~~~~


vim +/pm_dev +92 drivers/net/phy/mediatek/mtk-2p5ge.c

f74876ffb0bd38 Daniel Golle 2023-02-28   86  
f74876ffb0bd38 Daniel Golle 2023-02-28   87  static int mt7988_2p5ge_phy_config_init(struct phy_device *phydev)
f74876ffb0bd38 Daniel Golle 2023-02-28   88  {
f74876ffb0bd38 Daniel Golle 2023-02-28   89  	int ret, i;
f74876ffb0bd38 Daniel Golle 2023-02-28   90  	const struct firmware *fw;
f74876ffb0bd38 Daniel Golle 2023-02-28   91  	struct device *dev = &phydev->mdio.dev;
f74876ffb0bd38 Daniel Golle 2023-02-28  @92  	struct device *pm_dev;
f74876ffb0bd38 Daniel Golle 2023-02-28   93  	struct device_node *np;
f74876ffb0bd38 Daniel Golle 2023-02-28   94  	void __iomem *pmb_addr;
f74876ffb0bd38 Daniel Golle 2023-02-28   95  	void __iomem *md32_en_cfg_base;
f74876ffb0bd38 Daniel Golle 2023-02-28   96  	struct mtk_i2p5ge_phy_priv *phy_priv = phydev->priv;
f74876ffb0bd38 Daniel Golle 2023-02-28   97  	u16 reg;
f74876ffb0bd38 Daniel Golle 2023-02-28   98  	struct pinctrl *pinctrl;
f74876ffb0bd38 Daniel Golle 2023-02-28   99  
f74876ffb0bd38 Daniel Golle 2023-02-28  100  	if (!phy_priv->fw_loaded) {
f74876ffb0bd38 Daniel Golle 2023-02-28  101  		np = of_find_compatible_node(NULL, NULL, "mediatek,2p5gphy-fw");
f74876ffb0bd38 Daniel Golle 2023-02-28  102  		if (!np)
f74876ffb0bd38 Daniel Golle 2023-02-28  103  			return -ENOENT;
f74876ffb0bd38 Daniel Golle 2023-02-28  104  		pmb_addr = of_iomap(np, 0);
f74876ffb0bd38 Daniel Golle 2023-02-28  105  		if (!pmb_addr)
f74876ffb0bd38 Daniel Golle 2023-02-28  106  			return -ENOMEM;
f74876ffb0bd38 Daniel Golle 2023-02-28  107  		md32_en_cfg_base = of_iomap(np, 1);
f74876ffb0bd38 Daniel Golle 2023-02-28  108  		if (!md32_en_cfg_base)
f74876ffb0bd38 Daniel Golle 2023-02-28  109  			return -ENOMEM;
f74876ffb0bd38 Daniel Golle 2023-02-28  110  
f74876ffb0bd38 Daniel Golle 2023-02-28  111  		ret = request_firmware(&fw, MT7988_2P5GE_PMB_FW, dev);
f74876ffb0bd38 Daniel Golle 2023-02-28  112  		if (ret) {
f74876ffb0bd38 Daniel Golle 2023-02-28  113  			dev_err(dev, "failed to load firmware: %s, ret: %d\n",
f74876ffb0bd38 Daniel Golle 2023-02-28  114  				MT7988_2P5GE_PMB_FW, ret);
f74876ffb0bd38 Daniel Golle 2023-02-28  115  			return ret;
f74876ffb0bd38 Daniel Golle 2023-02-28  116  		}
f74876ffb0bd38 Daniel Golle 2023-02-28  117  
f74876ffb0bd38 Daniel Golle 2023-02-28  118  		reg = readw(md32_en_cfg_base);
f74876ffb0bd38 Daniel Golle 2023-02-28  119  		writew(reg | DMEM_PRIORITY | PMEM_PRIORITY, md32_en_cfg_base);
f74876ffb0bd38 Daniel Golle 2023-02-28  120  
f74876ffb0bd38 Daniel Golle 2023-02-28  121  		for (i = 0; i < fw->size - 1; i += 4)
f74876ffb0bd38 Daniel Golle 2023-02-28  122  			writel(*((uint32_t *)(fw->data + i)), pmb_addr + i);
f74876ffb0bd38 Daniel Golle 2023-02-28  123  		release_firmware(fw);
f74876ffb0bd38 Daniel Golle 2023-02-28  124  
f74876ffb0bd38 Daniel Golle 2023-02-28  125  		reg = readw(md32_en_cfg_base);
f74876ffb0bd38 Daniel Golle 2023-02-28  126  		reg &= ~(DMEM_PRIORITY | PMEM_PRIORITY | MD32_EN);
f74876ffb0bd38 Daniel Golle 2023-02-28  127  		writew(reg, md32_en_cfg_base);
f74876ffb0bd38 Daniel Golle 2023-02-28  128  		writew(reg | MD32_EN, md32_en_cfg_base);
f74876ffb0bd38 Daniel Golle 2023-02-28  129  		dev_info(dev, "Firmware loading/trigger ok.\n");
f74876ffb0bd38 Daniel Golle 2023-02-28  130  
f74876ffb0bd38 Daniel Golle 2023-02-28  131  		phy_priv->fw_loaded = true;
f74876ffb0bd38 Daniel Golle 2023-02-28  132  	}
f74876ffb0bd38 Daniel Golle 2023-02-28  133  
f74876ffb0bd38 Daniel Golle 2023-02-28  134  	/* Setup LED */
f74876ffb0bd38 Daniel Golle 2023-02-28  135  	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED0_ON_CTRL,
f74876ffb0bd38 Daniel Golle 2023-02-28  136  			 MTK_PHY_LED0_POLARITY | MTK_PHY_LED0_ON_LINK10 |
f74876ffb0bd38 Daniel Golle 2023-02-28  137  			 MTK_PHY_LED0_ON_LINK100 | MTK_PHY_LED0_ON_LINK1000 |
f74876ffb0bd38 Daniel Golle 2023-02-28  138  			 MTK_PHY_LED0_ON_LINK2500);
f74876ffb0bd38 Daniel Golle 2023-02-28  139  	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_ON_CTRL,
f74876ffb0bd38 Daniel Golle 2023-02-28  140  			 MTK_PHY_LED1_ON_FDX | MTK_PHY_LED1_ON_HDX);
f74876ffb0bd38 Daniel Golle 2023-02-28  141  
f74876ffb0bd38 Daniel Golle 2023-02-28  142  	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "i2p5gbe-led");
f74876ffb0bd38 Daniel Golle 2023-02-28  143  	if (IS_ERR(pinctrl)) {
f74876ffb0bd38 Daniel Golle 2023-02-28  144  		dev_err(&phydev->mdio.dev, "Fail to set LED pins!\n");
f74876ffb0bd38 Daniel Golle 2023-02-28  145  		return PTR_ERR(pinctrl);
f74876ffb0bd38 Daniel Golle 2023-02-28  146  	}
f74876ffb0bd38 Daniel Golle 2023-02-28  147  
f74876ffb0bd38 Daniel Golle 2023-02-28  148  	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LPI_PCS_DSP_CTRL,
f74876ffb0bd38 Daniel Golle 2023-02-28  149  		       MTK_PHY_LPI_SIG_EN_LO_THRESH100_MASK, 0);
f74876ffb0bd38 Daniel Golle 2023-02-28  150  
f74876ffb0bd38 Daniel Golle 2023-02-28  151  	/* Enable 16-bit next page exchange bit if 1000-BT isn't advertizing */
f74876ffb0bd38 Daniel Golle 2023-02-28  152  	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
f74876ffb0bd38 Daniel Golle 2023-02-28  153  	__phy_write(phydev, 0x11, 0xfbfa);
f74876ffb0bd38 Daniel Golle 2023-02-28  154  	__phy_write(phydev, 0x12, 0xc3);
f74876ffb0bd38 Daniel Golle 2023-02-28  155  	__phy_write(phydev, 0x10, 0x87f8);
f74876ffb0bd38 Daniel Golle 2023-02-28  156  	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
f74876ffb0bd38 Daniel Golle 2023-02-28  157  
f74876ffb0bd38 Daniel Golle 2023-02-28  158  	return 0;
f74876ffb0bd38 Daniel Golle 2023-02-28  159  }
f74876ffb0bd38 Daniel Golle 2023-02-28  160  

:::::: The code at line 92 was first introduced by commit
:::::: f74876ffb0bd38e20a6d865151cfdadef09d34fe net: phy: add driver for MediaTek 2.5G PHY

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
