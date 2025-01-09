Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175BD15E8B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386642; cv=none; b=Ukgmnzs5Pv+nBBfGgrXiJN+mBwV9/2rZUE/9HYSqRRFn3LaJkRedL0wVgWFffLMVOTiSqDXrowGK0juWFUK2KF4gjJ3lroExdMVbeGU9qPowaDZZgOImohXSriVEkmMZueXWOiJ8UuI3Do4h1VmSGWwT7MbqYcgvRosj7wXJeUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386642; c=relaxed/simple;
	bh=KEMwPMPL8k1q3gQKYDnAz2PHPmdJsxCzMYAj95m/jzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQCg5IwJwvPiC727bsERxAmaOBm38UHX+VNmaUwXvIvt1hQo3pFEEJHccX2k55Iqc7hBGGurK0DCdCBKs3RbOgi1dIjSzJfOJIupheA7vSaR8p1/XwI4DN3TjdwgMOjgn2+U2rKWG6jsOR+two8pviwMbTsjjpVweRHMKV52pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JF6Ahwlt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JF6Ahwlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736386641; x=1767922641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEMwPMPL8k1q3gQKYDnAz2PHPmdJsxCzMYAj95m/jzA=;
  b=JF6Ahwlty/dlWANl/VmS4G2rY+WZv/P1VYPQvlF30+t0TvwoupNynuLQ
   hvwHaf6xSyn0zCa90IsujUD3KS5rTaf9DqwHDNnWWymD9LVWDqzDhlJeT
   IJeFyiE7RnypL8DhpNEQsjYT16V/HTid+9g1ET8vJ/7LxLR2ugXipHUkX
   QmR56wAulz6yMJisJdNDzYLTkwvDKfIqs5Px3KV3kAe2z4NawehVVbiY3
   qC1VZhKdsK+NQzN3y17yOnmO1oWEshE2pljO2PL1CxJMfMT7IgQRjw560
   mO5g1VgCfA3gdpCvS22KG0GNQfGg0ay0xlVqXMWxBDOABbEpeG+fNTs/k
   Q==;
X-CSE-ConnectionGUID: E4mrKzveTSWmegH0zpcFLw==
X-CSE-MsgGUID: /M6jUEdOTnqE68QMLNgcbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36858107"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36858107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:37:20 -0800
X-CSE-ConnectionGUID: senC9nACRriCMVVKFCDAGg==
X-CSE-MsgGUID: X0c68r+AQvSUNgLxWDR51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108375630"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 17:37:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVhU4-000GtR-03;
	Thu, 09 Jan 2025 01:37:16 +0000
Date: Thu, 9 Jan 2025 09:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.14 2/36] drivers/nvme/host/tcp.c:1583:18:
 warning: variable 'n' set but not used
Message-ID: <202501090934.Dhw69M6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.14
head:   b9973aa4d0507c4969ad87763b535edb77b7dceb
commit: bd0f5c10310122f4f1d9468467a59a6f69e46f92 [2/36] nvme-tcp: Fix I/O queue cpu spreading for multiple controllers
config: s390-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090934.Dhw69M6j-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090934.Dhw69M6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090934.Dhw69M6j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_set_queue_io_cpu':
>> drivers/nvme/host/tcp.c:1583:18: warning: variable 'n' set but not used [-Wunused-but-set-variable]
    1583 |         int cpu, n = 0, min_queues = INT_MAX, io_cpu;
         |                  ^
--
>> drivers/nvme/host/tcp.c:1578: warning: Function parameter or struct member 'queue' not described in 'nvme_tcp_set_queue_io_cpu'
>> drivers/nvme/host/tcp.c:1578: warning: expecting prototype for Track the number of queues assigned to each cpu using a global per(). Prototype was for nvme_tcp_set_queue_io_cpu() instead


vim +/n +1583 drivers/nvme/host/tcp.c

  1567	
  1568	/**
  1569	 * Track the number of queues assigned to each cpu using a global per-cpu
  1570	 * counter and select the least used cpu from the mq_map. Our goal is to spread
  1571	 * different controllers I/O threads across different cpu cores.
  1572	 *
  1573	 * Note that the accounting is not 100% perfect, but we don't need to be, we're
  1574	 * simply putting our best effort to select the best candidate cpu core that we
  1575	 * find at any given point.
  1576	 */
  1577	static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
> 1578	{
  1579		struct nvme_tcp_ctrl *ctrl = queue->ctrl;
  1580		struct blk_mq_tag_set *set = &ctrl->tag_set;
  1581		int qid = nvme_tcp_queue_id(queue) - 1;
  1582		unsigned int *mq_map;
> 1583		int cpu, n = 0, min_queues = INT_MAX, io_cpu;
  1584	
  1585		if (wq_unbound)
  1586			goto out;
  1587	
  1588		if (nvme_tcp_default_queue(queue)) {
  1589			mq_map = set->map[HCTX_TYPE_DEFAULT].mq_map;
  1590			n = qid;
  1591		} else if (nvme_tcp_read_queue(queue)) {
  1592			mq_map = set->map[HCTX_TYPE_READ].mq_map;
  1593			n = qid - ctrl->io_queues[HCTX_TYPE_DEFAULT];
  1594		} else if (nvme_tcp_poll_queue(queue)) {
  1595			mq_map = set->map[HCTX_TYPE_POLL].mq_map;
  1596			n = qid - ctrl->io_queues[HCTX_TYPE_DEFAULT] -
  1597					ctrl->io_queues[HCTX_TYPE_READ];
  1598		}
  1599		if (WARN_ON(!mq_map))
  1600			goto out;
  1601	
  1602		/* Search for the least used cpu from the mq_map */
  1603		io_cpu = WORK_CPU_UNBOUND;
  1604		for_each_online_cpu(cpu) {
  1605			int num_queues = atomic_read(&nvme_tcp_cpu_queues[cpu]);
  1606	
  1607			if (mq_map[cpu] != qid)
  1608				continue;
  1609			if (num_queues < min_queues) {
  1610				io_cpu = cpu;
  1611				min_queues = num_queues;
  1612			}
  1613		}
  1614		if (io_cpu != WORK_CPU_UNBOUND) {
  1615			queue->io_cpu = io_cpu;
  1616			atomic_inc(&nvme_tcp_cpu_queues[io_cpu]);
  1617			set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
  1618		}
  1619	out:
  1620		dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
  1621			qid, queue->io_cpu);
  1622	}
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
