Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7871320A00
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470374; cv=none; b=M8C1WZd5vcEoHSh8488/WCqeP9NNxTltmjcHvr0OTsZhTL+s/nMxre5IuLaXUj6Dyt2nwlZFQ/34T4UWwC1c57QQZ8qIiIEKoesH0mrk4n6er9q83NmgbeBRnkwpQ7jSj8/XykFntrlRAiSJzZDVb0Br4i/xp5W8Ju4CJN8+nyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470374; c=relaxed/simple;
	bh=bdsKMUTm0B0wN+thyy0kwsrlE9DYjVn3O9VfPzjlWJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UG/mmEg9fB9V6XS6Qw8nYeLcHEvpVYQfISTPXE42CW2dVTSCh0umMEGT8yKVINFK5Ng6k723wBULiV9de+YpIMtVb1gipUlX+Qq14y3+x3JKGETfYvhdl3yITVngM4+U0ZCFOX8PCiSc1m+8JRWghqlGoalLQWa86QSth13Yf60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIrPOdgw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIrPOdgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781470373; x=1813006373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdsKMUTm0B0wN+thyy0kwsrlE9DYjVn3O9VfPzjlWJo=;
  b=QIrPOdgwwiBDJmmqroGJ7HbXFyCze1B+YZD5u8gTE79h87BOdHq5hEUV
   /HLZsQFIoB/xi7UQhzvbDM/vjg3+O0MJlDsec8mkRDV8qKrqdVhjLV13T
   YAVqm3CCvm1rR3c8hdvNXdxdBwH7OJ8agRBjxAo05UtJR+VSAwiJHsMsy
   M4mFIT3MWFPr8qhaAeUuJxpHfEtydGDD7xl5kzx1oj7DGQqexB7uzqLEf
   W4PszP4PjeOs3NI2n4IlubsZeUQz5ZHJR95A0TIjUndC5PCercQ18xAbu
   lZttJ4m3eb3+9e5K/MjOxcZRaGmCcRloXbW3jYUPL00zAHcp3zF3OZMKh
   A==;
X-CSE-ConnectionGUID: x5Eu87+qR6yLf7ONPAYp3g==
X-CSE-MsgGUID: HM45rBVdSEGyQkynLGTSwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93334006"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="93334006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:52:53 -0700
X-CSE-ConnectionGUID: AZ2waHU1QkOOzOf80YHnqg==
X-CSE-MsgGUID: hpJJe5HWRBOV7vQ0oumwXQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2026 13:52:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYrp2-00000000RCM-0iH5;
	Sun, 14 Jun 2026 20:52:48 +0000
Date: Mon, 15 Jun 2026 04:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 378/13763]
 include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202606150421.zV77IOQ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: e94b9f01543cc6a83538c2c2cc645a424d3015ca [378/13763] dma-fence: Fix potential tracepoint null pointer dereferences
config: x86_64-randconfig-121-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150421.zV77IOQ6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150421.zV77IOQ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150421.zV77IOQ6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1041:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1041:38: sparse:     expected char const [noderef] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1041:38: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1042:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1042:36: sparse:     expected char const [noderef] __rcu *driver
   drivers/dma-buf/dma-fence.c:1042:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
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
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
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
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:45:1: sparse: sparse: dereference of noderef expression

vim +12 include/trace/events/dma_fence.h

    11	
  > 12	DECLARE_EVENT_CLASS(dma_fence,
    13	
    14		TP_PROTO(struct dma_fence *fence),
    15	
    16		TP_ARGS(fence),
    17	
    18		TP_STRUCT__entry(
    19			__string(driver, dma_fence_driver_name(fence))
    20			__string(timeline, dma_fence_timeline_name(fence))
    21			__field(unsigned int, context)
    22			__field(unsigned int, seqno)
    23		),
    24	
    25		TP_fast_assign(
    26			__assign_str(driver);
    27			__assign_str(timeline);
    28			__entry->context = fence->context;
    29			__entry->seqno = fence->seqno;
    30		),
    31	
    32		TP_printk("driver=%s timeline=%s context=%u seqno=%u",
    33			  __get_str(driver), __get_str(timeline), __entry->context,
    34			  __entry->seqno)
    35	);
    36	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
