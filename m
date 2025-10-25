Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEC2F3C0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761388611; cv=none; b=sK2XKy8/sE+wKvwnPiqZM006WrvwCMQIQMmvFUqHVN6azhlcUVgv6NyA0kEdwtTqa6EpgJdWAfCBlpIoj4SngRWATL0+Nb687/yluccSdxOKH1FRJm+89dnBWcuNNT/4QtTfwTG/7DAkWGI01LinM6qxxwkw0j/+YKgp05HoozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761388611; c=relaxed/simple;
	bh=Jc/4jiyKfEXiGCxwWhXrP4+NZ0h+QgodAg6fHNkdsVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wk68sEs5Chzh1M3NniXwyQ1oME5aT5FwaR2lvLPtSWcMZkJ1lu3xavWp33TeiVRcgaSuZZi3qzQPw2+KNr9VK4pnLpQFD9rbRACGZoWSqEkOcFQhBC+EdfjQPwCB+EEOsBYLaAIx8dk9lPmeQ4aqLtxM6doR98kV14vnNR168iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNaSYbqw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNaSYbqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761388608; x=1792924608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jc/4jiyKfEXiGCxwWhXrP4+NZ0h+QgodAg6fHNkdsVA=;
  b=bNaSYbqwDVJ4ee6fN3uSw29KbhBvxNOB208oWtRm5SU14Q+Mc5ik0ewi
   f31IBQyVJw2LHUDZXYXrJeNh1gd8JGgPYi9iUpr4mlnNMRfDT39nvPrUB
   +VRdDaxeDX+VoyX1+CtdkRJejjdCbGtnDI7TnDYnRzmdk3xcD5XWxkJnR
   pqcgyv+4D83OcqkK+r0a+s9KNUWRyy+jJfbbJq1Btcti5ZAzNo00jUsuk
   JcSYYpKXBXxGRwSCd319j+22vvv6BbyWlYKbWYIpylQQRh9z32cJByTm6
   IM7pQo2dbwZnm6Bg1FcT/XSqcmGsKoNRNQUhyam7QVaDbTjh6+ZaNw1oN
   Q==;
X-CSE-ConnectionGUID: R4/gT1Y5SUGuNlFlWMmzIg==
X-CSE-MsgGUID: OQSk+rTpQrare/5x84mqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74667795"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="74667795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 03:36:48 -0700
X-CSE-ConnectionGUID: 3IMizbYrTCahDVoMlR0EUg==
X-CSE-MsgGUID: bgIXcFFATUa7MJ2o0iX+uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="215280003"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2025 03:36:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCbdc-000FGD-0r;
	Sat, 25 Oct 2025 10:36:44 +0000
Date: Sat, 25 Oct 2025 18:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [chunkuang-hu:mediatek-drm-next 9/11]
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:48:24: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202510251806.AH6gR1NM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-drm-next
head:   793b39b8398f24ec73a3ed09ac87c1d572e2502d
commit: 8db28701a2a05fcdbd8ec6364f0e817ee0aeff26 [9/11] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: sparc64-randconfig-r123-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251806.AH6gR1NM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251806.AH6gR1NM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251806.AH6gR1NM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:48:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:48:24: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:48:24: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:50:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:50:39: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:50:39: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:58:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:58:32: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:58:32: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:32: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:32: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:60:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:60:32: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:60:32: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:78:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:78:31: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:78:31: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:82:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:82:33: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:82:33: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:88:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:88:25: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:88:25: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:95:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:95:15: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:95:15: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:121:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:121:31: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:121:31: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:141:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:141:31: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:141:31: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:152:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:152:47: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:152:47: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:155:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:155:41: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:155:41: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:168:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:168:41: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:168:41: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:176:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:176:23: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:176:23: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:193:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:193:41: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:193:41: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:197:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:197:40: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:197:40: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:200:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:200:41: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:200:41: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:209:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:209:40: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:209:40: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:237:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:237:28: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:237:28: sparse:     got void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:254:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] __iomem *regs @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:254:28: sparse:     expected struct regmap *map
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:254:28: sparse:     got void [noderef] __iomem *regs
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:345:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *regs @@     got struct regmap * @@
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:345:19: sparse:     expected void [noderef] __iomem *regs
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:345:19: sparse:     got struct regmap *
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:383:24: sparse: sparse: symbol 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be static?
--
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:53:12: sparse: sparse: symbol 'mtk_hdmi_v2_clk_names' was not declared. Should it be static?

vim +48 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c

    43	
    44	static int mtk_ddc_check_and_rise_low_bus(struct mtk_hdmi_ddc *ddc)
    45	{
    46		u32 val;
    47	
  > 48		regmap_read(ddc->regs, HDCP2X_DDCM_STATUS, &val);
    49		if (val & DDC_I2C_BUS_LOW) {
    50			regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
    51					   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
    52			usleep_range(250, 300);
    53		}
    54	
    55		if (val & DDC_I2C_NO_ACK) {
    56			u32 ddc_ctrl, hpd_ddc_ctrl, hpd_ddc_status;
    57	
    58			regmap_read(ddc->regs, DDC_CTRL, &ddc_ctrl);
    59			regmap_read(ddc->regs, HPD_DDC_CTRL, &hpd_ddc_ctrl);
    60			regmap_read(ddc->regs, HPD_DDC_STATUS, &hpd_ddc_status);
    61		}
    62	
    63		if (val & DDC_I2C_NO_ACK)
    64			return -EIO;
    65	
    66		return 0;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
