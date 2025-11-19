Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EAC1E7C34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763595716; cv=none; b=QMsXow0JDsl9DGHKlIvPuFlDBkrkqNqZyDJwe47PC25GoRaQZxzOf2YtSMSyRd7O2qWKgDDFuZOrqi+J93rwnLSIkij+Mcx0ADqNSwnwMCqhIWTybb9z9Eo45R1YAg1rMAOa0omaQtN7nx8RGKEzPPHwfuMRCiizKnbk0Zj4pE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763595716; c=relaxed/simple;
	bh=y4t1b4/V4A0cZFn4GLQ3XJhrNRaS5m3r+R0VM8vfEPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o18jI9OUB66RXgT02kVjABKDQrXc0yFt/sTuhMoaQ+Kb7Qnq/EeIOxcJkoe2W3/2KVesIBfDCl1fKGbxfdMIunQFW2axx/Szh2aBEUMT4n5mpx4K9LjWYuy81FWy/mg7DZ+vvmox3mR1cPpT8rCZbT94VptmJtEUL4qclvqT6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adu8A2+f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adu8A2+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763595715; x=1795131715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4t1b4/V4A0cZFn4GLQ3XJhrNRaS5m3r+R0VM8vfEPs=;
  b=adu8A2+fe13/3lLACn3ICXgwaa6Txvx5R7Q2vrC5E/HZk051QBVCMDVk
   XpwkxMIKZL2DAVj5NW8x4LqY6ic9HIb8UaPPspTmSymZekBe9nyr7Crsh
   UZq8rLqpj9SIYDPdoLETwuz/o9K524NzcggO1rlxxakAMyQNbNCtN2Yjh
   V7w1p/b5fTX+R2E/HoXZxeTS+eUYQRu8tjBqgPBIUaxhpmBmmnp58zYyU
   uhGVbWHZ7F3u+I33DiETOZmdUeTzX9Ki/7cx0rD27qDL8M6XZigtGiDOI
   8EXH9oc66T2AfXkNHcosh5mLQ/8s3lpC8FRhDhFmrgLOfU8jn/gVMP65g
   w==;
X-CSE-ConnectionGUID: 7BvREXVrTzma8wuj0mWyUQ==
X-CSE-MsgGUID: uR5XBvuVTTyBdAKH+eiUaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65686012"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65686012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 15:41:55 -0800
X-CSE-ConnectionGUID: qVRETSS7Tn+caQFKuPJm0g==
X-CSE-MsgGUID: xCQ+8ZFYSKKsyYJtWOQNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="196329469"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2025 15:41:53 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLro6-0003Pv-2H;
	Wed, 19 Nov 2025 23:41:50 +0000
Date: Thu, 20 Nov 2025 07:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1] block/blk-mq-tag.h:42:43:
 warning: declaration of 'struct blk_mq_alloc_data' will not be visible
 outside of this function
Message-ID: <202511200707.3YFj12uf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   9536d991bb596a507f46aafe6b5f64fe9e599e78
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [0/1] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: i386-buildonly-randconfig-003-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200707.3YFj12uf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200707.3YFj12uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200707.3YFj12uf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:11:
   In file included from block/blk-mq.h:6:
>> block/blk-mq-tag.h:42:43: warning: declaration of 'struct blk_mq_alloc_data' will not be visible outside of this function [-Wvisibility]
      42 | extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
         |                                           ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:11:
   block/blk-mq.h:281:19: error: no member named 'plug' in 'struct task_struct'
     281 |                 return current->plug;
         |                        ~~~~~~~  ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
>> block/blk-mq-sched.h:27:55: warning: declaration of 'struct elevator_type' will not be visible outside of this function [-Wvisibility]
      27 | int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
         |                                                       ^
   block/blk-mq-sched.h:47:12: error: incomplete definition of type 'struct elevator_queue'
      47 |         if (e && e->type->ops.allow_merge)
         |                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:48:11: error: incomplete definition of type 'struct elevator_queue'
      48 |                 return e->type->ops.allow_merge(q, rq, bio);
         |                        ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:57:12: error: incomplete definition of type 'struct elevator_queue'
      57 |         if (e && e->type->ops.completed_request)
         |                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:58:4: error: incomplete definition of type 'struct elevator_queue'
      58 |                 e->type->ops.completed_request(rq, now);
         |                 ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:66:44: error: incomplete definition of type 'struct elevator_queue'
      66 |         if ((rq->rq_flags & RQF_ELVPRIV) && e && e->type->ops.requeue_request)
         |                                                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:67:4: error: incomplete definition of type 'struct elevator_queue'
      67 |                 e->type->ops.requeue_request(rq);
         |                 ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:74:12: error: incomplete definition of type 'struct elevator_queue'
      74 |         if (e && e->type->ops.has_work)
         |                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:75:11: error: incomplete definition of type 'struct elevator_queue'
      75 |                 return e->type->ops.has_work(hctx);
         |                        ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
>> block/blk.h:206:17: warning: declaration of 'struct elevator_type' will not be visible outside of this function [-Wvisibility]
     206 |                               struct elevator_type *new_e);
         |                                      ^
   3 warnings and 9 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]


vim +42 block/blk-mq-tag.h

32bc15afed04bd John Garry 2020-08-19  41  
cb96a42cc1f50b Ming Lei   2014-06-01 @42  extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
cae740a04b4d6d John Garry 2020-02-26  43  extern void blk_mq_put_tag(struct blk_mq_tags *tags, struct blk_mq_ctx *ctx,
cae740a04b4d6d John Garry 2020-02-26  44  			   unsigned int tag);
70f36b6001bf59 Jens Axboe 2017-01-19  45  extern int blk_mq_tag_update_depth(struct blk_mq_hw_ctx *hctx,
70f36b6001bf59 Jens Axboe 2017-01-19  46  					struct blk_mq_tags **tags,
70f36b6001bf59 Jens Axboe 2017-01-19  47  					unsigned int depth, bool can_grow);
32bc15afed04bd John Garry 2020-08-19  48  extern void blk_mq_tag_resize_shared_sbitmap(struct blk_mq_tag_set *set,
32bc15afed04bd John Garry 2020-08-19  49  					     unsigned int size);
32bc15afed04bd John Garry 2020-08-19  50  

:::::: The code at line 42 was first introduced by commit
:::::: cb96a42cc1f50ba1c7b1e9b2343bec80b926107f blk-mq: fix schedule from atomic context

:::::: TO: Ming Lei <tom.leiming@gmail.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
