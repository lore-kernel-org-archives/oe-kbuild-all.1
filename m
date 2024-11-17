Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C1322E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731826328; cv=none; b=jy7cWLOHFbslgap+IbrAKrphuC1NF4HFMOUVOab34vGVYe5b563vUUII9Ca7n0FR8kGFqMWBYVOr/zRuaPbAMkYPnbfBJhGSn1NpSkrz7DN3GaZkQe8yN2Be7qXsCXr6Hu8VIl7dYqB4HzZ4ldF+hzIMF/SWx74VZpDFmqu9aUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731826328; c=relaxed/simple;
	bh=IaqPp4lYfnN0re/mm4pI7WD2KarHahTRsuDW7j1zaWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wz8oWVzE3zNkBr5KFCEEk8JPkVTRGJEGSbjHDFG6G/K+nCv0qGHXyv32TjaabEbkznhLM3gXf6osuuM5vkf/o4TkzrFutoPVJ4H/7W7XDY3m33QmICiCv1MMaLHRwv1isciEFMWk8OEEm72OVgoY4HkSO9A4p4jAXSMv+7FScR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP43aFzP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP43aFzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731826326; x=1763362326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaqPp4lYfnN0re/mm4pI7WD2KarHahTRsuDW7j1zaWQ=;
  b=WP43aFzP27TkBHMM0d7M0B29ZrpGjSWpJF+ZvY11OksZuRYYgvED7ly6
   1rHDWaK4V7jfXXMhSb9I/HPBx/zpmbCwZfga4NPHn2Ih9JuHTrqgNntUC
   gR/AOa2Fnq0WuTb24X0DI+gWru9oKsaNzBr9v5u08UoxJy7Xq5hYcjs9E
   g6iV7bWTQUULdBlXsGkCCADZiKEfab4o47KD0HjSGUaqqyzO7Qb/cGI5C
   i/hSqNNO9eQcIVTteeuxB/bGsxhCWotz0I6mb13OhsMDdtMyDoF/X9YPX
   BNWMezNnBfENNSQkgUdvo7NReLlBNMrg1RdUJyQSYBHTMIphKPRtAwEHG
   g==;
X-CSE-ConnectionGUID: 9iPz23t8S0GUItoKGU5EVg==
X-CSE-MsgGUID: uHj0DGL+Tfuv32MO0U36VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="32037199"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="32037199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 22:52:05 -0800
X-CSE-ConnectionGUID: 4QxufEGMRoyzHsrrgVGVzA==
X-CSE-MsgGUID: NW0Gw8ZpTn615SGQaXpNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="112218125"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2024 22:52:04 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCZ8c-0001bh-1G;
	Sun, 17 Nov 2024 06:52:02 +0000
Date: Sun, 17 Nov 2024 14:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/base/core.c:1542:5: sparse: sparse: symbol
 'fw_devlink_relax_cycle' was not declared. Should it be static?
Message-ID: <202411171439.1f74cGDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux linux-5.10-gen-rkr3.4
head:   39141d792534c5703bb834861c47718008c85001
commit: 1df699c140a778ed678d7d4b2fa8ffb2c62573e1 UPSTREAM: driver core: Handle cycles in device links created by fw_devlink
date:   3 years, 9 months ago
config: i386-randconfig-062-20241112 (https://download.01.org/0day-ci/archive/20241117/202411171439.1f74cGDB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171439.1f74cGDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171439.1f74cGDB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/core.c:1542:5: sparse: sparse: symbol 'fw_devlink_relax_cycle' was not declared. Should it be static?

vim +/fw_devlink_relax_cycle +1542 drivers/base/core.c

  1527	
  1528	/**
  1529	 * fw_devlink_relax_cycle - Convert cyclic links to SYNC_STATE_ONLY links
  1530	 * @con: Device to check dependencies for.
  1531	 * @sup: Device to check against.
  1532	 *
  1533	 * Check if @sup depends on @con or any device dependent on it (its child or
  1534	 * its consumer etc).  When such a cyclic dependency is found, convert all
  1535	 * device links created solely by fw_devlink into SYNC_STATE_ONLY device links.
  1536	 * This is the equivalent of doing fw_devlink=permissive just between the
  1537	 * devices in the cycle. We need to do this because, at this point, fw_devlink
  1538	 * can't tell which of these dependencies is not a real dependency.
  1539	 *
  1540	 * Return 1 if a cycle is found. Otherwise, return 0.
  1541	 */
> 1542	int fw_devlink_relax_cycle(struct device *con, void *sup)
  1543	{
  1544		struct device_link *link;
  1545		int ret;
  1546	
  1547		if (con == sup)
  1548			return 1;
  1549	
  1550		ret = device_for_each_child(con, sup, fw_devlink_relax_cycle);
  1551		if (ret)
  1552			return ret;
  1553	
  1554		list_for_each_entry(link, &con->links.consumers, s_node) {
  1555			if ((link->flags & ~DL_FLAG_INFERRED) ==
  1556			    (DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_MANAGED))
  1557				continue;
  1558	
  1559			if (!fw_devlink_relax_cycle(link->consumer, sup))
  1560				continue;
  1561	
  1562			ret = 1;
  1563	
  1564			if (!(link->flags & DL_FLAG_INFERRED))
  1565				continue;
  1566	
  1567			pm_runtime_drop_link(link);
  1568			link->flags = DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
  1569			dev_dbg(link->consumer, "Relaxing link with %s\n",
  1570				dev_name(link->supplier));
  1571		}
  1572		return ret;
  1573	}
  1574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
