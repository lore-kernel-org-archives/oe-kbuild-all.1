Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C72EE611
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355229; cv=none; b=Jv6TGY9YwXGpGXoezSwIr1KNP3BStDip780qPPb3cH3paqrV4/KidGHu+cT+19FsYsRLjQd4KdGfq0J9h29bbD6HNIXpdoRGYHMNbVjzPZRMpmJa1XwGwu43lj161d78x0otpWGi1cxgZmJ3k9epV8W518Vu/T7/PAB/9ycCGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355229; c=relaxed/simple;
	bh=6wP1zrt2EOmikurwhTj1u6C4Xw7lFUb6HVg+70gokBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXepDjPxzjlKgG1tMH3P6u+2vfu4whNuwPvjmlrzRlbXp5OquMgA4S+Oi2R3qY+mugX1t3gA8q4CjOh84AMIqdgd1rZJwaUBE1wMKDojsssL0yPBIh1TImOG7TOGiEXlnzsO7gLBq52yNx7y+3On8dUjJkdnBPTKYr1RHUEt8oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5QSYdCz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5QSYdCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765355227; x=1796891227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wP1zrt2EOmikurwhTj1u6C4Xw7lFUb6HVg+70gokBw=;
  b=a5QSYdCz84rXWS4pTyyDEcluJS5Hr/htl/++wfhCkB4zBaKD9zoB5BJP
   UXu0UFis+lDVid2vHZbNnWcV2F1kpXAt4/efUYJLRIwHZutwlRMq/HzTS
   YSB4hxms6VckavVdfDDlBVRQ6IZ0eomE8Y6AajfTo3IRg9hJwDDBtxC8x
   O/Ir4UfI1ai2tFgVWbwSPF9n6ihMVkNsg/xHHsSWAAdDg9aZy3BSRXQpi
   SrbVr2VA8NFnXlYkgxEMM1Houj/jWmb59n/SoXNgHK9w0FyUqlwoeP6U7
   G9DWii/LEvigwFahzHqpPfVkADkO2jtMBzY9cqk9rBMDuZbNIA7CRqIIN
   Q==;
X-CSE-ConnectionGUID: gNwAwbdeT9K5YqUHr+LwRg==
X-CSE-MsgGUID: Cz+2io0/SEKadQP5fHdMTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69911036"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="69911036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 00:27:04 -0800
X-CSE-ConnectionGUID: UeA2Qr4AQECxycBAvuKANQ==
X-CSE-MsgGUID: pnwIQ/6KQ/2pg4U+igTv+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196365914"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 00:27:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTFXJ-00000000303-115R;
	Wed, 10 Dec 2025 08:27:01 +0000
Date: Wed, 10 Dec 2025 16:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] include/linux/blkdev.h:1699:17:
 error: field has incomplete type 'struct rq_list'
Message-ID: <202512101658.nxOCjWVc-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7d9fe864dc6289d8c10246453b0c7d3cb3f983f6
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [1/1] UPSTREAM: block: add a rq_list type
config: i386-randconfig-012-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101658.nxOCjWVc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101658.nxOCjWVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101658.nxOCjWVc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/sync.c:14:
   In file included from io_uring/io_uring.h:9:
   In file included from include/linux/io_uring_types.h:4:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   1 error generated.
--
   In file included from io_uring/rw.c:6:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
     239 |         return rl->head == NULL;
         |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
     244 |         rl->head = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
     245 |         rl->tail = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
     251 |         if (rl->tail)
         |             ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
     252 |                 rl->tail->rq_next = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
     254 |                 rl->head = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
     255 |         rl->tail = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
     260 |         rq->rq_next = rl->head;
         |                       ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
     261 |         rl->head = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
     262 |         if (!rl->tail)
         |              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                            ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
     272 |                 if (!rl->head)
         |                      ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from io_uring/rw.c:6:
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
     273 |                         rl->tail = NULL;
         |                         ~~^
--
   In file included from kernel/sched/core.c:41:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   kernel/sched/core.c:5616:6: warning: no previous prototype for function '__balance_callbacks' [-Wmissing-prototypes]
    5616 | void __balance_callbacks(struct rq *rq)
         |      ^
   kernel/sched/core.c:5616:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5616 | void __balance_callbacks(struct rq *rq)
         | ^
         | static 
   1 warning and 1 error generated.


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
