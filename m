Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B92213CA8D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396963; cv=none; b=uDjSdhyy7r3AQgKn226RJ/dBKe2TaR0A7hBDPX20KGztT5X7+Q3MRiQt3XfgOOz9B3ui+9GYJO4iOIa9nQ40AZdUf52+D+mesE+G48QrJHt8CZSGwRJipRtQANNzifw7bpETVGfCi2mtpgZoYhNLRBCKwVEoss++I/AB6SaSKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396963; c=relaxed/simple;
	bh=bQ++YsZ8TB4Ohh7Y/6ZCB57mbRgQuqoLLZpNQtXT0sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ffk1oJkDt3JbPrbdE3Vi6TgTK89zhXE9DhKtDQUUHRjsW1JxEaBtcZUoUBbiVxfAYW5EO3G9d43TpZ6EddYCLxNBo7ziTt2ObhUM8rH7XjKm1pENyLgNskBMo79p+UwbJGWteXXs4iFhX+Ypbs4IpQ35FrKxEIr32v4Bjoo+6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/k4vviN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/k4vviN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724396961; x=1755932961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQ++YsZ8TB4Ohh7Y/6ZCB57mbRgQuqoLLZpNQtXT0sg=;
  b=S/k4vviN0zfY4f35EgRBzMphSu2xzI9rzsikzi8NTlWasnbAb1G9tiom
   1Me//KAzL+y2Ye7zTptR8j2P5RL0qel9vyxh5HOnt21Bp6Q9W+g4gEZNm
   AAHAKh6coPAEszjAU8AqASYFTklPXhgYg0p8axKioBDl5t62aUQfkY6Ji
   QiuHiuET4N77QcumRm4KZk8TEAn5zQ0kZ4vSx+ZqtaiCdaVz6zM2nKNi/
   wMYzbenp08oBIvtq5UedaecN+YhUfqa70WXvidEnzS524/SwvrXrlwJxq
   AoWQUwk4farWv4Ms2y0z+zq87xXYMzBFOxmkcuid15ShW1bdx+qn92ky4
   g==;
X-CSE-ConnectionGUID: vnmUHjNwSbGVB8+9qQWQgw==
X-CSE-MsgGUID: DTCFSaw/Tx6/eAHqTOjWtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40362690"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="40362690"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 00:09:21 -0700
X-CSE-ConnectionGUID: WB50UADDSCOVS4yXM7Qofg==
X-CSE-MsgGUID: EzVMOMu1QyOFH79I0hAjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="92496246"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2024 00:09:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shOQA-000DYs-03;
	Fri, 23 Aug 2024 07:09:18 +0000
Date: Fri, 23 Aug 2024 15:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-random-sched 1/1] kernel/kcov.c:230:42: error:
 'X86_EFLAGS_AC' undeclared
Message-ID: <202408231534.hllYarTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-random-sched
head:   a2e8f001038652815e629351cab41bb9ae304fae
commit: a2e8f001038652815e629351cab41bb9ae304fae [1/1] kcov: add random scheduler perturbations
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240823/202408231534.hllYarTG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231534.hllYarTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231534.hllYarTG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kcov.c: In function 'random_delay':
>> kernel/kcov.c:230:42: error: 'X86_EFLAGS_AC' undeclared (first use in this function)
     230 |         if ((rnd & 0xf) == 0 && !(smap & X86_EFLAGS_AC) &&
         |                                          ^~~~~~~~~~~~~
   kernel/kcov.c:230:42: note: each undeclared identifier is reported only once for each function it appears in


vim +/X86_EFLAGS_AC +230 kernel/kcov.c

   208	
   209	static noinline notrace void random_delay(void)
   210	{
   211		struct task_struct *t = current;
   212		unsigned long long rnd;
   213		unsigned long smap;
   214	
   215		// TODO: checking SMAP just here does not seem to work for some reason.
   216		if (READ_ONCE(system_state) != SYSTEM_RUNNING ||
   217			oops_in_progress /*|| (smap_save() & X86_EFLAGS_AC)*/) {
   218			t->kcov_next_delay = 1000;
   219			return;
   220		}
   221	
   222		smap = smap_save();
   223		// TODO: shouldn't read rdtsc directly,
   224		// but we want this to be randomized even after snapshot restores.
   225		rnd = rdtsc();
   226		// TODO: should we avoid schedule() if !CONFIG_PREEMPT_RCU?
   227		// In that case rcu_preempt_depth() always returns 0
   228		// so we don't know if it's safe to resched or not.
   229		// Are there other similar cases?
 > 230		if ((rnd & 0xf) == 0 && !(smap & X86_EFLAGS_AC) &&
   231			!preempt_count() && !rcu_preempt_depth() &&
   232			!irqs_disabled() && !is_idle_task(t))
   233			schedule();
   234		else
   235			udelay(rnd & 0xfff);
   236		rnd = 1664525 * rnd + 1013904223;
   237		t->kcov_next_delay = (rnd & 0xffff) + 1;
   238		smap_restore(smap);
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
