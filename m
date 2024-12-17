Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1F288A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734422718; cv=none; b=SEBxrsDf3s2rJuiBsV7Kjn8QSfCOq4Aua3OuWpgUMAHFheLAmk+/7gpMwo68lJoTedz/rBbUtVRvGaYaoZf0tP1K6OT+qgcJcO7BXAxSjmb6oYhPJ+njuwxIXD7oK4JvSJXz5HgsTbtJPYSrLyow1QCcw+AGGJQ+f1nIO4hRCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734422718; c=relaxed/simple;
	bh=NPF1EKFkhV7RKMkMOAC7tUMm6zk0Qv/ggz8PnoI9wik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PDES+FRZdPWuM93aB2yP1+Vv9GrLmX6zqq1MbGNnmNZkV33zMaiD34/nc+4d/SHE7x+WzXieQzTtOxIlCKQEyeETvRKyvecbdipd0sCChpDlI3htO1X8ZExpvim/HQmWRtns68Cqm/nOQwpFKaX/GkD6hcY+ULLZ78IAcD9L5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IT4CEp+w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IT4CEp+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734422717; x=1765958717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPF1EKFkhV7RKMkMOAC7tUMm6zk0Qv/ggz8PnoI9wik=;
  b=IT4CEp+wdJX1gChU8pXDypZqH+4mDdjqaTtQwSzKmz6J2GE0+U/WHkSv
   /tq2lfRaKfjJmEXaCqr2kXQaCIG68hCs36JccVW+PnL5pA2TRMCZdW9zl
   ta5TJX8AI0E4E9oWCWP/HeVqkKo9IbiSz3UG6IVget84B4u32O8JLi6oV
   Ytj+C6dNf2hFVdB4eJTwXZc1svoQR9zq+jG5wEMsROzBsLMMZAEpMT9ci
   6vzQcQtyCvUUurBZdQUnYZbOvpxxE0OtR7/EIhdykTG1iZfJ6LgrWJ4rv
   nWxpBzE6dYfu4aOIYFOK3gGvEzVxJCdxKoCzYN9wS3tt3M626jcTf5L01
   w==;
X-CSE-ConnectionGUID: /nTzineTRpur4tcbnBOpzw==
X-CSE-MsgGUID: EOFvLdgaTOK8SN/GYi7M7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22426514"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="22426514"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:05:16 -0800
X-CSE-ConnectionGUID: cUwHcuYdTzmAC2IJnjWzEg==
X-CSE-MsgGUID: F1k9c0EYQqSnUQWQcfvknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97342604"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2024 00:05:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSZt-000Eop-0R;
	Tue, 17 Dec 2024 08:05:13 +0000
Date: Tue, 17 Dec 2024 16:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-remove-BLK_MQ_F_SHOULD_MERGE 1/1]
 block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier
 'BLK_MQ_F_SHOULD_MERGE'
Message-ID: <202412171630.xL04h1Pd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-remove-BLK_MQ_F_SHOULD_MERGE
head:   f7a2f23f70f1770dbfda0a60b2484a7390819eef
commit: f7a2f23f70f1770dbfda0a60b2484a7390819eef [1/1] block: remove BLK_MQ_F_SHOULD_MERGE
config: arm-randconfig-001-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171630.xL04h1Pd-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171630.xL04h1Pd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171630.xL04h1Pd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier 'BLK_MQ_F_SHOULD_MERGE'
           HCTX_FLAG_NAME(SHOULD_MERGE),
           ^
   block/blk-mq-debugfs.c:182:37: note: expanded from macro 'HCTX_FLAG_NAME'
   #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
                                       ^
   <scratch space>:2:1: note: expanded from here
   BLK_MQ_F_SHOULD_MERGE
   ^
>> block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier 'BLK_MQ_F_SHOULD_MERGE'
   block/blk-mq-debugfs.c:182:37: note: expanded from macro 'HCTX_FLAG_NAME'
   #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
                                       ^
   <scratch space>:2:1: note: expanded from here
   BLK_MQ_F_SHOULD_MERGE
   ^
>> block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier 'BLK_MQ_F_SHOULD_MERGE'
   block/blk-mq-debugfs.c:182:37: note: expanded from macro 'HCTX_FLAG_NAME'
   #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
                                       ^
   <scratch space>:2:1: note: expanded from here
   BLK_MQ_F_SHOULD_MERGE
   ^
>> block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier 'BLK_MQ_F_SHOULD_MERGE'
   block/blk-mq-debugfs.c:182:37: note: expanded from macro 'HCTX_FLAG_NAME'
   #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
                                       ^
   <scratch space>:2:1: note: expanded from here
   BLK_MQ_F_SHOULD_MERGE
   ^
>> block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier 'BLK_MQ_F_SHOULD_MERGE'
   block/blk-mq-debugfs.c:182:37: note: expanded from macro 'HCTX_FLAG_NAME'
   #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
                                       ^
   <scratch space>:2:1: note: expanded from here
   BLK_MQ_F_SHOULD_MERGE
   ^
>> block/blk-mq-debugfs.c:184:2: error: use of undeclared identifier 'BLK_MQ_F_SHOULD_MERGE'
   block/blk-mq-debugfs.c:182:37: note: expanded from macro 'HCTX_FLAG_NAME'
   #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
                                       ^
   <scratch space>:2:1: note: expanded from here
   BLK_MQ_F_SHOULD_MERGE
   ^
>> block/blk-mq-debugfs.c:199:15: error: invalid application of 'sizeof' to an incomplete type 'const char *const[]'
           BUILD_BUG_ON(ARRAY_SIZE(hctx_flag_name) !=
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   block/blk-mq-debugfs.c:212:26: error: invalid application of 'sizeof' to an incomplete type 'const char *const[]'
                          hctx_flag_name, ARRAY_SIZE(hctx_flag_name));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   8 errors generated.


vim +/BLK_MQ_F_SHOULD_MERGE +184 block/blk-mq-debugfs.c

f5c0b0910ac4c1b Bart Van Assche 2017-03-30  181  
1a435111f8eb30b Omar Sandoval   2017-05-04  182  #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  183  static const char *const hctx_flag_name[] = {
1a435111f8eb30b Omar Sandoval   2017-05-04 @184  	HCTX_FLAG_NAME(SHOULD_MERGE),
51db1c37ee16615 Ming Lei        2020-08-19  185  	HCTX_FLAG_NAME(TAG_QUEUE_SHARED),
bf0beec0607db3c Ming Lei        2020-05-29  186  	HCTX_FLAG_NAME(STACKING),
02f938e9fed1681 John Garry      2021-01-08  187  	HCTX_FLAG_NAME(TAG_HCTX_SHARED),
1c83c5375e2f1bc John Garry      2024-07-19  188  	HCTX_FLAG_NAME(BLOCKING),
1c83c5375e2f1bc John Garry      2024-07-19  189  	HCTX_FLAG_NAME(NO_SCHED),
1c83c5375e2f1bc John Garry      2024-07-19  190  	HCTX_FLAG_NAME(NO_SCHED_BY_DEFAULT),
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  191  };
1a435111f8eb30b Omar Sandoval   2017-05-04  192  #undef HCTX_FLAG_NAME
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  193  
f57de23ac9019ea Omar Sandoval   2017-05-04  194  static int hctx_flags_show(void *data, struct seq_file *m)
9abb2ad21e8b9b7 Omar Sandoval   2017-01-25  195  {
f57de23ac9019ea Omar Sandoval   2017-05-04  196  	struct blk_mq_hw_ctx *hctx = data;
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  197  	const int alloc_policy = BLK_MQ_FLAG_TO_ALLOC_POLICY(hctx->flags);
9abb2ad21e8b9b7 Omar Sandoval   2017-01-25  198  
226f0f6afc3e5c8 John Garry      2024-07-19 @199  	BUILD_BUG_ON(ARRAY_SIZE(hctx_flag_name) !=
226f0f6afc3e5c8 John Garry      2024-07-19  200  			BLK_MQ_F_ALLOC_POLICY_START_BIT);
26d3bdb57ec3fa5 John Garry      2024-07-19  201  	BUILD_BUG_ON(ARRAY_SIZE(alloc_policy_name) != BLK_TAG_ALLOC_MAX);
226f0f6afc3e5c8 John Garry      2024-07-19  202  
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  203  	seq_puts(m, "alloc_policy=");
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  204  	if (alloc_policy < ARRAY_SIZE(alloc_policy_name) &&
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  205  	    alloc_policy_name[alloc_policy])
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  206  		seq_puts(m, alloc_policy_name[alloc_policy]);
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  207  	else
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  208  		seq_printf(m, "%d", alloc_policy);
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  209  	seq_puts(m, " ");
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  210  	blk_flags_show(m,
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  211  		       hctx->flags ^ BLK_ALLOC_POLICY_TO_MQ_FLAG(alloc_policy),
f5c0b0910ac4c1b Bart Van Assche 2017-03-30  212  		       hctx_flag_name, ARRAY_SIZE(hctx_flag_name));
fd07dc81850e8bf Bart Van Assche 2017-04-26  213  	seq_puts(m, "\n");
9abb2ad21e8b9b7 Omar Sandoval   2017-01-25  214  	return 0;
9abb2ad21e8b9b7 Omar Sandoval   2017-01-25  215  }
9abb2ad21e8b9b7 Omar Sandoval   2017-01-25  216  

:::::: The code at line 184 was first introduced by commit
:::::: 1a435111f8eb30b370e3891caebb1d1ca61f41ec blk-mq-debugfs: clean up flag definitions

:::::: TO: Omar Sandoval <osandov@fb.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
