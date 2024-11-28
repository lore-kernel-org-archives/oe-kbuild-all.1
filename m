Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE11A0B00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732799479; cv=none; b=YWaMFHC1SG4tTdC0IIHv2nfAPIs7o5dfmj2eBvJY+44YUFTYRgPUVcyC2mkDztCAUEmK59MF0dMdrNu18KeNzdS8rlONe5QqU8apLOOk7MfLN4e09JTsan5/KJ4SHy3Sx8Ic+VyI941y1dvyw+qgFwQSWRKX66zAMzAEEMqBUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732799479; c=relaxed/simple;
	bh=sWN6+fq4uh1vUzjoCZSr+zX/IbURrvQ26GQng4cI8sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzVbziAiVcx2HJ9sF7gFwIaio/3UtvIZM54qUbdMHnyXLyJvLgDXivUwiMVySpwZHcEW49rCwQQjJ6ULFP+pm3i05ffuKRw4r4Zi9UUrzDen26CQGqiaswZ1n9SBZNEPsznujhHv5YWpJi0fPtEJ84PgjafrB/3VW9ylP3cvE+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myEW6Emk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myEW6Emk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732799478; x=1764335478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWN6+fq4uh1vUzjoCZSr+zX/IbURrvQ26GQng4cI8sw=;
  b=myEW6EmkaRjWUANtQyKqGQnAit4HuUnaCWW78/CT6/oou+L8JdiLhlDH
   3OlgXgIIs4Nw76a97TFUHQvm7d+SuwMnS3hGDnn/omcKyZFF6jxlcIaAf
   ZE2kZL/9gAjPpnOLIqUy/mh3OhqabYFaEDiIltlzvNA4EU2RI93qzwflD
   chXCaAzA511tvNBgiuMsFG1Ht0PvJ4ME6/mWu4TBIPeu9ZZ8hOqNRdgEO
   LfNeq7Sfu1xfHDwN3bSZymhCO+5Dpey9j4gN3f7m2o0TS0yv666Y8h1Tb
   82TQNJLktB0Q6FinL0l1UoXp6JUSN9kM5b7BeNtkXa5012imIHN+TsWBz
   A==;
X-CSE-ConnectionGUID: kngDr8NwQmCEH2R7jk1MXw==
X-CSE-MsgGUID: EDGSLMkfRdu0Ziek0wpILA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44417157"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="44417157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 05:11:17 -0800
X-CSE-ConnectionGUID: GLN08+B+RoOnVJmBNSTX4Q==
X-CSE-MsgGUID: ZS5FvY1iRG6iOiuAfyXsiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="97192395"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2024 05:11:17 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGeIb-0009bN-37;
	Thu, 28 Nov 2024 13:11:13 +0000
Date: Thu, 28 Nov 2024 21:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315]
 arch/arm64/kernel/smp.c:1124:14: error: 'pmu_nmi_enable' undeclared; did you
 mean 'perf_pmu_enable'?
Message-ID: <202411282147.aYnkuR6v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 9f05210dfee3a2319a61302f9bfd7317b522fa96 [1315/1315] arm64: perf: add pmu_nmi_enable to control pmu nmi support
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411282147.aYnkuR6v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282147.aYnkuR6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282147.aYnkuR6v-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/smp.c:840:6: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
     840 | void arch_irq_work_raise(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:1053:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
    1053 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c: In function 'hw_nmi_get_sample_period':
>> arch/arm64/kernel/smp.c:1124:14: error: 'pmu_nmi_enable' undeclared (first use in this function); did you mean 'perf_pmu_enable'?
    1124 |         if (!pmu_nmi_enable)
         |              ^~~~~~~~~~~~~~
         |              perf_pmu_enable
   arch/arm64/kernel/smp.c:1124:14: note: each undeclared identifier is reported only once for each function it appears in
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
   arch/arm64/kernel/smp.c: In function 'hw_nmi_get_sample_period':
   arch/arm64/kernel/smp.c:1128:1: warning: control reaches end of non-void function [-Wreturn-type]
    1128 | }
         | ^


vim +1124 arch/arm64/kernel/smp.c

  1121	
  1122	u64 hw_nmi_get_sample_period(int watchdog_thresh)
  1123	{
> 1124		if (!pmu_nmi_enable)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
