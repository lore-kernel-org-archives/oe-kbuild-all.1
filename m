Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87F61DA60F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770856819; cv=none; b=S5iFrJI329FFlio5O/jQBxV8zOJlLqno2ONAJaWvJzwL3o/nKM05B6Gax1jb0vLQhK9iXCvlnt9IjcC44DCGLhcDNXEeaT7uHNXmrmA6E3IAGrcLzCQqAxfc6BhUlOyLRaMfNGOcq7TipqxenCbr/hq7HSO7nRRIP7VlbTF11KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770856819; c=relaxed/simple;
	bh=twcg141IkCZ7F2G7N0JZJv3iplcltFhF7RrdCG8+tcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eVDOQhVc0CggbdIUg7/N5uvXPnEXs326MjgLW3guczXHAnOSwnqgq0Q0/uGJwJtiy7xczttzP4rP0l+ltLVOnzoEDSrR5Ilbp8Nl1v/shLJm1N1VthPYX3vbznQ2bomqovT3OjHjSeH45Y9XK97A5EpWkwLiziacywrnAsvxy5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjfXhQVz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjfXhQVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770856817; x=1802392817;
  h=date:from:to:cc:subject:message-id;
  bh=twcg141IkCZ7F2G7N0JZJv3iplcltFhF7RrdCG8+tcU=;
  b=jjfXhQVzUPzahbEHW3by/9foODfU5pQ6XNN6um9cDp/UfkvRBJKFKI5H
   zVZ4pExIDLM/TaZwF6N4PB4ruAWaMwyEz8I+PYpogHXgwTI2Oa9KFJkj/
   2llb6sBfm2D53nkToJpQjGMpjEoQ1IRm82VMXV1IheZQFC66o8NMy07cf
   8BVV5j5nJIj5KbZ+00SgV50jXzVQl5BkMsCQ1o8Gq88qgrn56a6udcNIc
   EwvyxzdkldrOHxdy/o5+guhpMYjM6zM/Y+1d1xHpG6Tfygg8G7UY6SQ+v
   idv4SSTsK4zQnheIyCKFSz1GSBF2OLujJcGhrVquN7Z6GJ8yOdRFO8kij
   g==;
X-CSE-ConnectionGUID: mR+QGH7rTmm2YnGKZqWFJQ==
X-CSE-MsgGUID: BRzIiuAfTbKeS2Yhh55PDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71922443"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71922443"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 16:39:58 -0800
X-CSE-ConnectionGUID: eY4GVjHZReK4oZgTuc8GtQ==
X-CSE-MsgGUID: IbQkF4ylSMmzJiQ2MWWNAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216568972"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2026 16:39:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqKkM-00000000qWI-3Gpk;
	Thu, 12 Feb 2026 00:39:54 +0000
Date: Thu, 12 Feb 2026 08:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 block/blk-flush.c:484:65: sparse: sparse: incorrect type in argument 3
 (different base types)
Message-ID: <202602120805.H6iREh1B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: f76294a6557b6c99c9ca58d89232171cf693eac2 [203/203] ANDROID: add hooks into blk-flush.c for customized I/O scheduler
config: i386-randconfig-063-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120805.H6iREh1B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120805.H6iREh1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120805.H6iREh1B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-flush.c:484:65: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int flags @@     got restricted gfp_t [usertype] flags @@
   block/blk-flush.c:484:65: sparse:     expected int flags
   block/blk-flush.c:484:65: sparse:     got restricted gfp_t [usertype] flags

vim +484 block/blk-flush.c

   469	
   470	#include <trace/hooks/block.h>
   471	struct blk_flush_queue *blk_alloc_flush_queue(int node, int cmd_size,
   472						      gfp_t flags)
   473	{
   474		struct blk_flush_queue *fq;
   475		int rq_sz = sizeof(struct request);
   476		bool skip = false;
   477	
   478		fq = kzalloc_node(sizeof(*fq), flags, node);
   479		if (!fq)
   480			goto fail;
   481	
   482		spin_lock_init(&fq->mq_flush_lock);
   483	
 > 484		trace_android_vh_blk_alloc_flush_queue(&skip, cmd_size, flags, node,
   485						       fq);
   486		if (!skip) {
   487			rq_sz = round_up(rq_sz + cmd_size, cache_line_size());
   488			fq->flush_rq = kzalloc_node(rq_sz, flags, node);
   489		}
   490		if (!fq->flush_rq)
   491			goto fail_rq;
   492	
   493		INIT_LIST_HEAD(&fq->flush_queue[0]);
   494		INIT_LIST_HEAD(&fq->flush_queue[1]);
   495		INIT_LIST_HEAD(&fq->flush_data_in_flight);
   496	
   497		lockdep_register_key(&fq->key);
   498		lockdep_set_class(&fq->mq_flush_lock, &fq->key);
   499	
   500		return fq;
   501	
   502	 fail_rq:
   503		kfree(fq);
   504	 fail:
   505		return NULL;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
