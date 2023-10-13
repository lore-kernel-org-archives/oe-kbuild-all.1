Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A8D307
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYjPXpWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697183727; x=1728719727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gp0EPda0TzeQs92f1komVLeRS1kADah/IA7As00d1qI=;
  b=WYjPXpWKewQupCreeTM5G0/79tmrFaYauqx2fv+3SIGWh8AI01pjMtdh
   fkvPWHwULN91dLy9SJwd56g2AXv1hrrAIKYDoYCeME/ulqQUsFX6n0dVp
   hSh9knee40APNussfsKCzwO1YrTvw58MtzSKAefWaP163r91ZSLNfCYlA
   JiwN6L6PX9YQenQH7H1V7S8Pyq2CRPnjmbOUyymeHXIRWEaxkROfSoggR
   cF1OZw8bakQeZwWuA4T8ziZIjUXK0DIGPWnU4Sqob6TCefcRtSgmf3T/M
   6IoAWpMLel5cuquRYDDpBUtDb8GR8y3YVnkTbTxut8MCAAM4NKSPeYawE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384964327"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="384964327"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 00:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898470918"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="898470918"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 00:53:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrD10-0004U9-1E;
	Fri, 13 Oct 2023 07:55:22 +0000
Date: Fri, 13 Oct 2023 15:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/3] block/blk-mq.h:281:17: error:
 'struct task_struct' has no member named 'plug'
Message-ID: <202310131513.QolmYwOO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   d677c31cb00abcb616376ca2a3bae754fb56493c
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [2/3] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: x86_64-buildonly-randconfig-006-20230824 (https://download.01.org/0day-ci/archive/20231013/202310131513.QolmYwOO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131513.QolmYwOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131513.QolmYwOO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-mq.h:6:0,
                    from block/blk.h:11,
                    from block/vendor_hooks.c:6:
   block/blk-mq-tag.h:42:43: warning: 'struct blk_mq_alloc_data' declared inside parameter list will not be visible outside of this definition or declaration
    extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
                                              ^~~~~~~~~~~~~~~~~
   In file included from block/blk.h:11:0,
                    from block/vendor_hooks.c:6:
   block/blk-mq.h: In function 'blk_mq_plug':
>> block/blk-mq.h:281:17: error: 'struct task_struct' has no member named 'plug'
      return current->plug;
                    ^~
   In file included from block/blk.h:12:0,
                    from block/vendor_hooks.c:6:
   block/blk-mq-sched.h: At top level:
   block/blk-mq-sched.h:27:55: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
    int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
                                                          ^~~~~~~~~~~~~
   block/blk-mq-sched.h: In function 'blk_mq_sched_allow_merge':
>> block/blk-mq-sched.h:47:12: error: dereferencing pointer to incomplete type 'struct elevator_queue'
     if (e && e->type->ops.allow_merge)
               ^~
   In file included from block/vendor_hooks.c:6:0:
   block/blk.h: At top level:
   block/blk.h:206:17: warning: 'struct elevator_type' declared inside parameter list will not be visible outside of this definition or declaration
             struct elevator_type *new_e);
                    ^~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102:0,
                    from include/trace/hooks/block.h:29,
                    from block/vendor_hooks.c:14:
   include/trace/trace_events.h:27:23: warning: 'str__block__trace_system_name' defined but not used [-Wunused-const-variable=]
    #define __app__(x, y) str__##x##y
                          ^
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
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


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
