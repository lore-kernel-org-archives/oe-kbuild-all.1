Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62961624C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766529283; cv=none; b=d7ce81RYKGbJI1AppxNhEJV/y4FYIAS6sk0AmBGNLnSGJrhDUWgREeVmAKbWs0+l/LEc1cUw622URu+Zs+ijVcQWNHaBu0o8/Ldj/NeKR1w7sovn0scHSRTAyNHG+pb5FMN7rR9tEwq6scqM80L8UJbdr0RhYqwERIRfC48K9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766529283; c=relaxed/simple;
	bh=ALeeB22tUHwZJHJODx3uLVKy7pQj9tvKqlUMl7pRgwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UJz7J+oARQSHEQdpGmFpdZ0jw9nOCJ4b1CwXfkFnomrTFKq+rLPUtFJPEdaTs5OtRcoTjS/Go+YeDPsfOtJZWMdOrniGs1JCwKYZ/4GJ7vNxm+u4mypj6g/vuTnMpiZsZT7HO07pH+Utkac2VP1clHOqg1JjeqczgwQHUYemp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1tSrnaO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1tSrnaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766529281; x=1798065281;
  h=date:from:to:cc:subject:message-id;
  bh=ALeeB22tUHwZJHJODx3uLVKy7pQj9tvKqlUMl7pRgwE=;
  b=K1tSrnaO9JkDCjb5vvKpPoDmgFrfbevE1w9ZnKnZhvUVsiJEMKMltZT+
   IS/CQ5LhhGpCH96OjszaS4m2Pcv+xhyoQMzjCgc+wBzhd2FvRJFGq8SGU
   jgp5a+GnM50fO+rtEDVnQDHoGYNTSL/KOa8CA+Wbz/SV5P2Drjcy1gxAM
   qo9RWrLviYqoDIme+nnQNVGlzm7JyNzvk1itERat8YYts1wTAJo6HsKYZ
   EZKNcAzU/yJEiu2idJCnSgPGee/j+rUQALY24p+xQelikSgDEfpzqq1BA
   QRX7K2WopynpV3ggZa9QnRMaWNxMJ1hI7Kj30E1/A8ffgunp+noySjJrU
   A==;
X-CSE-ConnectionGUID: hdDPfTnnT0C8YQDmM8PGXw==
X-CSE-MsgGUID: F2s0ZP/PRdqqlqMQhcBuGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79099099"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79099099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 14:34:40 -0800
X-CSE-ConnectionGUID: 5AEYYeXXQtW3vo2H1EV09w==
X-CSE-MsgGUID: /sUgaskdQfidIWcq7ZBl8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204414922"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 14:34:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYAxg-000000002RT-0fqB;
	Tue, 23 Dec 2025 22:34:36 +0000
Date: Wed, 24 Dec 2025 06:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: drivers/block/rnbd/rnbd-clt.c:1429 init_dev() warn: unsigned
 'dev->clt_device_id' is never less than zero.
Message-ID: <202512240645.rx8BjT1r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: c9b5645fd8ca10f310e41b07540f98e6a9720f40 block: rnbd-clt: Fix leaked ID in init_dev()
date:   5 days ago
config: csky-randconfig-r072-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240645.rx8BjT1r-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240645.rx8BjT1r-lkp@intel.com/

New smatch warnings:
drivers/block/rnbd/rnbd-clt.c:1429 init_dev() warn: unsigned 'dev->clt_device_id' is never less than zero.

Old smatch warnings:
drivers/block/rnbd/rnbd-clt.c:1241 find_and_get_or_create_sess() error: 'sess' dereferencing possible ERR_PTR()

vim +1429 drivers/block/rnbd/rnbd-clt.c

  1401	
  1402	static struct rnbd_clt_dev *init_dev(struct rnbd_clt_session *sess,
  1403					      enum rnbd_access_mode access_mode,
  1404					      const char *pathname,
  1405					      u32 nr_poll_queues)
  1406	{
  1407		struct rnbd_clt_dev *dev;
  1408		int ret;
  1409	
  1410		dev = kzalloc_node(sizeof(*dev), GFP_KERNEL, NUMA_NO_NODE);
  1411		if (!dev)
  1412			return ERR_PTR(-ENOMEM);
  1413	
  1414		/*
  1415		 * nr_cpu_ids: the number of softirq queues
  1416		 * nr_poll_queues: the number of polling queues
  1417		 */
  1418		dev->hw_queues = kcalloc(nr_cpu_ids + nr_poll_queues,
  1419					 sizeof(*dev->hw_queues),
  1420					 GFP_KERNEL);
  1421		if (!dev->hw_queues) {
  1422			ret = -ENOMEM;
  1423			goto out_alloc;
  1424		}
  1425	
  1426		dev->clt_device_id = ida_alloc_max(&index_ida,
  1427						   (1 << (MINORBITS - RNBD_PART_BITS)) - 1,
  1428						   GFP_KERNEL);
> 1429		if (dev->clt_device_id < 0) {
  1430			ret = dev->clt_device_id;
  1431			pr_err("Failed to initialize device '%s' from session %s, allocating idr failed, err: %d\n",
  1432			       pathname, sess->sessname, ret);
  1433			goto out_queues;
  1434		}
  1435	
  1436		dev->pathname = kstrdup(pathname, GFP_KERNEL);
  1437		if (!dev->pathname) {
  1438			ret = -ENOMEM;
  1439			goto out_ida;
  1440		}
  1441	
  1442		dev->sess		= sess;
  1443		dev->access_mode	= access_mode;
  1444		dev->nr_poll_queues	= nr_poll_queues;
  1445		mutex_init(&dev->lock);
  1446		refcount_set(&dev->refcount, 1);
  1447		dev->dev_state = DEV_STATE_INIT;
  1448	
  1449		/*
  1450		 * Here we called from sysfs entry, thus clt-sysfs is
  1451		 * responsible that session will not disappear.
  1452		 */
  1453		WARN_ON(!rnbd_clt_get_sess(sess));
  1454	
  1455		return dev;
  1456	
  1457	out_ida:
  1458		ida_free(&index_ida, dev->clt_device_id);
  1459	out_queues:
  1460		kfree(dev->hw_queues);
  1461	out_alloc:
  1462		kfree(dev);
  1463		return ERR_PTR(ret);
  1464	}
  1465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
