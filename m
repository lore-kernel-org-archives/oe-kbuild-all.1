Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945146;
	b=Zf7KccTqiN6arx3+F3mZw+cEWDTYN2gWYXxBCwzXHmkEqeGUg4iiJcd5qGjeCSq9vCpA
	 gf7rtiY8iTfwM4YDpMi5v5DjOkzhjzTxyGlAk1IYV/yFK3Svk9tFk/nag2bIeJyKHgk41
	 lxhipFStXAzDx5zckGq5BqSoZnjq53rSMCFZdE/gTYHt6jXpG5/wuwAQgjklKPkmKvwCW
	 /RbQwewWFL7DwXpNfO4cWJTT8J/bGJeCHCMIX/acTrfN/AfaJZdB7duV6B6eaWqqWQNFM
	 szfmIwGD6E3VMF02Svbe15INj2viZF9SVTtauLKgmyC7STKCwNZt944SHG2YZ1Xruvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945146;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SxYgFFhuexEnZKHnbi7IHk3R0sqaQuOONJDtM4BmLEI=;
	b=JojxLN6JumWIqesw9HpdKwzJ+amnsCLYlCVX2Yn0pPh+WMn9oEkETZdPO5eYfve8FDNU
	 +XuEDGp9NrILFwNsvEtAKxi3Th6Y0/2TqnHstr+wSJNzZj7Dk5txPOJKluzi8dAoW3Spk
	 SXTse6duVqt1mqWHGTLNsbvBt4VdOo0+ApPbnJ959lJP1H7OZmgU7DLB5TLH2/N371r8h
	 i26i1USkzlnbiXxQJlTtsTQ3ytXaZrmIslGxwh37Pl2IFwLo/j2u9kMaiSa2JMvKdYkLi
	 H/zKlIBtGHaVftnWttsX07MXg+fOBrnvofWytq+R4yKr+6A57hHfeaHysTpiE/AyBJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIkAzZ+1;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9B606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 06:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIkAzZ+1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793945145; x=1825481145;
  h=date:from:to:cc:subject:message-id;
  bh=loA3cmZ90MEuYpmjrmQmcTX3WPpiCrJ8D+1WIkfmMGQ=;
  b=mIkAzZ+1RR5ColB1yw7k1NG8BcrFzIhmwmgkGrI2WvOAiSbudQOVKwr3
   2VPr1BQ4gQONlku+vt4K4AVMVrbpGaX2Ryo/p4TXuOaya4nO9y3oJGvwn
   63n1EA8mL1C5vlGmlS20oC90drVItRU9w6pKlndlzkdghoh/as/ovVcLJ
   6spaC0pcHltvZC0KLHylSU36LLrYB8itNMojev7k6sKuLQCUW7o26yryc
   MuRODnd5NVIu7HIlwDVGChsAz32DTIjEngeaK4v1831GSdBiPTajC7rc0
   uk9q7yTfFa7nNAP1uvpZQLnKEhM0bXQCrH3a0Jc5yqIySAHpO2wGBgo11
   Q==;
X-CSE-ConnectionGUID: z5Kro7ECTNCos6axaOgWNg==
X-CSE-MsgGUID: 8cy8LzrIT0u7mqy6Yx5Idg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2747586"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2747586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 22:05:44 -0800
X-CSE-ConnectionGUID: 60TY2lBmST+Y57taGCAANw==
X-CSE-MsgGUID: NXVd7PvEScKv5JQpF8xHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7313798"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2026 22:05:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPD52-00000000A5n-0CIE;
	Fri, 06 Nov 2026 06:05:40 +0000
Date: Fri, 06 Nov 2026 07:05:17 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 kernel/sched/core.c:3981:2: error: implicit declaration of function
 '__do_migrate_task_rq'; did you mean '__migrate_task'?
Message-ID: <202611060725.SQ0aNff9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b835509d43ba8175031f800f12347f8e8206a471
commit: b835509d43ba8175031f800f12347f8e8206a471 [1/1] ANDROID: sched/proxy_exec: Invoke migrate_task_rq() on proxy-migration
config: arm-randconfig-r2109-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060725.SQ0aNff9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060725.SQ0aNff9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060725.SQ0aNff9-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'proxy_set_task_cpu':
>> kernel/sched/core.c:3981:2: error: implicit declaration of function '__do_migrate_task_rq'; did you mean '__migrate_task'? [-Werror=implicit-function-declaration]
    3981 |  __do_migrate_task_rq(p, cpu);
         |  ^~~~~~~~~~~~~~~~~~~~
         |  __migrate_task
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +3981 kernel/sched/core.c

  3969	
  3970	static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
  3971	{
  3972		unsigned int wake_cpu;
  3973	
  3974		/*
  3975		 * Since we are enqueuing a blocked task on a cpu it may
  3976		 * not be able to run on, preserve wake_cpu when we
  3977		 * __set_task_cpu so we can return the task to where it
  3978		 * was previously runnable.
  3979		 */
  3980		wake_cpu = p->wake_cpu;
> 3981		__do_migrate_task_rq(p, cpu);
  3982		__set_task_cpu(p, cpu);
  3983		p->wake_cpu = wake_cpu;
  3984	}
  3985	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
