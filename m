Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22442A8F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743735996; cv=none; b=e1letl1a0WTVk93w5mrB3xaG0Z4ihaHgx/f/yKwX/cjZFgigbAOIKyt/H7vmWmDnPJ9JgOaas1QbVRzllieWiJqVikr7KxBDWu/9uVHYzd6j11eVdqOrOVxrStUdpgNaixWnssiVrbru6A1YGfuqvyJJZkm70mwS7bjR9gSRU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743735996; c=relaxed/simple;
	bh=pw+YPr12/+6HTeVQJGQBeYvhUeiomqNbuOQIiZxf9ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6cESpioka6BnIaUyPLjntxXntexH3T0XFmzuPVg1Z9N8lf0yOS2u8mqsmW0eTNJpgK7yUX6opk3eaDAJ87DN2zNBput9T748ATl4dGBoymSrZVDgUWHEf3oqWmCGB+Y8J2FhFby93tr7kwPvy8izTJs34pj1+bauWgZzXUQLLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6c1r/b3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6c1r/b3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743735993; x=1775271993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pw+YPr12/+6HTeVQJGQBeYvhUeiomqNbuOQIiZxf9ew=;
  b=S6c1r/b3fqhRXxsi/kCzixYQU4fLOnKsBLVEYgrU3Z1I7yERkzsJX6bM
   wDSXkRfS6LxLXeFSONZK46ZuR6ZDOq3RoOqH5P+AYR1fBc5qNNvJmsq61
   m2TkHFRQMhs91uuSlSH87uHf0vEvzySIzBM6PxD/+h204v/OtRvZgSGEv
   LAGZug8sI9VMkjQu32/8HXFy8LM67+w83Bv7rOUjKxsr/ZMTIDc7MnRDA
   GYafThvCbPmfV7JBo0MDPLuTh1CKn5qglbYflH8u1QwdXKfHOdjD8ksj0
   C1knfWRlPVvy+5CNcp30/zVF0bAZqhRWMjq/r2iPBh6OF5kES6fUFgPAm
   Q==;
X-CSE-ConnectionGUID: nvtq47u9S2KEZogrF7VzaQ==
X-CSE-MsgGUID: drrSYMxzTVexYJS0W+INLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45344761"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45344761"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 20:06:32 -0700
X-CSE-ConnectionGUID: LNlutS7rT8S5l8QLMQYklQ==
X-CSE-MsgGUID: SJrFxTEfQ4CSZgyBr7+G7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="126971964"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2025 20:06:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0XO1-0000xD-1B;
	Fri, 04 Apr 2025 03:06:29 +0000
Date: Fri, 4 Apr 2025 11:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2024-05 17/17]
 block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202504041013.EN1N615K-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.10-2024-05
head:   2387d220c2a30a75a6b9335d405ec66cb4821617
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [17/17] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: i386-buildonly-randconfig-004-20250403 (https://download.01.org/0day-ci/archive/20250404/202504041013.EN1N615K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041013.EN1N615K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041013.EN1N615K-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
