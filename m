Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02DF1422D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418751; cv=none; b=bTnDIJIR5YTR3UISbgqFOLMhTnIe8w2NzmrKdPcVRRnUXSrqD2HQ3WU6DwN6Mou3qQl0ZLBgS6/6P0y33p6Sb8HEfnNBCRt8EWP6TAhlUDeaBW/4DXBCmyRay/fVwa3q262Bfk+4Ue62djMYrL8D2ySka/1R5hnFfg+JGpFacSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418751; c=relaxed/simple;
	bh=UcNrkuK2BXHCzDxwfcozpXk/mzdMdxhY10JkcwwVAkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/SFMwYoikxxej8BHfeTmTmeDhX1g8MvPQ9HNQqgX1/xVbvTIvaiP9Xogh5QogbVINIBoPZOFcZ+IE88xyxuNW3FgOXWgVExUtLO0UmdkdQxwRaBAoJ8tbNPq4iY4aU2pzoBwRPAvAVkDBXI2llEJ40GyfIqQUCDbKHWnVFzYug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3CZoYFZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3CZoYFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731418749; x=1762954749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UcNrkuK2BXHCzDxwfcozpXk/mzdMdxhY10JkcwwVAkk=;
  b=n3CZoYFZAY+iWE9fl7GWDgPNs5DVGYaL8w7TPeRnSgMPtGvJfAml2622
   iu3UNUI3h3RJj0nWlgUIzmB2/DAnTlOEQhkGYo77RDGNGGeQLqZm88xuk
   1dz+Cjx8KdpxkaiOmDFLgDTBToVG91z0A+rgs/LXQRNJ53tXRL/nvFr8k
   3yWfW+j7y9wQp9moCWkRtHY0/akxglr0qUs/MDObjc0MRfFIxLbKsIXQQ
   wMKACxwzrTqBqezpo/0mOHToN5sM5F5isxwWYf3CRIHNSxBTqUNsf8FzO
   JV6nI+P2SKT5vo61ZOxytXr5VMNJ6095Z5X3i2GI7pN/KQfJr0ZkaFqYC
   A==;
X-CSE-ConnectionGUID: IU9qD/0+RV+j27fCLth6xQ==
X-CSE-MsgGUID: hlw6gPdxRmWfVMa35GniqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35185192"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="35185192"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:39:08 -0800
X-CSE-ConnectionGUID: 2g1GstnLQYCWsppvCTNDqA==
X-CSE-MsgGUID: x+q/7aN4SlWcL2iX2i6Dyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87888659"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2024 05:39:07 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAr6n-0001MT-0M;
	Tue, 12 Nov 2024 13:39:05 +0000
Date: Tue, 12 Nov 2024 21:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1290/1290]
 drivers/clocksource/arm_arch_timer.c:554:44: error:
 'hisi_161010101_read_cntvct_el0' undeclared
Message-ID: <202411122158.hK6m4BFI-lkp@intel.com>
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
head:   078e0901be705959736f37cb993768ed39658448
commit: e63b4759933f6a5c5ce6cdc1d11c7bf2201d0612 [1290/1290] arm64: arch_timer: only do cntvct workaround on VDSO path on D05
config: arm64-randconfig-002-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122158.hK6m4BFI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122158.hK6m4BFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122158.hK6m4BFI-lkp@intel.com/

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
