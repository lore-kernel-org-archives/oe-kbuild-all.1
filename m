Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779AF314B64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458811; cv=none; b=k2TLajAf8s+LQQgbvLMttSAZKYIzg3IIRkOv1/kGSO/H/xZl1NNIm3556dllY179GFqSGCIBkpPL6MKOAUGghpUpetLdfs8o2jluuImJYBH4l1dEq2XLtIYVccp64dganW4pwttLne+WRldwaxMdaTbQqPHA65M6iz9SQX5QMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458811; c=relaxed/simple;
	bh=R52fcQLq3hZWro/jrQfkD/WxUVULqXfmj1Ui3NbN/LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5D4i8enUeAlXBcenRMPpbHlQPRH0UGeWZILk4JNEOa8//Pwle2CkAzPfPiENGLrNouVhupIYCJfiMPRgKvn1gZYhsnU6XCFPzqfXE6CBL1seG5c16df52khnSNnrQ8H9CQmR83BghUClgO8cWHogitNcJMFzrqMnz7ya+1qe2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m67uEtZn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m67uEtZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763458809; x=1794994809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R52fcQLq3hZWro/jrQfkD/WxUVULqXfmj1Ui3NbN/LA=;
  b=m67uEtZnaqJWKJcZRk+KJ7oUpQ6oR3e8yW+IU6HtLCZ1sr5yJs0gdrDi
   KG/wZKh6Dy/364gRoS59vBLugqjqzt//Pb02si/k/XMoUZ/u2yP9nfADT
   7nqLd4wmYWBWpYZCeNg3Wu02/tlER002qsY/Ue70TX6OwuHlZmC0Oav5r
   kX6Owj4chumLQVKHpjmvBv1Sh0+o5MPi1Ghx+06qTt/rV5oYkkmVD8job
   ZWn85zfw+VdgcpJPa7vmYbmKLb5f0Q7xQ/sqeR9kKN9OvzDQT0P/Km6Ss
   7AK3fPdb6yApt5aw6j39SveZrod8w5fkqCLvYcaVdXT+8PA1IBQ1yLy+N
   A==;
X-CSE-ConnectionGUID: bfi2XBRIRBik+l5dZ1O3lA==
X-CSE-MsgGUID: U0JNaV12Q26NhFeVvw1OtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65413957"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65413957"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:40:08 -0800
X-CSE-ConnectionGUID: QfLa0Q7gQIeY8BczDJrnhg==
X-CSE-MsgGUID: q+HzpOOATQC3pu5g/F5K9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191482317"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2025 01:40:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIBw-0001Yf-3B;
	Tue, 18 Nov 2025 09:40:04 +0000
Date: Tue, 18 Nov 2025 17:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 39/123] include/linux/pcs/pcs.h:90:1:
 warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used
Message-ID: <202511181729.6t2SMnix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   5812b58f3248f2b8ee76ed9c7b05782eed6fbf0f
commit: a5930f19b43e326d4f165722cb0cc198410385eb [39/123] net: phylink: support late PCS provider attach
config: nios2-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181729.6t2SMnix-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181729.6t2SMnix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181729.6t2SMnix-lkp@intel.com/

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
