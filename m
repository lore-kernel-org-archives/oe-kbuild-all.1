Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1FA5F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727013300; cv=none; b=AN13xJ16E35o4WlLpm9eWJkKLBVpry1juLK6RCBjmTccc7vgQ0FMVUmgtQd8F9mRmsvDFMaXJs7fcHHBj2kkfTHkPiu2M/c8AP4a9sCLT3MjDxrKpmN1g0Tnn0l6UvBlzcmCsDD003Fu2n9g8zB5Wduh4kmZXNiemI3zH846PL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727013300; c=relaxed/simple;
	bh=j6TcMBmuRpLdM+SXZF95JxQ3tIpNz98idP2wtftGc0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReZXrrm+uT1/JRnlDgkCSAiffrxommK2i239PwT6dJp0eax6p8C9ALP/5vkbV2vT4gdftlbfvSz8GXxxWzqVC95uvonmiSqf7X3ezti3vU1sBkH22exlxSzvWIMsooSBEpMX/dGVeJ1+L3p8arkgIaak6z77PFRzHWBE7XPqzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPbgJwJk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPbgJwJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727013298; x=1758549298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6TcMBmuRpLdM+SXZF95JxQ3tIpNz98idP2wtftGc0s=;
  b=ZPbgJwJkDtEmVFPlR9w9x6XZZvI0zVP0Dzv+bHOEWsI8yh0FJfS+1u/s
   QpfwYfaoj8r1rYJx0wvb1dHb1MrGeXdsVESw/5f+VRodVD+CT56tqAB7j
   weTpiuZJKi5uD4+JL67iGEwhL++3bdtfqTxuPvyXY+zeH0jQ7v5Ptlb9n
   GRrNTQ/4Zy858fMu9wL+qRs4l+d1cKZOoEGyTUP/lfcPwNTxpsql9YykC
   VIXxB+X4AFj5gMxUvVASpwJ//8CguYEnASZ6frwDtQEwFA46E3Ay2O0Vh
   27DZpK/k/7/iKUr/lDCqeyxG653K6Qp8IXbitMwtZNmyoOlQqUEOwynSo
   w==;
X-CSE-ConnectionGUID: oSZG/1LWQwG5ZtTnTonCfg==
X-CSE-MsgGUID: fkjEkhBFSs+hM6uzjw1DUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36628092"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36628092"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 06:54:55 -0700
X-CSE-ConnectionGUID: Nv3/NTvOSIyQMSXi/Upang==
X-CSE-MsgGUID: JTg54iWCSJuDAY4yW9wC9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71246432"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2024 06:54:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssN36-000GLa-0Y;
	Sun, 22 Sep 2024 13:54:52 +0000
Date: Sun, 22 Sep 2024 21:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15045/23728]
 drivers/clocksource/arm_arch_timer.c:554:44: error:
 'hisi_161010101_read_cntvct_el0' undeclared
Message-ID: <202409222139.Ec9hFPhJ-lkp@intel.com>
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
head:   3bbb0f885bf0f93bee0bb99c623877588ae005ee
commit: e63b4759933f6a5c5ce6cdc1d11c7bf2201d0612 [15045/23728] arm64: arch_timer: only do cntvct workaround on VDSO path on D05
config: arm64-randconfig-001-20240922 (https://download.01.org/0day-ci/archive/20240922/202409222139.Ec9hFPhJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222139.Ec9hFPhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222139.Ec9hFPhJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/arm_arch_timer.c: In function 'arch_timer_enable_workaround':
>> drivers/clocksource/arm_arch_timer.c:554:44: error: 'hisi_161010101_read_cntvct_el0' undeclared (first use in this function)
     554 |                 if (wa->read_cntvct_el0 == hisi_161010101_read_cntvct_el0) {
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:554:44: note: each undeclared identifier is reported only once for each function it appears in


vim +/hisi_161010101_read_cntvct_el0 +554 drivers/clocksource/arm_arch_timer.c

   527	
   528	static
   529	void arch_timer_enable_workaround(const struct arch_timer_erratum_workaround *wa,
   530					  bool local)
   531	{
   532		int i;
   533	
   534		if (local) {
   535			__this_cpu_write(timer_unstable_counter_workaround, wa);
   536		} else {
   537			for_each_possible_cpu(i)
   538				per_cpu(timer_unstable_counter_workaround, i) = wa;
   539		}
   540	
   541		/*
   542		 * Use the locked version, as we're called from the CPU
   543		 * hotplug framework. Otherwise, we end-up in deadlock-land.
   544		 */
   545		static_branch_enable_cpuslocked(&arch_timer_read_ool_enabled);
   546	
   547		/*
   548		 * Don't use the vdso fastpath if errata require using the
   549		 * out-of-line counter accessor. We may change our mind pretty
   550		 * late in the game (with a per-CPU erratum, for example), so
   551		 * change both the default value and the vdso itself.
   552		 */
   553		if (wa->read_cntvct_el0) {
 > 554			if (wa->read_cntvct_el0 == hisi_161010101_read_cntvct_el0) {
   555				clocksource_counter.archdata.vdso_direct = true;
   556				vdso_default = true;
   557				vdso_fix = true;
   558			} else {
   559				clocksource_counter.archdata.vdso_direct = false;
   560				vdso_default = false;
   561			}
   562		}
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
