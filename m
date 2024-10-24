Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA7E1F76A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729786448; cv=none; b=dKjo+fHOSdriCemnSmXiSVKFfWyhdxnHYQ8C4AQVlqlocSz/NLFtThR/f8q9DgYEz/88Wy5FBok2xmba7iVI+RBVoyQ7fe9Vr+wo7EAkUUkkl9OhmhsqTyeg4Bop6ET2ItNcdm1cvowBIf7UcQQNqZzIROD1P290/GOhVZzbyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729786448; c=relaxed/simple;
	bh=m4fV8A4YW68V3zgf+WSVwRQpoCdBTw39PKGoit+1Mfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfFmuURIsRR7wW0zoFHnAQKmfuq9TMkY89dBmxtPYmKaQkM+b1xAQ/bDwtvK3Ul+EyRCZAJuPS0vsL066pX00iKndOrxfMW4Jnqsrf35jHQWWl5H7kNVMLc3X/v0w+AXE7hMWfxJgxpfrxnyzKqd8tWIgcQrdABT2huAsYyZY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+E8OyRr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+E8OyRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729786446; x=1761322446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4fV8A4YW68V3zgf+WSVwRQpoCdBTw39PKGoit+1Mfc=;
  b=D+E8OyRraUGAKlMJXJQmeCmANr6GnSA4QHU/beXH4pdil5/zW+3C7HvA
   EXIlXzfOYHkEWYzyuQQZ4c5ixKZSc8+lZhPzhLyEGfHO0Y3iwf88wNLky
   AKLcR8YJaPspT59icHaAj+V1BNdqCEqJ1TznwIQtVslVNZFn/ii82R12W
   wVwsEK6sare+MKOHuGq/cZ6WmSXK/xhv/Mj8QzYtels6vBDpQu29saH99
   9WBCrulKs/7ktfRT8VSh6acrcu2+KhUP+018q9xaUFbdgBaaQGcgC1Vxr
   ifCGtq9x9mvvXI0+XSYN+xpHM1viKDHpwOAlqNO4IP+uNO8oSiVUi4BHx
   Q==;
X-CSE-ConnectionGUID: 39jrawSJT/mII5rIQ5l0WA==
X-CSE-MsgGUID: 9Ox3hp/ES7+aX6s2EfM/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40541445"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40541445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 09:14:06 -0700
X-CSE-ConnectionGUID: S7c6529sQZqxdjoCBlcWnA==
X-CSE-MsgGUID: 5zbmAo8eQFCiT2VDjxxpqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80941083"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 09:14:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t40TK-000Wfi-1C;
	Thu, 24 Oct 2024 16:14:02 +0000
Date: Fri, 25 Oct 2024 00:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5421/23857]
 arch/arm64/kernel/smp.c:1217:14: error: 'pmu_nmi_enable' undeclared; did you
 mean 'perf_pmu_enable'?
Message-ID: <202410250017.rJYuRb99-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fc5b1a61061cb6d640f3336024fb616182ef2614
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [5421/23857] selinux: use kernel linux/socket.h for genheaders and mdp
config: arm64-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250017.rJYuRb99-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250017.rJYuRb99-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250017.rJYuRb99-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/smp.c:840:6: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
     840 | void arch_irq_work_raise(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c: In function 'hw_nmi_get_sample_period':
>> arch/arm64/kernel/smp.c:1217:14: error: 'pmu_nmi_enable' undeclared (first use in this function); did you mean 'perf_pmu_enable'?
    1217 |         if (!pmu_nmi_enable)
         |              ^~~~~~~~~~~~~~
         |              perf_pmu_enable
   arch/arm64/kernel/smp.c:1217:14: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from arch/arm64/kernel/smp.c:20:
   arch/arm64/kernel/smp.c: In function '__cpu_up':
   include/linux/printk.h:346:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     346 |         printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:169:25: note: in expansion of macro 'pr_crit'
     169 |                         pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
         |                         ^~~~~~~
   arch/arm64/kernel/smp.c:170:17: note: here
     170 |                 case CPU_STUCK_IN_KERNEL:
         |                 ^~~~


vim +1217 arch/arm64/kernel/smp.c

c17272c92d2ee1 Wei Li         2019-03-28  1212  
5bffbe2174676c Wei Li         2019-03-20  1213  u64 hw_nmi_get_sample_period(int watchdog_thresh)
5bffbe2174676c Wei Li         2019-03-20  1214  {
c17272c92d2ee1 Wei Li         2019-03-28  1215  	u64 cpu_freq;
c17272c92d2ee1 Wei Li         2019-03-28  1216  
9f05210dfee3a2 Yang Yingliang 2019-03-23 @1217  	if (!pmu_nmi_enable)

:::::: The code at line 1217 was first introduced by commit
:::::: 9f05210dfee3a2319a61302f9bfd7317b522fa96 arm64: perf: add pmu_nmi_enable to control pmu nmi support

:::::: TO: Yang Yingliang <yangyingliang@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
