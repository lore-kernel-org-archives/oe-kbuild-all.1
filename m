Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8658366544
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774193989; cv=none; b=Dz/BrVlFWDblCr0zukceAeLb0gvjR7vYFPIuRmzBKYzIzo7yF5H8dittap3IywHOoW3xmLVyMcfo6pd3VUJz+mVO5BtGA+Yrv4zkjeLtO1Oo22Y7ICePl4YEkuuXnbnAuEV4NZzcKpWQZImoT5/WqMMR3azU+VxNm6LNPTxk7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774193989; c=relaxed/simple;
	bh=HVEOraYiKrVfAoFbCeCy98J07LBUj9UDYApM41himYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rS2S8HtxKZ1q0VsGOyFDtpRatGGShEkwF0wAWFLz/TWqteCv7f30t4MY39dICZZJSUvEB23O+FMFz8CC799ZKsXyewzeRmdq1SZaQ4Aelnly0fM5STECsUdC0ABFo/24aG8O53yl2F/q+At8msjt5IT1u9zFTMeb9aufPoFCqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0MNYESm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0MNYESm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774193988; x=1805729988;
  h=date:from:to:cc:subject:message-id;
  bh=HVEOraYiKrVfAoFbCeCy98J07LBUj9UDYApM41himYo=;
  b=S0MNYESmGqBWKWwvsLeNhJZ9gAJIFtGx8YcfS9wjN1CP3mivntKluS9o
   dxpNPQQk67lryQ6XWkdnd1tghyJfAsc9pRhvlNOwcEm6Hfd5koSQG8GZB
   oTE4nsxa8JShSzs+iTML+iCXB4fP3ozo9q8VfTa6l1UzmbHKHlxSaf+UW
   kucXfqbSrFaO+lfHFOUqgeI0KV+55L59nz9gkQGTPUFSNC5uVDPE6kAAy
   pjFYVmkjb5Zv6zgWCX7EpE/vVJJSvUOhUIgYfVF5kb6XmFwA/tVtyIIJ5
   bVUyM+l/XAH3xo+2Fy+8ReG18U7ARwg9b5W6NKJTiBuiEmcEPK/mVSDhg
   A==;
X-CSE-ConnectionGUID: 6gdzEzd3Seq0VStuAn3FJQ==
X-CSE-MsgGUID: JmOywJxLRnyhPkRZ1DTuTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75116397"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75116397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 08:39:47 -0700
X-CSE-ConnectionGUID: MC4yTUxZRQ2QXEIFIMHYrg==
X-CSE-MsgGUID: azZPXXNwTpeRDkB/6OwPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="224006888"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2026 08:39:46 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Ktz-000000002JJ-0QzZ;
	Sun, 22 Mar 2026 15:39:43 +0000
Date: Sun, 22 Mar 2026 23:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Chen <chen.dylane@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: kernel/events/ring_buffer.c:22:47: sparse: sparse: incorrect
 type in argument 2 (different base types)
Message-ID: <202603222340.Ikvqm7r6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
commit: c96fff391c095c11dc87dab35be72dee7d217cde perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
date:   1 year ago
config: arc-randconfig-r122-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222340.Ikvqm7r6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222340.Ikvqm7r6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222340.Ikvqm7r6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/ring_buffer.c:22:47: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int i @@     got restricted __poll_t @@
   kernel/events/ring_buffer.c:22:47: sparse:     expected int i
   kernel/events/ring_buffer.c:22:47: sparse:     got restricted __poll_t
   kernel/events/ring_buffer.c:174:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:174:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:174:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:174:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:174:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:174:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:174:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:174:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:174:14: sparse:    struct perf_buffer *

vim +22 kernel/events/ring_buffer.c

    19	
    20	static void perf_output_wakeup(struct perf_output_handle *handle)
    21	{
  > 22		atomic_set(&handle->rb->poll, EPOLLIN | EPOLLRDNORM);
    23	
    24		handle->event->pending_wakeup = 1;
    25	
    26		if (*perf_event_fasync(handle->event) && !handle->event->pending_kill)
    27			handle->event->pending_kill = POLL_IN;
    28	
    29		irq_work_queue(&handle->event->pending_irq);
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
