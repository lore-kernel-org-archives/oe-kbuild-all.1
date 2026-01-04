Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976D42C08CC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506226; cv=none; b=jpu8MFh6PTJOhSSrEHMMAbioZSi3zf4mj/9lEwdhiYSBmOAHhFKMC9ILseyCUaf80xxL0TFCoFZmofVVDiyVmKE06KkCyRtdzvhoPxGm8MphXFz8bncUoHsLv4oF+i63Zz6jMq/+P4uA6967FW7nPHrFgyYVgZJKUn5ev8IL9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506226; c=relaxed/simple;
	bh=TVfswDOCq03X1GAIzHY3O/dlOSMmX/zDh2IP0UkeAfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KIWZnDQySLkUV89kEitrtSfvfwF1QNUQO6cdxGGNaABvZrzXN0b6HZ6ktYL9gWBftrYvD7pF7Jy1grmmvlj6pOnQJjXG3Kwv9y0QaE5LWnwM6biru4efcctMiarwAFc2IPYpS3NncmmcrxVBzfT5Ujg2zrSvorcrwmevZpA5wrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6e5XNii; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6e5XNii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767506224; x=1799042224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVfswDOCq03X1GAIzHY3O/dlOSMmX/zDh2IP0UkeAfc=;
  b=A6e5XNiiKL0i38s92EymRZ+lZlMbdSUYPP6HBfgu2sNYPtNConTQZBN2
   jARuI1hwlbDLoQs1jn6IYUNiqdMvV0bmNsiAgRSSdy10n+qX/3kxd9+nK
   QdnyNQVKmLcDXYSZQ6hy6vptvrC0l7gPYiAY/oW49eWVyxxroJeQV6hXU
   FsEc2SWWQC6vJB5sPoEKXlMMSHcmJekak/o/YPcoAq6EfELnO+Ae0WvLM
   ygZ3bEJttKb9K2EBNYuvgXHZinofzw2SRaF8nTVecX65OuQC7NwUiO3Iq
   qunPnl92w7JfBebMJkFZt2fEO9C+HGiEa8DmbNrIl1EKc1gd1ITni/2oV
   A==;
X-CSE-ConnectionGUID: VgyDvX09SsShoJm/WdHgOA==
X-CSE-MsgGUID: uoEj+zKvSTO3cbjfRSky7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="71497835"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="71497835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 21:57:03 -0800
X-CSE-ConnectionGUID: Ql/38lsjRIabEoE/6GdX1Q==
X-CSE-MsgGUID: +essiyObTWidUrT0E/YwQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="202582364"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2026 21:57:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcH6o-000000000Ol-3sgv;
	Sun, 04 Jan 2026 05:56:58 +0000
Date: Sun, 04 Jan 2026 13:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: drivers/dma-buf/dma-fence.c:1000:38: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202601041357.4DNDupdP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aacb0a6d604ac9953b261963efe25ae7521b7c58
commit: ac364014fd812c8a2babe8f9dff8c909271a653e dma-buf: cleanup dma_fence_describe v3
date:   6 weeks ago
config: i386-randconfig-063-20260104 (https://download.01.org/0day-ci/archive/20260104/202601041357.4DNDupdP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601041357.4DNDupdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601041357.4DNDupdP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-fence.c:1000:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1000:38: sparse:     expected char const [noderef] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1000:38: sparse:     got char *
>> drivers/dma-buf/dma-fence.c:1001:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1001:36: sparse:     expected char const [noderef] __rcu *driver
   drivers/dma-buf/dma-fence.c:1001:36: sparse:     got char *
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
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
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
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *

vim +1000 drivers/dma-buf/dma-fence.c

   990	
   991	/**
   992	 * dma_fence_describe - Dump fence description into seq_file
   993	 * @fence: the fence to describe
   994	 * @seq: the seq_file to put the textual description into
   995	 *
   996	 * Dump a textual description of the fence and it's state into the seq_file.
   997	 */
   998	void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
   999	{
> 1000		const char __rcu *timeline = "";
> 1001		const char __rcu *driver = "";
  1002		const char *signaled = "";
  1003	
  1004		rcu_read_lock();
  1005	
  1006		if (!dma_fence_is_signaled(fence)) {
  1007			timeline = dma_fence_timeline_name(fence);
  1008			driver = dma_fence_driver_name(fence);
  1009			signaled = "un";
  1010		}
  1011	
  1012		seq_printf(seq, "%llu:%llu %s %s %ssignalled\n",
  1013			   fence->context, fence->seqno, timeline, driver,
  1014			   signaled);
  1015	
  1016		rcu_read_unlock();
  1017	}
  1018	EXPORT_SYMBOL(dma_fence_describe);
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
