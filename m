Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214C171E55
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730643813; cv=none; b=kcGB0667szmtywIicovCRLeCsLokEoY7x6rwhRr16XB/fgXBje9TUC+nj/JdLyeUAI7S39wPokmgAVHEdygvUpsczJ+7WLA6YpmZk9HCH+PKZVeYCqb8vYSbhOh5dZ2rrAx21/RSiiXHm/8QwF1AQo5mPxhInB+of0xtS3nKAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730643813; c=relaxed/simple;
	bh=2mVYlbRTztri7FSBIo+G1PUhPWUaaXylIGzsgYLTXBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HC56Xzl0xxK4581OwG/Hr0NrnzjN567mbzgafu2Tr4unTyCKCKtELDbGkblGgi8P1qL4TMWf72NjDaIU9yS6Ou7LTMKRIeGjGKF7WDWIfg6OcQuMMjmF6hdC7oZAs5XBJpMd07iU24P5NxnEuP5Y1DORzarK/67r+pZ9Awweeo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcec6iY1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcec6iY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730643810; x=1762179810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mVYlbRTztri7FSBIo+G1PUhPWUaaXylIGzsgYLTXBs=;
  b=fcec6iY1BRR4drBkrWondlv2B6XYFS2lc+/8WtJg1JQNYeG5K9nD5sVk
   vijJp+s2m2uJBODlOnP37zhybCYdE3xNr6XkNr+Uf9OPT6kdSh63x4Z0h
   Hhgfc/GnxT45qiVw2pooJyJ9xM9/vgd+WvDEr/M41SkYArEQlkwxSgYXN
   e90Y6oeypKvhiTqh+I47ScE5Dh1fPiQ/JB1q61FCHLc3yYor6yLJq+Om6
   Hvydpj97HmSf6kqVM5hopVELh6cnkqifNBY23T9m5vDt6+WcYU05qxObu
   23FFci5qNiYGStsGcVtA9898gJs6jrMejXAFjurR0bdvMzTAM25X5cSxE
   Q==;
X-CSE-ConnectionGUID: r1oQtlzQTnWMmIYaCzO8xg==
X-CSE-MsgGUID: 3gUzON3aRZW7gk0I6SPvCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34042875"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34042875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 06:23:29 -0800
X-CSE-ConnectionGUID: y2m3JwEHQ7uG+ZpmOBa/Ug==
X-CSE-MsgGUID: fUU3Wh1tSgSAsslFKLqbww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88173731"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Nov 2024 06:23:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7bVl-000jzJ-2P;
	Sun, 03 Nov 2024 14:23:25 +0000
Date: Sun, 3 Nov 2024 22:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 drivers/ub/urma/ubcore/ubcore_device.c:1329:5: warning: no previous
 prototype for 'ubcore_dispatch_event'
Message-ID: <202411032215.Rd41GUGS-lkp@intel.com>
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
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: f1753f8b17480bdb750cbd33fbaa358aef5dbb23 [2284/2284] urma: upload kernel patch for 20240219_Spring
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241103/202411032215.Rd41GUGS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411032215.Rd41GUGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411032215.Rd41GUGS-lkp@intel.com/

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
