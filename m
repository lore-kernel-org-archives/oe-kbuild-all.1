Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19AC399
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714349893; cv=none; b=H7ENMFmBRldGg11caf0UIscY8SuJ+Fufl1DHfe/IcO/SBQer2uAZRNYBeJYX87frvv+I+Uaypg2eaenryykRpPfqaGkWIyFC0yD+SJV1u03TKGMOJjMHx7VFcR/TGfmier7VbP2jnvEr18VTqVA/jI1//tllQ0Ni/E01U/ezjK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714349893; c=relaxed/simple;
	bh=uklAh8GHDnv9uJF/kdWphTXnpgl0ucZFU9NixpvYWFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5bCYyilGcU60gQxjIZCCTRdoesTdozx2c3mAoFRAm8yjKjRB1wU3HamymdVWqNPSeqL45BEX3yE/WsJzBYbozlAF7ty1Taz1hCR7cBdzqlIj4E0lWoHrNw7cZwka6BscBNoWkeqRd0uyHuO3RAOewefzdSYklS2Hs4s+2s6SkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcaarlTm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcaarlTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714349891; x=1745885891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uklAh8GHDnv9uJF/kdWphTXnpgl0ucZFU9NixpvYWFs=;
  b=fcaarlTmRdZ2ZCU3ePXFxvMIvljvcAmbYJPC3djBG9ILfNhs2l/OY2fS
   R3CoPx+SYDUCdx1ApryN6iepa+yijQYgmmzBnfLXHjb/SCmLgzVB0E1z0
   IzVsR+NqyIsLhATeqapgPUPD71zTkvshVLab93+be9ADyZ6cylngHNAwf
   IXmMtnBOGKvDiC6Z9db8gXVBF6ZuPk4qe4fzs+92f2Qn2JgX8yJ2j3L8I
   KyIGzqdAquSg/7es4QgJobBZe7pW1iyC5S6ADgNtA1a7kfHLX71SojH6b
   85WUpkYFPi2B1IPDFnArFzfshDDckfdvwqZyseop/mHhsqvtU8DuIam11
   w==;
X-CSE-ConnectionGUID: zlctOn8EQ4SMORzaQmVeGg==
X-CSE-MsgGUID: l8eRnH2dTbCZJ6mMr7PxVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9875173"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="9875173"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 17:18:08 -0700
X-CSE-ConnectionGUID: 23EwXMzcTcWqP4oKD3pxXw==
X-CSE-MsgGUID: GGCvVqbNRrCe3uVg/A/3eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26356151"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2024 17:18:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Eib-0006os-0T;
	Mon, 29 Apr 2024 00:18:05 +0000
Date: Mon, 29 Apr 2024 08:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5741/11728]
 drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for
 'xpcs_register_phy'
Message-ID: <202404290852.7XP9hg05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: f5d7b7a0ff41b77456b370b4e48051b0cdc00cc6 [5741/11728] LF-10639-4 net: pcs: xpcs: add mx95 serdes support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290852.7XP9hg05-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290852.7XP9hg05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290852.7XP9hg05-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for 'xpcs_register_phy' [-Wmissing-prototypes]
    1382 | u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
         |     ^~~~~~~~~~~~~~~~~
--
>> drivers/net/pcs/pcs-xpcs-phy.c:228:5: warning: no previous prototype for 'xpcs_phy_read_pma' [-Wmissing-prototypes]
     228 | int xpcs_phy_read_pma(struct dw_xpcs *xpcs, u32 reg)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/pcs/pcs-xpcs-phy.c:233:5: warning: no previous prototype for 'xpcs_phy_write_pma' [-Wmissing-prototypes]
     233 | int xpcs_phy_write_pma(struct dw_xpcs *xpcs, int reg, u16 val)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/pcs/pcs-xpcs-phy.c:238:5: warning: no previous prototype for 'xpcs_phy_usxgmii_init_seq_2' [-Wmissing-prototypes]
     238 | int xpcs_phy_usxgmii_init_seq_2(struct dw_xpcs *xpcs)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xpcs_register_phy +1382 drivers/net/pcs/pcs-xpcs.c

  1381	
> 1382	u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
  1383	{
  1384		u32 xpcs_phy_id;
  1385		int ret = 0;
  1386	
  1387		xpcs_phy_reg_lock(xpcs);
  1388	
  1389		xpcs_phy_id = xpcs_phy_get_id(xpcs);
  1390		ret = xpcs_phy_check_id(xpcs_phy_id);
  1391		if (!ret)
  1392			return 0;
  1393	
  1394		return xpcs_phy_id;
  1395	}
  1396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
