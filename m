Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841F1A6826
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945696; cv=none; b=D3/nos7WPgA4KNkLvNfJUxHH9eY7KSOAY4cUm0V4KIpYctC1nSa0lD1nQ8Xav7cxlD0bPSE27LHwHZs0M2h4iV/VEzt2W64jjDsqu3E63L7kUp7VwA04CTqnMbuMrzyosnCxfsZR23quOn0HIMfKAKCkD5MKRF2X3adrYGYj9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945696; c=relaxed/simple;
	bh=CQkAdJNHt3hFj0xR+LAsrQ6w7Pz30ovwlEWDnfMrxaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Denj5Nn3+0r4bJENlL6/cZGh+QCTsUEOQVOHQpVtS31XB71W8BB1Pp7Rk3ML2p/aEmDQ0PRXMMlNy0U5Rt4D8AX7HsKBsIOEPSkNVnXzHQglo433ciJTOySJ5nItAwJcdmTgBOL1VzjFcTIBYVaInUzUEs0dmtehRXp/yr8UOmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFnl/Rt+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFnl/Rt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772945694; x=1804481694;
  h=date:from:to:cc:subject:message-id;
  bh=CQkAdJNHt3hFj0xR+LAsrQ6w7Pz30ovwlEWDnfMrxaw=;
  b=hFnl/Rt+LcwgL1tJ4cteCOkmO4YFo0sfosj0Eg1Vw3nJ5Xztej9WUSoP
   jzNqO3zoF8n6H1VgDvxJiy3ojCotAPUhdipsyFI9Lf5ey5ermME3Y2tl0
   5w1dSbVZrj8j2TXImvGsUxj7FCazkpQEXbLcsOFSiFEqNM2sYhZ9Ke6Ow
   5+M2zfWJPqMWpiRkdg5dEo9AyFg3TvQnJVlBYs2slTFXXYqY0626J+tba
   zt6/QkzB9ANJxiLuBQAA4zJ5Y0RkKvPxWOhoH7t55FdqOEFFu7MKehLVS
   4Cd09zj1yORnoYMPEQHC9jDbsEeueS+2Th5MkAdi9shqqMOhnHHd/0GBG
   Q==;
X-CSE-ConnectionGUID: Wt4v27F2TE2KPUQu+Dw5JQ==
X-CSE-MsgGUID: 3kG4YqClR/KdL/Q9ItOwPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77857115"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77857115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 20:54:54 -0800
X-CSE-ConnectionGUID: CV5FlqJHSKKghCjxgu0emA==
X-CSE-MsgGUID: 52BdiuezSmqkr7MMOAAqyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219383502"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2026 20:54:52 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz6AD-000000002uV-2Ydx;
	Sun, 08 Mar 2026 04:54:49 +0000
Date: Sun, 08 Mar 2026 12:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 23/81]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202603081204.fJ3fsVvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   30092cdf41471e9043eb39db2ce267bf712da979
commit: 1f226da61b431cafcad33f9082fb1474cf7417ca [23/81] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: parisc-randconfig-002-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081204.fJ3fsVvu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081204.fJ3fsVvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081204.fJ3fsVvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_get_rxnfc':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5072:18: warning: unused variable 'eth' [-Wunused-variable]
     struct mtk_eth *eth = mac->hw;
                     ^~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   At top level:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
    fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int register_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fwnode_phylink_pcs_get_from_fwnode +90 include/linux/pcs/pcs.h

771aaa15691b238 Christian Marangi 2025-04-06  24  
73b8d01be960b97 Christian Marangi 2025-03-17  25  /**
73b8d01be960b97 Christian Marangi 2025-03-17  26   * fwnode_pcs_get - Retrieves a PCS from a firmware node
73b8d01be960b97 Christian Marangi 2025-03-17  27   * @fwnode: firmware node
73b8d01be960b97 Christian Marangi 2025-03-17  28   * @index: index fwnode PCS handle in firmware node
73b8d01be960b97 Christian Marangi 2025-03-17  29   *
73b8d01be960b97 Christian Marangi 2025-03-17  30   * Get a PCS from the firmware node at index.
73b8d01be960b97 Christian Marangi 2025-03-17  31   *
73b8d01be960b97 Christian Marangi 2025-03-17  32   * Returns a pointer to the phylink_pcs or a negative
73b8d01be960b97 Christian Marangi 2025-03-17  33   * error pointer. Can return -EPROBE_DEFER if the PCS is not
73b8d01be960b97 Christian Marangi 2025-03-17  34   * present in global providers list (either due to driver
73b8d01be960b97 Christian Marangi 2025-03-17  35   * still needs to be probed or it failed to probe/removed)
73b8d01be960b97 Christian Marangi 2025-03-17  36   */
73b8d01be960b97 Christian Marangi 2025-03-17  37  struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
73b8d01be960b97 Christian Marangi 2025-03-17  38  				   int index);
73b8d01be960b97 Christian Marangi 2025-03-17  39  
771aaa15691b238 Christian Marangi 2025-04-06  40  /**
771aaa15691b238 Christian Marangi 2025-04-06  41   * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
771aaa15691b238 Christian Marangi 2025-04-06  42   *					by the firmware node from a
771aaa15691b238 Christian Marangi 2025-04-06  43   *					firmware node
771aaa15691b238 Christian Marangi 2025-04-06  44   * @fwnode: firmware node
771aaa15691b238 Christian Marangi 2025-04-06  45   * @pcs_fwnode: PCS firmware node
771aaa15691b238 Christian Marangi 2025-04-06  46   *
771aaa15691b238 Christian Marangi 2025-04-06  47   * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
771aaa15691b238 Christian Marangi 2025-04-06  48   * 'pcs_fwnode' firmware node.
771aaa15691b238 Christian Marangi 2025-04-06  49   *
771aaa15691b238 Christian Marangi 2025-04-06  50   * Returns a pointer to the phylink_pcs or a negative
771aaa15691b238 Christian Marangi 2025-04-06  51   * error pointer. Can return -EPROBE_DEFER if the PCS is not
771aaa15691b238 Christian Marangi 2025-04-06  52   * present in global providers list (either due to driver
771aaa15691b238 Christian Marangi 2025-04-06  53   * still needs to be probed or it failed to probe/removed)
771aaa15691b238 Christian Marangi 2025-04-06  54   */
771aaa15691b238 Christian Marangi 2025-04-06  55  struct phylink_pcs *
771aaa15691b238 Christian Marangi 2025-04-06  56  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
771aaa15691b238 Christian Marangi 2025-04-06  57  				   struct fwnode_handle *pcs_fwnode);
771aaa15691b238 Christian Marangi 2025-04-06  58  
73b8d01be960b97 Christian Marangi 2025-03-17  59  /**
73b8d01be960b97 Christian Marangi 2025-03-17  60   * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
73b8d01be960b97 Christian Marangi 2025-03-17  61   * @fwnode: firmware node
73b8d01be960b97 Christian Marangi 2025-03-17  62   * @available_pcs: pointer to preallocated array of PCS
73b8d01be960b97 Christian Marangi 2025-03-17  63   * @num_pcs: where to store count of parsed PCS
73b8d01be960b97 Christian Marangi 2025-03-17  64   *
73b8d01be960b97 Christian Marangi 2025-03-17  65   * Generic helper function to fill available_pcs array with PCS parsed
73b8d01be960b97 Christian Marangi 2025-03-17  66   * from a "pcs-handle" fwnode property defined in firmware node up to
73b8d01be960b97 Christian Marangi 2025-03-17  67   * passed num_pcs.
73b8d01be960b97 Christian Marangi 2025-03-17  68   *
73b8d01be960b97 Christian Marangi 2025-03-17  69   * If available_pcs is NULL, num_pcs is updated with the count of the
73b8d01be960b97 Christian Marangi 2025-03-17  70   * parsed PCS.
73b8d01be960b97 Christian Marangi 2025-03-17  71   *
73b8d01be960b97 Christian Marangi 2025-03-17  72   * Returns 0 or a negative error.
73b8d01be960b97 Christian Marangi 2025-03-17  73   */
73b8d01be960b97 Christian Marangi 2025-03-17  74  int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
73b8d01be960b97 Christian Marangi 2025-03-17  75  			     struct phylink_pcs **available_pcs,
73b8d01be960b97 Christian Marangi 2025-03-17  76  			     unsigned int *num_pcs);
73b8d01be960b97 Christian Marangi 2025-03-17  77  #else
771aaa15691b238 Christian Marangi 2025-04-06 @78  static int register_fwnode_pcs_notifier(struct notifier_block *nb)
771aaa15691b238 Christian Marangi 2025-04-06  79  {
771aaa15691b238 Christian Marangi 2025-04-06  80  	return -EOPNOTSUPP;
771aaa15691b238 Christian Marangi 2025-04-06  81  }
771aaa15691b238 Christian Marangi 2025-04-06  82  
73b8d01be960b97 Christian Marangi 2025-03-17  83  static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
73b8d01be960b97 Christian Marangi 2025-03-17  84  						 int index)
73b8d01be960b97 Christian Marangi 2025-03-17  85  {
73b8d01be960b97 Christian Marangi 2025-03-17  86  	return ERR_PTR(-ENOENT);
73b8d01be960b97 Christian Marangi 2025-03-17  87  }
73b8d01be960b97 Christian Marangi 2025-03-17  88  
771aaa15691b238 Christian Marangi 2025-04-06  89  static struct phylink_pcs *
771aaa15691b238 Christian Marangi 2025-04-06 @90  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
771aaa15691b238 Christian Marangi 2025-04-06  91  				   struct fwnode_handle *pcs_fwnode)
771aaa15691b238 Christian Marangi 2025-04-06  92  {
771aaa15691b238 Christian Marangi 2025-04-06  93  	return ERR_PTR(-ENOENT);
771aaa15691b238 Christian Marangi 2025-04-06  94  }
771aaa15691b238 Christian Marangi 2025-04-06  95  

:::::: The code at line 90 was first introduced by commit
:::::: 771aaa15691b23801f188544f5da450cef6270c2 net: phylink: support late PCS provider attach

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
