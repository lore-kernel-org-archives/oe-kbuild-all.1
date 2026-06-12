Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97431F998
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272489; cv=none; b=ro5OOEhaiiiIumZWkB0/e3w+Om0iCjWzpp9RTCsjZyWdtAfsNsK/uZakbLVIplZhBjyCOn1o8wNZz2Y6wx6e4hr6HjvKTuGmGZ/TMLX9sf7baoOQAjYPjG5FGfrAo7KDWS71tcynLetwbCWCLQpqbxaSoexy1CqWHLJ0BoLrgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272489; c=relaxed/simple;
	bh=btqznZVUL930RZuFmUqKU5HplrP0G6gG2QQXykVTCRA=;
	h=Date:From:Cc:Subject:Message-ID; b=kwBYHOkyEnlEDRDdS7wOzU/U6wMRwGyKDWooN578wEGCyb63rx1GTwYGK7J28w0ko3ShipfKF4Ed2Nux442flmCnfhOUL1NPcJZM1HXDpNWJCETdTCTpYmUJ05u2i+81YyiAeOkdsQ/xyiZEN86X+pRExLNZVfyug2F0G4Z8qg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlioW0cs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlioW0cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781272489; x=1812808489;
  h=date:from:cc:subject:message-id;
  bh=btqznZVUL930RZuFmUqKU5HplrP0G6gG2QQXykVTCRA=;
  b=PlioW0csWLVxBhxFqcUCQ1JEDxe7RVWpnJ5F7HD04dPsInpj9qRR5XuN
   iDSGzKx42DcrZBUFaVmhvp/EVKx/G6dZ00W8DVV4gmWBVsyqG/wusfruY
   +wZ0PhQ8oSAXmpEAC2Ii1NBWnrUgPUfTrEwqaSl0zgRD5hGJFiRtzN4s8
   gge+NyC8T0M0t/zYqfkc8tdnFFvrkrol0gUpWz5197ra0aDGP3zAUXR3l
   7njKW4jAKEltiZVrGiUGxeYUy811tJq4f1H4eyZxFAjuLC4Q+BUZkSbeo
   lWUPzFejsBYYRRVO/TvU8/6jWPcosCEb5WKN+UZftzc/vcBFHru1z7W8c
   A==;
X-CSE-ConnectionGUID: Zj0E9dW3QaOmVfGz3I6i0w==
X-CSE-MsgGUID: WGcZkD39Q760ae94LWeG+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93592711"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93592711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 06:54:48 -0700
X-CSE-ConnectionGUID: I3rNcvXFTRWVvXT6q8s/7g==
X-CSE-MsgGUID: VJkazMfhR1KdtlleWf9ASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="284934618"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2026 06:54:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY2LL-00000000OpZ-2tgK;
	Fri, 12 Jun 2026 13:54:43 +0000
Date: Fri, 12 Jun 2026 21:54:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/emt 2/2] kernel/sched/ext.c:1062:undefined
 reference to `stop_sched_class'
Message-ID: <202606122150.bpiH47vC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: e61f636cc31042b717a46f6937a2dfaf21f45c91 [2/2] sched_ext: Fix incorrect sched_class settings for per-cpu migration tasks
config: sparc64-randconfig-001-20260612 (https://download.01.org/0day-ci/archive/20260612/202606122150.bpiH47vC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122150.bpiH47vC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122150.bpiH47vC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/sched/build_policy.o: in function `scx_setscheduler_class':
>> kernel/sched/ext.c:1062:(.text+0x2b00): undefined reference to `stop_sched_class'
>> sparc64-linux-ld: kernel/sched/ext.c:1062:(.text+0x2b08): undefined reference to `stop_sched_class'


vim +1062 kernel/sched/ext.c

  1059	
  1060	static const struct sched_class *scx_setscheduler_class(struct task_struct *p)
  1061	{
> 1062		if (p->sched_class == &stop_sched_class)
  1063			return &stop_sched_class;
  1064	
  1065		return __setscheduler_class(p->policy, p->prio);
  1066	}
  1067	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
