Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FB2E413
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876148; cv=none; b=e8IRA7rYn/J8p/eqhrOCwOk9QgFLbQVn9DLS4n0twXSdDEsiL2PSRiFGBkdkBCavjVWK+nOxRD2D6mXC67lJoQD08725d6qOzLgrOjSbnxeVylSudiAN0wNp0sgKlsKCqzFV3K616LW09RucgcCxx+/PsfvA3hPJHiDUS1IVesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876148; c=relaxed/simple;
	bh=HiZhdBS/gxRnMlkTGb9EfMQf7kvYbsVOmo+nCMR9DTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FwqHj0pglGbNXjKE39iCsypAaTbYWV2txCI9hJ1vvabZjwdf9cEjbN8aw9SvFTBlkv2SF6rZWUZ6AWHZSnUgwto8bVy0lAQ6QHzb5CPybnAvfn/2wRaP2D56wE7F0nfguicPz30qiKm/AGXBU8mHFUBqlWAjJ3CVQxFAi5OwIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4/Txhae; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4/Txhae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765876147; x=1797412147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HiZhdBS/gxRnMlkTGb9EfMQf7kvYbsVOmo+nCMR9DTg=;
  b=X4/TxhaefrWq2AQejtlayIddQi2oGTZRGTpPzgOscsnIiSDJ/Hd4NnkT
   gaR3joiJz2LX9MNnUXjHG+kXj2YFc2Lgyore6qHIJJyEKwSi3x2eYDzZI
   PZhiYLByomKUSxTOvWMY4tAFabhX+UrMe2JG6M7NJo5+d82DbCgVOpQsj
   +De76K49JqleWz78gqUT/wulOuY9ybfZIK1ugNmGu3XOxhA8RBbU/m6Dh
   WOymvmKx/4IcfayjPxPyJQsTdzm4hbc4nDEcUhWzMNozTFxOOydlob0R/
   uwiTESzdEzX+pBsqiYnFwajrV9k75QkgoWC28gifBx5nNR2Tn8tm7fD7O
   A==;
X-CSE-ConnectionGUID: lacrhxI4Qf2gNh9jN0GxUQ==
X-CSE-MsgGUID: xI/Sn7G0S3i0Ju0wbyYNVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67671480"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67671480"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 01:09:07 -0800
X-CSE-ConnectionGUID: JmaiAi/0S0yS4PccGord1A==
X-CSE-MsgGUID: 79OUzH4MT9a3XI0sFPN2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197713431"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 01:09:06 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVR3C-000000001Q9-1lqO;
	Tue, 16 Dec 2025 09:08:59 +0000
Date: Tue, 16 Dec 2025 17:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2]
 drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: #error "Use of GKI
 forbidden symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202512161720.f45t36hR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d988c988f0fc2f9a25a9cd9da5d96e8f8f12c84
commit: f8833da199c243bbf9801b0eb6b36820abe8f3ec [0/2] ANDROID: [TEMP] i915: Provide workaround to build i915 as vendor module
config: x86_64-randconfig-006-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161720.f45t36hR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161720.f45t36hR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161720.f45t36hR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_rps.c: In function 'ips_ping_for_i915_load':
>> drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
    2732 | #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
         |  ^~~~~


vim +2732 drivers/gpu/drm/i915/gt/intel_rps.c

  2714	
  2715	/*
  2716	 * Tells the intel_ips driver that the i915 driver is now loaded, if
  2717	 * IPS got loaded first.
  2718	 *
  2719	 * This awkward dance is so that neither module has to depend on the
  2720	 * other in order for IPS to do the appropriate communication of
  2721	 * GPU turbo limits to i915.
  2722	 */
  2723	static void
  2724	ips_ping_for_i915_load(void)
  2725	{
  2726	#if IS_ENABLED(CONFIG_INTEL_IPS)
  2727		/*
  2728		 * (b/352497771): GKI does not allow to build any vendor module which
  2729		 * uses symbol_get/symbol_put as symbol lookup circumvents all ABI
  2730		 * checking.
  2731		 */
> 2732	#error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
  2733		void (*link)(void);
  2734	
  2735		link = symbol_get(ips_link_to_i915_driver);
  2736		if (link) {
  2737			link();
  2738			symbol_put(ips_link_to_i915_driver);
  2739		}
  2740	#endif
  2741	}
  2742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
