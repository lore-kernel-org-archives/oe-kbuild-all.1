Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE76B25F98A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786686947; cv=none; b=kPrjSOk442hI8VbS16EMfufUaW95HXEdbkpZKzNVWYmEi9sibuWTNNMGhEg5pNVkF0y1Q0/UHt1YNAYRQUN4h2lB5q/2NqokNxiFrcpRpWCffHf9VREZvdhAx4au1luY94m36kUIRIZ6TDh0jLJhMLtoZk1NScKQaaUvhS7EhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786686947; c=relaxed/simple;
	bh=9TSAh6K3EbaHhpHmECvPHB5vz3oz4xnh7rMtO3AhgGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iSll8r2IZYxZ2h/lIhMY9WqJcfqwYnJWJOVoujH0cjYihrC5BmGtFgz31TM1MdScrT84gKN5MMwBq1+wBcUnFJ+nq0nQdnPhGMdqLEhRjdudzAefme7gy6GjFZ11NIFx7QKZALTQRlZxsR/kzbd7FUeAcjPa16McybGislbXnSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0lqn7cN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0lqn7cN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786686943; x=1818222943;
  h=date:from:to:cc:subject:message-id;
  bh=9TSAh6K3EbaHhpHmECvPHB5vz3oz4xnh7rMtO3AhgGk=;
  b=D0lqn7cNCZACq/bjE1UEdEh9lScAwoamBlcY1Vyo27o+tMb/4rxLVmRF
   YR8OIu20A93rAjV/wHtUmvA0tARZVpDKTHh6qZrYIfxWybQsMVNdOkMpm
   KOerSRtFKbtLJK26yrWVtx04VhHe339Fkqo2ival0ZWMBKGOZgN4nidto
   pRyMMURL16MxAoaeh8WlFRBepBT2UUeuFDDFrMSciPIuASEsYTSYvPMhX
   V2OxRpwwO+BY1PnxHBoPe5lttGt6ijTLoSpwqiz1wuV/jnQQEBLFt7Z3q
   fXnflZQ75l1pS23qFTo+uBnxqD6GObTf9FlhZ/7+iMmCs5dHeamO+m3ZH
   Q==;
X-CSE-ConnectionGUID: KAavjT6iSxihcusZ3hDLpQ==
X-CSE-MsgGUID: yW+/jcsGStukfU+c5Je4Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86385503"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="86385503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 22:55:42 -0700
X-CSE-ConnectionGUID: nTjOdTePQ7yIiEe4xdKj5Q==
X-CSE-MsgGUID: XPvOrLduQTurtATQXz6HfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="302377357"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2026 22:55:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuktF-00000000XxO-2fY6;
	Fri, 14 Aug 2026 05:55:37 +0000
Date: Fri, 14 Aug 2026 13:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/214 3/3]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202608141355.fotZpby6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/214
head:   894796752b9044f9e75ab8a8ef1d7f18b895ba3b
commit: 52cee3b1e45855711479a5d1880a8278721f37ee [3/3] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: um-randconfig-001-20260814 (https://download.01.org/0day-ci/archive/20260814/202608141355.fotZpby6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141355.fotZpby6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141355.fotZpby6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
      90 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      78 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fwnode_phylink_pcs_get_from_fwnode +90 include/linux/pcs/pcs.h

78819d0682c434 Christian Marangi 2025-04-06  24  
b7841d87afb420 Christian Marangi 2025-03-17  25  /**
b7841d87afb420 Christian Marangi 2025-03-17  26   * fwnode_pcs_get - Retrieves a PCS from a firmware node
b7841d87afb420 Christian Marangi 2025-03-17  27   * @fwnode: firmware node
b7841d87afb420 Christian Marangi 2025-03-17  28   * @index: index fwnode PCS handle in firmware node
b7841d87afb420 Christian Marangi 2025-03-17  29   *
b7841d87afb420 Christian Marangi 2025-03-17  30   * Get a PCS from the firmware node at index.
b7841d87afb420 Christian Marangi 2025-03-17  31   *
b7841d87afb420 Christian Marangi 2025-03-17  32   * Returns a pointer to the phylink_pcs or a negative
b7841d87afb420 Christian Marangi 2025-03-17  33   * error pointer. Can return -EPROBE_DEFER if the PCS is not
b7841d87afb420 Christian Marangi 2025-03-17  34   * present in global providers list (either due to driver
b7841d87afb420 Christian Marangi 2025-03-17  35   * still needs to be probed or it failed to probe/removed)
b7841d87afb420 Christian Marangi 2025-03-17  36   */
b7841d87afb420 Christian Marangi 2025-03-17  37  struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
b7841d87afb420 Christian Marangi 2025-03-17  38  				   int index);
b7841d87afb420 Christian Marangi 2025-03-17  39  
78819d0682c434 Christian Marangi 2025-04-06  40  /**
78819d0682c434 Christian Marangi 2025-04-06  41   * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
78819d0682c434 Christian Marangi 2025-04-06  42   *					by the firmware node from a
78819d0682c434 Christian Marangi 2025-04-06  43   *					firmware node
78819d0682c434 Christian Marangi 2025-04-06  44   * @fwnode: firmware node
78819d0682c434 Christian Marangi 2025-04-06  45   * @pcs_fwnode: PCS firmware node
78819d0682c434 Christian Marangi 2025-04-06  46   *
78819d0682c434 Christian Marangi 2025-04-06  47   * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
78819d0682c434 Christian Marangi 2025-04-06  48   * 'pcs_fwnode' firmware node.
78819d0682c434 Christian Marangi 2025-04-06  49   *
78819d0682c434 Christian Marangi 2025-04-06  50   * Returns a pointer to the phylink_pcs or a negative
78819d0682c434 Christian Marangi 2025-04-06  51   * error pointer. Can return -EPROBE_DEFER if the PCS is not
78819d0682c434 Christian Marangi 2025-04-06  52   * present in global providers list (either due to driver
78819d0682c434 Christian Marangi 2025-04-06  53   * still needs to be probed or it failed to probe/removed)
78819d0682c434 Christian Marangi 2025-04-06  54   */
78819d0682c434 Christian Marangi 2025-04-06  55  struct phylink_pcs *
78819d0682c434 Christian Marangi 2025-04-06  56  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
78819d0682c434 Christian Marangi 2025-04-06  57  				   struct fwnode_handle *pcs_fwnode);
78819d0682c434 Christian Marangi 2025-04-06  58  
b7841d87afb420 Christian Marangi 2025-03-17  59  /**
b7841d87afb420 Christian Marangi 2025-03-17  60   * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
b7841d87afb420 Christian Marangi 2025-03-17  61   * @fwnode: firmware node
b7841d87afb420 Christian Marangi 2025-03-17  62   * @available_pcs: pointer to preallocated array of PCS
b7841d87afb420 Christian Marangi 2025-03-17  63   * @num_pcs: where to store count of parsed PCS
b7841d87afb420 Christian Marangi 2025-03-17  64   *
b7841d87afb420 Christian Marangi 2025-03-17  65   * Generic helper function to fill available_pcs array with PCS parsed
b7841d87afb420 Christian Marangi 2025-03-17  66   * from a "pcs-handle" fwnode property defined in firmware node up to
b7841d87afb420 Christian Marangi 2025-03-17  67   * passed num_pcs.
b7841d87afb420 Christian Marangi 2025-03-17  68   *
b7841d87afb420 Christian Marangi 2025-03-17  69   * If available_pcs is NULL, num_pcs is updated with the count of the
b7841d87afb420 Christian Marangi 2025-03-17  70   * parsed PCS.
b7841d87afb420 Christian Marangi 2025-03-17  71   *
b7841d87afb420 Christian Marangi 2025-03-17  72   * Returns 0 or a negative error.
b7841d87afb420 Christian Marangi 2025-03-17  73   */
b7841d87afb420 Christian Marangi 2025-03-17  74  int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
b7841d87afb420 Christian Marangi 2025-03-17  75  			     struct phylink_pcs **available_pcs,
b7841d87afb420 Christian Marangi 2025-03-17  76  			     unsigned int *num_pcs);
b7841d87afb420 Christian Marangi 2025-03-17  77  #else
78819d0682c434 Christian Marangi 2025-04-06 @78  static int register_fwnode_pcs_notifier(struct notifier_block *nb)
78819d0682c434 Christian Marangi 2025-04-06  79  {
78819d0682c434 Christian Marangi 2025-04-06  80  	return -EOPNOTSUPP;
78819d0682c434 Christian Marangi 2025-04-06  81  }
78819d0682c434 Christian Marangi 2025-04-06  82  
b7841d87afb420 Christian Marangi 2025-03-17  83  static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
b7841d87afb420 Christian Marangi 2025-03-17  84  						 int index)
b7841d87afb420 Christian Marangi 2025-03-17  85  {
b7841d87afb420 Christian Marangi 2025-03-17  86  	return ERR_PTR(-ENOENT);
b7841d87afb420 Christian Marangi 2025-03-17  87  }
b7841d87afb420 Christian Marangi 2025-03-17  88  
78819d0682c434 Christian Marangi 2025-04-06  89  static struct phylink_pcs *
78819d0682c434 Christian Marangi 2025-04-06 @90  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
78819d0682c434 Christian Marangi 2025-04-06  91  				   struct fwnode_handle *pcs_fwnode)
78819d0682c434 Christian Marangi 2025-04-06  92  {
78819d0682c434 Christian Marangi 2025-04-06  93  	return ERR_PTR(-ENOENT);
78819d0682c434 Christian Marangi 2025-04-06  94  }
78819d0682c434 Christian Marangi 2025-04-06  95  

:::::: The code at line 90 was first introduced by commit
:::::: 78819d0682c43448cdf91c7baf64370eef493fe7 net: phylink: support late PCS provider attach

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
