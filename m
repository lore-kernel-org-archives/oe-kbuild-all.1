Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4641E1C02
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 00:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017119; cv=none; b=tzGksLuY6ocGURcGokpK5vo9NkwWHP0OuoOgq7Vbv5YVBr3hWIQK0vXa1VMq50nNU2BQTWksZWR/qag29kdTYkPlcztBL6KznCg8PWrD8/6WbUIX6xnR1CPV9ER7BUJ9+Bit6gt/HzOAJIitLNfuM9zpKo6BEg/FHH5vj56kKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017119; c=relaxed/simple;
	bh=WmEhQQqxOq+BaV1EcQ+3TxT5yXmBnMFA5Gu0mSuawrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p2PoSAY6XRJnvhD9Xpf3zu7XHfq1d8HNxX3Aqkai33DGSlK7I943+FS1SyofK3+0YEELwmhJ3oKSP+i9BvqhJruWrgcAtU4meRscoBqG3N8uoGQo72tz3ThIZV1KcVoD814vYn2pRrVzkt3zZe66rTkd+qwFKlvL4W2zeJ1Cabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrN/fxvX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrN/fxvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773017117; x=1804553117;
  h=date:from:to:cc:subject:message-id;
  bh=WmEhQQqxOq+BaV1EcQ+3TxT5yXmBnMFA5Gu0mSuawrk=;
  b=jrN/fxvXBJqVFldqClbzLdZ5CyVztrxemSr1qLWRlKD25S96GgEVyrRj
   CeTcxwy5Mx9cb30HM8p8DIPT+Q2bMQJOaYHC6UDGXtTpgIRLhSJQxLxhh
   F4Mifpr9ZxwuvW7ywYyGvaN2Y6vZKVmG1pMSEQgG+gg4PTn1ciSTfRDkq
   gkkFErO4ni9Gsfr3EfTnZYoJ0Gy6woHH0VD6big+3uLnM8b2vBgal8bNx
   Ulo/HjS3MDY1ElC/Y3tM5ARQyqaLhLXpPbMtxiS7Ve+Uts2H7oOyNSbpw
   zvwms5nKs0VnE3foZYPQHWUPs2IAlxiqGwmZkBpygZg6Ph7/tLkoOMyWs
   g==;
X-CSE-ConnectionGUID: 3KKEZLEZS/6ipOVzLuqcDw==
X-CSE-MsgGUID: +VPYA7LyQ6yCDuPos1f3ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="61609367"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="61609367"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:45:16 -0700
X-CSE-ConnectionGUID: khdYL6R6QpK0KEWyOLJheQ==
X-CSE-MsgGUID: +FQY49SkTSeeWksoWVgMKA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2026 17:45:14 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzOkB-000000003W0-1fQm;
	Mon, 09 Mar 2026 00:45:11 +0000
Date: Mon, 09 Mar 2026 08:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: 
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c:240:undefined reference to
 `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202603090827.nPbHOnKI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc9f248d8c591454e257edd54ac4085d84f11e6a
commit: 355a110040665e439af126e8ec9c3968e73f163c media: synopsys: add driver for the designware mipi csi-2 receiver
date:   7 weeks ago
config: x86_64-randconfig-073-20260309 (https://download.01.org/0day-ci/archive/20260309/202603090827.nPbHOnKI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090827.nPbHOnKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090827.nPbHOnKI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/platform/synopsys/dw-mipi-csi2rx.o: in function `dw_mipi_csi2rx_start':
>> drivers/media/platform/synopsys/dw-mipi-csi2rx.c:240:(.text+0x5af): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'


vim +240 drivers/media/platform/synopsys/dw-mipi-csi2rx.c

   215	
   216	static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
   217	{
   218		struct media_pad *source_pad;
   219		union phy_configure_opts opts;
   220		u32 lanes = csi2->lanes_num;
   221		u32 control = 0;
   222		s64 link_freq;
   223		int ret;
   224	
   225		if (lanes < 1 || lanes > 4)
   226			return -EINVAL;
   227	
   228		source_pad = media_pad_remote_pad_unique(
   229			&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
   230		if (IS_ERR(source_pad))
   231			return PTR_ERR(source_pad);
   232	
   233		/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
   234		link_freq = v4l2_get_link_freq(source_pad, 0, 0);
   235		if (link_freq < 0)
   236			return link_freq;
   237	
   238		switch (csi2->bus_type) {
   239		case V4L2_MBUS_CSI2_DPHY:
 > 240			ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
   241									 lanes, &opts.mipi_dphy);
   242			if (ret)
   243				return ret;
   244	
   245			ret = phy_set_mode(csi2->phy, PHY_MODE_MIPI_DPHY);
   246			if (ret)
   247				return ret;
   248	
   249			ret = phy_configure(csi2->phy, &opts);
   250			if (ret)
   251				return ret;
   252	
   253			control |= SW_CPHY_EN(0);
   254			break;
   255	
   256		case V4L2_MBUS_CSI2_CPHY:
   257			/* TODO: implement CPHY configuration */
   258			return -EOPNOTSUPP;
   259		default:
   260			return -EINVAL;
   261		}
   262	
   263		control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
   264			   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
   265	
   266		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
   267		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
   268		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
   269	
   270		return phy_power_on(csi2->phy);
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
