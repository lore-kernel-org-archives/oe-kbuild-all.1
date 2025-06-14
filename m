Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1320F1FBEB0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 23:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749944388; cv=none; b=OM6qDkTezwDFKeD4MQvIlz9AGFMk31JjqwA+fYZbgE+wO0hQ8E9MFpU5z4px9I2L6ukUdxxoi4iSyWOwyZS/1Orlld7Lx9UlhdW251gDZUXXaoeSmzV9VNh5/P8OxAnB5f6sgz/RJKd9Jtev72cbwx3ZVNZTc4mqmvmNqJRbYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749944388; c=relaxed/simple;
	bh=AYpyNXeZy1aPMv2w4XGnqdEFbCatIy7/6G5eteKjlV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ITfnCl+SWcoRKDd9xYwQNr52OmnQzzUxsc9VRHuC5F66DAyQm22z3HOvvkgS7D7EL3PjdZAlgoVt5Y2xiWG+vrZ0OJ/A/0i+1YOJACGYZkhGBjI8gquu/+O8tm7wD9ld1M7FTgQMC8SJ0FbnZI1p57VrgFGEdJ6ZRllfBokDkhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPC3GvLb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPC3GvLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749944387; x=1781480387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYpyNXeZy1aPMv2w4XGnqdEFbCatIy7/6G5eteKjlV0=;
  b=ZPC3GvLbBFuQcbJAs+bppQZlFD6PRSXY8SoqMAIOAug0BWBKO6V+kUKQ
   F+TB2EUYuq44W3wbTZu5K2CNiqzQ/d/E+h1S7px5sQ/rC0WZoFxamJ4vC
   x6lISg0nW8TKhTYC1xkBc7sjtex1sCKBgKbiPX6o+KAP6wK7ACCT5RDpp
   oV7NxEL32+2Q7EnXYC4hz0b06U3eUzxejrBacVxwhvAaQmhCKakgpAkp0
   rqH4IaOT0Kc+CfJtfCvxNJldzU7DzVk53ufahXfU6FOxeEtMgpcedp5So
   aapFNe4Q+y0xBVaVedA2Jci6BObFTxqO+64iYkCzhuw0KgTGKYE26Py1i
   Q==;
X-CSE-ConnectionGUID: v309Q275Qxy0FjljEDMz4w==
X-CSE-MsgGUID: pj3z2R3PRh2yTIhNaEHR6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55928080"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="55928080"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 16:39:46 -0700
X-CSE-ConnectionGUID: gfrNynWxTQWmu3ke5daDnA==
X-CSE-MsgGUID: BNUAkUiaRkijHernFVkt/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148117073"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 16:39:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQaTP-000Dx1-0u;
	Sat, 14 Jun 2025 23:39:43 +0000
Date: Sun, 15 Jun 2025 07:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 29/61]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202506150719.zdYF0NE8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   b17cf8cf3f5c81caacf7ef16812b79e57c99078b
commit: d490d78fc104c047edb1ac1334cd8d659d603f26 [29/61] net: phylink: support late PCS provider attach
config: parisc-randconfig-002-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150719.zdYF0NE8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150719.zdYF0NE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150719.zdYF0NE8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
    fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int register_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fwnode_phylink_pcs_get_from_fwnode +90 include/linux/pcs/pcs.h

    24	
    25	/**
    26	 * fwnode_pcs_get - Retrieves a PCS from a firmware node
    27	 * @fwnode: firmware node
    28	 * @index: index fwnode PCS handle in firmware node
    29	 *
    30	 * Get a PCS from the firmware node at index.
    31	 *
    32	 * Returns a pointer to the phylink_pcs or a negative
    33	 * error pointer. Can return -EPROBE_DEFER if the PCS is not
    34	 * present in global providers list (either due to driver
    35	 * still needs to be probed or it failed to probe/removed)
    36	 */
    37	struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
    38					   int index);
    39	
    40	/**
    41	 * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
    42	 *					by the firmware node from a
    43	 *					firmware node
    44	 * @fwnode: firmware node
    45	 * @pcs_fwnode: PCS firmware node
    46	 *
    47	 * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
    48	 * 'pcs_fwnode' firmware node.
    49	 *
    50	 * Returns a pointer to the phylink_pcs or a negative
    51	 * error pointer. Can return -EPROBE_DEFER if the PCS is not
    52	 * present in global providers list (either due to driver
    53	 * still needs to be probed or it failed to probe/removed)
    54	 */
    55	struct phylink_pcs *
    56	fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    57					   struct fwnode_handle *pcs_fwnode);
    58	
    59	/**
    60	 * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
    61	 * @fwnode: firmware node
    62	 * @available_pcs: pointer to preallocated array of PCS
    63	 * @num_pcs: where to store count of parsed PCS
    64	 *
    65	 * Generic helper function to fill available_pcs array with PCS parsed
    66	 * from a "pcs-handle" fwnode property defined in firmware node up to
    67	 * passed num_pcs.
    68	 *
    69	 * If available_pcs is NULL, num_pcs is updated with the count of the
    70	 * parsed PCS.
    71	 *
    72	 * Returns 0 or a negative error.
    73	 */
    74	int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
    75				     struct phylink_pcs **available_pcs,
    76				     unsigned int *num_pcs);
    77	#else
  > 78	static int register_fwnode_pcs_notifier(struct notifier_block *nb)
    79	{
    80		return -EOPNOTSUPP;
    81	}
    82	
    83	static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
    84							 int index)
    85	{
    86		return ERR_PTR(-ENOENT);
    87	}
    88	
    89	static struct phylink_pcs *
  > 90	fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    91					   struct fwnode_handle *pcs_fwnode)
    92	{
    93		return ERR_PTR(-ENOENT);
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
