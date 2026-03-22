Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F036A01E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774198617; cv=none; b=kR1OZX2DC5ogn6cS027ES47JfeaiUeTkala/mXUkvrPo4HBeq/2qv83d1GaMdkiMFmwXD9bunsJUVKxS9wz+AACn9PtC/eRDHMjU7q72k8Un6l6xv++38WAEwNPIEBz6kKfAPgPGR3QCL9Tzw6yoBczGfQ7QmnmEYZiuxqPkCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774198617; c=relaxed/simple;
	bh=UpKuiJJHee5yQHs1e/aDYiZGztq1a5z/1VhFshzkV6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqXfeN6UvosIIo+3kcTN0dAsFGVEM0iuwOhx41hBglITzoom+QVGKiz1fhFxAn9taLXw+9axEqUpSvX0I/5d4+baGnUu4/+ZwdYbqFWoy3f16uBzK5y43JLthnpUYTFPMPDzeOxG9/pC53LoNAv8TRyRmBJNAyPkoAQ6+GBmJcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iz+Zv4CQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iz+Zv4CQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774198616; x=1805734616;
  h=date:from:to:cc:subject:message-id;
  bh=UpKuiJJHee5yQHs1e/aDYiZGztq1a5z/1VhFshzkV6k=;
  b=iz+Zv4CQ/kNYNCDU3dNC4Spi8rtoCO7+l/9RBA2pHGljPzTLeu/qkfGm
   IhudWVExdEXyKvOEIZ0OVXiXnl5jyA/7a9sQDOdHUHmxXfce74WgWFhbP
   b0EDcsEHyyf3EqCR7A/ayLixwZZ1S+0INafQomC+il9aybDowcwgp8B0S
   uBdOkLcWbUq3L2Im+KbsaldRryIizFaiCGPa0kTpcvH1s2iOoY6Y3mep1
   X9xa1eK8/hf9jbgc9LJ09N0hG+KLk6yxqcaekCAAkAspNkhc31w+jkCXP
   64ozenX/BXRtiWMbST1nUbkAHMjan5MlfLTO/Xhn0uTcCLKiT2sAkaafO
   w==;
X-CSE-ConnectionGUID: OiOu8noFSDqsnWhTZR24Yg==
X-CSE-MsgGUID: FVrsQSfVQz2HPE1B+JPS3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74392521"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74392521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 09:56:55 -0700
X-CSE-ConnectionGUID: rIwhWFtvSC2eEE3ltpYOUQ==
X-CSE-MsgGUID: HrZFINP9QbqYAdLUQu2vaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="247677159"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2026 09:56:54 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4M6V-000000002QN-1rsV;
	Sun, 22 Mar 2026 16:56:46 +0000
Date: Mon, 23 Mar 2026 00:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dakr:driver_override 6/7]
 drivers/s390/crypto/ap_bus.c:1021:44: error: 'ap_dev' undeclared; did you
 mean 'ap_drv'?
Message-ID: <202603230034.0eMCRxvg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git driver_override
head:   70493c3cad283a8341ce791812cd203db3b472ce
commit: 7144511c6614967b4c16b716a9674b12c4e7f2b9 [6/7] WIP: treewide: make callsites use generic driver_override
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260323/202603230034.0eMCRxvg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230034.0eMCRxvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230034.0eMCRxvg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/crypto/ap_bus.c: In function 'ap_device_probe':
>> drivers/s390/crypto/ap_bus.c:1021:44: error: 'ap_dev' undeclared (first use in this function); did you mean 'ap_drv'?
    1021 |         rc = ap_drv->probe ? ap_drv->probe(ap_dev) : -ENODEV;
         |                                            ^~~~~~
         |                                            ap_drv
   drivers/s390/crypto/ap_bus.c:1021:44: note: each undeclared identifier is reported only once for each function it appears in


vim +1021 drivers/s390/crypto/ap_bus.c

7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   974  
1534c3820c26ac Martin Schwidefsky   2006-09-20   975  static int ap_device_probe(struct device *dev)
1534c3820c26ac Martin Schwidefsky   2006-09-20   976  {
1534c3820c26ac Martin Schwidefsky   2006-09-20   977  	struct ap_driver *ap_drv = to_ap_drv(dev->driver);
7144511c661496 Danilo Krummrich     2026-03-01   978  	int card, queue, devres, drvres, rc = -ENODEV, ovrd;
29c2680fd2bf38 Harald Freudenberger 2020-10-20   979  
29c2680fd2bf38 Harald Freudenberger 2020-10-20   980  	if (!get_device(dev))
29c2680fd2bf38 Harald Freudenberger 2020-10-20   981  		return rc;
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   982  
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   983  	if (is_queue_dev(dev)) {
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   984  		/*
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   985  		 * If the apqn is marked as reserved/used by ap bus and
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   986  		 * default drivers, only probe with drivers with the default
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   987  		 * flag set. If it is not marked, only probe with drivers
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   988  		 * with the default flag not set.
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   989  		 */
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   990  		card = AP_QID_CARD(to_ap_queue(dev)->qid);
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20   991  		queue = AP_QID_QUEUE(to_ap_queue(dev)->qid);
7144511c661496 Danilo Krummrich     2026-03-01   992  		ovrd = device_match_driver_override(dev, &ap_drv->driver);
7144511c661496 Danilo Krummrich     2026-03-01   993  		if (ovrd > 0) {
7144511c661496 Danilo Krummrich     2026-03-01   994  			/* override set and matches, nothing to do */
7144511c661496 Danilo Krummrich     2026-03-01   995  		} else if (ovrd == 0) {
d38a87d7c0643d Harald Freudenberger 2025-11-19   996  			goto out;
d38a87d7c0643d Harald Freudenberger 2025-11-19   997  		} else {
8babcc2b6a75d1 Harald Freudenberger 2025-11-19   998  			mutex_lock(&ap_attr_mutex);
2004b57cde6b21 Harald Freudenberger 2022-04-04   999  			devres = test_bit_inv(card, ap_perms.apm) &&
2004b57cde6b21 Harald Freudenberger 2022-04-04  1000  				test_bit_inv(queue, ap_perms.aqm);
8babcc2b6a75d1 Harald Freudenberger 2025-11-19  1001  			mutex_unlock(&ap_attr_mutex);
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20  1002  			drvres = ap_drv->flags & AP_DRIVER_FLAG_DEFAULT;
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20  1003  			if (!!devres != !!drvres)
29c2680fd2bf38 Harald Freudenberger 2020-10-20  1004  				goto out;
7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20  1005  		}
d38a87d7c0643d Harald Freudenberger 2025-11-19  1006  	}
1534c3820c26ac Martin Schwidefsky   2006-09-20  1007  
306d6bda8f9743 Harald Freudenberger 2024-05-13  1008  	/*
306d6bda8f9743 Harald Freudenberger 2024-05-13  1009  	 * Rearm the bindings complete completion to trigger
306d6bda8f9743 Harald Freudenberger 2024-05-13  1010  	 * bindings complete when all devices are bound again
306d6bda8f9743 Harald Freudenberger 2024-05-13  1011  	 */
306d6bda8f9743 Harald Freudenberger 2024-05-13  1012  	reinit_completion(&ap_apqn_bindings_complete);
306d6bda8f9743 Harald Freudenberger 2024-05-13  1013  
e385050873d1e1 Harald Freudenberger 2017-05-24  1014  	/* Add queue/card to list of active queues/cards */
bc4b295e87a86b Harald Freudenberger 2020-05-08  1015  	spin_lock_bh(&ap_queues_lock);
bc4b295e87a86b Harald Freudenberger 2020-05-08  1016  	if (is_queue_dev(dev))
bc4b295e87a86b Harald Freudenberger 2020-05-08  1017  		hash_add(ap_queues, &to_ap_queue(dev)->hnode,
bc4b295e87a86b Harald Freudenberger 2020-05-08  1018  			 to_ap_queue(dev)->qid);
bc4b295e87a86b Harald Freudenberger 2020-05-08  1019  	spin_unlock_bh(&ap_queues_lock);
e385050873d1e1 Harald Freudenberger 2017-05-24  1020  
666e68e0dde826 Ingo Tuchscherer     2014-07-14 @1021  	rc = ap_drv->probe ? ap_drv->probe(ap_dev) : -ENODEV;
e385050873d1e1 Harald Freudenberger 2017-05-24  1022  
e385050873d1e1 Harald Freudenberger 2017-05-24  1023  	if (rc) {
bc4b295e87a86b Harald Freudenberger 2020-05-08  1024  		spin_lock_bh(&ap_queues_lock);
bc4b295e87a86b Harald Freudenberger 2020-05-08  1025  		if (is_queue_dev(dev))
bc4b295e87a86b Harald Freudenberger 2020-05-08  1026  			hash_del(&to_ap_queue(dev)->hnode);
bc4b295e87a86b Harald Freudenberger 2020-05-08  1027  		spin_unlock_bh(&ap_queues_lock);
2004b57cde6b21 Harald Freudenberger 2022-04-04  1028  	}
e385050873d1e1 Harald Freudenberger 2017-05-24  1029  
29c2680fd2bf38 Harald Freudenberger 2020-10-20  1030  out:
d38a87d7c0643d Harald Freudenberger 2025-11-19  1031  	if (rc) {
29c2680fd2bf38 Harald Freudenberger 2020-10-20  1032  		put_device(dev);
d38a87d7c0643d Harald Freudenberger 2025-11-19  1033  	} else {
d38a87d7c0643d Harald Freudenberger 2025-11-19  1034  		if (is_queue_dev(dev)) {
d38a87d7c0643d Harald Freudenberger 2025-11-19  1035  			pr_debug("queue=%02x.%04x new driver=%s\n",
d38a87d7c0643d Harald Freudenberger 2025-11-19  1036  				 card, queue, ap_drv->driver.name);
d38a87d7c0643d Harald Freudenberger 2025-11-19  1037  		} else {
d38a87d7c0643d Harald Freudenberger 2025-11-19  1038  			pr_debug("card=%02x new driver=%s\n",
d38a87d7c0643d Harald Freudenberger 2025-11-19  1039  				 to_ap_card(dev)->id, ap_drv->driver.name);
d38a87d7c0643d Harald Freudenberger 2025-11-19  1040  		}
d38a87d7c0643d Harald Freudenberger 2025-11-19  1041  	}
1534c3820c26ac Martin Schwidefsky   2006-09-20  1042  	return rc;
1534c3820c26ac Martin Schwidefsky   2006-09-20  1043  }
1534c3820c26ac Martin Schwidefsky   2006-09-20  1044  

:::::: The code at line 1021 was first introduced by commit
:::::: 666e68e0dde826ae146b980099f1719f74fa968c s390/zcrypt: improve device probing for zcrypt adapter cards

:::::: TO: Ingo Tuchscherer <ingo.tuchscherer@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
