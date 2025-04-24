Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D0288CA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515538; cv=none; b=ZAr0Ol086FJFqo+/7I6dWu5DtgEi8s1BHM+XELScXGr0lKNOAVupG2xU9/6IZ7UW9qmd5LE992j3ger0uQAKkbdvAPvUjSvUKcMq/aWh/qrlOBIA7QkShE0Sxifkact2bqcDUwtsxAp01IXeFjDWRHKR5ENWfdWpzGtmLLvnTmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515538; c=relaxed/simple;
	bh=OKhniggyjGapc12ZeTOR8fm6sjotROqrYbUpMojZeLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9qV596ur+s0FfG5RErsGV9tgQmLN2XRpnt/97w6xwJE+oRpHYuq3zaoWR5TIqY2bMfYMQyzaWaYHYSbbIBqxm9youmg2QdbL9utguGLO3wbfUb+wQGtKw2Rm28Ol4zy+zFvprJeEXtz/n596DqM+yOhcHz6vRmX4CRr0DcErqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SY2cKkSQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SY2cKkSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745515536; x=1777051536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKhniggyjGapc12ZeTOR8fm6sjotROqrYbUpMojZeLU=;
  b=SY2cKkSQSWQ7QyQCor4YmZUa5Jeda7Zdk2svNupenFeaAaNAaya7QQEX
   QaqkQqGyeG9eXau3K0vemfTRARsNx0cWbs2Fa1Nb1WejYIQcFmFAuGYX/
   7qEst3GvkCm7M48JbZKW5eAJN2uhE3eJBcd8Zm5T/S+SODdsL4L9Gmd3L
   H3N3jth4VRjGGNF/mn5vasQn0L9jFs3yulvwLyjTsys175ATdR0/vWU6J
   iWufJKc74yO6QoLz15s2/mDU2pqLwVjs06TSwbzsM0A8r+wvA1AJIZrgh
   zf4dio4x3/qOUvLAj8LrzxJn4R5hwD1YRULdEZ8GJbNrfB3fMS36hJQ7A
   w==;
X-CSE-ConnectionGUID: N5u4DZiVS7yaQHJV0WMPKQ==
X-CSE-MsgGUID: LhVdacf+TCyeKuzZU7N+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50985827"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="50985827"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:25:36 -0700
X-CSE-ConnectionGUID: OejroqNlTu+9F7Xt6s0caA==
X-CSE-MsgGUID: h7Y5TKCFSqK9KiihgUknoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="169894964"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Apr 2025 10:25:35 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u80KK-0004OH-0v;
	Thu, 24 Apr 2025 17:25:32 +0000
Date: Fri, 25 Apr 2025 01:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kan Liang <kan.liang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/urgent 3/5] arch/x86/events/core.c:757:19: error:
 static declaration of 'is_x86_event' follows non-static declaration
Message-ID: <202504250102.dkWEg7D2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   9fb2028a0e250a64c69e4a4046602fc84c212330
commit: 5d4d71ebc7377f4fa5b04d35735cdbaf43161786 [3/5] perf/x86/intel: Only check the group flag for X86 leader
config: i386-buildonly-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250102.dkWEg7D2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250102.dkWEg7D2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250102.dkWEg7D2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/core.c:757:19: error: static declaration of 'is_x86_event' follows non-static declaration
     757 | static inline int is_x86_event(struct perf_event *event)
         |                   ^~~~~~~~~~~~
   In file included from arch/x86/events/core.c:47:
   arch/x86/events/perf_event.h:113:5: note: previous declaration of 'is_x86_event' with type 'int(struct perf_event *)'
     113 | int is_x86_event(struct perf_event *event);
         |     ^~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +/is_x86_event +757 arch/x86/events/core.c

f87ad35d37fa54 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 2009-02-27  756  
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18 @757  static inline int is_x86_event(struct perf_event *event)
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18  758  {
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  759  	int i;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  760  
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  761  	if (!is_hybrid())
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18  762  		return event->pmu == &pmu;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  763  
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  764  	for (i = 0; i < x86_pmu.num_hybrid_pmus; i++) {
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  765  		if (event->pmu == &x86_pmu.hybrid_pmu[i].pmu)
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  766  			return true;
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18  767  	}
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18  768  
d9977c43bff895 arch/x86/events/core.c             Kan Liang              2021-04-12  769  	return false;
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18  770  }
1da53e023029c0 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       2010-01-18  771  

:::::: The code at line 757 was first introduced by commit
:::::: 1da53e023029c067ba1277a33038c65d6e4c99b3 perf_events, x86: Improve x86 event scheduling

:::::: TO: Stephane Eranian <eranian@google.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
