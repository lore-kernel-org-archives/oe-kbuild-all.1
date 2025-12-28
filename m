Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC1824BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 20:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766953833; cv=none; b=s83oIxoG2mP3IX2GiEskUbZV5WR0yDi7s5Uwa/a+JEyXDokX50RKktNELMST+YhcqLl0uD+1EC3dRc0lgNdXaTyHskuqM5YkhfWtKe0a/zAcn9IJG6wFnRMGwkagQ/zun7Zut8sZvn4KQR5Kc/KWlDnrVIjsHQSEvEYLyxy59T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766953833; c=relaxed/simple;
	bh=c6LJvG6sRWFoZr2OyZswuRCEMElrBS+m2HnrRmEiSoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dxc9O70LuZVsIqzTLa+cy6pni1WrjGmx7/OhtxiOiS3xxZw2ktsmZkh1Agm8+25J3L8Kx9EKKhJVwB6zNVQi7j9cLhdzpdIlrQsdJ7SCoyXworWr4/eR5mDRkLRcvhel9VNQhuPpUltQSgHsAisIAWPPdb6H3LZn0rL0wRCFwBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN35oeT+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN35oeT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766953832; x=1798489832;
  h=date:from:to:cc:subject:message-id;
  bh=c6LJvG6sRWFoZr2OyZswuRCEMElrBS+m2HnrRmEiSoU=;
  b=QN35oeT+6xXoQJkeBtsMKS5+6FxMaQKF1qpHqYFz/4Ho68UZyxkfbqfO
   FPj59f3xxHSGhm3XufxEwDBRhT7Ik+UH959CkOXQmLCQYUDNd7Zth7B79
   skWFcpnfW9xOVZFew8cUMBj2/722oclJxY3W3wAvrWIIpUhKJAh16TZg7
   dS0yIf1gEVp4UblCNBf+dJwwRIN3xgnHGFzOFFsqHps8L24Cu86tRzEqO
   oQGjYK2Xji+Lf+GSa5PtLqKaxHRObYOT3jRddbwQxje4Wsqx0aW6g3cYR
   SGxBLyHtIfW1OmRZj8HLMbvQJ4fWOmo6hy/D9i/KaJrKO+8tODIwdJOH+
   w==;
X-CSE-ConnectionGUID: aX7qc+wOQg+6M/qQ/L3pwg==
X-CSE-MsgGUID: sGy1o5dqTdmuiXCRE0BDug==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79951258"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="79951258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 12:30:31 -0800
X-CSE-ConnectionGUID: 4/GcmWQ0QUCnEVpWVJFcdw==
X-CSE-MsgGUID: M6fIrPp0Su+2sDUAokCM6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205684573"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2025 12:30:30 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZxPC-000000006gL-2agM;
	Sun, 28 Dec 2025 20:30:23 +0000
Date: Mon, 29 Dec 2025 04:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 23/117]
 drivers/net/pcs/pcs-mtk-lynxi.c:383:2-3: Unneeded semicolon
Message-ID: <202512290444.1u8gmDqh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   44b0991cc3efe339e015f1f9bb402537bdb5e10c
commit: 6edae4f620b970a0fd58f812250e8aa94068bd49 [23/117] net: pcs: pcs-mtk-lynxi: add platform driver for MT7988
config: arm64-randconfig-r053-20251228 (https://download.01.org/0day-ci/archive/20251229/202512290444.1u8gmDqh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512290444.1u8gmDqh-lkp@intel.com/

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
