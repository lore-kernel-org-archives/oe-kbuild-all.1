Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C39273FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705842376; cv=none; b=lx26X2bbiLzXOg90x0ZTn2Xy+7QknUYKKmk+xZ/R3qDEJfqD7JFrpx/qUJCLsRcwaHj3Rg2fNOmmWsZOPMlExHknK5bMmYjMTCehWnf6/CpZb0R9OqUcTbke1abjp+MufBA70JcmWZh0UQai7HHogeycKw6CzfOkNou+7wonu80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705842376; c=relaxed/simple;
	bh=7U/YKi36YJtD3q2CVrX3DGN2DUCXc18vXf7B4RhwpjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOEwrK6tMwdFcDWIr0rwLFolQwTziNSdgoiIKmhKjVj0THYZXDIBWJp//gS4NXfDPmjckwMJgA9YJjaaJWEz2V/h7EEs6r6KN0bkOxIaUzcqCRTI+0P91sA9anSlSWelUq8HDUzJ6obppITHyUGzSR+mxDKYhJgafBA6JWKQR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OohIF1tz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OohIF1tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705842374; x=1737378374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7U/YKi36YJtD3q2CVrX3DGN2DUCXc18vXf7B4RhwpjQ=;
  b=OohIF1tz1o8WYgwasc5UuXYSpt5AbrrQD/IB8slg3+4R1STc9qzRTRiy
   5ih0XKyZMxwde+TwfdzQygxSUoS+A1v3H4PkLt9qz5kQMlG+Vo5XQhhxt
   r6PwcdyZ0x9XsMMG/87GHniocvNo4IEFPQP3cC/lP/yjjrozRsG+JGjo0
   SOboeQO6wKJK8fLsELlyTtojOKB5UFuffZiD1UBn8o9uodtM+IVZ0NZk2
   RtGThHmPFjD36/2Eh0jp46BMlG81fXkvxLGIXIId78Ah/f1ym0JdBFHWj
   pocxqcs4qZLRT9o8rHK2u+ktxDyc/kRMwaTg4JcXOCA8NjLrGJNLgHJiu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="8124468"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="8124468"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 05:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="788738852"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="788738852"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2024 05:06:11 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRXWb-0005vy-2a;
	Sun, 21 Jan 2024 13:06:09 +0000
Date: Sun, 21 Jan 2024 21:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26797/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:2104:33: warning:
 'hns3_unic_ethtool_ops' defined but not used
Message-ID: <202401212022.rhFtuhFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   297307a8bbb354ddba271dfebf528961834ddf14
commit: 737ec46e963210dc3b856637e871fa5b0c91316e [26797/30000] UNIC: Adds the process of UNIC driver initializing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240121/202401212022.rhFtuhFB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401212022.rhFtuhFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401212022.rhFtuhFB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:2104:33: warning: 'hns3_unic_ethtool_ops' defined but not used [-Wunused-const-variable=]
    2104 | static const struct ethtool_ops hns3_unic_ethtool_ops = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c: In function 'hns3_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:588:58: warning: '%s' directive output may be truncated writing up to 119 bytes into a region of size 32 [-Wformat-truncation=]
     588 |                         snprintf(buff, ETH_GSTRING_LEN, "%s",
         |                                                          ^~
   drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:588:25: note: 'snprintf' output between 1 and 120 bytes into a destination of size 32
     588 |                         snprintf(buff, ETH_GSTRING_LEN, "%s",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     589 |                                  hns3_priv_flags[i].name);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hns3_unic_ethtool_ops +2104 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c

  2103	
> 2104	static const struct ethtool_ops hns3_unic_ethtool_ops = {
  2105		.supported_coalesce_params = HNS3_ETHTOOL_COALESCE,
  2106		.supported_ring_params = HNS3_ETHTOOL_RING,
  2107		.self_test = hns3_self_test,
  2108		.get_drvinfo = hns3_get_drvinfo,
  2109		.get_link = hns3_get_link,
  2110		.get_ringparam = hns3_get_ringparam,
  2111		.set_ringparam = hns3_set_ringparam,
  2112		.get_strings = hns3_get_strings,
  2113		.get_ethtool_stats = hns3_get_stats,
  2114		.get_sset_count = hns3_get_sset_count,
  2115		.get_channels = hns3_get_channels,
  2116		.set_channels = hns3_set_channels,
  2117		.get_rxnfc = hns3_get_rxnfc,
  2118		.set_rxnfc = hns3_set_rxnfc,
  2119		.get_rxfh_key_size = hns3_get_rss_key_size,
  2120		.get_rxfh_indir_size = hns3_get_rss_indir_size,
  2121		.get_rxfh = hns3_get_rss,
  2122		.set_rxfh = hns3_set_rss,
  2123		.get_link_ksettings = hns3_get_link_ksettings,
  2124		.set_link_ksettings = hns3_set_link_ksettings,
  2125		.nway_reset = hns3_nway_reset,
  2126		.get_coalesce = hns3_get_coalesce,
  2127		.set_coalesce = hns3_set_coalesce,
  2128		.get_regs_len = hns3_get_regs_len,
  2129		.get_regs = hns3_get_regs,
  2130		.set_phys_id = hns3_set_phys_id,
  2131		.get_msglevel = hns3_get_msglevel,
  2132		.set_msglevel = hns3_set_msglevel,
  2133		.get_fecparam = hns3_get_fecparam,
  2134		.set_fecparam = hns3_set_fecparam,
  2135		.get_module_info = hns3_get_module_info,
  2136		.get_module_eeprom = hns3_get_module_eeprom,
  2137		.get_priv_flags = hns3_get_priv_flags,
  2138		.set_priv_flags = hns3_set_priv_flags,
  2139		.get_ts_info = hns3_get_ts_info,
  2140		.get_tunable = hns3_get_tunable,
  2141		.set_tunable = hns3_set_tunable,
  2142		.reset = hns3_set_reset,
  2143		.get_link_ext_state = hns3_get_link_ext_state,
  2144	};
  2145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
