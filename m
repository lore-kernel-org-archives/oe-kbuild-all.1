Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD633D6C0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179899; cv=none; b=JNS4Qn/czUTU+KW0FUY95pDnYpsP36KqqgByTfUfwP8C+pDl6I2QTYOwAJG4G6jp+XzGw4glKj+SY7iWNFtQwwt1lXnQKRFir/7rOQsj3MFQvZVirdPc4sYCHog7jPJ+EiiJ8KXQYe0cadS8JRt79PVyin45pNUye525KpQrSJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179899; c=relaxed/simple;
	bh=3ppLWT9DxwsK5KUA1HHOqBYCDrT4cU/2ayoUvet7r9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pHjv8AkWmjg6MQ1neyzgazcnYrXka5cEIDwaooXFakpv9+nBh5zDfzuYcFCI4NBqXR4VZH1MFojBjp18/kqU5uUdjgrrDM3uftxULkG5uzSvZlmt33nnGjvrVBS6Jv2tT0sqn1UIUSewXZJxlhBG62MFoC4l2DXdYGTG8Z6NkWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S61ilcw/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S61ilcw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778179897; x=1809715897;
  h=date:from:to:cc:subject:message-id;
  bh=3ppLWT9DxwsK5KUA1HHOqBYCDrT4cU/2ayoUvet7r9E=;
  b=S61ilcw/sfiurJUHH+rJzj5HMYnFqanvRg56muMl8257DElMaF2Ckx0V
   t0s7WWtRy91RaVMuDH71Lc+IeyWIfjCXkYxwUD+TBX26UYl87s0tZ13SE
   Sqvv5Qv+8yIZ7CoB/8K+ugK+MS3dBbndnHM11sqEJ10oykMplNa628ye+
   ZfM+R/Ep3vnzcGQOsQyWzMbeD4nycxfRKQYJq1ZIRMU+y6fYs7W5C8DFO
   OlVgBtzjGiSBwCTx/+1dO4oHsqBhMv0rZTFgnBi21MR+8P9G83KaxAv+X
   Tkoki4Qk+3ghLQDGXDZMgV5Mhth2DThDBPH97z8ZxZvn5637zgZWVInbd
   A==;
X-CSE-ConnectionGUID: P5Dhbi5nSFSnnccmHhl+Qg==
X-CSE-MsgGUID: gAg8srbjQn+wBHbd36hf4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79079426"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79079426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:51:36 -0700
X-CSE-ConnectionGUID: 5H0P1wr4Sa+OluLubNXXWA==
X-CSE-MsgGUID: 6LcrZhQAQZC0959WhmBPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="236644356"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2026 11:51:35 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3oq-000000000Nx-3YrN;
	Thu, 07 May 2026 18:51:32 +0000
Date: Fri, 08 May 2026 02:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 157/157]
 drivers/net/pcs/pcs-mtk-usxgmii.c:344:undefined reference to
 `mtk_xfi_tphy_valid_ctle'
Message-ID: <202605080248.ODOIVhvo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: ce3735b05f8971cb2a88ba66c5df025751f12b10 [157/157] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: microblaze-randconfig-r051-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080248.ODOIVhvo-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080248.ODOIVhvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080248.ODOIVhvo-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/net/pcs/pcs-mtk-usxgmii.o: in function `mtk_usxgmii_pcs_link_up':
>> drivers/net/pcs/pcs-mtk-usxgmii.c:344:(.text+0x724): undefined reference to `mtk_xfi_tphy_valid_ctle'


vim +344 drivers/net/pcs/pcs-mtk-usxgmii.c

   333	
   334	static void mtk_usxgmii_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
   335					    phy_interface_t interface,
   336					    int speed, int duplex)
   337	{
   338		struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
   339	
   340		/* Reconfiguring USXGMII to ensure the quality of the RX signal
   341		 * after the line side link up.
   342		 */
   343		if (mtk_usxgmii_pcs_link_status(mpcs) &&
 > 344		    mtk_xfi_tphy_valid_ctle(mpcs->xfi_tphy))
   345			return;
   346	
   347		mtk_usxgmii_pcs_config(pcs, neg_mode, interface, NULL, false);
   348		phy_reset(mpcs->xfi_tphy);
   349		phy_set_mode_ext(mpcs->xfi_tphy, PHY_MODE_ETHERNET, interface);
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
