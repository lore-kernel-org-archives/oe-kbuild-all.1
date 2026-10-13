Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2D3DAAAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 01:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854736; cv=none; b=Fb/djOvQCDG1Q3rRpGVrw/mqQ5gLiGDUSCkvsOeWHhaVhPDjRc1jD2tbYnGH8AdzJEnH8GitpsNYoNxkgPBiYelL7JEPlnVmX0YtOKG8pG6F9SLcyR+DF0N8jAZd/92Grb373XtBB/s2R/OmM2L72EskQS7pVK+Zv6/Rf5Rcm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854736; c=relaxed/simple;
	bh=ut3wIHXT85/zGjEz0te09l4xkcMlBrOIMTlKjRQAPGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BBrZM1VuAx1wPbR/KvRI0TKeLqLZzsm/A1/vwakelrgk5URmZwaNv7YqSJrtveHzdL8JmjdgLmye3GA8q+/Eqd63SFD0rVTmiJ7cKyuRqjRpLL9cdD4SUst7W70UzYpncSYRI0rHe7M1FshVplrhz1ADjBAhfIeJpsPfnsUYDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjfmRD0H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjfmRD0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791854729; x=1823390729;
  h=date:from:to:cc:subject:message-id;
  bh=ut3wIHXT85/zGjEz0te09l4xkcMlBrOIMTlKjRQAPGI=;
  b=PjfmRD0Hxxr+R4ZuiweE2sHE8TTJafhHz67nmmnWd4tupGi25258X5UF
   PQ8shXtdK1zCzaFMKyiw8YZ8MLc+1SwGCI++X+6/AxenzCHQ2t21HPP3B
   Jb9Kiwv75aThCOXyTOjWEo2PdjKVYUAQH4F54rbbDmA2rWKBc+0o+DHV9
   v5TysCJ5RxRUXP1LbZdzedboM0vTrfIuv13EAczPc58cMJj1gHW9aUqlx
   IpoNzrYU5xdrGovGZnPHB33oWbALjoXC/JeajORzQ3/ns38j7LbOI2YTx
   f9NB9ietD1Rq97IK36AgaEHUEg1eySDeF0nT16pEBonelc+lNPtHJDw4p
   Q==;
X-CSE-ConnectionGUID: CTJaRdQQQS+/u/A3YvxBbw==
X-CSE-MsgGUID: HysM7pNtQsWepxR/72jelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="470474"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="470474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 18:25:28 -0700
X-CSE-ConnectionGUID: S36eDHgyRqaruZ5TzdcrLw==
X-CSE-MsgGUID: OBQTMHsFQuqsBrx1YkYneQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1000220"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 18:25:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGRGe-00000000AKh-2ulL;
	Tue, 13 Oct 2026 01:25:24 +0000
Date: Tue, 13 Oct 2026 03:25:20 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 block/blk-mq-sched.h:47:12: error: dereferencing pointer to incomplete type
 'struct elevator_queue'
Message-ID: <202610130316.ILN1UxG3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   f2fb9e95a9ba544d173eeef98c5afc5a1a78812a
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [1/1] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: arm64-randconfig-2000-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130316.ILN1UxG3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130316.ILN1UxG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130316.ILN1UxG3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-mq.h:6,
                    from block/blk.h:11,
                    from block/vendor_hooks.c:6:
   block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared inside parameter list will not be visible outside of this definition or declaration
    extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
                                              ^~~~~~~~~~~~~~~~~
   In file included from block/blk.h:11,
                    from block/vendor_hooks.c:6:
   block/blk-mq.h: In function 'blk_mq_plug':
   block/blk-mq.h:281:17: error: 'struct task_struct' has no member named 'plug'
      return current->plug;
                    ^~
   In file included from block/blk.h:12,
                    from block/vendor_hooks.c:6:
   block/blk-mq-sched.h: At top level:
   block/blk-mq-sched.h:27:55: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
    int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
                                                          ^~~~~~~~~~~~~
   block/blk-mq-sched.h: In function 'blk_mq_sched_allow_merge':
>> block/blk-mq-sched.h:47:12: error: dereferencing pointer to incomplete type 'struct elevator_queue'
     if (e && e->type->ops.allow_merge)
               ^~
   In file included from block/vendor_hooks.c:6:
   block/blk.h: At top level:
   block/blk.h:206:17: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
             struct elevator_type *new_e);
                    ^~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/block.h:29,
                    from block/vendor_hooks.c:14:
   include/trace/trace_events.h:27:23: warning: 'str__block__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
    #define __app(x, y) __app__(x, y)
                        ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
    #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
                                ^~~~~
   include/trace/trace_events.h:33:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
     static const char TRACE_SYSTEM_STRING[] = \
                       ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
    TRACE_MAKE_SYSTEM_STR();
    ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +47 block/blk-mq-sched.h

bd166ef183c263 Jens Axboe        2017-01-17  26  
6917ff0b5bd413 Omar Sandoval     2017-04-05 @27  int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
54d5329d425650 Omar Sandoval     2017-04-07  28  void blk_mq_exit_sched(struct request_queue *q, struct elevator_queue *e);
c3e2219216c929 Ming Lei          2019-06-04  29  void blk_mq_sched_free_requests(struct request_queue *q);
bd166ef183c263 Jens Axboe        2017-01-17  30  
bd166ef183c263 Jens Axboe        2017-01-17  31  static inline bool
14ccb66b3f585b Christoph Hellwig 2019-06-06  32  blk_mq_sched_bio_merge(struct request_queue *q, struct bio *bio,
14ccb66b3f585b Christoph Hellwig 2019-06-06  33  		unsigned int nr_segs)
bd166ef183c263 Jens Axboe        2017-01-17  34  {
9bddeb2a5b9815 Ming Lei          2017-05-26  35  	if (blk_queue_nomerges(q) || !bio_mergeable(bio))
bd166ef183c263 Jens Axboe        2017-01-17  36  		return false;
bd166ef183c263 Jens Axboe        2017-01-17  37  
14ccb66b3f585b Christoph Hellwig 2019-06-06  38  	return __blk_mq_sched_bio_merge(q, bio, nr_segs);
bd166ef183c263 Jens Axboe        2017-01-17  39  }
bd166ef183c263 Jens Axboe        2017-01-17  40  
bd166ef183c263 Jens Axboe        2017-01-17  41  static inline bool
bd166ef183c263 Jens Axboe        2017-01-17  42  blk_mq_sched_allow_merge(struct request_queue *q, struct request *rq,
bd166ef183c263 Jens Axboe        2017-01-17  43  			 struct bio *bio)
bd166ef183c263 Jens Axboe        2017-01-17  44  {
bd166ef183c263 Jens Axboe        2017-01-17  45  	struct elevator_queue *e = q->elevator;
bd166ef183c263 Jens Axboe        2017-01-17  46  
f9cd4bfe96955e Jens Axboe        2018-11-01 @47  	if (e && e->type->ops.allow_merge)
f9cd4bfe96955e Jens Axboe        2018-11-01  48  		return e->type->ops.allow_merge(q, rq, bio);
bd166ef183c263 Jens Axboe        2017-01-17  49  
bd166ef183c263 Jens Axboe        2017-01-17  50  	return true;
bd166ef183c263 Jens Axboe        2017-01-17  51  }
bd166ef183c263 Jens Axboe        2017-01-17  52  

:::::: The code at line 47 was first introduced by commit
:::::: f9cd4bfe96955e7a1d3ec54b393dee87b815ba3b block: get rid of MQ scheduler ops union

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
