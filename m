Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C41224EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 20:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735071853; cv=none; b=I3ERnWfgo9dmS7GUU+NvuIxDySI8drJK5AyUPquSgcRHJ9N74kma2FprLtXFI2sA3yLqrC0mCXgX1Tf2mliIcozgpLAnYCXHZTLS0wR9IHRGYo/1cxMYBOAFvWFzHAWhk4X7zpEwYTpy7UgU4TjcpcQ3x8QJJpwJXh+G/BqQ5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735071853; c=relaxed/simple;
	bh=8QEmySBmmLg6PvapB3I3tVgYbeJwKHgFSWGRHaiHwoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvnvrPR/X9tWZvg0WK+STP6JhdIQPYFd9VKlrMUMvvqDbsi7PgQJBdAaUIIKvT89jfBpcejTZGKQbjFTv563V2cPWu3II2C4x50vBUbVROBI1dvTk7kwNIR0gR/KA3bSUdd4fw7Bq24Qd+B8cM/0lJppgTux6xOJ7IchAxjsQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8VwBiSl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8VwBiSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735071851; x=1766607851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8QEmySBmmLg6PvapB3I3tVgYbeJwKHgFSWGRHaiHwoE=;
  b=G8VwBiSl+NGtI2f/08IYIJU17lfKF4jCmX1Oi4zrTz325vT0EjsIkBGv
   QPtikPV6HtaNmLhj5/0yHqcbDbd2FdkHgnHnYY0djzsVrsgGsCfCOukZD
   XcR8KiQaF20XV6QtbT/zyhXSBvcOkKyYZ5UL/qoaaDqcK4Be+ZLXC0w2k
   A27hj2jzlXHTNofEWQuWaJmeeY9+XOieCFyiGUZNF0RH1LVrLf+K+3IAp
   04lEJYrrzH+292p67xpICsVQ9hAsdxMj5SkjqFSNE8Ybj3W4rkyK792o4
   kGY5idJoMVfVxQiuPBi70SScqnJrjRj/bWAFUxIKV55UsEA+UjXkDJtqA
   Q==;
X-CSE-ConnectionGUID: Mq+TYsB0S5GFkARMzj0RxQ==
X-CSE-MsgGUID: ee96/dHtR1mBvTGBzdoD7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35418213"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="35418213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 12:24:10 -0800
X-CSE-ConnectionGUID: N5DMhx0xSq2w4FAtk+l0hA==
X-CSE-MsgGUID: u21s+tGPR9K9dEzN0yBzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="130410753"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2024 12:24:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQBRl-0001QZ-1g;
	Tue, 24 Dec 2024 20:24:05 +0000
Date: Wed, 25 Dec 2024 04:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yuyu Li <liyuyu6@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Junxian Huang <huangjunxian6@hisilicon.com>
Subject: [rdma-rdma:wip/leon-for-next 32/34]
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:154:17: error: implicit
 declaration of function 'pvrdma_dispatch_event'; did you mean
 'ib_dispatch_event'?
Message-ID: <202412250400.jePXAWj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   1a4f56e8c029d463e9b8461ea3256ae16c88ddf6
commit: bb66b99e3c66384facdb8c104d67a62e53c1128c [32/34] RDMA/pvrdma: Support report_port_event() ops
config: loongarch-randconfig-002-20241225 (https://download.01.org/0day-ci/archive/20241225/202412250400.jePXAWj9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250400.jePXAWj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250400.jePXAWj9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c: In function 'pvrdma_report_event_handle':
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:154:17: error: implicit declaration of function 'pvrdma_dispatch_event'; did you mean 'ib_dispatch_event'? [-Wimplicit-function-declaration]
     154 |                 pvrdma_dispatch_event(dev, 1, IB_EVENT_PORT_ERR);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 ib_dispatch_event
   drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c: At top level:
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:394:13: warning: conflicting types for 'pvrdma_dispatch_event'; have 'void(struct pvrdma_dev *, int,  enum ib_event_type)'
     394 | static void pvrdma_dispatch_event(struct pvrdma_dev *dev, int port,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:394:13: error: static declaration of 'pvrdma_dispatch_event' follows non-static declaration
   drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:154:17: note: previous implicit declaration of 'pvrdma_dispatch_event' with type 'void(struct pvrdma_dev *, int,  enum ib_event_type)'
     154 |                 pvrdma_dispatch_event(dev, 1, IB_EVENT_PORT_ERR);
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +154 drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c

   145	
   146	static void pvrdma_report_event_handle(struct ib_device *ibdev,
   147					       struct net_device *ndev,
   148					       unsigned long event)
   149	{
   150		struct pvrdma_dev *dev = container_of(ibdev, struct pvrdma_dev, ib_dev);
   151	
   152		switch (event) {
   153		case NETDEV_DOWN:
 > 154			pvrdma_dispatch_event(dev, 1, IB_EVENT_PORT_ERR);
   155			break;
   156		case NETDEV_UP:
   157			pvrdma_write_reg(dev, PVRDMA_REG_CTL,
   158					 PVRDMA_DEVICE_CTL_UNQUIESCE);
   159	
   160			mb();
   161	
   162			if (pvrdma_read_reg(dev, PVRDMA_REG_ERR))
   163				dev_err(&dev->pdev->dev,
   164					"failed to activate device during link up\n");
   165			else
   166				pvrdma_dispatch_event(dev, 1, IB_EVENT_PORT_ACTIVE);
   167			break;
   168	
   169		default:
   170			break;
   171		}
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
