Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC181E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753955071; cv=none; b=Ud6cFw5AxizDvfAVcUc6ZfBf+6GKCs8V+IqwK/Csz1VuB3oH6AjArs1K4XAH7l0aUeXcFxfQifaEuH5nvanfGWJtmR2ynPt3X2qBXwdvDMXIbST+vKBnuTTLI0lXvXQ6yq3lLglPPBhUYQiELX0s6MhWB72eNCJ7xH0CbbsEmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753955071; c=relaxed/simple;
	bh=VEoYNejBqIjZ7/JDYJcIwMCoHKWmk75fDd6N9nH+o9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+rN/6w8+8w77r50n2mGDVbNIm7uMeB6Fu4Ov0NfDZwD0zy+Vwh3bAD+IPF1M8l7KmGdD/XF9OnhvlIp2sBIuCqhJ8Bs3zpuLUjD/MQ4X4d7KC69228dLdAP4A5SV3u/KMvaVU82ENQENiCLZPQqYYGhx2kWFeBMV0IknZDdmT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVO5qBzb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVO5qBzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753955070; x=1785491070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEoYNejBqIjZ7/JDYJcIwMCoHKWmk75fDd6N9nH+o9U=;
  b=mVO5qBzbGqN16gd8YQmTl6TrpIErpt2hNy48TvD9XP0WizxxlQ4ufVK+
   IPigcQn4PySRBWtV1flPRR4Kn8AYxb/jw0R/ww98pcSlF18IWHiQw49jR
   WRgBSOJty/vDUbkuf4/sy+pzbO3z6Mbxx0hcRPMLEHDbwGz8GDpJU6fmc
   W6VgEE9P2BQTX6Ody1DLsLP8VT7zA7rMF7d6MpVCt7aj2xiKG1CyggY2I
   +VlqxHabPfA4IzKNAoJUbSHGWpgieEpwFW6vba8ZRi8aYWXvwi+cCOtqv
   Hbdeac1I6HpS9M/0CVvIUrzZ5IKtvrVZ6B99uB/GnYZgeD60NaYzeQfkl
   A==;
X-CSE-ConnectionGUID: zUkn4nj6Tkq4v2BGSmYaAw==
X-CSE-MsgGUID: 7t4OpHZCR2iWa1s+V5dFRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60094773"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="60094773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 02:44:29 -0700
X-CSE-ConnectionGUID: Iy4Te+pfTcyMXX38luZbNQ==
X-CSE-MsgGUID: i1DHjKo0SwCQXia4En0GIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163664303"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2025 02:44:28 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhPpp-0003ci-2n;
	Thu, 31 Jul 2025 09:44:25 +0000
Date: Thu, 31 Jul 2025 17:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 29/61] include/linux/pcs/pcs.h:90:1:
 warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used
Message-ID: <202507311735.33ud1xJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   91e226e3ba3199526769b10b2f2eccd21872c876
commit: d490d78fc104c047edb1ac1334cd8d659d603f26 [29/61] net: phylink: support late PCS provider attach
config: sh-randconfig-002-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311735.33ud1xJa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311735.33ud1xJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311735.33ud1xJa-lkp@intel.com/

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
