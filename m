Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354215ADBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 03:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718076848; cv=none; b=C+Eta/ZbV1KtsUan2zc2JRFoOiMwA2IIkkNvriel581uTYHzAB/HyPSYoQQVorcZQYyUl1zOeeMfAmz8JB8iv8GGbKRTTfYlQxzhy59WphVPzkZDO4nU26PWT8N3LVidAAuUKno3LWsxns+mr5g9Y8EJoYwce1OXskT20dWo570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718076848; c=relaxed/simple;
	bh=vAE+07WDPxyqB81fJZN1qltLjJb9nm44MO4z0LDjGVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8eWR4wKN0m7cNQ7y8iB1C3ZxhLnG7lqHbQTcFpwczyw/ONHTJd6SyveLHsmNQTVCwQ7iT97tt7OMzygo/LEV/7y3kNCqUoayrG6CwEgfttQJK5GCi8MpDSpL/1zEbhWHB0unYc6rkqogNFQ258OTBST2WC8MeS+2+0RK0yXHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWqGlCv1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWqGlCv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718076847; x=1749612847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vAE+07WDPxyqB81fJZN1qltLjJb9nm44MO4z0LDjGVA=;
  b=UWqGlCv1t/QiyTCVV8+1g4T7ve15nlezJBSpq5QTQkTUPRo0SYzl2iG3
   lREWY9kA9m25lJyyRQIJ5ZiRx6qX9rn2E98afbkXvQ31xbQCsEabKlwpI
   Y+8olzLSTBd8nBQ9Kvhb2wD7OkKxY/atEN1lsbdn6KXqfRjDvnlr9LU3L
   7K18XUNjxJmpbKFOiGkmrUMLYnvEjhg9zrP/hYG4ho98FncEiFNLNhbzt
   s0fKLKvZmVyOCxHZc5eQkB6mLhBlqKH8dKUKA53YytUtRWfpuNQ/NAiyp
   oAsmOdh8Uk4qxRkKzgCWkBytagSrnuxBEycmhzDZzeeiTM1nWnOyL2XUC
   g==;
X-CSE-ConnectionGUID: 1KjsSWzsSk60dqE2oz+l/A==
X-CSE-MsgGUID: j8c8SGQjT6a1c9diZioYrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32250816"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32250816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 20:34:05 -0700
X-CSE-ConnectionGUID: f0fM9jTBQZ6Aw9geOot2aw==
X-CSE-MsgGUID: J8oCHSZiTxangS0ZIR9p3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39953053"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2024 20:34:03 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGsGm-0002lc-2G;
	Tue, 11 Jun 2024 03:34:00 +0000
Date: Tue, 11 Jun 2024 11:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 7/11] include/trace/events/timestamp.h:30:41:
 warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka
 'long long int *'} makes integer from pointer without a cast
Message-ID: <202406111119.O9YE4EvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   be51a9b4d34b1383cf39064988562665bed1b954
commit: 748dc0feb518a69ac526fedfc5436478d68320d3 [7/11] fs: add tracepoints around multigrain timestamp changes
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240611/202406111119.O9YE4EvH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111119.O9YE4EvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111119.O9YE4EvH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/timestamp.h:153,
                    from fs/inode.c:26:
   include/trace/events/timestamp.h: In function 'trace_raw_output_ctime_inode_update':
   include/trace/trace_events.h:203:39: error: expected expression before ')' token
     203 |         trace_event_printf(iter, print);                                \
         |                                       ^
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/events/timestamp.h:47:1: note: in expansion of macro 'TRACE_EVENT'
      47 | TRACE_EVENT(ctime_inode_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h: In function 'trace_event_raw_event_ctime_floor_update':
>> include/trace/events/timestamp.h:30:41: warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
      30 |                 __entry->old            = old;
         |                                         ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/events/timestamp.h:31:41: warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
      31 |                 __entry->new            = new;
         |                                         ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/events/timestamp.h:32:41: warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
      32 |                 __entry->cur            = cur;
         |                                         ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   include/trace/events/timestamp.h: In function 'perf_trace_ctime_floor_update':
>> include/trace/events/timestamp.h:30:41: warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
      30 |                 __entry->old            = old;
         |                                         ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/events/timestamp.h:31:41: warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
      31 |                 __entry->new            = new;
         |                                         ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/events/timestamp.h:32:41: warning: assignment to 'ktime_t' {aka 'long long int'} from 'ktime_t *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
      32 |                 __entry->cur            = cur;
         |                                         ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:27:9: note: in expansion of macro 'TP_fast_assign'
      27 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   fs/inode.c: In function 'inode_set_ctime_current':
   fs/inode.c:2618:49: warning: passing argument 2 of 'trace_ctime_floor_update' makes pointer from integer without a cast [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                 ^~~~~
         |                                                 |
         |                                                 ktime_t {aka long long int}
   In file included from include/trace/events/writeback.h:8,
                    from fs/inode.c:24:
   include/trace/events/timestamp.h:13:27: note: expected 'ktime_t *' {aka 'long long int *'} but argument is of type 'ktime_t' {aka 'long long int'}
      13 |                  ktime_t *old,
         |                  ~~~~~~~~~^~~
   include/linux/tracepoint.h:256:41: note: in definition of macro '__DECLARE_TRACE'
     256 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:12:9: note: in expansion of macro 'TP_PROTO'
      12 |         TP_PROTO(struct inode *inode,
         |         ^~~~~~~~
   fs/inode.c:2618:56: warning: passing argument 3 of 'trace_ctime_floor_update' makes pointer from integer without a cast [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                        ^~~
         |                                                        |
         |                                                        ktime_t {aka long long int}
   include/trace/events/timestamp.h:14:27: note: expected 'ktime_t *' {aka 'long long int *'} but argument is of type 'ktime_t' {aka 'long long int'}
      14 |                  ktime_t *new,
         |                  ~~~~~~~~~^~~
   include/linux/tracepoint.h:256:41: note: in definition of macro '__DECLARE_TRACE'
     256 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:12:9: note: in expansion of macro 'TP_PROTO'
      12 |         TP_PROTO(struct inode *inode,
         |         ^~~~~~~~
   fs/inode.c:2618:61: warning: passing argument 4 of 'trace_ctime_floor_update' makes pointer from integer without a cast [-Wint-conversion]


vim +30 include/trace/events/timestamp.h

    10	
    11	TRACE_EVENT(ctime_floor_update,
    12		TP_PROTO(struct inode *inode,
    13			 ktime_t *old,
    14			 ktime_t *new,
    15			 ktime_t *cur),
    16	
    17		TP_ARGS(inode, old, new, cur),
    18	
    19		TP_STRUCT__entry(
    20			__field(dev_t,				dev)
    21			__field(ino_t,				ino)
    22			__field(ktime_t,			old)
    23			__field(ktime_t,			new)
    24			__field(ktime_t,			cur)
    25		),
    26	
    27		TP_fast_assign(
    28			__entry->dev		= inode->i_sb->s_dev;
    29			__entry->ino		= inode->i_ino;
  > 30			__entry->old		= old;
    31			__entry->new		= new;
    32			__entry->cur		= cur;
    33		),
    34	
    35		TP_printk("ino=%d:%d:%lu old=%llu.%lu new=%llu.%lu cur=%llu.%lu swp=%c",
    36			MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
    37			ktime_to_timespec64(__entry->old).tv_sec,
    38			ktime_to_timespec64(__entry->old).tv_nsec,
    39			ktime_to_timespec64(__entry->new).tv_sec,
    40			ktime_to_timespec64(__entry->new).tv_nsec,
    41			ktime_to_timespec64(__entry->cur).tv_sec,
    42			ktime_to_timespec64(__entry->cur).tv_nsec,
    43			(__entry->old == __entry->cur) ? 'Y' : 'N'
    44		)
    45	);
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
