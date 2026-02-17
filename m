Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9207425A62E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293606; cv=none; b=WrCLsjKa1j/i8qndDeE/Yki1VIcBwqymv4SH3eWUk1+Kc6axJoEgjPyCdsUaE6VyMGSfkiBAk2JDv953ZXzpS+8wz7ECBh5ADV9W9SgqENKCKX8XUDR3rZ+vNh20khySUZ8HygDdoL1MUqoiBTdbZIxfCdEPhMgk9PEhAEWyB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293606; c=relaxed/simple;
	bh=/Qy7/YaGYB1dDi8kiSKFceSeyhVl5pMCXYBVxh88Feo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNSnLS4r0HPW5y8Ur2Cv3qY78VnVy2i274iKfu1JYDfETCWvOfGvu0oQtLH+yEwkW7+ipooujs8Oh6MIB5AthOknvXCHarrk6kJ6ohLmS9Pum6gGCXKrLhcz0VqmalQol53BdhrJyla/p3yF0W0bvpHKZ4Jc4bZCwdqUVjy5opU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEplDunD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEplDunD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293605; x=1802829605;
  h=date:from:to:cc:subject:message-id;
  bh=/Qy7/YaGYB1dDi8kiSKFceSeyhVl5pMCXYBVxh88Feo=;
  b=ZEplDunDdiFTPrB98VBHAS86/J8+CU57moiQ5Ia0nlhdtR0g7bSOgNBx
   fI7axwbW3R2XGQtnUpDT1dwoqLjqboGMk/tdQbElc/EneztssM261FpMh
   LkUa8Zu1o3N7/s/l83iiYD391+WjnUEERkUCN2i/EmtLDMo0RC6jdTXyB
   U4Sfl3xDZHZhcCJdVvttblFCKHGhAzBFg0PUFSIt/vGgxIAwNyF4BEwGz
   WYDnWN7qLAlSM3Zs4sOIo9mqQGdhl4aLKBQWOaYcDlipTjQmVm+XSH60f
   Vg9EYGhE5HjU1mJlcCIg0oj2y8/GMt5poJbTiyVAXzwjp6IqVHNb9vS7d
   A==;
X-CSE-ConnectionGUID: 3mYNSOAKR9WYpA2hlOy3MQ==
X-CSE-MsgGUID: LI87XZT2R+Ska9mwxGKLxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82996865"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82996865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:00:05 -0800
X-CSE-ConnectionGUID: +kQeEjs4TRejPG4smBvlgw==
X-CSE-MsgGUID: oP1zu7w/TH6M2XF3ZLrMNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217715629"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 18:00:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsANd-000000010Um-2Wze;
	Tue, 17 Feb 2026 02:00:01 +0000
Date: Tue, 17 Feb 2026 09:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 32/36]
 kernel/time/hrtimer.c:528:16: warning: 'hrtimer_bases_next_event_without'
 defined but not used
Message-ID: <202602170954.4a5Og9cA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: be42df4c723a190225d41865105706b35cb0e323 [32/36] hrtimer: Rework next event evaluation
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260217/202602170954.4a5Og9cA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170954.4a5Og9cA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170954.4a5Og9cA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/hrtimer.c:528:16: warning: 'hrtimer_bases_next_event_without' defined but not used [-Wunused-function]
     528 | static ktime_t hrtimer_bases_next_event_without(struct hrtimer_cpu_base *cpu_base,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hrtimer_bases_next_event_without +528 kernel/time/hrtimer.c

   520	
   521	#define for_each_active_base(base, cpu_base, active)		\
   522		while ((base = __next_base((cpu_base), &(active))))
   523	
   524	/*
   525	 * Same as hrtimer_bases_next_event() below, but skips the excluded timer and
   526	 * does not update cpu_base->next_timer/expires.
   527	 */
 > 528	static ktime_t hrtimer_bases_next_event_without(struct hrtimer_cpu_base *cpu_base,
   529							const struct hrtimer *exclude,
   530							unsigned int active, ktime_t expires_next)
   531	{
   532		struct hrtimer_clock_base *base;
   533		ktime_t expires;
   534	
   535		lockdep_assert_held(&cpu_base->lock);
   536	
   537		for_each_active_base(base, cpu_base, active) {
   538			expires = ktime_sub(base->expires_next, base->offset);
   539			if (expires >= expires_next)
   540				continue;
   541	
   542			/*
   543			 * If the excluded timer is the first on this base evaluate the
   544			 * next timer.
   545			 */
   546			if (unlikely(exclude == base->next_timer)) {
   547				struct timerqueue_node *next;
   548				struct hrtimer *timer;
   549	
   550				next = timerqueue_iterate_next(&base->next_timer->node);
   551				if (!next)
   552					continue;
   553	
   554				timer = container_of(next, struct hrtimer, node);
   555				expires = ktime_sub(hrtimer_get_expires(timer), base->offset);
   556				if (expires >= expires_next)
   557					continue;
   558			}
   559			expires_next = expires;
   560		}
   561		/* If base->offset changed, the result might be negative */
   562		return max(expires_next, 0);
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
