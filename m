Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372E72E9ED3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858421; cv=none; b=dvKm3emKFgZEIdKFwHHvM5pE8IraBU2ZLeReTqXg9m23VJT0bwRgkquCGakJSelvCMlNgcf7du3iZalpOiSV/q2iFSCKpgodOgBSn/G31EjNowl2czi2E9536GZWXV8SrsUF4m7qj8sUNll18+/WQy/ox2lrPpoIe5R75S3gFZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858421; c=relaxed/simple;
	bh=3sn3980IVXfFLfphdS3EBqJPJpq1/RlVKRKQ+S0oe/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EnjNNTcilplSAIavzUgJgxQTmYl18XB+JIqkXHE6Q28rgWwD/bBk3EWZlizzRSFjwjn5NoVyymRD5/AKgkTniRATOWMx/5L3QGqOVq7scI1Mf19vpuozSO6uJ8+loKcuRgfn+Rt/xyUyr5RtLv2HUCNROR28Z853CeGyoR7crwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3dWYqyj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3dWYqyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755858420; x=1787394420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sn3980IVXfFLfphdS3EBqJPJpq1/RlVKRKQ+S0oe/Y=;
  b=j3dWYqyj+CaEcYvQXsgaTNYXZLbW54gp3Ov/kJZeTXQTVjRvpL4UsOsw
   Jys/jw17Tc8t4MZOK6Nx4yubfXB3TD0XYENCNzdD73UvHwan0k9a5tZq5
   jmR5tqAZGMNQ7XAAxhg8c9HTifDTchc0SqsYJo3rnUnpBwLl74habYBhK
   yl4iTZWm8bxVnjwhcT69qe/YhqUP99Sy8/x4zsIYwmv5Ykh8Ji6C/gIDl
   G5MMKgfUW2QxIaT0frSvYWPagYOxDWNW7MtDTxmkVrETilWBLYRkMVWST
   reBho7rgk6lEfI6uFraZvISzMJTcPd7hh5B30X0dDv2NgXbarta7moSxg
   g==;
X-CSE-ConnectionGUID: s0M8mseeTq2DJR0Me7yXUQ==
X-CSE-MsgGUID: vvXrRiSdTRiI3HE46VvLJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68764115"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="68764115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:26:57 -0700
X-CSE-ConnectionGUID: a4JQPw8NQkCI7GVaJ55pFw==
X-CSE-MsgGUID: yRtNSGt+THu19a+22QgNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169039958"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Aug 2025 03:26:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upOyi-000L9v-13;
	Fri, 22 Aug 2025 10:26:36 +0000
Date: Fri, 22 Aug 2025 18:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202508221834.hekYlJqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3957a5720157264dcc41415fbec7c51c4000fc2d
commit: 506aa8b02a8d6898c64cc095d233fbae1cef8b8a dma-fence: Add safe access helpers and document the rules
date:   2 months ago
config: sh-randconfig-r132-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221834.hekYlJqU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250822/202508221834.hekYlJqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221834.hekYlJqU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1112:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1114:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1144:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1146:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *

vim +12 include/trace/events/dma_fence.h

e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  11  
f54d1867005c33 include/trace/events/dma_fence.h Chris Wilson            2016-10-25 @12  DECLARE_EVENT_CLASS(dma_fence,
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  13  
f54d1867005c33 include/trace/events/dma_fence.h Chris Wilson            2016-10-25  14  	TP_PROTO(struct dma_fence *fence),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  15  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  16  	TP_ARGS(fence),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  17  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  18  	TP_STRUCT__entry(
ecec875a6c3379 include/trace/events/dma_fence.h Tvrtko Ursulin          2025-05-15  19  		__string(driver, dma_fence_driver_name(fence))
ecec875a6c3379 include/trace/events/dma_fence.h Tvrtko Ursulin          2025-05-15  20  		__string(timeline, dma_fence_timeline_name(fence))
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  21  		__field(unsigned int, context)
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  22  		__field(unsigned int, seqno)
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  23  	),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  24  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  25  	TP_fast_assign(
2c92ca849fcc6e include/trace/events/dma_fence.h Steven Rostedt (Google  2024-05-16  26) 		__assign_str(driver);
2c92ca849fcc6e include/trace/events/dma_fence.h Steven Rostedt (Google  2024-05-16  27) 		__assign_str(timeline);
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  28  		__entry->context = fence->context;
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  29  		__entry->seqno = fence->seqno;
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  30  	),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  31  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  32  	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  33  		  __get_str(driver), __get_str(timeline), __entry->context,
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  34  		  __entry->seqno)
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  35  );
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  36  

:::::: The code at line 12 was first introduced by commit
:::::: f54d1867005c3323f5d8ad83eed823e84226c429 dma-buf: Rename struct fence to dma_fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
