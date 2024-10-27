Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFDE433D0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730020625; cv=none; b=mAKLSXljrg6nuaVG65c4vcLCksbf74bbvy8n9lzWqn/vjkwr38YLupsprFpYyHdOi7BmMePPWa2fAoWj7DGEMgoJtSto1srhjwV0L5fD6m+H7ZcoycdeBZHTGGH0mNWyKtIPf6ZUH0co+2v27RQSpBdrUKS/QVDNdz8IQpqsEfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730020625; c=relaxed/simple;
	bh=6KbqJCtx+tLiCgXQwGIEE/seXUugVmeBLuLlkVX9uMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elBqfOTN/Dt+FE4A/XnDDg61yIVnwfndcODjY49Oa3jTQBnJh1kiAncclkYzjlRvsudPHZA/im1oKE9dT+GMH2Y7RVlO6Qjj0llih3pcdt4gtnJBh3pKgObhbLI65QWVuEgcfy/U4C4rkzS7rwBi6WkzMfYJ6XQiQUjIgeUib/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brZvNMsg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brZvNMsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730020622; x=1761556622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KbqJCtx+tLiCgXQwGIEE/seXUugVmeBLuLlkVX9uMY=;
  b=brZvNMsgAJJ/ckp5pdU3ud4Ze0qb5MdAq26xJ1+RZagySqeOwWCzcifl
   3unzpyR4E6z5C+kZzUffK5nIFl7R9v8GRckjn3Xuegplqcc2qT4F5VJ8m
   RXNfWzlpL7XeU0NkX59WNEvKl9m4u/oSKkcckY5ewqlgMzWcvqyAoeLPF
   L/MCjd8ouRl+E7hD6pKEzXZhfYiaQUBwg6nEE296C13GjGiKUSuf/1GFo
   2PPIvJsB4mvOZQrCRMGI/5PcroqMqJAQKyPwIB07rgas505Z7Ifyh2RVF
   lR+fST669etliV6HnHRP5Z95EKrThXH/eTdtAAgxaGt1Zn6dCwcAjR8Ri
   w==;
X-CSE-ConnectionGUID: 7uRgQnY0RNW2+H83RcoQNg==
X-CSE-MsgGUID: yNqR1F3fSMa5Z5F7cS1EwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29501897"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29501897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 02:17:01 -0700
X-CSE-ConnectionGUID: mHsUcGEHTc2XK0GP2P4nOA==
X-CSE-MsgGUID: i31DVdboStib6TVMYSDHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="82159458"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2024 02:17:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4zOM-000aaE-2A;
	Sun, 27 Oct 2024 09:16:58 +0000
Date: Sun, 27 Oct 2024 17:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19377/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:2104:33: warning:
 'hns3_unic_ethtool_ops' defined but not used
Message-ID: <202410271746.Yz3z91T2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fengyan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 737ec46e963210dc3b856637e871fa5b0c91316e [19377/30000] UNIC: Adds the process of UNIC driver initializing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241027/202410271746.Yz3z91T2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271746.Yz3z91T2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271746.Yz3z91T2-lkp@intel.com/

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
