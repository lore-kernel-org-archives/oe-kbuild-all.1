Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F097AEACE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690016661; x=1721552661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gGMvp5YO1fnz2qKZE/lraSwtvwzbHLd4oWSiq/kx/8=;
  b=BTsv6VlZk5emK5YATDYcZ4vNx33tpIZ/Xd+BdQ9QEtG/Mq770pD07mpt
   M4tPZWpqyKqf5gA+/5/WIGvcxo0J0ve4XmJoRjUC/M6NlOB5askMawJ8i
   lEXaHJ7N82kyilYSEEqyV+LDmUtL78cHLacPCRNVutFOvyu6ZX+PydETu
   d9H6ZmPvrg84X7O6DAlZTp8gT3VMtZ5PAMJGybLQiKD2rA44gMjfo/l1G
   WVtDY61IsJ78bRweY+PRGESplNO9EGyqzUYmq4cX2lhUTIY2DqG72YELp
   BYauqpq+4eELzPEuLaeg8OKTpAb/u6jrLdYUF+ipBgW4VScqN7BDR7IZJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346781564"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="346781564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 02:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055842490"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="1055842490"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2023 02:04:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN8XD-0008CL-1J;
	Sat, 22 Jul 2023 09:04:19 +0000
Date: Sat, 22 Jul 2023 17:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 442/462] drivers/scsi/sg.c:1569:24:
 warning: unused variable 'q'
Message-ID: <202307221618.4xue1KU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   a9e3b323637a4cfb04b3352fa5efb74299c7c1f1
commit: d6ff60bb558b81f2fe30f4a5445c9fe28c4735de [442/462] scsi: sg: fix blktrace debugfs entries leakage
config: i386-randconfig-i003-20230721 (https://download.01.org/0day-ci/archive/20230722/202307221618.4xue1KU4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221618.4xue1KU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221618.4xue1KU4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sg.c:1569:24: warning: unused variable 'q' [-Wunused-variable]
           struct request_queue *q = sdp->device->request_queue;
                                 ^
   1 warning generated.


vim +/q +1569 drivers/scsi/sg.c

  1564	
  1565	static void
  1566	sg_device_destroy(struct kref *kref)
  1567	{
  1568		struct sg_device *sdp = container_of(kref, struct sg_device, d_ref);
> 1569		struct request_queue *q = sdp->device->request_queue;
  1570		unsigned long flags;
  1571	
  1572		/* CAUTION!  Note that the device can still be found via idr_find()
  1573		 * even though the refcount is 0.  Therefore, do idr_remove() BEFORE
  1574		 * any other cleanup.
  1575		 */
  1576	
  1577		blk_trace_remove(q);
  1578		scsi_device_put(sdp->device);
  1579	
  1580		write_lock_irqsave(&sg_index_lock, flags);
  1581		idr_remove(&sg_index_idr, sdp->index);
  1582		write_unlock_irqrestore(&sg_index_lock, flags);
  1583	
  1584		SCSI_LOG_TIMEOUT(3,
  1585			sg_printk(KERN_INFO, sdp, "sg_device_destroy\n"));
  1586	
  1587		kfree(sdp);
  1588	}
  1589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
