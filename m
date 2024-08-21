Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2315C157
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724220913; cv=none; b=lRr9sphZ6K39K/V9nSP0XMnI6F2/mhLfG1chIWR3Rx+WM+N0qEKDwiwwZDVYfokxNI7Au3U31O/YcBAmEffp/2dLdOlsk/WY1gfg7fU/A7efE+ZdkCDlGJE549XhE1DEvyJvpJ2ysvONsPXOXBdAd13+n1CX5GHLf0IdyIocdEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724220913; c=relaxed/simple;
	bh=Wonru8rTPj3TNxsQmynkzx4R3nzj0YM+J4jGdEI331U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbWnj1wo4MgObyF9dCC/cEf8RIAeezPUG2gNq8h9KlWzVTXvI+sOI/Y8najZAJKMVSptX0GL1EuZFnmKPF56KMuD1pqfCpVU1EMFNhJciLiDTdWRfpzapOA1fSn/i/1W5QX9EgvvEly14a92IhG48a+X7rx0ggmS2rQMLX/WKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ac7miXfY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ac7miXfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724220911; x=1755756911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wonru8rTPj3TNxsQmynkzx4R3nzj0YM+J4jGdEI331U=;
  b=ac7miXfYMbdBQ6Jg7JkSQ3AA3br0OrCFRK57PVg6QBtVxnqjjX7avuiX
   Yyqop/LLfXtOEIDUE4ywmisI1HOG+h3NS2+83OaR0vZ6QZLJQ1p9ztJX+
   LY93eAjbw9uWObzWOvFuxowKoh2CNCeyPKrBz0EkTxUV8N3pwuctZypO1
   koSUWIN16aSoCN8dsz2CbI52OpjlmY+QfhPWSNGlifxRnpGo4llcT4bjO
   0M/jIp9cgYipp7eE6gHMxviTJbwIRcY5K5MiZjNJzJqsDP3fVCiTpVh55
   9na91JecBR5WSCpPHqYFOh2Uf0YfUxVIvd2u1YMbhsOd9SOJ9Rx8BKZvA
   g==;
X-CSE-ConnectionGUID: Tsubf+IGSMuGjh7zFGHG5w==
X-CSE-MsgGUID: hsz/mJYlROSjKK6zqfn5iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22441747"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22441747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 23:15:10 -0700
X-CSE-ConnectionGUID: F8k7ya4ZSVWoG442MiPtQw==
X-CSE-MsgGUID: cGXidcG2QJazeJ21R5cwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="60704256"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 23:15:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgecd-000Axs-0j;
	Wed, 21 Aug 2024 06:15:07 +0000
Date: Wed, 21 Aug 2024 14:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 7844/7904]
 kernel/sched/psi.c:538:3: error: implicit declaration of function
 'trace_android_vh_psi_event'
Message-ID: <202408211421.pU4apODE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: b79d1815c400c3929bb78a209b6e51a38d6ffcb2 [7844/7904] ANDROID: psi: Add vendor hooks for PSI tracing
config: i386-buildonly-randconfig-002-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211421.pU4apODE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211421.pU4apODE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211421.pU4apODE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/psi.c:143:
   kernel/sched/sched.h:1420:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1420 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:538:3: error: implicit declaration of function 'trace_android_vh_psi_event' [-Werror,-Wimplicit-function-declaration]
     538 |                 trace_android_vh_psi_event(t);
         |                 ^
>> kernel/sched/psi.c:546:2: error: implicit declaration of function 'trace_android_vh_psi_group' [-Werror,-Wimplicit-function-declaration]
     546 |         trace_android_vh_psi_group(group);
         |         ^
   1 warning and 2 errors generated.


vim +/trace_android_vh_psi_event +538 kernel/sched/psi.c

   503	
   504	static u64 update_triggers(struct psi_group *group, u64 now)
   505	{
   506		struct psi_trigger *t;
   507		bool new_stall = false;
   508		u64 *total = group->total[PSI_POLL];
   509	
   510		/*
   511		 * On subsequent updates, calculate growth deltas and let
   512		 * watchers know when their specified thresholds are exceeded.
   513		 */
   514		list_for_each_entry(t, &group->triggers, node) {
   515			u64 growth;
   516	
   517			/* Check for stall activity */
   518			if (group->polling_total[t->state] == total[t->state])
   519				continue;
   520	
   521			/*
   522			 * Multiple triggers might be looking at the same state,
   523			 * remember to update group->polling_total[] once we've
   524			 * been through all of them. Also remember to extend the
   525			 * polling time if we see new stall activity.
   526			 */
   527			new_stall = true;
   528	
   529			/* Calculate growth since last update */
   530			growth = window_update(&t->win, now, total[t->state]);
   531			if (growth < t->threshold)
   532				continue;
   533	
   534			/* Limit event signaling to once per window */
   535			if (now < t->last_event_time + t->win.size)
   536				continue;
   537	
 > 538			trace_android_vh_psi_event(t);
   539	
   540			/* Generate an event */
   541			if (cmpxchg(&t->event, 0, 1) == 0)
   542				wake_up_interruptible(&t->event_wait);
   543			t->last_event_time = now;
   544		}
   545	
 > 546		trace_android_vh_psi_group(group);
   547	
   548		if (new_stall)
   549			memcpy(group->polling_total, total,
   550					sizeof(group->polling_total));
   551	
   552		return now + group->poll_min_period;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
