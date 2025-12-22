Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427B29AB05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424294; cv=none; b=tAKrxd6tDBUPJGwXqhsbuZlL93dEqBlgSwPU7lqCQmWJBn5BjVKpSQd+tlDP40jj0LTMtiGFbZ4mp+/JcL+Bu0w6/Q+nDChQqo8Yeck60OV29NH9X8JXhPfWQSmMRAkEgF+A0CGBUQ+oV85Vn8f1Evd/DPcUJ43wkIgFFpzWN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424294; c=relaxed/simple;
	bh=MCKSWfOvavrYFvYfqIbXjHAbqKmqWfPUGaaemTTVLWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/CLfM6Obv/ip4kDT1AcVEqjolIaZMON+AIn+pZgaOQslBrk0TPvNBBifRd5BmTlWSEc0nepRBwjopUW3I5h/K6ClLfGjB6RZNgLZ5Pbv4RgDR66+QmbksDSUsi6msmWMqRNv7Y2XDKoA1VYGUkInsfzg7jCEso805y8bCJBsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KInYqvF5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KInYqvF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766424292; x=1797960292;
  h=date:from:to:cc:subject:message-id;
  bh=MCKSWfOvavrYFvYfqIbXjHAbqKmqWfPUGaaemTTVLWA=;
  b=KInYqvF5cx/+fzr2pgU5QgnjrY/pwnZzPGWhsdqWxTP4UDf2AClIgUQa
   qZ3MGNFyB9BK6cFqfBh8SgFkaToen0Z3TQ9Z/XQjo8kFyrh1Zh3zHEk6D
   1zNeT78/xrJWUezWVIkWwBzmPPAAJKfKNjnSX9Qwa2h6c7K4ajy+cNFr7
   GvT/+1uMyU3C8/UL6Z94tyx93qcvybJ+kgpY8N4jLIfPuoRi1KRq1ybrh
   QVGDoKsM/jg3uDpFF0wECxvSQfWjlbHV4iPyPLHnDLVq0hU6tEZ02Mfw4
   mvxlakCxy7FyoqXtefM07sL7cVfFgy/DQd1EdQSdjt7m6dcx6m0ZYByPd
   w==;
X-CSE-ConnectionGUID: k/+RVvd4Tu6YG7ABjzHd4A==
X-CSE-MsgGUID: 9Wz+IgynRKa0Yptn4TmEDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68324759"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68324759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:24:50 -0800
X-CSE-ConnectionGUID: qjbveXNtTdCGpb/SKtfteA==
X-CSE-MsgGUID: Obrrhzq8TwelPx9jrMnF1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199341829"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Dec 2025 09:24:48 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjeI-000000000vX-0kyW;
	Mon, 22 Dec 2025 17:24:46 +0000
Date: Tue, 23 Dec 2025 01:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-netnext-rss 13/25]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202512230130.94MwkRl8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-netnext-rss
head:   2f037797178ec9f630e7f6bd06d51e4045963b0b
commit: b6f8889bc1af697fdda06f6aee505a2b96e1da55 [13/25] net: phylink: support late PCS provider attach
config: sparc-randconfig-r073-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230130.94MwkRl8-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230130.94MwkRl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230130.94MwkRl8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
      90 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      78 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
