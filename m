Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2A830F7EA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349077; cv=none; b=B3jdjRh/p0Y/o5sLhIZb4V68MDhdRmuN1C5DD3MWlX2UzLNtrQZ+iYwOlweLHhH1wYfb0iK9UJQr+a7jHCCKtdX2rnqw/YGbjgpquc9NWTbdlNp2lOR00Yn9jP1jaFaRk7eektDsd999f9kfQI+UUEHYwMhpFs5EVs1qihXvOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349077; c=relaxed/simple;
	bh=GYWfhtbvBIlMo6yBD6BpHZWN5TeYLuLnwmFplHTqVAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQxvvL2pEZRJx3P3WPRzN8xwV7qsCr9VxfzMlwWRX3+C5sWc4IWufOoaApojYq1WPid3kNgNERTYxTh0j1DSw1mDXpFX9nOM5trS6pUO7Q0jKUpsV2QetZj2f8DHbrlbyG34TjE0MGXbR9gKXKfp6ApSP1jTvO6cgQpLN6R7jyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npw3yk/A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npw3yk/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349076; x=1788885076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYWfhtbvBIlMo6yBD6BpHZWN5TeYLuLnwmFplHTqVAY=;
  b=npw3yk/AWoa0PLLOIsWNSzmG9sZ/mJngbWLbzocdxpO5CFMarrpUkpQ3
   BG2lg/xskTjiGA2V5+E3K5yQQZyV1ith1Dt6+SFdUbeMNGRBuhxeKq6RO
   K7CJYW/PiRml/JfsJ6WWZGZNSklUudt7sCExd18X7lCu7inEL1Cbe3UO+
   TuR9K/wruo1PYmNbj+eOoRuE2aE2onBWnHdr2NNKSGuq52nGTPM+kjVp1
   vMBfOisbFN82jCgIR4cPUanTFs8e1vRHLjzV9v3rzbjUjlaCDmAfoXgJp
   /ShrniG/CVAjBI3v/cH7YPaLK47NI8gHFEH3eDKgJfSJ8a/4AZxzmP7VE
   Q==;
X-CSE-ConnectionGUID: RXvDPaceQ7WU9EUkNyRylA==
X-CSE-MsgGUID: jRub3B8fQQu/wGQJzNryyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63251927"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63251927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:31:15 -0700
X-CSE-ConnectionGUID: UlouMBmnTjuDrU+rcPMlGw==
X-CSE-MsgGUID: w3RfERgYRP6YZa/yds+EiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203817942"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2025 09:31:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvelr-0003yp-0v;
	Mon, 08 Sep 2025 16:31:11 +0000
Date: Tue, 9 Sep 2025 00:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Qiao <zhangqiao22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3201/3201] kernel/sched/soft_domain.c:186:10:
 error: implicit declaration of function 'cpu_util_cfs'
Message-ID: <202509090052.9gEjUjCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   082f87c04789af128a3f27914b5d9aa8c5bbe517
commit: dd6655291bf7230ef984e1d283a5ec05821f996f [3201/3201] sched: Attach task group to soft domain
config: x86_64-buildonly-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20250909/202509090052.9gEjUjCy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090052.9gEjUjCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090052.9gEjUjCy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/soft_domain.c:186:10: error: implicit declaration of function 'cpu_util_cfs' [-Werror,-Wimplicit-function-declaration]
     186 |                 sum += cpu_util_cfs(cpu_rq(cpu));
         |                        ^
   kernel/sched/soft_domain.c:186:10: note: did you mean 'cpu_util_irq'?
   kernel/sched/sched.h:3118:29: note: 'cpu_util_irq' declared here
    3118 | static inline unsigned long cpu_util_irq(struct rq *rq)
         |                             ^
   kernel/sched/soft_domain.c:269:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     269 |         int cpu;
         |             ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/cpu_util_cfs +186 kernel/sched/soft_domain.c

   179	
   180	static unsigned long sum_util(struct cpumask *mask)
   181	{
   182		unsigned long sum = 0;
   183		int cpu;
   184	
   185		for_each_cpu(cpu, mask)
 > 186			sum += cpu_util_cfs(cpu_rq(cpu));
   187	
   188		return sum;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
