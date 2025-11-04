Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB11865FA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266417; cv=none; b=cuCjrg6BH0CrVOVL4p7DvLYg0fATZx/yipgFwaabiyTFOvBwA13GSUynnVsk+xWXdv2FJLPUTCmHxWZhEeNbWvV6BFFb1usfSa8zMkbq8UkbqA6DK+J20Tu63Wa0p+ylEAISNxpZaBlpQshsTye7cVxL7GzFEBVrDbpLvwChkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266417; c=relaxed/simple;
	bh=RSU6pOH3ia7H9J3yFqoXIv1A6hQJZiS9cMuW7MCascg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORglVFw6CVb7DbnsqitkXuMXEfrcJQ2YcugeEpLWNwCZq1h3eDgswlXPUGCXS6Z8rK/UqD9c903va4vjTGMgQHc6iKtONIXlF2aOGhYFjiE55NsgThEhG/nLEVmTrlu6RKzvqJw35iiKjKG34PWv5A7Gjg0WCyB0LKbYUOTb9Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YV2m5vyg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YV2m5vyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762266415; x=1793802415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSU6pOH3ia7H9J3yFqoXIv1A6hQJZiS9cMuW7MCascg=;
  b=YV2m5vygFVH6xphgnljdVsaOOtM5Mk+S2KCM1JPO/m8hPSOjkzOc0H4o
   KDewlBZDUcjXWaSIG3WioU0cc2cZY1LblfNljPEBna0BRIn618U1uu5y3
   VtHd3x4V0KJS/SWZyBfhof6a4j5bjB6oVh0Z3JnmASiuO6bAfSIjR1Rb7
   ue7C9pHUNVH2M9o0SA7SeW4/a+l++8nQCslroZc348XavsqWgOvPPcX3F
   54XoQb1G5XmLMJkDSbAW8sXQHqyOqGWmZmhk8JfZNiBLdBL+fFHNyaexR
   JVVqU79t794PIfqqO8Udxmhd970YSjttra4fjnOtcUxWB++OlPEsAYC+Q
   Q==;
X-CSE-ConnectionGUID: YQZTx9OmSj+wuAinkqNlgA==
X-CSE-MsgGUID: L3bbQs+fSO+0AtRanU8R0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68016074"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="68016074"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:26:54 -0800
X-CSE-ConnectionGUID: iSok6PXxShCdiMfTqBMFVw==
X-CSE-MsgGUID: rF+xigRNR+SYFY6kOqANxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="192339246"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 06:26:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGHz2-000RTq-0F;
	Tue, 04 Nov 2025 14:26:24 +0000
Date: Tue, 4 Nov 2025 22:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/sched/cpuacct.c:417:17:
 warning: no previous prototype for 'bpf_task_ca_cpuusage'
Message-ID: <202511042208.SaUQnITn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   25097b0e8b7a08363a1cba931a5762548a3b0e16
commit: 00c32c5569d488b6c90f1695175577e35c17c21c [3098/3098] bpf-rvi: cpuacct: Add bpf_task_ca_cpuusage() kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042208.SaUQnITn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042208.SaUQnITn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042208.SaUQnITn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:61:
>> kernel/sched/cpuacct.c:417:17: warning: no previous prototype for 'bpf_task_ca_cpuusage' [-Wmissing-prototypes]
     417 | __bpf_kfunc u64 bpf_task_ca_cpuusage(struct task_struct *p)
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/cpuacct.c:424:18: warning: no previous prototype for 'bpf_cpuacct_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     424 | __bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c:102:12: warning: no previous prototype for 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^~~~~~~~~~~~~~


vim +/bpf_task_ca_cpuusage +417 kernel/sched/cpuacct.c

   416	
 > 417	__bpf_kfunc u64 bpf_task_ca_cpuusage(struct task_struct *p)
   418	{
   419		if (!p)
   420			return 0;
   421		return cpuusage_read(task_css(p, cpuacct_cgrp_id), NULL);
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
