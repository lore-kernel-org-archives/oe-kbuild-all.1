Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A47C2260C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619973; cv=none; b=nd7JOmR3k62vCvKQwibnl8ufUt6mW/Xxp9KxZGv8Ji8+LLSk2zEeVPEkOsruFRZ9Z0r/r349rF0mv/iILy2jxeWoSi4MufEbG+JY2G4WqJQ7UhnnygX1e0YX5PjBSE1W6QCN3xj9N0txApae8CqkFrDnknqKsPWoW2mX+3x0UYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619973; c=relaxed/simple;
	bh=hNiDxhLm9qEo+lO4r6aspe3Ms7FXKI2kSAb0HgLHaks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSl83RHj9YWOnnyc3hzNlnmLg55/b6c3F+FyCL0yx5gKv/somfOa/6TEFaf07Gf2fmGTDIs+SJ1R1xFV9je+jOBtxY45K5gMG6np8p5K8LN8ylpWVIGihrJGbClOHRsm65hKvmfePJR1E60sCmo4q1JbrsghAZjdCTGTsfEqG7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiSJ/qYY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiSJ/qYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750619972; x=1782155972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hNiDxhLm9qEo+lO4r6aspe3Ms7FXKI2kSAb0HgLHaks=;
  b=SiSJ/qYYifhB1HWPk7ohK9bXua8M6v0sTiNE+qZNtpJGWdxfIwokTL0i
   0RD6c/3VHKmudIPIAJCCuw3yjl7XPKvolmqpPVG3PgZsROA8G2ZPCE7yu
   x9kNs6D9Kn8u6VcRLdtMhV2h+uelAFjwWA80qymLAScpMJjwgChvk5D3u
   gMErxtOOM6ZJNd8o91y/UvAxoPrOBGIrmbr5uHlR7WNJTpDV5t8htx4/x
   mjkd9pPnH7sWPvcwFR5v7Gk9JIftpchuEw/UY3858Zoo+9Gbj7vyFY3Tr
   SZPQT5hVZaCp+VIxNXUl+EyEdy/4RKJRm4zOD8N/99VIuslFxl/ujCc/N
   A==;
X-CSE-ConnectionGUID: Vqd4W3faTRezW/yi4UHrUw==
X-CSE-MsgGUID: 3b5BbMr3RhehsJR2/Aqv1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70248320"
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="70248320"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 12:19:31 -0700
X-CSE-ConnectionGUID: 56wDiJ5fSNm/dpIOBClVVg==
X-CSE-MsgGUID: 0W0z/62eQmqS5TKY11zcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="150988136"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jun 2025 12:19:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTQDw-000NTu-0R;
	Sun, 22 Jun 2025 19:19:28 +0000
Date: Mon, 23 Jun 2025 03:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 46/72]
 drivers/net/pcs/pcs-mtk-lynxi.c:383:2-3: Unneeded semicolon
Message-ID: <202506230340.xfCW4slb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   14bf550b65cbf5b2fc136cfa4f48a3475b597d25
commit: 54b2c2d8d54b5e8ea71b381aaa5dffd1ed065e9f [46/72] net: pcs: pcs-mtk-lynxi: add platform driver for MT7988
config: arm64-randconfig-r051-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230340.xfCW4slb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506230340.xfCW4slb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-mtk-lynxi.c:383:2-3: Unneeded semicolon

vim +383 drivers/net/pcs/pcs-mtk-lynxi.c

   346	
   347	static struct phylink_pcs *mtk_pcs_lynxi_init(struct device *dev, struct regmap *regmap,
   348						      u32 ana_rgc3, u32 flags,
   349						      struct mtk_pcs_lynxi *prealloc)
   350	{
   351		struct mtk_pcs_lynxi *mpcs;
   352		u32 id, ver;
   353		int ret;
   354	
   355		ret = regmap_read(regmap, SGMSYS_PCS_DEVICE_ID, &id);
   356		if (ret < 0)
   357			return ERR_PTR(ret);
   358	
   359		if (id != SGMII_LYNXI_DEV_ID) {
   360			dev_err(dev, "unknown PCS device id %08x\n", id);
   361			return ERR_PTR(-ENODEV);
   362		}
   363	
   364		ret = regmap_read(regmap, SGMSYS_PCS_SCRATCH, &ver);
   365		if (ret < 0)
   366			return ERR_PTR(ret);
   367	
   368		ver = FIELD_GET(SGMII_DEV_VERSION, ver);
   369		if (ver != 0x1) {
   370			dev_err(dev, "unknown PCS device version %04x\n", ver);
   371			return ERR_PTR(-ENODEV);
   372		}
   373	
   374		dev_dbg(dev, "MediaTek LynxI SGMII PCS (id 0x%08x, ver 0x%04x)\n", id,
   375			ver);
   376	
   377		if (prealloc) {
   378			mpcs = prealloc;
   379		} else {
   380			mpcs = kzalloc(sizeof(*mpcs), GFP_KERNEL);
   381			if (!mpcs)
   382				return ERR_PTR(-ENOMEM);
 > 383		};
   384	
   385		mpcs->ana_rgc3 = ana_rgc3;
   386		mpcs->regmap = regmap;
   387		mpcs->flags = flags;
   388		mpcs->pcs.ops = &mtk_pcs_lynxi_ops;
   389		mpcs->pcs.poll = true;
   390		mpcs->interface = PHY_INTERFACE_MODE_NA;
   391	
   392		__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
   393		__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
   394		__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);
   395	
   396		return &mpcs->pcs;
   397	};
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
