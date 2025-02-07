Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F42417D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 02:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894549; cv=none; b=lV9qPDVhyeRgJMSXnMTrTWCqxXliRNYffAkv2ixXOcitC7Qigk3WK2zjx+qw5fgAcsoW+M2J7tH2CUd+xqfqoSlKJbTKXlB2kDE0qRzWz/D6TlAQkdu3UotUm2QW0ZM3hhJBjutDUzaaZlCTDuPBk8GhZRAszhoZBJNuAZFj9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894549; c=relaxed/simple;
	bh=mlMhT4N05K5CguIf0QuSN7IOj82wtEOK5XAEPWD25Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8Lc0Rl3RyBNfGlPTJv9ZewDMZv89Hapnjt+nSDxBaimcNXV86sKt+CjlXq9/fTe+R9bEAMgEiluDd19EdXJbhDpnv7l2txWMMjAIunli33NqM4U52IjPeHewK4msYDtNu/wOA21pobXh8nuqHArvF5XEhMAXus9bfRrHDTC4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXFWqHHP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXFWqHHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738894547; x=1770430547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlMhT4N05K5CguIf0QuSN7IOj82wtEOK5XAEPWD25Mw=;
  b=MXFWqHHPuz5q1alP8HiqHL1LalcPl4De7k+HFFnXMR745rj/+a6xIvjs
   7oKDAS6RRxjG8QWUi4iwjPFFLXw5CUMeGXXhK5JcpgmYGBlqMVwI86rHK
   Ps1Jlew2a/pQ+KgFg3zn/zzGCPRDI7+Dx8IGcGN9fJhk0HODkqiQX4Zwr
   5NErtDJIeacnVr7p153oGn/+045CMvOAU9jsnabvGSVwbwUVRoJAU8jz2
   SCJTRqP4qMw7HfAByFN0x24PLNb+UJJTc8mtmRIJ9gYpSUSqoY6yDPr8v
   UKxIowMvzixM3CNIs9BbsJNNvF2IbrtnuV+cRiwVVdY00IgNv48nt206m
   Q==;
X-CSE-ConnectionGUID: TeGOnmxjTV++1zkX9U/bbA==
X-CSE-MsgGUID: /1ELkuWRQxqwMyo/vgfq6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50510613"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="50510613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 18:15:46 -0800
X-CSE-ConnectionGUID: ZqiC0PZKRaSj8T2+zgkEFw==
X-CSE-MsgGUID: WYtnNFSoSSuVIOFVF66geA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116013795"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 18:15:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgDuB-000xdx-1a;
	Fri, 07 Feb 2025 02:15:43 +0000
Date: Fri, 7 Feb 2025 10:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 6/6] kernel/sched/isolation.c:256:9:
 error: implicit declaration of function 'lru_add_and_bh_lrus_drain'
Message-ID: <202502071032.ahwOfi8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   3a5b43d6075ec915d0bf17d38d15f9c75d05dc26
commit: 3a5b43d6075ec915d0bf17d38d15f9c75d05dc26 [6/6] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
config: sparc64-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071032.ahwOfi8m-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071032.ahwOfi8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071032.ahwOfi8m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:104:
   kernel/sched/isolation.c: In function 'isolated_task_work':
>> kernel/sched/isolation.c:256:9: error: implicit declaration of function 'lru_add_and_bh_lrus_drain' [-Wimplicit-function-declaration]
     256 |         lru_add_and_bh_lrus_drain();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/lru_add_and_bh_lrus_drain +256 kernel/sched/isolation.c

   252	
   253	#if defined(CONFIG_NO_HZ_FULL)
   254	static void isolated_task_work(struct callback_head *head)
   255	{
 > 256		lru_add_and_bh_lrus_drain();
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
