Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDCDF9E8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN0eYwis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699093312; x=1730629312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+56/4DpNf5YSWISqXdWXhWRBwF7TTXSMefKSiWvaKFQ=;
  b=iN0eYwisb6BH3FGPMuVoJatwV5RBCeI1KOe6CP22v14A1NeW1ZLhqj5Q
   2xz2KDEa+SymFShqUoiSf33Oql8PRfbIBrUnQlUUSv1iruu1c+PazZ6AA
   ryYKdZbOZnTZiLGw7t/Cr+Xs9cC1Wlg++5jglrTCNtIrPzKsSuoQqYNVs
   87AywdPJ6ivml83LUkVPSCnMstXfEjFqPyF4KH+N+Ccl3qK1wVXd1/OMh
   KUv0MgCbEnlEvTFHfAwSuLS/xbUkdZkv2yrFJUD9nUPckYFbhHEEtBVxA
   Y5YO3JVl3wUsNmTFblgaTD1O9f7iqFOlF1TMhelHhotOTCvdtV955pymU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387964046"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="387964046"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 03:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738346892"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="738346892"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2023 03:21:50 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzDml-0003m5-3B;
	Sat, 04 Nov 2023 10:21:47 +0000
Date: Sat, 4 Nov 2023 18:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 4768/30000]
 drivers/base/core.c:1542:5: warning: no previous prototype for
 'fw_devlink_relax_cycle'
Message-ID: <202311041845.cxgksTaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: 1df699c140a778ed678d7d4b2fa8ffb2c62573e1 [4768/30000] UPSTREAM: driver core: Handle cycles in device links created by fw_devlink
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231104/202311041845.cxgksTaI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041845.cxgksTaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041845.cxgksTaI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/core.c:1542:5: warning: no previous prototype for 'fw_devlink_relax_cycle' [-Wmissing-prototypes]
    1542 | int fw_devlink_relax_cycle(struct device *con, void *sup)
         |     ^~~~~~~~~~~~~~~~~~~~~~


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
