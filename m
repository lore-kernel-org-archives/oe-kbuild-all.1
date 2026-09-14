Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A1472783
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389170; cv=none; b=ch1HccyntWmtmQBYtSGDmEU4CinoOcC51CHJXpo3EsAvaD60qKprlKhXjTmIYMpfJ2dESJoyn4CVH7cS+1m6ZZ4qTDKVFHY4B2s8+j6iJmT6FSc6AyEVfKOOUGvgOhHA0VxQvDKxKVMYVgkFGWXw+94/b02w8otSrdE96yRHb6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389170; c=relaxed/simple;
	bh=wtpLunOcFbPVfPaADxJ9v7hTea6HYj2Yg9yA1m7rdSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVLPZlAwsQIVNMUpdl99EPCQLmb4amUZ5+DIUmbjrpw19Yd0HhUj8Td214q/TAHyPMXWV82lsBSaKUUrP2LUqG28ePMYGaxWn1FE5X05lwBvQyp6usPtn+peDwJzLNvBSqpioZHUmhmS1+eAqi21B3MlJKAT++8yKdLI+9fZzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZ/9hwKu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZ/9hwKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789389168; x=1820925168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtpLunOcFbPVfPaADxJ9v7hTea6HYj2Yg9yA1m7rdSs=;
  b=LZ/9hwKuf3Z/2p0AdDgpSad9Rhi1WAkVDlYnNx/AWBcIqRpPDM45QILj
   efCjECFtWLypQz8fQnA3lhgZrpErNLvSzzYGeZOc0hUCgi5T9DjpKGpct
   CJKIL73nkAFERw390DEGjomAXKimu/VpJ0BRnOgILqVndju/2bT7uLGLp
   cCfy8r+MICBh07XBz14e/a3MxtdhFb17+fJ2CSUqgMqqoFPmCGslw2WJS
   5SK2EuMJMjVZ7/uG7fmRNxhar0ffJz8UhYzoWMHZSZN1AT1ex7WxU52Y7
   S8xElhCLo9bwKqbI4yXk7tNDM/QheNlntuAEWJCoocpCbPV/jLn+C3M4x
   Q==;
X-CSE-ConnectionGUID: VZyVj6/qQZ6uyoGtgfbgmA==
X-CSE-MsgGUID: biZZVCywRQ+865rh397DfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89674838"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89674838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:32:47 -0700
X-CSE-ConnectionGUID: GNc1C7ejSMWinJ1sDVjK/Q==
X-CSE-MsgGUID: 6QMgZINARnCBDVNz7X2nvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="272594762"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2026 05:32:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x65rY-000000002t9-2syc;
	Mon, 14 Sep 2026 12:32:44 +0000
Date: Mon, 14 Sep 2026 20:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: pcs: airoha: add support for Airoha
 AN7583 SoC
Message-ID: <202609142003.jrINwpOC-lkp@intel.com>
References: <20260911072340.107675-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911072340.107675-1-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20260901-102916]
[cannot apply to net-next/main net/main linus/master v7.3-rc3 next-20260911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-pcs-airoha-add-support-for-Airoha-AN7583-SoC/20260911-092339
base:   https://github.com/intel-lab-lkp/linux Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20260901-102916
patch link:    https://lore.kernel.org/r/20260911072340.107675-1-ansuelsmth%40gmail.com
patch subject: [RFC PATCH net-next] net: pcs: airoha: add support for Airoha AN7583 SoC
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260914/202609142003.jrINwpOC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609142003.jrINwpOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609142003.jrINwpOC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/pcs/airoha/pcs-an7583.c:2266:5: error: redefinition of 'an7583_pcs_usb_phya_bringup'
    2266 | int an7583_pcs_usb_phya_bringup(struct airoha_pcs_priv *priv,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/pcs/airoha/pcs-an7583.c:10:
   drivers/net/pcs/airoha/pcs-airoha.h:1751:19: note: previous definition of 'an7583_pcs_usb_phya_bringup' with type 'int(struct airoha_pcs_priv *, int,  phy_interface_t)'
    1751 | static inline int an7583_pcs_usb_phya_bringup(struct airoha_pcs_priv *priv,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/pcs/airoha/pcs-an7583.c:2278:5: error: redefinition of 'an7583_pcs_common_phya_bringup'
    2278 | int an7583_pcs_common_phya_bringup(struct airoha_pcs_priv *priv,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/pcs/airoha/pcs-airoha.h:1745:19: note: previous definition of 'an7583_pcs_common_phya_bringup' with type 'int(struct airoha_pcs_priv *, int,  phy_interface_t)'
    1745 | static inline int an7583_pcs_common_phya_bringup(struct airoha_pcs_priv *priv,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/pcs/airoha/pcs-an7583.c:2299:6: error: redefinition of 'an7583_pcs_common_phya_link_up'
    2299 | void an7583_pcs_common_phya_link_up(struct airoha_pcs_priv *priv, int index)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/pcs/airoha/pcs-airoha.h:1757:20: note: previous definition of 'an7583_pcs_common_phya_link_up' with type 'void(struct airoha_pcs_priv *, int)'
    1757 | static inline void an7583_pcs_common_phya_link_up(struct airoha_pcs_priv *priv,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/an7583_pcs_usb_phya_bringup +2266 drivers/net/pcs/airoha/pcs-an7583.c

  2265	
> 2266	int an7583_pcs_usb_phya_bringup(struct airoha_pcs_priv *priv,
  2267					int index, phy_interface_t interface)
  2268	{
  2269		struct airoha_pcs_maps *maps = &priv->maps[index];
  2270	
  2271		regmap_set_bits(maps->multi_sgmii,
  2272				AIROHA_PCS_MULTI_SGMII_MSG_RX_LIK_STS_1,
  2273				AIROHA_PCS_PAUSE_STS_P2 | AIROHA_PCS_PAUSE_STS_P1);
  2274	
  2275		return phy_set_mode_ext(priv->phy, PHY_MODE_ETHERNET, interface);
  2276	}
  2277	
> 2278	int an7583_pcs_common_phya_bringup(struct airoha_pcs_priv *priv,
  2279					   int index, phy_interface_t interface)
  2280	{
  2281		if (priv->phy)
  2282			return an7583_pcs_usb_phya_bringup(priv, index, interface);
  2283	
  2284		an7583_pcs_dig_reset_hold(priv, index);
  2285	
  2286		an7583_pcs_cfg_phy_type(priv, index, interface);
  2287	
  2288		an7583_pcs_common_phya_txpll_on(priv, index);
  2289	
  2290		an7583_pcs_common_phya_tx_on(priv, index);
  2291	
  2292		an7583_pcs_first_plug_in(priv, index, interface);
  2293	
  2294		an7583_pcs_ana_reset_release(priv, index);
  2295	
  2296		return 0;
  2297	}
  2298	
> 2299	void an7583_pcs_common_phya_link_up(struct airoha_pcs_priv *priv, int index)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
