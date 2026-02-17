Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ACA1A9F91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771306485; cv=none; b=dUK9v7cNRlCw/K6qTTCIDqivNYRPVDaKjJ90w2IAxuVqQPIOyox0dzBQ58ZLt8VLICJ9jfozsZnSUVllj20tiTdSS+OCqyHk0K07c+LsqCrm1y+K4AGi0GiC9EI57ka7+Xsom0ZNT97R0+i87uvFICiIu3xHzgjS0IVu++vdyy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771306485; c=relaxed/simple;
	bh=uAPeJ61NOyeBx4hXJP4BUjs6/JHVvjkFSXvq+2BVY2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KqU3pqRTAYn0DIs1oWhwU6ugdKs9LPI1QsMMqzWDCUosJlak1ej1uyO2hzrUfgBkyRrRENA4/lzhYAO09YkgjI9IEPKs3acWJraC40gwoegc8XsgpCutsMniNMShGJ3kO8jQalH8OYceEGR0ByH9U5Zut7KXzVciG47f3IM6bow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QK8YeMIY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QK8YeMIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771306484; x=1802842484;
  h=date:from:to:cc:subject:message-id;
  bh=uAPeJ61NOyeBx4hXJP4BUjs6/JHVvjkFSXvq+2BVY2k=;
  b=QK8YeMIYCb1qSyaIlOnJRe//Ue6Cs26PUuongSZDq2Fsy9Ip78R/uqOC
   zfY5r3N/d5Y+Wk8KrVU/AeapNuhJMLtOz5gjFZIhXU1CxbEqZJ6rHacOB
   APe5TBjQ34fHuY/8vuAN6Vu6i6NK7+l6HfVROxjOROhLkOHRi/Nt3v7yW
   TwHgXgXTuy5zfJFjIOvmwICjGKvLEeeM5JoJjA4Q6W5WQKa/wDuDqTkwq
   BsOJqjUFMCInjgvjVKsrCqZeRZOgASwuK1M6zuB9fJ64VB7oc4bsagI/5
   AXN2BipmZo+XNLGuWDoArGRDtfbNjx7jIojhMCpUgwJDschqderd6VbHI
   Q==;
X-CSE-ConnectionGUID: YoO9VEa6TcOvY7yengz5KA==
X-CSE-MsgGUID: 1XUYfAdnRn64SvqUb24sMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="74974177"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="74974177"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:34:44 -0800
X-CSE-ConnectionGUID: cOYA3fsKQDGrsdGRPKJOAw==
X-CSE-MsgGUID: fXq66dLzTOiXr79e70bT8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218320283"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2026 21:34:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsDjM-000000002mj-0bdu;
	Tue, 17 Feb 2026 05:34:40 +0000
Date: Tue, 17 Feb 2026 06:34:32 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 32/36]
 kernel/time/hrtimer.c:528:16: warning: 'hrtimer_bases_next_event_without'
 defined but not used
Message-ID: <202602170604.zdGtlv5F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: be42df4c723a190225d41865105706b35cb0e323 [32/36] hrtimer: Rework next event evaluation
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260217/202602170604.zdGtlv5F-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170604.zdGtlv5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170604.zdGtlv5F-lkp@intel.com/

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
