Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F491F2361
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750610536; cv=none; b=i3bghvOWG3mDyR8vMBCcRfSDbRhauh0zyuTPBSAwJxZVnswjSf1B8N0XE7a8Ocz1m7b0dc5GHMPdBVlSbx8aB7c2x6VyE2GtMqRpvFlfTp2IjYNXTGDxbKuaewXLhoEUFalKYVz96xliJPKhMsDyLXrt/v7RYZ5KyJsaetqZDew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750610536; c=relaxed/simple;
	bh=KNVOrboJY81I1Jqt15rRemn3yOEn5mCFDqIR4bZZqCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sgPE2WTvHfgVXu4GU+uXxSiK4n3dy7NY15kyCrOBKwNGhB+FawQKXja2NTA2ZOz6kShmZgRssf97jEadpigyp2UqIJmN8W49yArG7iNg0bgf7jilnokHTDU2CAm2vfbCjUXQx2rmPyICuqVf6/SeSvd1C6ZsHltk9bXi+EG7goY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNbz9qFz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNbz9qFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750610534; x=1782146534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KNVOrboJY81I1Jqt15rRemn3yOEn5mCFDqIR4bZZqCg=;
  b=QNbz9qFzViqrp5Yx+iolPotmfWA45uqDirbf/V4vO4tz5Qc+5fZmt6Em
   1pi92AaJ2aZPVhzixlItq0C5ngX1ssG8R7x4s7Pmnthucq8PeeRWOpTvW
   gcYzZwjOne85zOUyvmQ/ApQDjvQpOcRIkssnhR6hdhL/h+HKqYfRtqdWG
   sUYiY8leAD7gVlm5FE8aN12XRCV5WBwVqfP0olz07d7GfcerL47pqETa4
   dPo7O+tLiEB7LnnVyFsAv7LHwFT2KZ9w4O/orKeaJKChg3LHeJNzzlt0s
   Yjsrx2q6knMOttB+q/dSSIKDJAmkWdILPRZ+gb+bTMfi2snp4L/tq3m7t
   g==;
X-CSE-ConnectionGUID: LpUWrOspSN6i/a2c76LFpQ==
X-CSE-MsgGUID: zsEfCn22Q1mFeD59KS7PJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55452696"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="55452696"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 09:42:13 -0700
X-CSE-ConnectionGUID: HfoZvBaGSqGmmxDQDyzAmw==
X-CSE-MsgGUID: f7ctL0yLS023BaQmToeBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="156870651"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2025 09:42:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTNli-000NPa-2N;
	Sun, 22 Jun 2025 16:42:10 +0000
Date: Mon, 23 Jun 2025 00:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 36/72]
 drivers/net/ethernet/mediatek/mtk_eth_path.c:225:2-3: Unneeded semicolon
Message-ID: <202506230008.c63UGFL9-lkp@intel.com>
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
commit: 2bc47ff7ea2ace3310b449c338064e7700ffd323 [36/72] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: arm64-randconfig-r051-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230008.c63UGFL9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506230008.c63UGFL9-lkp@intel.com/

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
