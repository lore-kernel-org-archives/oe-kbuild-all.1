Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FE13E405
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828901; cv=none; b=XxcdPl6FdiToCRDLddKePxHX3MxbHrgXd/NZwrKBMfLpIHgmZbfdHXMWES4mgv0rWXGBrO0+13vpuMo7cJKAYBlo44qSjheXPXpD++hvIonbJFz1xhzZwsD3wnwMELF2Hu8kCGrvJcI19ZE+LoL4Nvg+PW+ACXemFV18r/OAdVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828901; c=relaxed/simple;
	bh=GjPungAra1LmQp/AOkev+C2xoQwdvEloRuxyC15MPDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLzbA0d1pwgJ1YXVDoVgooZRVIj2gGIWAld5PGNKQ5qdZAnzaLDZrIaUtVt6aaMpipPWeJ+DphKVgvy+hbCuPHLjTLGv5TRYc7WfDNy2U/EuLs2/nD5UXT4/Lh5gH5CFixfxdgNNLGql1MaS2kPj/WbqH9iVrLJ2wvCaaSTlbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYxgMQAT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYxgMQAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712828900; x=1744364900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjPungAra1LmQp/AOkev+C2xoQwdvEloRuxyC15MPDM=;
  b=TYxgMQAT4pGgrqF3vlti4KlbiYrCnlenljFNVKxfwgS9eQ8d3AoORcc6
   Xc3YTWhDtLXH2gDVyCpxlo/gfNfUpTdFU7GOjjBgFye1qcCQfLEbG0A2Q
   eO8+GNAzNMEJfLncaP3yHH2uTMXqGhui40A6x0z5T818/XNQJqJcWTbM2
   XaE9FULJWrWYZlrO6FPsZkcjlCr3gwhHnYD6sGImc3WANpE0LX58HcKjD
   s/9DDZnoQseSgpafhBev3LDEYVUqu0scQwQh5hK5emtsb5Qt/MF69Qjh/
   ieawVSR68eUlNYEJwn8La0LLj6+PRyd/xi66oUSRb0Gq+m5TiNu9vFv2i
   Q==;
X-CSE-ConnectionGUID: C02wNQc4Qm2ZsuCeeRewKg==
X-CSE-MsgGUID: 3yOOmRCiSkqb1AZYZ2oIrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8087751"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8087751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:48:19 -0700
X-CSE-ConnectionGUID: 1h42mwZkS9qG9/NbbGr1cA==
X-CSE-MsgGUID: 5UB8ntXwSWmKq7arKSVDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20901605"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2024 02:48:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rur2W-0008Tn-0g;
	Thu, 11 Apr 2024 09:48:16 +0000
Date: Thu, 11 Apr 2024 17:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 16160/18110]
 drivers/net/phy/phylink.c:701:(.text+0x3474): relocation truncated to fit:
 R_NIOS2_CALL26 against `linkmode_support_c73'
Message-ID: <202404111708.CBvU7BWC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   2bfda7392e6621dd9060f87d7f9d601bb1906dbf
commit: 437a7c67817908bf02b57f1259af2933ef9891e4 [16160/18110] net: phylink: add support for managed = "c73"
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111708.CBvU7BWC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111708.CBvU7BWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111708.CBvU7BWC-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_c73':
   drivers/net/phy/phylink.c:701:(.text+0x3474): undefined reference to `linkmode_support_c73'
>> drivers/net/phy/phylink.c:701:(.text+0x3474): relocation truncated to fit: R_NIOS2_CALL26 against `linkmode_support_c73'
   nios2-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:1016:(.text+0x3904): undefined reference to `linkmode_support_c73'
   drivers/net/phy/phylink.c:1016:(.text+0x3904): relocation truncated to fit: R_NIOS2_CALL26 against `linkmode_support_c73'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_RNG
   Depends on [n]: CRYPTO [=n]
   Selected by [y]:
   - IMX_ELE_TRNG [=y]


vim +701 drivers/net/phy/phylink.c

   684	
   685	/* Validation of C73 link modes should not depend on state->interface, because
   686	 * that is an output of the C73 autonegotiation process, so it cannot be used
   687	 * as an input in establishing what should be advertised. Use pcs_validate() to
   688	 * give us the core set of link modes, and mask out those modes that aren't
   689	 * supported by mac_capabilities assuming no rate matching.
   690	 */
   691	static void phylink_validate_c73(unsigned long *supported,
   692					 struct phylink_link_state *state,
   693					 unsigned long mac_capabilities)
   694	{
   695		__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
   696	
   697		phylink_set_port_modes(mask);
   698		phylink_set(mask, Autoneg);
   699		phylink_set(mask, Asym_Pause);
   700		phylink_set(mask, Pause);
 > 701		linkmode_support_c73(mask);
   702	
   703		phylink_caps_to_linkmodes(mask, mac_capabilities);
   704	
   705		linkmode_and(supported, supported, mask);
   706		linkmode_and(state->advertising, state->advertising, mask);
   707	}
   708	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
