Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494763B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxVpdxLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705175359; x=1736711359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d38lR70GMQr5xgetw7d5ucH5sce0qrHDk4EDz4gnth4=;
  b=UxVpdxLTQDBBNa3VbL1osUtjBpjbRgNCH+JBzzbzLn5xNymEE/U8bwF6
   D+fUkrSjjHcMetrhrBG69FnQXwXbuEjyUAmgpyekHJmKyrMwyJD7sLWAY
   F/wREF7SjDEZoqYF5BJ3G1i0U/J5MEWDfXTIYFgOlQbHjZXWH3A+WQg/4
   kqY/ZVl5xywypRMFzOOHkgsf6eppu/m8PUKztzoWJbME6UC6xrZtKANwJ
   +ZLI3K7/e1uiM+wzQEE18x7XhZXeggIKBzpUqMZMuA8SkyNRxuEhOdDYa
   7YvtXknc35kljjAmEKuK8wCEuMtec52rsmh23lBblIg5K5UNvCLlMld5A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6124276"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6124276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 11:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="776337295"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="776337295"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Jan 2024 11:49:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOk0H-000Arg-2r;
	Sat, 13 Jan 2024 19:49:13 +0000
Date: Sun, 14 Jan 2024 03:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15045/21544]
 drivers/clocksource/arm_arch_timer.c:554:44: error:
 'hisi_161010101_read_cntvct_el0' undeclared
Message-ID: <202401140357.jtyTq3QD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: e63b4759933f6a5c5ce6cdc1d11c7bf2201d0612 [15045/21544] arm64: arch_timer: only do cntvct workaround on VDSO path on D05
config: arm64-randconfig-002-20240112 (https://download.01.org/0day-ci/archive/20240114/202401140357.jtyTq3QD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140357.jtyTq3QD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140357.jtyTq3QD-lkp@intel.com/

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
