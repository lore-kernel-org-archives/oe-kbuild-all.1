Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03222332EBB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439681; cv=none; b=AkgevyYgMUNt3bqCZELDUgFcZFddjzcklV8dFBZsSrR/OGgYhwpghZ957ujBxu2JPPGaiGc0un4FHUAeKSQ4yNkv+dLr0pqWCC2UixyMEYFKnZ+G37qfSZpcKd7tY5P3LtnTcvm7IsIYZFrDEskUg3wwhp0EnHF0wNBSfJ/52X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439681; c=relaxed/simple;
	bh=5dUPwyCtxjZAiWAyLmb4rk55T7Eulvbaef+41AomuyM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTrisSzNy9hylZ8SJzsorh0hPyXft6eMOF5s0iINH5ATV5Z9gSaYW031R3eDDJQSNC4bq63cydHIqKVktu4Gbdk5ZeBWyuVpPh+bf1ZvBQnhCjopV3wk3uktWHbDMIftFC/VRQL8hrkAGzjSTTwM/kMO6dL6HZpAYLmoP9zTbfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOrSWqbs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOrSWqbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772439680; x=1803975680;
  h=date:from:to:cc:subject:message-id;
  bh=5dUPwyCtxjZAiWAyLmb4rk55T7Eulvbaef+41AomuyM=;
  b=DOrSWqbsB07u9HnxcS8hV5GHCBCmj4EjSUu8GIwj+m9jATiE24JDIQZD
   5EZxxXzifxH0RQk6KZKw/weRG5bA+AGHZ36m7xasg7N6L88+/32H4nA0A
   lTO96PqHJEnPr5WiKWCwMrmNE+qd/Das7XfcAHlEz009DTUCS+S3jV84t
   DYe0FRBoPU/z8dQ8idipYOKeK4kyneTuAYAWx2yTOuDjnAiA6uzYXM9Bk
   J1eKqTxXWJNuAkPfpScKTbvlxrJTK6S7uGBXmTJ7jQ2m2a+PQiJTaxu4A
   Dy6VnQgcx04AcZJj7j1SJAFvJeIacDcqP/2bDtVwrUQQ/mRU7Vw+8fBNy
   w==;
X-CSE-ConnectionGUID: lcM+3YRoR3mag4GcC/IpEA==
X-CSE-MsgGUID: CN5nL8WdT++Z+h8wGrgQfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73308574"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73308574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:21:20 -0800
X-CSE-ConnectionGUID: Ckra6k/ES4aIA1KKEoUVTg==
X-CSE-MsgGUID: e+/Xm8mzSYeRDXgoibXK/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="214825735"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2026 00:21:18 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwyWh-000000000cT-3xU3;
	Mon, 02 Mar 2026 08:21:15 +0000
Date: Mon, 02 Mar 2026 16:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dakr:driver_override 7/8]
 drivers/s390/crypto/ap_bus.c:1021:37: error: incompatible pointer types
 passing 'struct ap_driver *' to parameter of type 'struct ap_device *'
Message-ID: <202603021600.zqyNUmVs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git driver_override
head:   268a990c3f5423afd328f3b8006a627b37979da7
commit: 67f27ae64f38893378fdfb8dad6cfd1dd00c1804 [7/8] WIP: treewide: make callsites use generic driver_override
config: s390-randconfig-r062-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021600.zqyNUmVs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021600.zqyNUmVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021600.zqyNUmVs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/crypto/ap_bus.c:1021:37: error: use of undeclared identifier 'ap_dev'; did you mean 'ap_drv'?
    1021 |         rc = ap_drv->probe ? ap_drv->probe(ap_dev) : -ENODEV;
         |                                            ^~~~~~
         |                                            ap_drv
   drivers/s390/crypto/ap_bus.c:977:20: note: 'ap_drv' declared here
     977 |         struct ap_driver *ap_drv = to_ap_drv(dev->driver);
         |                           ^
>> drivers/s390/crypto/ap_bus.c:1021:37: error: incompatible pointer types passing 'struct ap_driver *' to parameter of type 'struct ap_device *' [-Wincompatible-pointer-types]
    1021 |         rc = ap_drv->probe ? ap_drv->probe(ap_dev) : -ENODEV;
         |                                            ^~~~~~
   2 errors generated.


vim +1021 drivers/s390/crypto/ap_bus.c

7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   974  
1534c3820c26aca Martin Schwidefsky   2006-09-20   975  static int ap_device_probe(struct device *dev)
1534c3820c26aca Martin Schwidefsky   2006-09-20   976  {
1534c3820c26aca Martin Schwidefsky   2006-09-20   977  	struct ap_driver *ap_drv = to_ap_drv(dev->driver);
67f27ae64f38893 Danilo Krummrich     2026-03-01   978  	int card, queue, devres, drvres, rc = -ENODEV, ovrd;
29c2680fd2bf386 Harald Freudenberger 2020-10-20   979  
29c2680fd2bf386 Harald Freudenberger 2020-10-20   980  	if (!get_device(dev))
29c2680fd2bf386 Harald Freudenberger 2020-10-20   981  		return rc;
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   982  
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   983  	if (is_queue_dev(dev)) {
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   984  		/*
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   985  		 * If the apqn is marked as reserved/used by ap bus and
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   986  		 * default drivers, only probe with drivers with the default
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   987  		 * flag set. If it is not marked, only probe with drivers
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   988  		 * with the default flag not set.
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   989  		 */
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   990  		card = AP_QID_CARD(to_ap_queue(dev)->qid);
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20   991  		queue = AP_QID_QUEUE(to_ap_queue(dev)->qid);
67f27ae64f38893 Danilo Krummrich     2026-03-01   992  		ovrd = device_match_driver_override(dev, &ap_drv->driver);
67f27ae64f38893 Danilo Krummrich     2026-03-01   993  		if (ovrd > 0) {
67f27ae64f38893 Danilo Krummrich     2026-03-01   994  			/* override set and matches, nothing to do */
67f27ae64f38893 Danilo Krummrich     2026-03-01   995  		} else if (ovrd == 0) {
d38a87d7c0643db Harald Freudenberger 2025-11-19   996  			goto out;
d38a87d7c0643db Harald Freudenberger 2025-11-19   997  		} else {
8babcc2b6a75d1e Harald Freudenberger 2025-11-19   998  			mutex_lock(&ap_attr_mutex);
2004b57cde6b211 Harald Freudenberger 2022-04-04   999  			devres = test_bit_inv(card, ap_perms.apm) &&
2004b57cde6b211 Harald Freudenberger 2022-04-04  1000  				test_bit_inv(queue, ap_perms.aqm);
8babcc2b6a75d1e Harald Freudenberger 2025-11-19  1001  			mutex_unlock(&ap_attr_mutex);
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20  1002  			drvres = ap_drv->flags & AP_DRIVER_FLAG_DEFAULT;
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20  1003  			if (!!devres != !!drvres)
29c2680fd2bf386 Harald Freudenberger 2020-10-20  1004  				goto out;
7e0bdbe5c21cb83 Harald Freudenberger 2018-07-20  1005  		}
d38a87d7c0643db Harald Freudenberger 2025-11-19  1006  	}
1534c3820c26aca Martin Schwidefsky   2006-09-20  1007  
306d6bda8f97432 Harald Freudenberger 2024-05-13  1008  	/*
306d6bda8f97432 Harald Freudenberger 2024-05-13  1009  	 * Rearm the bindings complete completion to trigger
306d6bda8f97432 Harald Freudenberger 2024-05-13  1010  	 * bindings complete when all devices are bound again
306d6bda8f97432 Harald Freudenberger 2024-05-13  1011  	 */
306d6bda8f97432 Harald Freudenberger 2024-05-13  1012  	reinit_completion(&ap_apqn_bindings_complete);
306d6bda8f97432 Harald Freudenberger 2024-05-13  1013  
e385050873d1e19 Harald Freudenberger 2017-05-24  1014  	/* Add queue/card to list of active queues/cards */
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1015  	spin_lock_bh(&ap_queues_lock);
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1016  	if (is_queue_dev(dev))
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1017  		hash_add(ap_queues, &to_ap_queue(dev)->hnode,
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1018  			 to_ap_queue(dev)->qid);
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1019  	spin_unlock_bh(&ap_queues_lock);
e385050873d1e19 Harald Freudenberger 2017-05-24  1020  
666e68e0dde826a Ingo Tuchscherer     2014-07-14 @1021  	rc = ap_drv->probe ? ap_drv->probe(ap_dev) : -ENODEV;
e385050873d1e19 Harald Freudenberger 2017-05-24  1022  
e385050873d1e19 Harald Freudenberger 2017-05-24  1023  	if (rc) {
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1024  		spin_lock_bh(&ap_queues_lock);
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1025  		if (is_queue_dev(dev))
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1026  			hash_del(&to_ap_queue(dev)->hnode);
bc4b295e87a86bf Harald Freudenberger 2020-05-08  1027  		spin_unlock_bh(&ap_queues_lock);
2004b57cde6b211 Harald Freudenberger 2022-04-04  1028  	}
e385050873d1e19 Harald Freudenberger 2017-05-24  1029  
29c2680fd2bf386 Harald Freudenberger 2020-10-20  1030  out:
d38a87d7c0643db Harald Freudenberger 2025-11-19  1031  	if (rc) {
29c2680fd2bf386 Harald Freudenberger 2020-10-20  1032  		put_device(dev);
d38a87d7c0643db Harald Freudenberger 2025-11-19  1033  	} else {
d38a87d7c0643db Harald Freudenberger 2025-11-19  1034  		if (is_queue_dev(dev)) {
d38a87d7c0643db Harald Freudenberger 2025-11-19  1035  			pr_debug("queue=%02x.%04x new driver=%s\n",
d38a87d7c0643db Harald Freudenberger 2025-11-19  1036  				 card, queue, ap_drv->driver.name);
d38a87d7c0643db Harald Freudenberger 2025-11-19  1037  		} else {
d38a87d7c0643db Harald Freudenberger 2025-11-19  1038  			pr_debug("card=%02x new driver=%s\n",
d38a87d7c0643db Harald Freudenberger 2025-11-19  1039  				 to_ap_card(dev)->id, ap_drv->driver.name);
d38a87d7c0643db Harald Freudenberger 2025-11-19  1040  		}
d38a87d7c0643db Harald Freudenberger 2025-11-19  1041  	}
1534c3820c26aca Martin Schwidefsky   2006-09-20  1042  	return rc;
1534c3820c26aca Martin Schwidefsky   2006-09-20  1043  }
1534c3820c26aca Martin Schwidefsky   2006-09-20  1044  

:::::: The code at line 1021 was first introduced by commit
:::::: 666e68e0dde826ae146b980099f1719f74fa968c s390/zcrypt: improve device probing for zcrypt adapter cards

:::::: TO: Ingo Tuchscherer <ingo.tuchscherer@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
