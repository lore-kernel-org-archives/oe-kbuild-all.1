Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA179B65
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258046; cv=none; b=ZceRvo3JI/nMkBiBzNDBSE/Wtj1VQihJ9KPVUqdsm0nf8j8F9a3/qaxKI3Cte8jyoFor7JGyUZziFqFvky0dEkSQ85YVLn2YHUErARNC9LVfRgg9HeoVKPiNa2gk2ybJp+pBHx192DNNpIbG2hQWeMAoxKDeGETQdyXToc21W/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258046; c=relaxed/simple;
	bh=fFQcbzjUBCQ7zX71se1gIiaV/KjYaz8agOFUvfOGx58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFANMMaizDwfO0bx9YTe0osa/jBi48V3gju8uHRfcCY4iuLl7WgelA53KGNt+msDdvOUOW/kuXvUuk2yTE0iovSUHo1gQGxbfTH+b64AoTkRvnKDK0ZqNL2tLoNUWB4+CAN31+A1wKsiyI4/2rjhxvAQb5MP/sfAqgi8XYprZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVxbbbpw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVxbbbpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710258045; x=1741794045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fFQcbzjUBCQ7zX71se1gIiaV/KjYaz8agOFUvfOGx58=;
  b=MVxbbbpwrlNfgqp9mJktPAGm51gVzZBXBnMXaWhaCoktQX+Xa2Pndwno
   klHK49vM2vOfW9MSxt/Ozihk2mPcT0g9HLBGoMBe1ktWRmPq/gwUaPJrZ
   UgBPGj3h6OL0JXAR82g9UonwjQIHo4JXRe7RRUBqcBwSpwRHeSLdh29G0
   3hsrhDa5icHpNHNvEx5zyk/J1jiMJUOH3KARjZJsgFZeTtd9E69FL+XtD
   cPex9zyfuFwd4Ese8zw8DWIOX9gjWV2Qg19VNKA4dZkLlnAl6+3mnJQXc
   nGESRKcEfYw9zhtJG2421cT4JnFePAx5WaDb9iNJH5uq/2nY5v0itfFAo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4831755"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4831755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 08:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16277372"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2024 08:40:39 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk4F2-000ALb-22;
	Tue, 12 Mar 2024 15:40:36 +0000
Date: Tue, 12 Mar 2024 23:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 280/30000] arch/arm64/kernel/smp.c:1232:5:
 warning: no previous prototype for 'hw_nmi_get_sample_period'
Message-ID: <202403122352.tvX5nEio-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fa7099066983597bd415dde5a3e416bf2bd8f7c
commit: 22a589ef7833a36ba116897ac86e671290b86f2b [280/30000] arm64: Add support for hard lockup by using pmu counter
config: arm64-randconfig-002-20240312 (https://download.01.org/0day-ci/archive/20240312/202403122352.tvX5nEio-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403122352.tvX5nEio-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403122352.tvX5nEio-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/smp.c: In function 'smp_prepare_cpus':
   arch/arm64/kernel/smp.c:786:30: error: 'cpu_madt_gicc' undeclared (first use in this function)
     786 |                         if ((cpu_madt_gicc[cpu].flags & ACPI_MADT_ENABLED))
         |                              ^~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:786:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kernel/smp.c: At top level:
   arch/arm64/kernel/smp.c:844:6: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
     844 | void arch_irq_work_raise(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:864:6: warning: no previous prototype for 'panic_smp_self_stop' [-Wmissing-prototypes]
     864 | void panic_smp_self_stop(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/smp.c:1232:5: warning: no previous prototype for 'hw_nmi_get_sample_period' [-Wmissing-prototypes]
    1232 | u64 hw_nmi_get_sample_period(int watchdog_thresh)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/hw_nmi_get_sample_period +1232 arch/arm64/kernel/smp.c

  1231	
> 1232	u64 hw_nmi_get_sample_period(int watchdog_thresh)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
