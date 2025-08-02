Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADC1F099C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754139188; cv=none; b=kik5ckHPeriaa6pPuarIkuDIK1mWxOYpafq6xHtsoVz64sCpdJarC6rsayLBNZYdcAoOiBgLmCFKjS2Q7bxIMGJs1npSy6l2kbC3MB9zL1Y6ylz6Gthx2/Q9Il9Q3DFNGQAtqr14eVhqH5eOOGSeDU4uy+XB+vyZ86pPMsHYXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754139188; c=relaxed/simple;
	bh=YGw2MXnGOqC8kDk1uWkqZF43WKDaBFw/cBtiXfKb0eE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzrWc7+K3VCeU14OZBNtLXJQMtHmjPgD2RYoY8dUdKaYsA3Mf7f5/oPo3hiZg/kKRmG4FhUZmgKCmSzg5sE3tM6fKFfmYgTfmJ9wBolaQBJe4NgmrMEAiz2W/JXQtDm0DQ4rdteNRSWt7aTzwq5XAuaea/ltNkDAWQNRmWtO5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnSaISBB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnSaISBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754139186; x=1785675186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YGw2MXnGOqC8kDk1uWkqZF43WKDaBFw/cBtiXfKb0eE=;
  b=lnSaISBBxOSunpUS8P5GWJMO9GwmngBHfeqwxCtmJlsiwmWlSvb83K1g
   qJRXAWeHicYotLt1quveNDkmTVAfKXvJm+RQCofP6vXjCimHCxvny7Kvt
   /Tzxqb2JxdVH1LSZBd64GbltwOkzGLzFqL0+mHLTZsRAqSxEfdJELzns9
   qmckoMfdZnafSeSyDyQIy/mA9dutLvWAHO1rNKhOzRMSoZK0KiZIhU8Qw
   MzOy2GIbdSSigv69emb/tVWgq2O9yAEvb+GZ44CnxtuKOUYrQZ9GwOjxe
   QCYQMl0PwvXNKcmmXHQzR8dVwhDOhWBD7xXes8cGlr4GYr860p1gVNj8D
   Q==;
X-CSE-ConnectionGUID: JqfQ1HjsQRWO1gBBWt72YA==
X-CSE-MsgGUID: aqlJ4oY8QiSMoGqhrYwCJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60297712"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60297712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 05:53:06 -0700
X-CSE-ConnectionGUID: ppezpVBcSuuciUNqbE6gfQ==
X-CSE-MsgGUID: M4HsKljXSw6N00M9xnEc/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163340235"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Aug 2025 05:53:04 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiBjS-0005M8-1T;
	Sat, 02 Aug 2025 12:53:02 +0000
Date: Sat, 2 Aug 2025 20:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 0/1]
 include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct
 rq_list'
Message-ID: <202508022005.G7Uh9b7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   3c4da6410bcbca1c8cb12e7e65d8b531f7873152
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [0/1] UPSTREAM: block: add a rq_list type
config: x86_64-randconfig-102-20250802 (https://download.01.org/0day-ci/archive/20250802/202508022005.G7Uh9b7g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508022005.G7Uh9b7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022005.G7Uh9b7g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/super.c:26:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   1 error generated.
--
   In file included from fs/fs-writeback.c:27:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   fs/fs-writeback.c:138:6: warning: no previous prototype for function 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | void wb_wakeup(struct bdi_writeback *wb)
         | ^
         | static 
   fs/fs-writeback.c:1349:6: warning: no previous prototype for function 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         | ^
         | static 
   2 warnings and 1 error generated.
--
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
     239 |         return rl->head == NULL;
         |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
     244 |         rl->head = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
     245 |         rl->tail = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
     251 |         if (rl->tail)
         |             ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
     252 |                 rl->tail->rq_next = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
     254 |                 rl->head = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
     255 |         rl->tail = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
     260 |         rq->rq_next = rl->head;
         |                       ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
     261 |         rl->head = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
     262 |         if (!rl->tail)
         |              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;


vim +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
