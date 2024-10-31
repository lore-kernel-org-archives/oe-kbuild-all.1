Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6D413A865
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400706; cv=none; b=Fh3UX6G629BP5XGGFa5hmuoYWM6kA81bDadEFGpSyTfWBvSH3G5hJezUt7gimk+39rnPqoXjH8UzaM3cqXPOSscOKT3Cmwn7s4XaFDFKmGebmgcIHSpBHl5YumHys4ZfxVnYK8DyhJbjucDy7zjxLUuYkiNWVjtZW7fQ5ZB7ShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400706; c=relaxed/simple;
	bh=fPQ5cszXHFscvs0yYnJxyfXZTjHugGioNN2lk+zcCu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmXUs5KDsAUMLhMUUaSg/9o1N1gqgbfuYD7K6jKLp6ehmLfhetBKzQtUQSvfV9IxnHuvrfap5PN9+swKwMnY8o53890V28y5iafo6y6J3zUS6ZPXnkXZFLoKDMa5FiX1wMjbIFMSKNb7epiaBtlkBr64453D+BxDRFuDS/prIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1Q4vDM8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1Q4vDM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730400704; x=1761936704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPQ5cszXHFscvs0yYnJxyfXZTjHugGioNN2lk+zcCu4=;
  b=M1Q4vDM8agugJOn+Q3z6KbIBXyNmcskHrseStLLY0CHYShq3FCQ0lZAy
   nKJ1PXIjJqQDOWsyOERCXDcV/iwobgSkYg22RzGLEYUxL56x7b6FOAiHW
   4u4LlHEAljqUIfXQ7hEAa888f7Pl9/OiZM5CvnwPqARMy3Uo+56SSo5g0
   DmjIKPf58fxa/odRRLUBckCOoNa9s9bibw8ZaAv81OjtWVN41R9etlAKE
   NETQs/PYVlixqDH14ekgjRhWATaYMDZERevDoTs6VTsTERIgt8u6dqAwS
   f2glnfxSoEmGAo8DuIOdOiDxn8+KDiSNjrXqxSwD0g17NNAe11Ln2AKqs
   Q==;
X-CSE-ConnectionGUID: B9yVm0hdRrWoZscyGSG0bw==
X-CSE-MsgGUID: evJe6+0IQX61EmOHL6i7uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29578666"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="29578666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:51:43 -0700
X-CSE-ConnectionGUID: iXecBGPKRE+JAHPZlrA1cA==
X-CSE-MsgGUID: FGmMh+rlQWuJezv1MkP6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87263901"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 11:51:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6aGi-000gci-1O;
	Thu, 31 Oct 2024 18:51:40 +0000
Date: Fri, 1 Nov 2024 02:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15/16]
 drivers/gpu/drm/i915/gt/intel_rps.c:2735:2: error: #error "Use of GKI
 forbidden symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202411010217.FDF5L84c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: 1e38a98e8350cd5437a2479854dc4d2ef034ddde [15/16] ANDROID: i915: Provide workaround to build i915 as vendor module
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241101/202411010217.FDF5L84c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010217.FDF5L84c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010217.FDF5L84c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_rps.c: In function 'ips_ping_for_i915_load':
>> drivers/gpu/drm/i915/gt/intel_rps.c:2735:2: error: #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
    2735 | #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
         |  ^~~~~


vim +2735 drivers/gpu/drm/i915/gt/intel_rps.c

  2717	
  2718	/*
  2719	 * Tells the intel_ips driver that the i915 driver is now loaded, if
  2720	 * IPS got loaded first.
  2721	 *
  2722	 * This awkward dance is so that neither module has to depend on the
  2723	 * other in order for IPS to do the appropriate communication of
  2724	 * GPU turbo limits to i915.
  2725	 */
  2726	static void
  2727	ips_ping_for_i915_load(void)
  2728	{
  2729	#if IS_ENABLED(CONFIG_INTEL_IPS)
  2730		/*
  2731		 * (b/352497771): GKI does not allow to build any vendor module which
  2732		 * uses symbol_get/symbol_put as symbol lookup circumvents all ABI
  2733		 * checking.
  2734		 */
> 2735	#error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
  2736		void (*link)(void);
  2737	
  2738		link = symbol_get(ips_link_to_i915_driver);
  2739		if (link) {
  2740			link();
  2741			symbol_put(ips_link_to_i915_driver);
  2742		}
  2743	#endif
  2744	}
  2745	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
