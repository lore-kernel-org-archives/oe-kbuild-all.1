Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158871EF38F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654943; cv=none; b=Ifw9cbMgkLdWB255LKxAM322XanilBWC/9jidub3j7OBsqoPSpNIfp3n0GghvozzWFeKWBOuo17XGob+ti9GafE7vt3RG+v3bFdaVeoe2WV/78UyZIJnVjDVB1IeZKCxHGeq8eBLEh0G+mZwUFOOIO8liqhNYnd6DvrG+Ly7keY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654943; c=relaxed/simple;
	bh=zC+Sslxg/1CLkq3Ix/uhQ/SKPc1nt8Oep9/oLNGHUZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lihNWUsbwk6M+uLofI5BD1PmrIS3kHCIpCAs0KCwTboSQD+LGV7GGC7jbGqSEA6oT9esJhl9E0AfnpxYPONc9urqEUll6Ra5AQXSsug6x7CQFmVXE4zGIf4WdpWCDt5FAIHBGVOwqmQDDaXSAIO//Vuums6lJSDx1amtxucdNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ij5rxFIL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ij5rxFIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747654942; x=1779190942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zC+Sslxg/1CLkq3Ix/uhQ/SKPc1nt8Oep9/oLNGHUZs=;
  b=Ij5rxFILblHXRig3naDCEJNkvwdH/CK8BKmyg1v3QDPB5NEzK+MetI8m
   KKyuV2TfVrr/NXcW/T11rC8qt/YHZDSBqiEs2iVMnlTKGPDTguReStVr+
   JAKTfN674IXXtLNdHPxVjAz950i+HdJYBNe0M6YbGOdSoROGjyNOkJoqS
   FsipL5nP/db+8c8g2p05vvEdRK5o7lpvS7WgbMPcT93ghjHtlne75az2Q
   DfXNr5NWGajomDf7caEXPJEocCZURt8PTRlrh1ai9bI6tS9d+jkL+iY5d
   gC5cpPhsNyjU4b6o/Ww3hqoOG9z/abmEItje1FVjBjOFD8TF/Nq/+UHp+
   w==;
X-CSE-ConnectionGUID: L4eonf2PTeOsUVcUWDR/Lg==
X-CSE-MsgGUID: /+PMSlTTRpmQckDceQ93UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49249772"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49249772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:42:21 -0700
X-CSE-ConnectionGUID: d1BrxyPdTJG/YNTLOlYjzQ==
X-CSE-MsgGUID: HlXCJhjlS5+kkwxOpoHn5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139245090"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 May 2025 04:42:21 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGyss-0000pD-1X;
	Mon, 19 May 2025 11:42:18 +0000
Date: Mon, 19 May 2025 19:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/gpu/drm/i915/gt/intel_rps.c:2735:2: error: #error "Use of GKI
 forbidden symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202505191916.d7v5F1dS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: 1e38a98e8350cd5437a2479854dc4d2ef034ddde [0/1] ANDROID: i915: Provide workaround to build i915 as vendor module
config: i386-buildonly-randconfig-2004-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191916.d7v5F1dS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191916.d7v5F1dS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191916.d7v5F1dS-lkp@intel.com/

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
