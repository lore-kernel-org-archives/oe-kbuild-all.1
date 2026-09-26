Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3210D2EEE62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384361; cv=none; b=gjXTzM7+fly9bFtbn1Lo2EtheflrUhlcMlbE3Ih22GilYEeF5CLqU2kYJ5rYtpX02AVtokubVIwWHeyZmxeBjwL0tMb4L96m/LVWagq04Qnn7ZExP8f1LCrzeNL48YJjxwjOqWsvnW4bM2HTk2vbSJNLdBJOHd0hL9F3smOpj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384361; c=relaxed/simple;
	bh=tVxwfgqxqkpchr+uVX4bnKMl7riOU4kHb8JV1undC3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gggWyVnr/Gjw0Z8uoSUuMDx8soF7Xc/v3JfvqZlFB423JCDqtzM2K8kcJp7w5BNBd/1eqZXBcopj8ahjT4l9BoEJmNP1KL7ZWu5I6Lb20TpSoCQGCKo+43N2LPe9U4zuFdNOGolifC/lrR+u5786qVQbSrLdA4FrfwQcCdu8ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwLJ+tUl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwLJ+tUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790384359; x=1821920359;
  h=date:from:to:cc:subject:message-id;
  bh=tVxwfgqxqkpchr+uVX4bnKMl7riOU4kHb8JV1undC3U=;
  b=fwLJ+tUlQRbpj3PsrvHXporr1wIKeS3JvmFCAp71i+SwciDAUuA/frZE
   xD7ey4Et2oe9YcIXr4hs5ZN2bSIOoPHGlBS2ZBc6E7gG2eptgdYb0DnL6
   zm8OJDuPB2eZEcjV9whV1/6Hpqu/euLkTuIm53MTrKuvGmZC24k3gAek5
   RHIbofGgyHUKPPmZB1iBFkNAWKUqw4J2eINh6Y5gYP3jNFgntGo+3junj
   vv2nOxkTNP+XJ4/w8H39ZzuHTHEIBciFbDYPnjvvNPY2H+1MK8JydU/DS
   7UWZMkJuP5+CypUZT+HS5gmXjRjtOi+Bob1aBfOir21rPw1bASEizKewP
   Q==;
X-CSE-ConnectionGUID: vdG4TEbVSke2lsxJd/Vb3g==
X-CSE-MsgGUID: dO/XndmeQtKh1FCeaz0T7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90079004"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90079004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 17:59:17 -0700
X-CSE-ConnectionGUID: C7HWuZWhS0muyigYtiGQEw==
X-CSE-MsgGUID: BA1af2ofT4uc1py+Fdj2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="277837602"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 17:59:17 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAGkz-0000000009E-2mLT;
	Sat, 26 Sep 2026 00:59:13 +0000
Date: Sat, 26 Sep 2026 02:58:51 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/ethernet/mediatek/mtk_eth_path.c:225:2-3: Unneeded semicolon
Message-ID: <202609260237.LuwsFS0v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: ac31c86a941e02ff8f91a2f7b5e171352ccf9b03 [214/214] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: sparc64-randconfig-r2104-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260237.LuwsFS0v-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260237.LuwsFS0v-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_eth_path.c:225:2-3: Unneeded semicolon
--
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:557:2-3: Unneeded semicolon

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
