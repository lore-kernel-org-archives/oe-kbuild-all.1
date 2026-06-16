Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8B2DF59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568176; cv=none; b=KMgd2K3p4qFsUNZfpMntdVOYlnXqWWDIhK4jkYci9KmTR1nMdaKYdLBy1gwVkYcQp8O00Z6GcIfZqV+dObFscCV6G0rK+nYlrTP8DFmSHL+eOVREn15mwDpNsKSUE+oFTaE2uAgJJyCzY5NSgYAyhVdpwxpZoAQV4SipdvYvReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568176; c=relaxed/simple;
	bh=qZR6/V7Jc7rfAA5ONuWPf/nNzdi9AzVXS8rZQy+KKeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lROswoaHWM8X9zPN1jG84PQhoWlTHp9QtouzYsQWCXyJeROILFFLEWP0ABSE4UPOV2HHQq9ClXY0kNDMzb7/C3hrgaRnAxggXH+HQm3WBtaWoka7U0qh3A9jPCKzmBw36kmiFJkkddvY6YSeBj1oA0CSwTO3bRttmBM5bANklQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4REdvGk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4REdvGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781568174; x=1813104174;
  h=date:from:to:cc:subject:message-id;
  bh=qZR6/V7Jc7rfAA5ONuWPf/nNzdi9AzVXS8rZQy+KKeA=;
  b=K4REdvGkUJy7pcoc2UlwvJ9pis0LToaDZzDjXUVWUT1WeqCEmLGmqk1I
   hM588UQUGaB5dCfx+93YD53zpxLdAr7vfPyTX4U/aqrzouhkegNPrBT7P
   +dpcbciJwFI2HCQitxJSVW1riauc2hjE2c9N/O7ng3sJ8yAhiS3Gz+yDU
   01xDh3PUX7U7YKxuGzgCtuUeGzv13q4L6NSMt65WSMBOW5X/35QotbbHc
   vX3RP7KlpLvSoAWRBS38Ubcy2nOVcnfqiCb7uj+gUofGmYaleBEO9Bb08
   TcQqE5nO+FgCbhOLcoD8M6+U27yqY4CWCBpFFWA1/dc4WyPoKMn3NAaNL
   A==;
X-CSE-ConnectionGUID: ByQ7ahzCQwarvxib0do2fg==
X-CSE-MsgGUID: H5sBJ2XIRCytJECj2HCiWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86162635"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="86162635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 17:02:53 -0700
X-CSE-ConnectionGUID: MVf+P5zQQk6Wwrw1sEkkEw==
X-CSE-MsgGUID: lc67ZCe/SNWzjzWJwOxkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="243245750"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jun 2026 17:02:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZHGU-00000000511-364N;
	Tue, 16 Jun 2026 00:02:50 +0000
Date: Tue, 16 Jun 2026 02:01:59 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/phy/phylink.c:2209:17: error: implicit
 declaration of function 'unregister_fwnode_pcs_notifier'; did you mean
 'register_fwnode_pcs_notifier'?
Message-ID: <202606160252.kjyIO3ZE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20260615-212009
head:   10bf93a42ff6fa44dfd5bc9e6f71cca15ba1750a
commit: fc6fa24f5fd3fbc958ba44beefce3dea9843a70b net: phylink: support late PCS provider attach
date:   11 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260616/202606160252.kjyIO3ZE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160252.kjyIO3ZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160252.kjyIO3ZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phylink.c: In function 'phylink_destroy':
>> drivers/net/phy/phylink.c:2209:17: error: implicit declaration of function 'unregister_fwnode_pcs_notifier'; did you mean 'register_fwnode_pcs_notifier'? [-Wimplicit-function-declaration]
    2209 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 register_fwnode_pcs_notifier


vim +2209 drivers/net/phy/phylink.c

  2189	
  2190	/**
  2191	 * phylink_destroy() - cleanup and destroy the phylink instance
  2192	 * @pl: a pointer to a &struct phylink returned from phylink_create()
  2193	 *
  2194	 * Destroy a phylink instance. Any PHY that has been attached must have been
  2195	 * cleaned up via phylink_disconnect_phy() prior to calling this function.
  2196	 *
  2197	 * Note: the rtnl lock must not be held when calling this function.
  2198	 */
  2199	void phylink_destroy(struct phylink *pl)
  2200	{
  2201		struct phylink_pcs *pcs, *tmp;
  2202	
  2203		sfp_bus_del_upstream(pl->sfp_bus);
  2204		if (pl->link_gpio)
  2205			gpiod_put(pl->link_gpio);
  2206	
  2207		/* Unregister notifier for late PCS attach */
  2208		if (pl->fwnode_pcs_nb.notifier_call)
> 2209			unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
  2210	
  2211		/* Drop link between PCS and phylink */
  2212		list_for_each_entry(pcs, &pl->pcs_list, list)
  2213			pcs->phylink = NULL;
  2214	
  2215		/* Remove every PCS from phylink PCS list */
  2216		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
  2217			list_del(&pcs->list);
  2218	
  2219		cancel_work_sync(&pl->resolve);
  2220		kfree(pl);
  2221	}
  2222	EXPORT_SYMBOL_GPL(phylink_destroy);
  2223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
