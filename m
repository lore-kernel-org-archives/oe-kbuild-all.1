Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43DB3B6376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044483; cv=none; b=r3iWjNCLxx0o7bPlXhbzmilCDIQ6AkpjjDdr4JtnfQ8EUFIqMEq9mRnlHw8WJawGJrNrEZwtupxkNabkltlSTNimRQoGjG0xYFl0PHy6K8XvgG1PeCPYGYFcvr9v+5qcivb+eGL3pAAkMQxGiV7MXEcrapNGAmgsij4dOaL8NJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044483; c=relaxed/simple;
	bh=RQwuegm16SE/t257qqlYKaA83yuihTjHuFwCdsD6XBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TZ4gOTWTj5y10UfhO25ebCHiv58fwJVkS88raqbAFFs0A9oFTPNwTRwsMNHvPeJ4b8SVbPls3o/kFG39Ugob/JM01JfNjueosDA1UpsvWXFnaSVE0akZghL1q8HO0yfTsR2aFAUAIribsUEQwvBY/FWsg8J9k9bN31yCCZ7IJkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOeggW1+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOeggW1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780044481; x=1811580481;
  h=date:from:to:cc:subject:message-id;
  bh=RQwuegm16SE/t257qqlYKaA83yuihTjHuFwCdsD6XBo=;
  b=jOeggW1+A09AJSqZQ6hDPqN4IP4aZ8S7xYyWG+9Ih8+VQDZokdysrPJI
   WCD/A0Ba53lWAPKD9Cbbghc7cfrl4BdhM5nWNaxsfPXD8i1Dmt6ZPvwuh
   ims1B2IHWiLgzo8GuY4RITFkxYMRyYSWMZwjxY3OzhOHYSAXSYbXCxXqB
   wZ3SqMBdtnqZF/6qeIIMzkJQWnhiPrsK5UUaFCjErqvPmPapdQfXtHEK6
   FOlCX/8C6vXRRpcOtZi3TqSLJCNCnFR76dnPP0ra8c9/6ENoY0FvdeIhu
   oCZ38x57f9HiF7QsyYQ7OuwgKNcdcnYQyTwlg65BR2rjW1dLNCaonSNTc
   A==;
X-CSE-ConnectionGUID: yoKALP2rQpe1vk1il38u7A==
X-CSE-MsgGUID: Tm8rGhGtQnaZUDkEsQ8kFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98310076"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98310076"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 01:48:00 -0700
X-CSE-ConnectionGUID: NVG4fBIYQ9iI7qcTrxZLgA==
X-CSE-MsgGUID: FthWhtNxTIaPpQZML7M90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="280915188"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2026 01:47:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSssm-00000000704-1P8b;
	Fri, 29 May 2026 08:47:56 +0000
Date: Fri, 29 May 2026 16:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/179 2/2]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202605291642.BfQACsbj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/179
head:   8a20bd94c7748a571183704c85e98e90f54f5533
commit: bc90b5ee19403f643f84569934ff31656c9e4bf0 [2/2] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: sparc-randconfig-001-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291642.BfQACsbj-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291642.BfQACsbj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291642.BfQACsbj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
    fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int register_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fwnode_phylink_pcs_get_from_fwnode +90 include/linux/pcs/pcs.h

3e73870b3843b8 Christian Marangi 2025-04-06  24  
ce865557c4c35d Christian Marangi 2025-03-17  25  /**
ce865557c4c35d Christian Marangi 2025-03-17  26   * fwnode_pcs_get - Retrieves a PCS from a firmware node
ce865557c4c35d Christian Marangi 2025-03-17  27   * @fwnode: firmware node
ce865557c4c35d Christian Marangi 2025-03-17  28   * @index: index fwnode PCS handle in firmware node
ce865557c4c35d Christian Marangi 2025-03-17  29   *
ce865557c4c35d Christian Marangi 2025-03-17  30   * Get a PCS from the firmware node at index.
ce865557c4c35d Christian Marangi 2025-03-17  31   *
ce865557c4c35d Christian Marangi 2025-03-17  32   * Returns a pointer to the phylink_pcs or a negative
ce865557c4c35d Christian Marangi 2025-03-17  33   * error pointer. Can return -EPROBE_DEFER if the PCS is not
ce865557c4c35d Christian Marangi 2025-03-17  34   * present in global providers list (either due to driver
ce865557c4c35d Christian Marangi 2025-03-17  35   * still needs to be probed or it failed to probe/removed)
ce865557c4c35d Christian Marangi 2025-03-17  36   */
ce865557c4c35d Christian Marangi 2025-03-17  37  struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
ce865557c4c35d Christian Marangi 2025-03-17  38  				   int index);
ce865557c4c35d Christian Marangi 2025-03-17  39  
3e73870b3843b8 Christian Marangi 2025-04-06  40  /**
3e73870b3843b8 Christian Marangi 2025-04-06  41   * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
3e73870b3843b8 Christian Marangi 2025-04-06  42   *					by the firmware node from a
3e73870b3843b8 Christian Marangi 2025-04-06  43   *					firmware node
3e73870b3843b8 Christian Marangi 2025-04-06  44   * @fwnode: firmware node
3e73870b3843b8 Christian Marangi 2025-04-06  45   * @pcs_fwnode: PCS firmware node
3e73870b3843b8 Christian Marangi 2025-04-06  46   *
3e73870b3843b8 Christian Marangi 2025-04-06  47   * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
3e73870b3843b8 Christian Marangi 2025-04-06  48   * 'pcs_fwnode' firmware node.
3e73870b3843b8 Christian Marangi 2025-04-06  49   *
3e73870b3843b8 Christian Marangi 2025-04-06  50   * Returns a pointer to the phylink_pcs or a negative
3e73870b3843b8 Christian Marangi 2025-04-06  51   * error pointer. Can return -EPROBE_DEFER if the PCS is not
3e73870b3843b8 Christian Marangi 2025-04-06  52   * present in global providers list (either due to driver
3e73870b3843b8 Christian Marangi 2025-04-06  53   * still needs to be probed or it failed to probe/removed)
3e73870b3843b8 Christian Marangi 2025-04-06  54   */
3e73870b3843b8 Christian Marangi 2025-04-06  55  struct phylink_pcs *
3e73870b3843b8 Christian Marangi 2025-04-06  56  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
3e73870b3843b8 Christian Marangi 2025-04-06  57  				   struct fwnode_handle *pcs_fwnode);
3e73870b3843b8 Christian Marangi 2025-04-06  58  
ce865557c4c35d Christian Marangi 2025-03-17  59  /**
ce865557c4c35d Christian Marangi 2025-03-17  60   * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
ce865557c4c35d Christian Marangi 2025-03-17  61   * @fwnode: firmware node
ce865557c4c35d Christian Marangi 2025-03-17  62   * @available_pcs: pointer to preallocated array of PCS
ce865557c4c35d Christian Marangi 2025-03-17  63   * @num_pcs: where to store count of parsed PCS
ce865557c4c35d Christian Marangi 2025-03-17  64   *
ce865557c4c35d Christian Marangi 2025-03-17  65   * Generic helper function to fill available_pcs array with PCS parsed
ce865557c4c35d Christian Marangi 2025-03-17  66   * from a "pcs-handle" fwnode property defined in firmware node up to
ce865557c4c35d Christian Marangi 2025-03-17  67   * passed num_pcs.
ce865557c4c35d Christian Marangi 2025-03-17  68   *
ce865557c4c35d Christian Marangi 2025-03-17  69   * If available_pcs is NULL, num_pcs is updated with the count of the
ce865557c4c35d Christian Marangi 2025-03-17  70   * parsed PCS.
ce865557c4c35d Christian Marangi 2025-03-17  71   *
ce865557c4c35d Christian Marangi 2025-03-17  72   * Returns 0 or a negative error.
ce865557c4c35d Christian Marangi 2025-03-17  73   */
ce865557c4c35d Christian Marangi 2025-03-17  74  int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
ce865557c4c35d Christian Marangi 2025-03-17  75  			     struct phylink_pcs **available_pcs,
ce865557c4c35d Christian Marangi 2025-03-17  76  			     unsigned int *num_pcs);
ce865557c4c35d Christian Marangi 2025-03-17  77  #else
3e73870b3843b8 Christian Marangi 2025-04-06 @78  static int register_fwnode_pcs_notifier(struct notifier_block *nb)
3e73870b3843b8 Christian Marangi 2025-04-06  79  {
3e73870b3843b8 Christian Marangi 2025-04-06  80  	return -EOPNOTSUPP;
3e73870b3843b8 Christian Marangi 2025-04-06  81  }
3e73870b3843b8 Christian Marangi 2025-04-06  82  
ce865557c4c35d Christian Marangi 2025-03-17  83  static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
ce865557c4c35d Christian Marangi 2025-03-17  84  						 int index)
ce865557c4c35d Christian Marangi 2025-03-17  85  {
ce865557c4c35d Christian Marangi 2025-03-17  86  	return ERR_PTR(-ENOENT);
ce865557c4c35d Christian Marangi 2025-03-17  87  }
ce865557c4c35d Christian Marangi 2025-03-17  88  
3e73870b3843b8 Christian Marangi 2025-04-06  89  static struct phylink_pcs *
3e73870b3843b8 Christian Marangi 2025-04-06 @90  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
3e73870b3843b8 Christian Marangi 2025-04-06  91  				   struct fwnode_handle *pcs_fwnode)
3e73870b3843b8 Christian Marangi 2025-04-06  92  {
3e73870b3843b8 Christian Marangi 2025-04-06  93  	return ERR_PTR(-ENOENT);
3e73870b3843b8 Christian Marangi 2025-04-06  94  }
3e73870b3843b8 Christian Marangi 2025-04-06  95  

:::::: The code at line 90 was first introduced by commit
:::::: 3e73870b3843b8006fb9c6e37666090c52c3e0b5 net: phylink: support late PCS provider attach

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
