Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6329E1D9A54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165777; cv=none; b=tBr0nWFvzsuVezS9wwxxzdtBMHVEziN7KJ9WFgOs2MBhf2HkVBKJrLHgQTz418RakRl1PimjR4We7jTfj6nhiIf8uQ82KV1o8H5vEs8yqVKvaKHqsGwLiVrTjtVTgv7lY3mDE3MQcTwK9J5PQRwXcnYNxVNKsbshQA31fkLAt70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165777; c=relaxed/simple;
	bh=LiqBzTmw6O1rZLKQXEqs6YbC6TBHOUIelCkPXmcR0tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RerQZ1AEN2iKIB128TPfsW5tJ+PmWB5Q/pCKSZFAk/bn4xPoA5OlJUCcxq3jj9J4Xpbi5CYL8oMhZkPA1hmx5jH2xpUhiKgZ+kQ+D1GcU7qtRbRwzsrAgzr+YwbynykMszSUjMFYK99vQioFgbVb17+bc6vrBr0y2jiEX5Nqusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMLBgBi6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMLBgBi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766165776; x=1797701776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LiqBzTmw6O1rZLKQXEqs6YbC6TBHOUIelCkPXmcR0tM=;
  b=OMLBgBi67QxR/LaPd118orw0a15tgfbMMZsomntUZuYPrj+9/jo6Rqch
   32KuoZIWZftYLAopiBkugs2yzarrvI2OR34JjGneBOCu+Yxc2f1hTkhH8
   yNSvNnMdXZx/BQsNGJVR1qnnIf9i65wt6R5R5wwx9CqbiSJW0Lvl/fuhj
   qj9YbhU2eAjjVzpSDukbA2oH/IpVRo7WDBm/lj8/wZmB1OMkv6pHU25Ys
   UbEPpummZ7zZaBqYPMCpt+SLLm7YN3KlNtHqZ0l6ofoOTYDoZ9fHEufAp
   lWRx54LuX/heAIuYLuSNZGJIfZK+etWnjhaXg8V63Di0/fSYUI+zCaK8V
   g==;
X-CSE-ConnectionGUID: s/V2zztqTYG3PquPU+qJlQ==
X-CSE-MsgGUID: jcU6BvlfQSidKnR++atPjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68281282"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68281282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 09:36:08 -0800
X-CSE-ConnectionGUID: 6HIh9dPbQymDJ9oXpfLQqg==
X-CSE-MsgGUID: feaVNDflSZaqqeHqPu6tlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="203438049"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Dec 2025 09:36:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWeOa-000000003of-0frE;
	Fri, 19 Dec 2025 17:36:04 +0000
Date: Sat, 20 Dec 2025 01:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/base/core.c:1542:5: warning: no previous prototype for
 'fw_devlink_relax_cycle'
Message-ID: <202512200141.NaSBtNtx-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 1df699c140a778ed678d7d4b2fa8ffb2c62573e1 [0/4] UPSTREAM: driver core: Handle cycles in device links created by fw_devlink
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512200141.NaSBtNtx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200141.NaSBtNtx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200141.NaSBtNtx-lkp@intel.com/

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
