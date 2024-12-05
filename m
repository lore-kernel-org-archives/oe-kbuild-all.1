Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0ED79DC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 02:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366982; cv=none; b=KB/X0Qpq6xvzero3Rf248seotRcziFbII2V9V+m8AUJ0sPeHFWnBhC8exHu8Yk/uPyRnKmZ6GqiSLRD9NJ+DPTWrA5iQhycKo81K6OCkHzxEor+/ue/GhTRp0NrVtp+nTQxq2fluJFv4EItQKBruwZK1k3Bpu0wcZ1HuuRk6+cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366982; c=relaxed/simple;
	bh=a92wE5BKt+edWrlwyD03yGu54Ma8gfKhzD/KDmHPUyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQULfvM7V0Oznqp3hBtU9SCHmT4wkZznihL/uvYRhoKA1qNQ+83WFw5Gyv/znLk69ehdUnPGYbY26UOxhk6NUOiA5kkseHwGTyEhyqR80FyRYXBduJaTkFnu1JthiiDyxRekX1azny8XzOicPKTe9mVkA/K2zJKnowXXQ2rb62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmMQul/D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmMQul/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733366979; x=1764902979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a92wE5BKt+edWrlwyD03yGu54Ma8gfKhzD/KDmHPUyU=;
  b=NmMQul/DkqyDb5MfNnjSH8ABoVDbNrv3gn4fhredm7AvO4VjUukDx2w5
   slEHTV044/fAhENxcKQSslDRAiQkNkb/95qGQaIv5TxiOIjTTTHoYCWjk
   eMIiA1Gsf4zkuYgYindZAuarWV3gKzSDmiBM8eDJZZ2WrsxvWP8kqil2/
   cb4RNjPq93XICXbbqjL7De6PGml8p+2i0/AVH+1weVHNbOoIx1HKgqrn3
   2klLnUZ4Vhx05tIuueOb83qprKtkEVkJ8TDeYhS6xi7jOpEa/IR2Dg66I
   odBnjJGTF+hyWAfdvMvUUyZoyIJawf7zd3Fn7kbw88D3GV2sU5o0ksa0Z
   A==;
X-CSE-ConnectionGUID: E2tCKzhHQ6yzd+5y815e2w==
X-CSE-MsgGUID: eILCYTUMQDWkHerBdf1h3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51073680"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51073680"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 18:49:38 -0800
X-CSE-ConnectionGUID: 7/nfsvMTS3iXrg21OnbJKw==
X-CSE-MsgGUID: r8+fCEgiQ2eau20TqU1E4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98923932"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 18:49:37 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ1vq-0003hz-3B;
	Thu, 05 Dec 2024 02:49:34 +0000
Date: Thu, 5 Dec 2024 10:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_device.c:1329:5: warning: no previous
 prototype for 'ubcore_dispatch_event'
Message-ID: <202412051043.VbAyfzTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b71af6f00ede58be00cb7306c9acb2660ec90947
commit: f1753f8b17480bdb750cbd33fbaa358aef5dbb23 [2516/2516] urma: upload kernel patch for 20240219_Spring
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241205/202412051043.VbAyfzTq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051043.VbAyfzTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051043.VbAyfzTq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_device.c:352:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     352 | void ubcore_destroy_upi_list(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:440:23: warning: no previous prototype for 'ubcore_find_tpf_device_legacy' [-Wmissing-prototypes]
     440 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1329:5: warning: no previous prototype for 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1329 | int ubcore_dispatch_event(struct ubcore_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1454:6: warning: no previous prototype for 'ubcore_dev_accessible' [-Wmissing-prototypes]
    1454 | bool ubcore_dev_accessible(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:2015:6: warning: no previous prototype for 'ubcore_net_exit' [-Wmissing-prototypes]
    2015 | void ubcore_net_exit(struct net *net)
         |      ^~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:690:5: warning: no previous prototype for 'ubcore_create_port_attr_files' [-Wmissing-prototypes]
     690 | int ubcore_create_port_attr_files(struct ubcore_logic_device *ldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:785:5: warning: no previous prototype for 'ubcore_create_eid_attr_files' [-Wmissing-prototypes]
     785 | int ubcore_create_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:797:5: warning: no previous prototype for 'ubcore_create_dev_attr_files' [-Wmissing-prototypes]
     797 | int ubcore_create_dev_attr_files(struct ubcore_logic_device *ldev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:6: warning: no previous prototype for 'ubcore_remove_port_attr_files' [-Wmissing-prototypes]
     810 | void ubcore_remove_port_attr_files(struct ubcore_logic_device *ldev, uint8_t port_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:815:6: warning: no previous prototype for 'ubcore_remove_eid_attr_files' [-Wmissing-prototypes]
     815 | void ubcore_remove_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:820:6: warning: no previous prototype for 'ubcore_remove_dev_attr_files' [-Wmissing-prototypes]
     820 | void ubcore_remove_dev_attr_files(struct ubcore_logic_device *ldev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ubcore_dispatch_event +1329 drivers/ub/urma/ubcore/ubcore_device.c

  1328	
> 1329	int ubcore_dispatch_event(struct ubcore_event *event)
  1330	{
  1331		struct ubcore_event_work *l_ubcore_event;
  1332	
  1333		l_ubcore_event = kzalloc(sizeof(*l_ubcore_event), GFP_ATOMIC);
  1334		if (!l_ubcore_event)
  1335			return -ENOMEM;
  1336	
  1337		INIT_WORK(&l_ubcore_event->work, ubcore_dispatch_event_task);
  1338		l_ubcore_event->event = *event;
  1339	
  1340		if (ubcore_queue_work((int)UBCORE_DISPATCH_EVENT_WQ, &l_ubcore_event->work) != 0) {
  1341			kfree(l_ubcore_event);
  1342			ubcore_log_err("Queue work failed");
  1343		}
  1344	
  1345		return 0;
  1346	}
  1347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
