Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F520E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 08:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691655967; x=1723191967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XHgofnGZ1QaAOe/WmL1jEbithHy9PgkGSwUFtIJ4qKs=;
  b=KvMJQuU3SJwNGeDUPau4DMC9bYt0wlLm08Q7sklRg+EzbQcJBfzjQJhh
   dNEpINuBNopzmckmYjVd/B3T6EBuCK+gK9L4xKWDwIFZaPwwONpVlFLY3
   7otSFd2FA09M7SKiwSPL+3HYQdYn+wDIi1qeolve7RGQPOeRqvr2B+C7e
   obKaRcEi4vPmfCw6570PGia3AB5eHvfJH2iONdLjJbIS//ky2b0jCRrWr
   Z25uKxfl4+6pFP7tgS3F6bubjUWpdGKEqSJKjCTkgJT54vV+FOtim8DFI
   ptbCT6gAyL+2oymO6EbtRK+s6/W9pBkkdYxdSNDwGyY9zh2sa0iZQgZJd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435232773"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="435232773"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 01:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846285594"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="846285594"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2023 01:26:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU0zb-0006qq-0h;
	Thu, 10 Aug 2023 08:26:03 +0000
Date: Thu, 10 Aug 2023 16:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Ming Lei <ming.lei@redhat.com>
Subject: [axboe-block:for-6.6/block 36/41] drivers/block/ublk_drv.c:963:24:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202308101657.CSjaVKXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.6/block
head:   0ece1d649b6dd615925a72bc1824d6b9fa5b998a
commit: 29802d7ca33bc0a75c9da2a143eeed4f9e99fca4 [36/41] ublk: enable zoned storage support
config: arc-randconfig-r093-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101657.CSjaVKXe-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101657.CSjaVKXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101657.CSjaVKXe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/ublk_drv.c:963:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int @@
   drivers/block/ublk_drv.c:963:24: sparse:     expected restricted blk_status_t
   drivers/block/ublk_drv.c:963:24: sparse:     got int
   drivers/block/ublk_drv.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/arc/include/asm/uaccess.h:590:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char *d_char @@     got void [noderef] __user *to @@
   arch/arc/include/asm/uaccess.h:590:33: sparse:     expected unsigned char *d_char
   arch/arc/include/asm/uaccess.h:590:33: sparse:     got void [noderef] __user *to

vim +963 drivers/block/ublk_drv.c

   953	
   954	static blk_status_t ublk_setup_iod(struct ublk_queue *ubq, struct request *req)
   955	{
   956		struct ublksrv_io_desc *iod = ublk_get_iod(ubq, req->tag);
   957		struct ublk_io *io = &ubq->ios[req->tag];
   958		enum req_op op = req_op(req);
   959		u32 ublk_op;
   960	
   961		if (!ublk_queue_is_zoned(ubq) &&
   962		    (op_is_zone_mgmt(op) || op == REQ_OP_ZONE_APPEND))
 > 963			return -EIO;
   964	
   965		switch (req_op(req)) {
   966		case REQ_OP_READ:
   967			ublk_op = UBLK_IO_OP_READ;
   968			break;
   969		case REQ_OP_WRITE:
   970			ublk_op = UBLK_IO_OP_WRITE;
   971			break;
   972		case REQ_OP_FLUSH:
   973			ublk_op = UBLK_IO_OP_FLUSH;
   974			break;
   975		case REQ_OP_DISCARD:
   976			ublk_op = UBLK_IO_OP_DISCARD;
   977			break;
   978		case REQ_OP_WRITE_ZEROES:
   979			ublk_op = UBLK_IO_OP_WRITE_ZEROES;
   980			break;
   981		default:
   982			if (ublk_queue_is_zoned(ubq))
   983				return ublk_setup_iod_zoned(ubq, req);
   984			return BLK_STS_IOERR;
   985		}
   986	
   987		/* need to translate since kernel may change */
   988		iod->op_flags = ublk_op | ublk_req_build_flags(req);
   989		iod->nr_sectors = blk_rq_sectors(req);
   990		iod->start_sector = blk_rq_pos(req);
   991		iod->addr = io->addr;
   992	
   993		return BLK_STS_OK;
   994	}
   995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
