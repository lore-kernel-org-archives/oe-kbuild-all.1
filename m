Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7372C1780
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 00:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769126802; cv=none; b=VTutT1T1HltK4H1UKC8sx62wekGiO3srtb3RxHqKJgspIX2bCgK7241V/rpczbYXQbXXm99YWZSxi9oxKwPXKYoWPGOTYcgYEuYkwBIKrK97H99q4VLxDH12FD21LpIJEAIGSnUrzt/gRpDvBEVNOajntL88GmMGH12dnF8t+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769126802; c=relaxed/simple;
	bh=qPRuhU9e2CP1qih/3j8AzvTeJFPLvLbbEmvpKQjOFGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bCBibSL3e8lHlV+/gvkz6bL4uID1LhujB4SIJLBHD/Oe0n9l8zKWnXW536zo/Dpcx6kAvTfLPVK0nuNwl6FDrOzdddFemHsaw6w6ICoyvK5LKCiZ4X7Z5xoIipYyNd/FPoFVXHGMFP0eOrT2H3aZWaxBWGOAKMaFlhMwCiUMKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZAg3EmQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZAg3EmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769126793; x=1800662793;
  h=date:from:to:cc:subject:message-id;
  bh=qPRuhU9e2CP1qih/3j8AzvTeJFPLvLbbEmvpKQjOFGQ=;
  b=eZAg3EmQIHjAHbqJAc1ha3WZrmgoqaZqq/v5T6FPnxSThr5RzYUxm1yc
   3/+hOdIEBkvUDn5xcsvMUdilzHC7kh+er4H2XvtLUY5BtiEo5vzxcxbWf
   YPPLSN5YGJoIg61mRyYbysVvSOJ2BHjHa41Vre59M2vYj+EWOESGh1XyF
   OwZ1+ZSaD+Ew8/JGT1NiAtfjhA9avHGOjMUCHmsnR3gOu/mC0tkfYj5N3
   ueMvYXTghGwH2JLaYHyrVT6xW8K3vGa3naMVJeCVKAcliNchuzkbbolal
   5LEbwnesEjXHFsQIDwtJZABEak150IrspybpO/J51QDM3tDQY7y7Rnxiq
   g==;
X-CSE-ConnectionGUID: 0JZ9yxrSTTubcpWxswph8g==
X-CSE-MsgGUID: zcQaTb/vTUirknegWIIU3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57947889"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="57947889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 16:06:27 -0800
X-CSE-ConnectionGUID: h3BAFNVVRrippkgve9D/6Q==
X-CSE-MsgGUID: fAT2J1F/TX6a7xcEYdhJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="237527014"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2026 16:06:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj4gw-00000000TMM-46wX;
	Fri, 23 Jan 2026 00:06:22 +0000
Date: Fri, 23 Jan 2026 08:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/xen/pvcalls-back.c:1014:9: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202601230705.AP9Nd0ne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f440fa382add8d0ec84acc3fd7e5785e10af1ded
commit: f440fa382add8d0ec84acc3fd7e5785e10af1ded [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: x86_64-randconfig-r131-20260123 (https://download.01.org/0day-ci/archive/20260123/202601230705.AP9Nd0ne-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230705.AP9Nd0ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230705.AP9Nd0ne-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/xen/pvcalls-back.c:1014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   drivers/xen/pvcalls-back.c:1014:9: sparse:     expected void **slot
   drivers/xen/pvcalls-back.c:1014:9: sparse:     got void [noderef] __rcu **
>> drivers/xen/pvcalls-back.c:1014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   drivers/xen/pvcalls-back.c:1014:9: sparse:     expected void **slot
   drivers/xen/pvcalls-back.c:1014:9: sparse:     got void [noderef] __rcu **
>> drivers/xen/pvcalls-back.c:1015:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   drivers/xen/pvcalls-back.c:1015:49: sparse:     expected void [noderef] __rcu **slot
   drivers/xen/pvcalls-back.c:1015:49: sparse:     got void **slot
   drivers/xen/pvcalls-back.c:1020:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   drivers/xen/pvcalls-back.c:1020:38: sparse:     expected void **slot
   drivers/xen/pvcalls-back.c:1020:38: sparse:     got void [noderef] __rcu **
   drivers/xen/pvcalls-back.c:1014:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   drivers/xen/pvcalls-back.c:1014:9: sparse:     expected void [noderef] __rcu **slot
   drivers/xen/pvcalls-back.c:1014:9: sparse:     got void **slot
>> drivers/xen/pvcalls-back.c:1014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   drivers/xen/pvcalls-back.c:1014:9: sparse:     expected void **slot
   drivers/xen/pvcalls-back.c:1014:9: sparse:     got void [noderef] __rcu **

vim +1014 drivers/xen/pvcalls-back.c

0a9c75c2c7258f Stefano Stabellini 2017-07-06   996  
0a9c75c2c7258f Stefano Stabellini 2017-07-06   997  static int backend_disconnect(struct xenbus_device *dev)
0a9c75c2c7258f Stefano Stabellini 2017-07-06   998  {
0a85d23b8164c9 Stefano Stabellini 2017-07-06   999  	struct pvcalls_fedata *fedata;
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1000  	struct sock_mapping *map, *n;
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1001  	struct sockpass_mapping *mappass;
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1002  	struct radix_tree_iter iter;
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1003  	void **slot;
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1004  
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1005  
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1006  	fedata = dev_get_drvdata(&dev->dev);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1007  
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1008  	down(&fedata->socket_lock);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1009  	list_for_each_entry_safe(map, n, &fedata->socket_mappings, list) {
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1010  		list_del(&map->list);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1011  		pvcalls_back_release_active(dev, fedata, map);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1012  	}
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1013  
0a85d23b8164c9 Stefano Stabellini 2017-07-06 @1014  	radix_tree_for_each_slot(slot, &fedata->socketpass_mappings, &iter, 0) {
0a85d23b8164c9 Stefano Stabellini 2017-07-06 @1015  		mappass = radix_tree_deref_slot(slot);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1016  		if (!mappass)
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1017  			continue;
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1018  		if (radix_tree_exception(mappass)) {
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1019  			if (radix_tree_deref_retry(mappass))
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1020  				slot = radix_tree_iter_retry(&iter);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1021  		} else {
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1022  			radix_tree_delete(&fedata->socketpass_mappings,
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1023  					  mappass->id);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1024  			pvcalls_back_release_passive(dev, fedata, mappass);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1025  		}
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1026  	}
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1027  	up(&fedata->socket_lock);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1028  
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1029  	unbind_from_irqhandler(fedata->irq, dev);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1030  	xenbus_unmap_ring_vfree(dev, fedata->sring);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1031  
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1032  	list_del(&fedata->list);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1033  	kfree(fedata);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1034  	dev_set_drvdata(&dev->dev, NULL);
0a85d23b8164c9 Stefano Stabellini 2017-07-06  1035  
0a9c75c2c7258f Stefano Stabellini 2017-07-06  1036  	return 0;
0a9c75c2c7258f Stefano Stabellini 2017-07-06  1037  }
0a9c75c2c7258f Stefano Stabellini 2017-07-06  1038  

:::::: The code at line 1014 was first introduced by commit
:::::: 0a85d23b8164c951a50512b84601decb9a5e4dd6 xen/pvcalls: disconnect and module_exit

:::::: TO: Stefano Stabellini <sstabellini@kernel.org>
:::::: CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
