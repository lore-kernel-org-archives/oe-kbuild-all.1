Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907912C11C4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 20:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764705717; cv=none; b=Q9XqJd03XqSyQnE4SU1XCYUZovIvi27EvEceB6TgttBEcqx/HJVwPYX//2q9vqSHf4xu3wuJJjIsN0bLvbU4PzvEKG8I6hYgYl3c2GEjB0zrCpS1Q123wT5fLk00QXJz6zJo00DlKLv5NBWgR18Inp3IA2b7ZMx/YSaYB3ACuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764705717; c=relaxed/simple;
	bh=tDMsaFxI3YB8BdjG7wYssbtXsD6fFyJrdmWVbLt6iVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JHa+AkJNagsVHlIQmVgSu9MUKrY3r0hbKwWjzh5hMBNvt5tBZRO5/rvPXTdV0vzUWQqsSp/EKQ7L2oIXQX8kVAXlbbhlKczWwKeFNAg3eFzgZ4K093WvR6U3vYRNMsss2ItMO1byAG6UxyHS8X3Me4I5UtZjEjrLD7pt/oMeBvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+ycch5E; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+ycch5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764705714; x=1796241714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDMsaFxI3YB8BdjG7wYssbtXsD6fFyJrdmWVbLt6iVQ=;
  b=T+ycch5EtiOiMKybnOIN7WA+Bbfopm5fV5cBtIQ2F2wJQl7ZYCSnWBvL
   Med5aduLWG4pCV8ttWISDTn1802j4zh6+R/BX9rHTq0fOPfG4oXFagQLs
   kx1N7QAxym5y0ma5MUm0d7NEZnVo8huRQdKZ+g+WejUrziwzozR6i4u71
   GAzcQDUWxp0Ipm0W6SvbhwEsBNkkMBGTb+Vp00rAX/xVaYb2n+byuLtl8
   ANodRupQ6Soj1XkuGLCPuHcCbIDy7MraYVotSR4qYgOTPQ/5n+C9putR5
   4qfsCjOR9YvDmrbM5oujSml1W/CxvsbRZv+iktNny8t4z99W8R2p2EbpU
   w==;
X-CSE-ConnectionGUID: EbtnvpDeRjmEu/hTiZG6xA==
X-CSE-MsgGUID: FKdZDvZLRQWjhZ3K6Vr9yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77373454"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="77373454"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 12:01:50 -0800
X-CSE-ConnectionGUID: DT+/TmB6TUuxroXHz9lVHg==
X-CSE-MsgGUID: M1Akr68/SLOuXHAsCI3xyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194288423"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 12:01:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQWZG-00000000AAB-1gwq;
	Tue, 02 Dec 2025 20:01:46 +0000
Date: Wed, 3 Dec 2025 04:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202512030340.h4teI6vf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f8d5f70fffe2177afcc62f02feead5827dfe8dd
commit: 506aa8b02a8d6898c64cc095d233fbae1cef8b8a dma-fence: Add safe access helpers and document the rules
date:   6 months ago
config: i386-randconfig-062-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030340.h4teI6vf-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030340.h4teI6vf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030340.h4teI6vf-lkp@intel.com/

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
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
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
