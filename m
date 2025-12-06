Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DF25392A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764999767; cv=none; b=USN2THGdoC2QCXZmFb9dXYn1bker8pkEF6KKD7PUqvBzv9cfx5D5kRMRMOMry49kf8y8aXrv4hzOIT/KNJlKqDmFF2MerLDqKZUh/Z85WsRBlxv+1I4+HThgms3t14V0V/sWREqkygiIl0wjn4NJ5gedVBIunx4VMrhFCWveDvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764999767; c=relaxed/simple;
	bh=2xqKa3aX5SWh3pU0w0Q30lhSuiODyrzdd3432bSvvVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4K134FtXMmShmbNbIS9epKrQ30fyXWaGdVPSYeU7ZEsV1rOmvKACOyZqCusvI2w+BLdwWtivblOL9el9pxcYJ0iO49tpOv4SqDBDZaixAqIyAEKrTUncdkXKdidiDzMq3xbI1fGZp9pfisgscVZ5u9KfiExtHd5BMjS4VXVfZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAmDWmOH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAmDWmOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764999765; x=1796535765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xqKa3aX5SWh3pU0w0Q30lhSuiODyrzdd3432bSvvVw=;
  b=bAmDWmOHOUjGhDysGL0H5HcFy2bqFN41JAWgXdi1H2IaJZjpcy7cPrWu
   iR+GJyj+qRiInMaou+qFc9MCzHNcOUIVpapf4UKIKCOGKsPpPOrQbGd7S
   tP2UX5S1Pxo/f4w2X3ngpB+GDO227FPqtXr//LIuejVpvbrf/ViqpCz4m
   fa60XlxVhyG4QWssJG1u4geybT2K2GB6au//AdXmMPPPbXYYwBxbxKIlI
   dyz8No9/XbbhiorZgWV1bNHzok0cLVSvNj2KHRRSH6FWe5zPfxHXe5QXS
   5cxnnFX9t0rkq7IE7jytcMf6Ven1zG5RPgCadjgpf4+1h7IanPeSqNrjs
   A==;
X-CSE-ConnectionGUID: FhwK16GqTAOajrU+GptVDQ==
X-CSE-MsgGUID: QbnnLFEMQTiFbDjs++p2Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70882499"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="70882499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:42:44 -0800
X-CSE-ConnectionGUID: WqolDFO0TTyU1+hkSPPtcQ==
X-CSE-MsgGUID: goCiw32wRFOVxyJELyE5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195100242"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 21:42:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRl42-00000000Fth-11rc;
	Sat, 06 Dec 2025 05:42:38 +0000
Date: Sat, 6 Dec 2025 13:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: "Use of GKI forbidden
 symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202512061338.JCk2XMjM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   893a821faadd92557e35d840ace1d648fe0a50e6
commit: f8833da199c243bbf9801b0eb6b36820abe8f3ec [7/7] ANDROID: [TEMP] i915: Provide workaround to build i915 as vendor module
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512061338.JCk2XMjM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061338.JCk2XMjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061338.JCk2XMjM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
    2732 | #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
         |  ^
   1 error generated.


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
