Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6324E2F15
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365096; cv=none; b=iMXwDxs/2IiVI7dcKUPGCebFhQqEVFuwQ7Qyw6eTQQgyBPv38Ab3IgPe12U08VVXL3uAV+S6j8Du5Fx4Tlqf6M0SwxIrDJ4h2OXP807FbuFYq4omPilDXlI7K7Jd0CqLwHAQv3iWQl0eqC2xfBYzdm9PPV8ERKoy6JSIZUKRIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365096; c=relaxed/simple;
	bh=FThho+N+dtJrOp6e3Y/AJ4fNrrPKf9y6YRTpFFcul7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IuQV7Djk5RxLXw6da3NNMIIqD9CdeM3O5QUX+q4ZYJ43NGM9uhcGWMqZyRw+cTx0izETGVGq/1VUSs1dAAO/dlC4y0K6RSv0DQo3bgxZAv6HUdnXtAqyKvWXh+A3ketMQlcKkxINBZ3WGCAmXDrZ+JNLI/TBQ20eJjJg9Sk4wU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G188RyQf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G188RyQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790365093; x=1821901093;
  h=date:from:to:cc:subject:message-id;
  bh=FThho+N+dtJrOp6e3Y/AJ4fNrrPKf9y6YRTpFFcul7s=;
  b=G188RyQfaKKfMNGslN73IiZ9FVxB+xkLEt2W8LYbnO50qL1SZV/u9o6l
   4ZcRG2euFfhpBc8VEPvO6I7UWJKzrUW3U5wDw+SyKoZVOyy58zz2dKMDg
   kmbR/IIGv24JaGdxJkjgWdm/F50459fVMoJyrwEgyS549g6UwlFySFg4t
   emL/9APD+7i+Tk3GBgWe2xWajuIERIR4+uQ2XTO9WgCf/rnoBbDdu0mHx
   7VMdDQHv186GSl3tlAWxfUYdeMA0W2G1QzBjRLMk5gber4j5bmPrjUNfy
   BGQ/0IODFQCZm52nuqkAzbud8UnKDOLkpwZPEGi5MM2kSrmP+B+1R3YYk
   Q==;
X-CSE-ConnectionGUID: lp18aq5kRl6TB6T0vbCEfA==
X-CSE-MsgGUID: Hr04qVA9TXWyz41rq46xdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="107536875"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="107536875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 12:38:12 -0700
X-CSE-ConnectionGUID: DW3bOm8PTWGf/usn17jcwA==
X-CSE-MsgGUID: VT99XDo8SLKVuh6pyieO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274573941"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2026 12:38:10 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xABkF-000000000rm-3xwK;
	Fri, 25 Sep 2026 19:38:07 +0000
Date: Fri, 25 Sep 2026 21:37:24 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode'
 defined but not used
Message-ID: <202609251947.lSPsuH0V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: ac31c86a941e02ff8f91a2f7b5e171352ccf9b03 [214/214] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: s390-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251947.lSPsuH0V-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251947.lSPsuH0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251947.lSPsuH0V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
    fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
    static int register_fwnode_pcs_notifier(struct notifier_block *nb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fwnode_phylink_pcs_get_from_fwnode +90 include/linux/pcs/pcs.h

dc0306cecdd553 Christian Marangi 2025-04-06  24  
69a44cff9e793a Christian Marangi 2025-03-17  25  /**
69a44cff9e793a Christian Marangi 2025-03-17  26   * fwnode_pcs_get - Retrieves a PCS from a firmware node
69a44cff9e793a Christian Marangi 2025-03-17  27   * @fwnode: firmware node
69a44cff9e793a Christian Marangi 2025-03-17  28   * @index: index fwnode PCS handle in firmware node
69a44cff9e793a Christian Marangi 2025-03-17  29   *
69a44cff9e793a Christian Marangi 2025-03-17  30   * Get a PCS from the firmware node at index.
69a44cff9e793a Christian Marangi 2025-03-17  31   *
69a44cff9e793a Christian Marangi 2025-03-17  32   * Returns a pointer to the phylink_pcs or a negative
69a44cff9e793a Christian Marangi 2025-03-17  33   * error pointer. Can return -EPROBE_DEFER if the PCS is not
69a44cff9e793a Christian Marangi 2025-03-17  34   * present in global providers list (either due to driver
69a44cff9e793a Christian Marangi 2025-03-17  35   * still needs to be probed or it failed to probe/removed)
69a44cff9e793a Christian Marangi 2025-03-17  36   */
69a44cff9e793a Christian Marangi 2025-03-17  37  struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
69a44cff9e793a Christian Marangi 2025-03-17  38  				   int index);
69a44cff9e793a Christian Marangi 2025-03-17  39  
dc0306cecdd553 Christian Marangi 2025-04-06  40  /**
dc0306cecdd553 Christian Marangi 2025-04-06  41   * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
dc0306cecdd553 Christian Marangi 2025-04-06  42   *					by the firmware node from a
dc0306cecdd553 Christian Marangi 2025-04-06  43   *					firmware node
dc0306cecdd553 Christian Marangi 2025-04-06  44   * @fwnode: firmware node
dc0306cecdd553 Christian Marangi 2025-04-06  45   * @pcs_fwnode: PCS firmware node
dc0306cecdd553 Christian Marangi 2025-04-06  46   *
dc0306cecdd553 Christian Marangi 2025-04-06  47   * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
dc0306cecdd553 Christian Marangi 2025-04-06  48   * 'pcs_fwnode' firmware node.
dc0306cecdd553 Christian Marangi 2025-04-06  49   *
dc0306cecdd553 Christian Marangi 2025-04-06  50   * Returns a pointer to the phylink_pcs or a negative
dc0306cecdd553 Christian Marangi 2025-04-06  51   * error pointer. Can return -EPROBE_DEFER if the PCS is not
dc0306cecdd553 Christian Marangi 2025-04-06  52   * present in global providers list (either due to driver
dc0306cecdd553 Christian Marangi 2025-04-06  53   * still needs to be probed or it failed to probe/removed)
dc0306cecdd553 Christian Marangi 2025-04-06  54   */
dc0306cecdd553 Christian Marangi 2025-04-06  55  struct phylink_pcs *
dc0306cecdd553 Christian Marangi 2025-04-06  56  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
dc0306cecdd553 Christian Marangi 2025-04-06  57  				   struct fwnode_handle *pcs_fwnode);
dc0306cecdd553 Christian Marangi 2025-04-06  58  
69a44cff9e793a Christian Marangi 2025-03-17  59  /**
69a44cff9e793a Christian Marangi 2025-03-17  60   * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
69a44cff9e793a Christian Marangi 2025-03-17  61   * @fwnode: firmware node
69a44cff9e793a Christian Marangi 2025-03-17  62   * @available_pcs: pointer to preallocated array of PCS
69a44cff9e793a Christian Marangi 2025-03-17  63   * @num_pcs: where to store count of parsed PCS
69a44cff9e793a Christian Marangi 2025-03-17  64   *
69a44cff9e793a Christian Marangi 2025-03-17  65   * Generic helper function to fill available_pcs array with PCS parsed
69a44cff9e793a Christian Marangi 2025-03-17  66   * from a "pcs-handle" fwnode property defined in firmware node up to
69a44cff9e793a Christian Marangi 2025-03-17  67   * passed num_pcs.
69a44cff9e793a Christian Marangi 2025-03-17  68   *
69a44cff9e793a Christian Marangi 2025-03-17  69   * If available_pcs is NULL, num_pcs is updated with the count of the
69a44cff9e793a Christian Marangi 2025-03-17  70   * parsed PCS.
69a44cff9e793a Christian Marangi 2025-03-17  71   *
69a44cff9e793a Christian Marangi 2025-03-17  72   * Returns 0 or a negative error.
69a44cff9e793a Christian Marangi 2025-03-17  73   */
69a44cff9e793a Christian Marangi 2025-03-17  74  int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
69a44cff9e793a Christian Marangi 2025-03-17  75  			     struct phylink_pcs **available_pcs,
69a44cff9e793a Christian Marangi 2025-03-17  76  			     unsigned int *num_pcs);
69a44cff9e793a Christian Marangi 2025-03-17  77  #else
dc0306cecdd553 Christian Marangi 2025-04-06 @78  static int register_fwnode_pcs_notifier(struct notifier_block *nb)
dc0306cecdd553 Christian Marangi 2025-04-06  79  {
dc0306cecdd553 Christian Marangi 2025-04-06  80  	return -EOPNOTSUPP;
dc0306cecdd553 Christian Marangi 2025-04-06  81  }
dc0306cecdd553 Christian Marangi 2025-04-06  82  
69a44cff9e793a Christian Marangi 2025-03-17  83  static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
69a44cff9e793a Christian Marangi 2025-03-17  84  						 int index)
69a44cff9e793a Christian Marangi 2025-03-17  85  {
69a44cff9e793a Christian Marangi 2025-03-17  86  	return ERR_PTR(-ENOENT);
69a44cff9e793a Christian Marangi 2025-03-17  87  }
69a44cff9e793a Christian Marangi 2025-03-17  88  
dc0306cecdd553 Christian Marangi 2025-04-06  89  static struct phylink_pcs *
dc0306cecdd553 Christian Marangi 2025-04-06 @90  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
dc0306cecdd553 Christian Marangi 2025-04-06  91  				   struct fwnode_handle *pcs_fwnode)
dc0306cecdd553 Christian Marangi 2025-04-06  92  {
dc0306cecdd553 Christian Marangi 2025-04-06  93  	return ERR_PTR(-ENOENT);
dc0306cecdd553 Christian Marangi 2025-04-06  94  }
dc0306cecdd553 Christian Marangi 2025-04-06  95  

:::::: The code at line 90 was first introduced by commit
:::::: dc0306cecdd5530677da942149daf2b08e56f943 net: phylink: support late PCS provider attach

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
