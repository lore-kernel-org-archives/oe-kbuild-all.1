Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31AA2DF719
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347034; cv=none; b=LtQ9AO6HJyCVQNpRMsgFdaJSFsXxii4wSKGCP5qnUHeqHYM6BCPcNxdVTS7ke3I+CPlhBoec+ocsl5yi/8ytacnBDSTjZr8Uzp66NxyEsxM+pgFNnWDiiYi2l3uPaSuASfPfwXgoAv92+w8SsBt5Sx8X6uCe2w5nzL3CGSsVeyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347034; c=relaxed/simple;
	bh=BEeZ7kGUql4rnGl3F9DKyfbfDtsHzlF6Lz+U7e1biFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=REMZ3woC6Jkh2Qgl2Quyyu/k9Ij9K1d3Fps2x5Hb3Iwu0ZMq4oVxaE35NypCXrr6i6bfrMVjm04n8TMtDx0C6jF5+a849hf2veKQTSJbn7Xy5ledZkEGFrym8krKEZLqYGaSvqXnRsxHGnMw3jxbFwiom6UZd08v+0pnwb4ROJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRxHa8hV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRxHa8hV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787347033; x=1818883033;
  h=date:from:to:cc:subject:message-id;
  bh=BEeZ7kGUql4rnGl3F9DKyfbfDtsHzlF6Lz+U7e1biFQ=;
  b=KRxHa8hVB++fl7jHZma55vJ076bTnmYpcDoeMApikxpl3WsA/+LReWnA
   GPumq9klVpdPLNpsDAlEdHyuetQnRCJGjmNPo2Nziose0LZ1at3p8eeId
   vfZqCwSZr8iGuFOyR/6UGwl/XLJlUIEU+qcpMVOm3cLEi99juC9IwGx+w
   4KmtDWw+XSBWAV4lFx+LKFXbV43cqhQTBWwhqAyUT5/Bci3CaQuYM4O/N
   zQZSSb6hK1BraAJ5D1Y/7c/URKGHtT4VafCzT5Q7luyBhbBO1iPd4NyAX
   zeI0ioXWJc1XOyhdPVjR33c6b9EOJ/Ffns8Kw0T0BQoJ0WiDmfoI+R0gu
   Q==;
X-CSE-ConnectionGUID: JKJEKlZfS3OUWBUR4vTdaw==
X-CSE-MsgGUID: y8qcll7tTa6Q6ZHTuUKE8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91775311"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91775311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:17:11 -0700
X-CSE-ConnectionGUID: IWVLL/FeQACWd4Q9X8x4OA==
X-CSE-MsgGUID: qRzurJlzT6u9sJOM2iYH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="262728787"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2026 14:17:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxWbq-00000000qTp-43pg;
	Fri, 21 Aug 2026 21:17:06 +0000
Date: Sat, 22 Aug 2026 05:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/2]
 block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202608220542.U1hmdVTp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   233907fd00d20cb913bac974697845f18998af64
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [0/2] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: i386-randconfig-016-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220542.U1hmdVTp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220542.U1hmdVTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220542.U1hmdVTp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-mq.h:6,
                    from block/blk.h:11,
                    from block/vendor_hooks.c:6:
>> block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared inside parameter list will not be visible outside of this definition or declaration
      42 | extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
         |                                           ^~~~~~~~~~~~~~~~~
   block/blk-mq.h: In function 'blk_mq_plug':
   block/blk-mq.h:281:31: error: 'struct task_struct' has no member named 'plug'
     281 |                 return current->plug;
         |                               ^~
   In file included from block/blk.h:12:
   block/blk-mq-sched.h: At top level:
>> block/blk-mq-sched.h:27:55: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
      27 | int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
         |                                                       ^~~~~~~~~~~~~
   block/blk-mq-sched.h: In function 'blk_mq_sched_allow_merge':
   block/blk-mq-sched.h:47:19: error: invalid use of undefined type 'struct elevator_queue'
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


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
