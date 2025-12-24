Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597A33D6D8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569798; cv=none; b=TO4fAe7kKDWewpWPkUJ1AVfO9tYI0q7d4fUVUR0hc1BRU9m0yldCSNh6IlOqsk6nGntEyeWZ7GWB86T77Z3pWjqu2zsSY6M3EfY3XI2PcbQ6hlDK/L5ud+6NKZQhp6LkRresPjdvz09b4g/JEXOFJrLinp6BWikbnG+tNS7gHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569798; c=relaxed/simple;
	bh=qXde4gxK0pFcrbXxMgjj8p448lwiip4pjBQb7v9iBiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fL2Z/iqzFw4yVm4j2StQHddOAGjch3MeTkvYRhoBeh4/Y2wkfJZID5z8wkZdidiIaC7QFmy9RYqxGf6lvi6iA6ZELv4z8Gtf0kxOwbGNRqY8R1nXlBrR3u3FpLF8IXcLm9oAa/QjlMKSRKGAOGGymI7vS0waXraQn4sLr/anEmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgKcE1JP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgKcE1JP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766569796; x=1798105796;
  h=date:from:to:cc:subject:message-id;
  bh=qXde4gxK0pFcrbXxMgjj8p448lwiip4pjBQb7v9iBiM=;
  b=IgKcE1JP2CM+Y3A0Y/Ihw7V3wlcwv0WovuRKYlU1S/XWysvmJlhODuL9
   LDG+gR0Xpvj4dV3ETfDW22FK89JY/bOcIUcWpZYZCPq5gG3QSymY7oLJO
   Zb0Ppb7yjqgdPmeRq9C5wVKMpkwV5fw4KCQzwxLmwxSh6GlFDsG/4IavA
   xCmFu3uifyOf8gvHFac1MwjUPIMIO+JR2o7QfXHtx6yk3fYsEFjSQn9KC
   lhFpvIhMgVLr6jUjLHiq+piVnXiMaEO3m8YQP5thTOmGVSK1m2Tl5xpnj
   eROc7tptWwqPg2VeSLVg6rhK8KFsw4Shx4ggn9TGNUg/qUn/QL6c/7+Dh
   Q==;
X-CSE-ConnectionGUID: I4BlR4aTS+i1MAzMnNtJuA==
X-CSE-MsgGUID: ACaZe6DUQRu/6XIQzbqB4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68451303"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68451303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 01:49:55 -0800
X-CSE-ConnectionGUID: 2P1/f3KzS4uxPcNb+2s/7g==
X-CSE-MsgGUID: rQFWhdJSRdKBCF+lO7NodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="199738283"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Dec 2025 01:49:54 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYLV9-000000002u7-32rT;
	Wed, 24 Dec 2025 09:49:51 +0000
Date: Wed, 24 Dec 2025 17:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] block/blk-mq.h:281:31:
 error: 'struct task_struct' has no member named 'plug'
Message-ID: <202512241756.p1wqhoms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [1/1] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: arm64-randconfig-r051-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241756.p1wqhoms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241756.p1wqhoms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241756.p1wqhoms-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/blk-mq.h:6,
                    from block/blk.h:11,
                    from block/vendor_hooks.c:6:
>> block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared inside parameter list will not be visible outside of this definition or declaration
      42 | extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
         |                                           ^~~~~~~~~~~~~~~~~
   block/blk-mq.h: In function 'blk_mq_plug':
>> block/blk-mq.h:281:31: error: 'struct task_struct' has no member named 'plug'
     281 |                 return current->plug;
         |                               ^~
   In file included from block/blk.h:12:
   block/blk-mq-sched.h: At top level:
>> block/blk-mq-sched.h:27:55: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
      27 | int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
         |                                                       ^~~~~~~~~~~~~
   block/blk-mq-sched.h: In function 'blk_mq_sched_allow_merge':
>> block/blk-mq-sched.h:47:19: error: invalid use of undefined type 'struct elevator_queue'
      47 |         if (e && e->type->ops.allow_merge)
         |                   ^~
   block/blk-mq-sched.h:48:25: error: invalid use of undefined type 'struct elevator_queue'
      48 |                 return e->type->ops.allow_merge(q, rq, bio);
         |                         ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_completed_request':
   block/blk-mq-sched.h:57:19: error: invalid use of undefined type 'struct elevator_queue'
      57 |         if (e && e->type->ops.completed_request)
         |                   ^~
   block/blk-mq-sched.h:58:18: error: invalid use of undefined type 'struct elevator_queue'
      58 |                 e->type->ops.completed_request(rq, now);
         |                  ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_requeue_request':
   block/blk-mq-sched.h:66:51: error: invalid use of undefined type 'struct elevator_queue'
      66 |         if ((rq->rq_flags & RQF_ELVPRIV) && e && e->type->ops.requeue_request)
         |                                                   ^~
   block/blk-mq-sched.h:67:18: error: invalid use of undefined type 'struct elevator_queue'
      67 |                 e->type->ops.requeue_request(rq);
         |                  ^~
   block/blk-mq-sched.h: In function 'blk_mq_sched_has_work':
   block/blk-mq-sched.h:74:19: error: invalid use of undefined type 'struct elevator_queue'
      74 |         if (e && e->type->ops.has_work)
         |                   ^~
   block/blk-mq-sched.h:75:25: error: invalid use of undefined type 'struct elevator_queue'
      75 |                 return e->type->ops.has_work(hctx);
         |                         ^~
   block/blk.h: At top level:
>> block/blk.h:206:38: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
     206 |                               struct elevator_type *new_e);
         |                                      ^~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/block.h:29,
                    from block/vendor_hooks.c:14:
   include/trace/trace_events.h:27:23: warning: 'str__block__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +281 block/blk-mq.h

0da73d00ca111a Minwoo Im      2018-07-02  254  
b49773e7bcf316 Damien Le Moal 2019-07-11  255  /*
b49773e7bcf316 Damien Le Moal 2019-07-11  256   * blk_mq_plug() - Get caller context plug
b49773e7bcf316 Damien Le Moal 2019-07-11  257   * @q: request queue
b49773e7bcf316 Damien Le Moal 2019-07-11  258   * @bio : the bio being submitted by the caller context
b49773e7bcf316 Damien Le Moal 2019-07-11  259   *
b49773e7bcf316 Damien Le Moal 2019-07-11  260   * Plugging, by design, may delay the insertion of BIOs into the elevator in
b49773e7bcf316 Damien Le Moal 2019-07-11  261   * order to increase BIO merging opportunities. This however can cause BIO
b49773e7bcf316 Damien Le Moal 2019-07-11  262   * insertion order to change from the order in which submit_bio() is being
b49773e7bcf316 Damien Le Moal 2019-07-11  263   * executed in the case of multiple contexts concurrently issuing BIOs to a
b49773e7bcf316 Damien Le Moal 2019-07-11  264   * device, even if these context are synchronized to tightly control BIO issuing
b49773e7bcf316 Damien Le Moal 2019-07-11  265   * order. While this is not a problem with regular block devices, this ordering
b49773e7bcf316 Damien Le Moal 2019-07-11  266   * change can cause write BIO failures with zoned block devices as these
b49773e7bcf316 Damien Le Moal 2019-07-11  267   * require sequential write patterns to zones. Prevent this from happening by
b49773e7bcf316 Damien Le Moal 2019-07-11  268   * ignoring the plug state of a BIO issuing context if the target request queue
b49773e7bcf316 Damien Le Moal 2019-07-11  269   * is for a zoned block device and the BIO to plug is a write operation.
b49773e7bcf316 Damien Le Moal 2019-07-11  270   *
b49773e7bcf316 Damien Le Moal 2019-07-11  271   * Return current->plug if the bio can be plugged and NULL otherwise
b49773e7bcf316 Damien Le Moal 2019-07-11  272   */
b49773e7bcf316 Damien Le Moal 2019-07-11  273  static inline struct blk_plug *blk_mq_plug(struct request_queue *q,
b49773e7bcf316 Damien Le Moal 2019-07-11  274  					   struct bio *bio)
b49773e7bcf316 Damien Le Moal 2019-07-11  275  {
b49773e7bcf316 Damien Le Moal 2019-07-11  276  	/*
b49773e7bcf316 Damien Le Moal 2019-07-11  277  	 * For regular block devices or read operations, use the context plug
b49773e7bcf316 Damien Le Moal 2019-07-11  278  	 * which may be NULL if blk_start_plug() was not executed.
b49773e7bcf316 Damien Le Moal 2019-07-11  279  	 */
b49773e7bcf316 Damien Le Moal 2019-07-11  280  	if (!blk_queue_is_zoned(q) || !op_is_write(bio_op(bio)))
b49773e7bcf316 Damien Le Moal 2019-07-11 @281  		return current->plug;
b49773e7bcf316 Damien Le Moal 2019-07-11  282  
b49773e7bcf316 Damien Le Moal 2019-07-11  283  	/* Zoned block device write operation case: do not plug the BIO */
b49773e7bcf316 Damien Le Moal 2019-07-11  284  	return NULL;
b49773e7bcf316 Damien Le Moal 2019-07-11  285  }
b49773e7bcf316 Damien Le Moal 2019-07-11  286  

:::::: The code at line 281 was first introduced by commit
:::::: b49773e7bcf316f238f6709ad9e1999dcc3ed433 block: Disable write plugging for zoned block devices

:::::: TO: Damien Le Moal <damien.lemoal@wdc.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
