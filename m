Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E137F75E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226977; cv=none; b=mpmzmLp4Svr6NLmD9vmQ5XxIlJZsMyx/V+NBbDOen8GTkhaC/fKhXjGWHnv5POFSxuqfVvGEVHwv7fq1uiZJkd1zzYmu+nVuRD4a6cV8MYZl9p7w/0xsRtCV5XbU2ZreVcrX1AQONDAh1kqEKTT5W4LBBHyJ/030PtlrmO+ih7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226977; c=relaxed/simple;
	bh=hmc3OGSaw20XzGtI1C3ZoSA4xEJIUGCVOolgQTP+7sk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DglboQ8hbnDXmHJPbm48nb8ctPsbHHVYRn2XDVdVGryHt6OzD044vxQnJ62bjgwxe0PMNE3iFX0fvGIp/p4E5zbyiZ+hxkrzG9Z4as5eo+0Skr5GP+Lba358XTq/WvnsZxA72I6XuypHs46pyhCPhmxleLYyWPlXyzrt9cVqrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccLl5PPb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccLl5PPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778226975; x=1809762975;
  h=date:from:to:cc:subject:message-id;
  bh=hmc3OGSaw20XzGtI1C3ZoSA4xEJIUGCVOolgQTP+7sk=;
  b=ccLl5PPb7aVG/s7EUDsssenNGaeJE+HLMcUQN9S1jVAE5H1cFbMwUwNs
   q11DGzIB7Nwa+mSPBQimPudWhGzkOgRcFS9nXhKnXLs5FChNqoHwrScHb
   Ng3h4G+VzLoONmXtpOlRuDQ40Cxu4IBGZ5aa7NjNgdu9EvNFSOja7PlCl
   ri/z1CUa1TbsewxZ8tHsxk0ZKGDYVnHK3pWyhChwLdESNKWSkuQYXOVh+
   qiirtf2n2/uLF8H/bfoS+X/kemR12avx6qCx6S6sTTS7D5QZ5NQXUJ/Vx
   iEF3z5Xjx5/s52aX5XeHrTLcVWWzuMU2UnFkCBZi6Mw1LFP06JcFU2hkx
   Q==;
X-CSE-ConnectionGUID: iAk43I/YT1aQkgknqAuinA==
X-CSE-MsgGUID: VrxNPBXITuuzq7bcMX2xlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79297718"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79297718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:56:14 -0700
X-CSE-ConnectionGUID: b9cGEc23QZyO/UnD5MkaFA==
X-CSE-MsgGUID: 9bJp0r/HRoyElB7VxnYICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232168549"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2026 00:56:12 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLG4A-000000000px-14b2;
	Fri, 08 May 2026 07:56:10 +0000
Date: Fri, 08 May 2026 15:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_lt_phy.c:246:35: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202605081525.Z4gAosfh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: e1455196ada3ed892742b6b3459be7e6980a1590 drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
date:   6 months ago
config: x86_64-randconfig-121-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081525.Z4gAosfh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081525.Z4gAosfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1455196ada3 ("drm/i915/ltphy: Read PHY_VDR_0_CONFIG register")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081525.Z4gAosfh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_lt_phy.c:246:35: sparse: sparse: Using plain integer as NULL pointer

vim +246 drivers/gpu/drm/i915/display/intel_lt_phy.c

   238	
   239	void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
   240				     const struct intel_crtc_state *crtc_state)
   241	{
   242		struct intel_display *display = to_intel_display(encoder);
   243		struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
   244		bool lane_reversal = dig_port->lane_reversal;
   245		u8 owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
 > 246		intel_wakeref_t wakeref = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
