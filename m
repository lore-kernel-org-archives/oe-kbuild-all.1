Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC36155389
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769962139; cv=none; b=NDTrENll+fpgykHEFZ0Kw4VsLkCe3OhshE0OiYQ0gMltWZkkdyj136ylrGrjg/liYF6UMki+QPhFbGC3BoCnSbOmj1IZiee9L+GtznyheOJCgt7Gccqc7nlBlAtQ5KPLMN/4O/k2B/VfkaRWWRbI1S5z3R3WXZ8uF/G1Gi/ZGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769962139; c=relaxed/simple;
	bh=wbmtGO8d15wcoAlAXZ6gxsSUwrytrBSLJi1rpj09J5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MLzsMRdSzsiwasPalrg3DDaqgKcdTYQ013ongR7qkSNc8ZefLQRlfcP0NelFGiabA5d6RNDq6Ha+Npa0tbDGyQKSnGo+CKIUQdjGtVAIXsvBOE2EQdOP+twOYTJjrSg8XrFhU3OYti8JRpCur8yccgWjFixhOM90KOWbfZe2zuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSspCjz/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSspCjz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769962138; x=1801498138;
  h=date:from:to:cc:subject:message-id;
  bh=wbmtGO8d15wcoAlAXZ6gxsSUwrytrBSLJi1rpj09J5s=;
  b=hSspCjz/dR3KWCGqPpPZMZsf6ohGm1WgTDX9NTzwNEJjm9bcD8vtg+/c
   Eqtur13J8L5M7JPR2Svigx7mOCXMnh/rzpVO6KGdmnkR1KPdfv3JklXxv
   rIimkOL5FAp2Y48+H8w3gNbYR2LrBuNlC9LU/FdYFw0cxszUKx7Y8cajG
   aHFZS7wtjGOt12z9NvMUhoickhFdVCoREwzT3DjmiNcWfp4OyfqyctmJQ
   4agzSLtqYANJBfQGfiJHHVkExZYafMq7ugEAQ8jniTDOiRsI4PkKS/Gm7
   JbSU2PdmEEg23i6Pf0gk5NooLb9Uc8x8MAVZ4LqD8aHiX+2qIEq1zgTYx
   g==;
X-CSE-ConnectionGUID: WhOq8tn3SzGsqX4tPjijDg==
X-CSE-MsgGUID: /gxt0p9+S+2HogbqQTJL5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71036356"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71036356"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 08:08:57 -0800
X-CSE-ConnectionGUID: RluDTcc4TEe5GSilDaKgqQ==
X-CSE-MsgGUID: K92V+aF3SJaR+djTfGolhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="213391830"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2026 08:08:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vma0K-00000000eqK-3YEW;
	Sun, 01 Feb 2026 16:08:52 +0000
Date: Mon, 02 Feb 2026 00:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 133/133]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202602020015.rqhqrIk3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   3aa6ba75ca4f9bad60511cef75ec85aacfcf9464
commit: b4e835e7effb778d4108e9a343ff47a7d80957f0 [133/133] net: phylink: support late PCS provider attach
config: riscv-randconfig-002-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020015.rqhqrIk3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020015.rqhqrIk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020015.rqhqrIk3-lkp@intel.com/

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
