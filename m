Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55921B9C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946914; cv=none; b=kWdCYqaEhm23Jd3VbybPw+wnQ9BvZrBQ5pImqeDATweYBd+Vn+5UIyIOtAwvv5CkJeZUW62gRhVsHlsJUlnLHXgMXjmeeNFrQq6oEqJPYx83wbvUK4p2GjFMtfzrH+TNudLLONhMLym460XTrid84V5IpGdqZQLJGIfRTZv7tbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946914; c=relaxed/simple;
	bh=Jq6KMRw2fCIJ/rrOoYPoYvQk01XSBlYIQTq4e37yF2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DFOC2r5iAs6XEvP+OcKKB8SMFwtzJKHW6ZhOgTm58X63dAQVycHe0+xSpOuP1g2eMtO+z+ERVp64ddSvqf9HjbkM56vsm13CF+gsaRhGC9LLBl3oZoETZymEeSQDCf+Z8s3dpeseomFTCqt+7TCIGXYLshMrqkXyLAcHtkPgNVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltSRao4k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltSRao4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766946913; x=1798482913;
  h=date:from:to:cc:subject:message-id;
  bh=Jq6KMRw2fCIJ/rrOoYPoYvQk01XSBlYIQTq4e37yF2g=;
  b=ltSRao4kgHEsIBvgs+Tuaxj+S3uV31npM+wrgsyX48GEXLMBV7mflh87
   ShhibtjRlERbS9wmk/MTGQTB9KZEaI7jRFyTkISSFgXIvyxuQ+ikLiyiE
   6N1VAlaM1qvz+hor9PME2Lm50py6OFcLX+nx053ZpnOyMmBiek0vB4Mtb
   wz6vGxFxL2wfC5yDdPzAdvu/+OASN7ydHYUMDh1SjW8m5fZXCFVDlSXUQ
   WON5V2phbPfLROx7y2+wpaIKsgSYxwYEtS7Gzob2lA0GFs1N0Zi4EgWIS
   /u1MMtGHreqlcI/6rEbMBcgLIkqFXfnsPOIcNfAAIuBggwYEleJLTBTRY
   Q==;
X-CSE-ConnectionGUID: j2NZRHFhRyiK5lpGbIY56A==
X-CSE-MsgGUID: HTqZ9yUvS6qucS0n6owarA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68471472"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="68471472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:35:12 -0800
X-CSE-ConnectionGUID: YzBEzU1zS0yfZ9z9Q5BFqQ==
X-CSE-MsgGUID: LQZAs8XjQk+ZKknXnmojzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="201049425"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Dec 2025 10:35:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZvbg-000000006dJ-3Hrr;
	Sun, 28 Dec 2025 18:35:08 +0000
Date: Mon, 29 Dec 2025 02:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 17/117]
 drivers/net/ethernet/mediatek/mtk_eth_path.c:225:2-3: Unneeded semicolon
Message-ID: <202512290200.D1G2f3Ph-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   44b0991cc3efe339e015f1f9bb402537bdb5e10c
commit: 97e347446bd9fd4c41db0520d167f50724acff9a [17/117] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: arm64-randconfig-r053-20251228 (https://download.01.org/0day-ci/archive/20251229/202512290200.D1G2f3Ph-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512290200.D1G2f3Ph-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_eth_path.c:225:2-3: Unneeded semicolon

vim +225 drivers/net/ethernet/mediatek/mtk_eth_path.c

   200	
   201	static int set_mux_gmac123_to_usxgmii(struct mtk_eth *eth, u64 path)
   202	{
   203		unsigned int val = 0;
   204		bool updated = true;
   205		int mac_id = 0;
   206	
   207		/* Disable SYSCFG1 SGMII */
   208		regmap_read(eth->ethsys, ETHSYS_SYSCFG0, &val);
   209	
   210		switch (path) {
   211		case MTK_ETH_PATH_GMAC1_USXGMII:
   212			val &= ~(u32)SYSCFG0_SGMII_GMAC1_V2;
   213			mac_id = MTK_GMAC1_ID;
   214			break;
   215		case MTK_ETH_PATH_GMAC2_USXGMII:
   216			val &= ~(u32)SYSCFG0_SGMII_GMAC2_V2;
   217			mac_id = MTK_GMAC2_ID;
   218			break;
   219		case MTK_ETH_PATH_GMAC3_USXGMII:
   220			val &= ~(u32)SYSCFG0_SGMII_GMAC3_V2;
   221			mac_id = MTK_GMAC3_ID;
   222			break;
   223		default:
   224			updated = false;
 > 225		};
   226	
   227		if (updated) {
   228			regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
   229					   SYSCFG0_SGMII_MASK, val);
   230	
   231			if (mac_id == MTK_GMAC2_ID)
   232				regmap_set_bits(eth->infra, TOP_MISC_NETSYS_PCS_MUX,
   233						MUX_G2_USXGMII_SEL);
   234		}
   235	
   236		dev_dbg(eth->dev, "path %s in %s updated = %d\n",
   237			mtk_eth_path_name(path), __func__, updated);
   238	
   239		return 0;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
