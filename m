Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BB388E53
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178494; cv=none; b=UF33+LVXaSqfNVLjWLrvKnY8RxZUUGmBjXe6IqZwcuMS/fh0L69pHHvYfQ7VGVuql7CSyJPaw4Zj5/z0Y7taq3aoX2gTOotzRuFlzdciY4oWAykicpEm0iB4m58qQIhvTKcofREl6N4GVqCw218rddVSjNRS2OkU+yxs7LUIPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178494; c=relaxed/simple;
	bh=fUsffFSqFCs1YvGKuc9m9Ocoa1HFls8XDEqWwzrsmA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wqjs3Kns/BhXYZtgYCmOMyD+LomRs1ANTf2/McrwfYk/HCHPpYQJMSFwdWugr3+G/WDLLPaJUsS5cPL3Rmydy2xwa+Zf8I1rvHE6g0cBY0Ql0PDLuMek4+B2ysGu1LvTVJeMfxELyTsmKamMc0WpMYHRfOqxxYL0pNbJrHznjes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOwQ6eJB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOwQ6eJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779178492; x=1810714492;
  h=date:from:to:cc:subject:message-id;
  bh=fUsffFSqFCs1YvGKuc9m9Ocoa1HFls8XDEqWwzrsmA4=;
  b=DOwQ6eJBpNN4MrhS8h+aR+C8deNF9JismaR9LAs3XFWfMQddcW/eybYv
   6srWKu7YgMQRqXYs8kWtrUCdYA+lTCRrZYcXtTSOeHKnN4n7bcs0HsG3I
   TJMJ6giyWgV8gmdNFvSlYcpBO0SoHOWuJPXPY5S6uuCuyc0JK19qJuFKt
   UNgV15l3UKk18RsEOOo0iIm5sMNhjJ/JxPSrOpsLRnsxD1ixD+pEvZUaI
   9cZ1mAfvtqaBvDdYziSxl1t3jd60yWReKBFM6Sx6fKTZKiga5/lva5tw0
   J2Ly8pNcqIBD6uIR5Ynv624m9JMXaT5pkaXkdzCgyeu0ahP2xcT202cwx
   Q==;
X-CSE-ConnectionGUID: 9selLCPKRIOzsejRcepmaw==
X-CSE-MsgGUID: 1XrEM1lJTei09N3UQLHUTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90743713"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90743713"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:14:52 -0700
X-CSE-ConnectionGUID: ngtsb/x6S0eJ/9wpbmYmyw==
X-CSE-MsgGUID: CqAZl6bhSSamQFSfECq98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243989951"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2026 01:14:50 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPFaz-000000000hr-1Z4p;
	Tue, 19 May 2026 08:14:36 +0000
Date: Tue, 19 May 2026 16:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 162/238]
 arch/s390/kernel/perf_pai.c:381:24: warning: assignment to 'long unsigned
 int' from 'void *' makes integer from pointer without a cast
Message-ID: <202605191646.Ieq162B5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: a73bbee1928c8039c4f0308b08dff778e886649c [162/238] s390: replace get_zeroed_page() with kzalloc()
config: s390-randconfig-r053-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191646.Ieq162B5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191646.Ieq162B5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191646.Ieq162B5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/kernel/perf_pai.c: In function 'pai_event_init':
>> arch/s390/kernel/perf_pai.c:381:24: warning: assignment to 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      PAI_SAVE_AREA(event) = kzalloc(PAGE_SIZE, GFP_KERNEL);
                           ^


vim +381 arch/s390/kernel/perf_pai.c

   368	
   369	/* Might be called on different CPU than the one the event is intended for. */
   370	static int pai_event_init(struct perf_event *event, int idx)
   371	{
   372		struct perf_event_attr *a = &event->attr;
   373		int rc;
   374	
   375		/* PAI event must be valid and in supported range */
   376		rc = pai_event_valid(event, idx);
   377		if (rc)
   378			goto out;
   379		/* Get a page to store last counter values for sampling */
   380		if (a->sample_period) {
 > 381			PAI_SAVE_AREA(event) = kzalloc(PAGE_SIZE, GFP_KERNEL);
   382			if (!PAI_SAVE_AREA(event)) {
   383				rc = -ENOMEM;
   384				goto out;
   385			}
   386		}
   387	
   388		if (event->cpu >= 0)
   389			rc = pai_alloc_cpu(event, event->cpu);
   390		else
   391			rc = pai_alloc(event);
   392		if (rc) {
   393			kfree((void *)PAI_SAVE_AREA(event));
   394			goto out;
   395		}
   396	
   397		if (a->sample_period) {
   398			a->sample_period = 1;
   399			a->freq = 0;
   400			/* Register for paicrypt_sched_task() to be called */
   401			event->attach_state |= PERF_ATTACH_SCHED_CB;
   402			/* Add raw data which contain the memory mapped counters */
   403			a->sample_type |= PERF_SAMPLE_RAW;
   404			/* Turn off inheritance */
   405			a->inherit = 0;
   406		}
   407	out:
   408		return rc;
   409	}
   410	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
