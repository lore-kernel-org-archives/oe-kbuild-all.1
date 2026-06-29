Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768273BA22C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732098; cv=none; b=JW1/tPsBUXZXxK0qxOkNrTIt70ijSvP/1L2s3TXw5QOYxG7T/kr4FW36/k+Mma1ZFJ0dSDjRJsJXBJmmZf+75u8LzxjbjmVC/+XFztD4coURu602BKsufwIl9vScAdepk41cLXw4zyNtJhw+EAb8ufyoQq7Kt5Wj1iMhZYgakak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732098; c=relaxed/simple;
	bh=YBz9ylnYqTqWR1RqWYspQNkvBt/uYTQmGXCJh6a9qVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gyCA8aHRHxcKOTxpJ+ZwgeUJLuuQL957ueHCFjty/jrhN1ysc6y0CgPActAaxIga2ueaOAZ0o612B3uH61nqScXHgLBmAF5C306l1G8jikPEvLj6iaFo1BYIinGi6+cTtyQYqM/nn3kSR/JYqWWBfc6syzw7mBFZM9vCdcOS230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8DODO21; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8DODO21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732097; x=1814268097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBz9ylnYqTqWR1RqWYspQNkvBt/uYTQmGXCJh6a9qVE=;
  b=N8DODO21v3zb/tzDlH9IMh8HfI/a9sSjauDhRS4AlGSkrk2gZX68faoW
   WCNvRLYpV+gO+x/b6vz3iVyBQ8KjvlyMlGIGjjqLovCFnymBL5sxuPzwd
   KUEC1k+qs2gPTWq94t4M16+ok+C2yumTtVCMblZ528B2EBSkmX2dpIVZh
   tIj28FozEPA0R74OaK/XGsRJRyYn6yNWKwb0r6fVyVZNYiomwBGKoZWWh
   gh54cKNiJjJ0dkF6AOw4EHz0P0VwKQKvzPx0jcAZ0ffox4owIPgGyXW6S
   Ic6/WADzr6l3GPIS2MN7OSstFCyyIGskAX3oBF+5cSNN+FqtX3qxse9sS
   g==;
X-CSE-ConnectionGUID: Gbtn0rTtR7O6AjAA6XJ5BA==
X-CSE-MsgGUID: sWyI4Kw/STupBH63MEv0Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="87323576"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="87323576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:19:02 -0700
X-CSE-ConnectionGUID: 80lIeK8bRt+8Si68feIpsg==
X-CSE-MsgGUID: mqNUiyU4TTygAbpVkbA6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="250865239"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Jun 2026 04:19:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weA0v-000000007L1-41ue;
	Mon, 29 Jun 2026 11:18:57 +0000
Date: Mon, 29 Jun 2026 19:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 9/11]
 kernel/time/hrtimer.c:2149:14: warning: variable 'is_aux' set but not used
Message-ID: <202606291931.QkoCi5d6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   45292308ab4c9b3eb5951d3f793871e1f0ebae44
commit: 46b428a1e7c80fd12db12abdf5443ee6afe78659 [9/11] hrtimer: Optimize auxiliary clock base condition
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260629/202606291931.QkoCi5d6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291931.QkoCi5d6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291931.QkoCi5d6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c: In function '__hrtimer_run_queues':
>> kernel/time/hrtimer.c:2149:14: warning: variable 'is_aux' set but not used [-Wunused-but-set-variable]
    2149 |         bool is_aux;
         |              ^~~~~~


vim +/is_aux +2149 kernel/time/hrtimer.c

  2143	
  2144	static void __hrtimer_run_queues(struct hrtimer_cpu_base *cpu_base, ktime_t now,
  2145					 unsigned long flags, unsigned int active_mask)
  2146	{
  2147		unsigned int active = cpu_base->active_bases & active_mask;
  2148		struct hrtimer_clock_base *base;
> 2149		bool is_aux;
  2150	
  2151		for_each_active_base(base, cpu_base, active, is_aux) {
  2152			ktime_t basenow;
  2153	
  2154			if (clockid_aux_valid(base->clockid)) {
  2155				if (!mono_conv_is_valid(base->aux_mono_conv))
  2156					continue;
  2157	
  2158				basenow = ktime_mono_to_aux(now, base->aux_mono_conv);
  2159			} else {
  2160				basenow = ktime_add(now, *base->offset);
  2161			}
  2162	
  2163			struct hrtimer *timer;
  2164	
  2165			while ((timer = clock_base_next_timer(base))) {
  2166				/*
  2167				 * The immediate goal for using the softexpires is
  2168				 * minimizing wakeups, not running timers at the
  2169				 * earliest interrupt after their soft expiration.
  2170				 * This allows us to avoid using a Priority Search
  2171				 * Tree, which can answer a stabbing query for
  2172				 * overlapping intervals and instead use the simple
  2173				 * BST we already have.
  2174				 * We don't add extra wakeups by delaying timers that
  2175				 * are right-of a not yet expired timer, because that
  2176				 * timer will have to trigger a wakeup anyway.
  2177				 */
  2178				if (basenow < hrtimer_get_softexpires(timer))
  2179					break;
  2180	
  2181				__run_hrtimer(cpu_base, base, timer, basenow, flags);
  2182				if (active_mask == HRTIMER_ACTIVE_SOFT)
  2183					hrtimer_sync_wait_running(cpu_base, flags);
  2184			}
  2185		}
  2186	}
  2187	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
