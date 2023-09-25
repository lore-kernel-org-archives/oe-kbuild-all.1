Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5DA2A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 01:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695604995; x=1727140995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYfADym6f2hy6zmmncjYip1QBDLVmlVDy9t4ce6SVzw=;
  b=nnZCXtohvS+mH8M7VApktG2Npr0EbJ+PK4g4blQvimnYXp02aU8CjT4p
   Wz7v5/+Cc7DP3M+CRF0+49kKrYVZahvvHm076OS6Lfxeim3P+Ti40YAjJ
   V98vwczWBhy6kgsPLK9ex9ecs0jqTmGjZLIwPfiWp1TjOT/szsmkwGs/n
   uJGyVnocfv4DGo0Ex8rBzNgQ+87zZLAZ0OrUvmIxlJ9pMKldVPh3bD2Zz
   qRcfIJnAQjXs2sME0yZv7NUirSwv4+eAxyBIw/pXgnYI6Bjg6EowEXkvf
   IHNryiKBFta0APLCJJ0yIOwkVVgo5Xa7TPQsUBYltXhLyn9Wyug9ClFlF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412075737"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="412075737"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 18:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777491324"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="777491324"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2023 18:23:11 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkaJa-0000j6-10;
	Mon, 25 Sep 2023 01:23:10 +0000
Date: Mon, 25 Sep 2023 09:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/3] block/blk-mq.h:281:31: error:
 'struct task_struct' has no member named 'plug'
Message-ID: <202309250930.ZgI1wSE8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   75f82c6a15c4188cbb32825892fc6ae3e95479f0
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [2/3] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: i386-randconfig-054-20230925 (https://download.01.org/0day-ci/archive/20230925/202309250930.ZgI1wSE8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250930.ZgI1wSE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250930.ZgI1wSE8-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
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
