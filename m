Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C62425CC4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194751; cv=none; b=CpJ61ZH7ZwYRJefCk9ho9UrN1TEvCMTQvZIw7vbbv2ZwQlyyBlq9vfYLr2AiBh3oezNiyGowVCjRRu60w1Rfd7bNOqjf/cZYQZdKHNgqw4Z8qZV4LV8SqNkZ2vPD3Bh0NDqKyw5GtbzdRSbeAMCmtiQQ/+BmwguXQiXqqVkCYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194751; c=relaxed/simple;
	bh=+CxkmQJabNpri45oIxbUGHZHBBP4UmRrVT6Ei6Y9lI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WG546lwVndrvmntbmibvfZHi4fVD/WOHvZWL7ALO4xmKGIlYV2FGAt+UmzcsfXgDt+woMTdTY/PTgNqG800Hd5iF2+tiW91264kWJC7XwawYC0361MH126SABCvxFj+5MC9Dd5om3Ic5/AD6vCO6uKq8gPEncwka0mHo8XjQQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIujpiev; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIujpiev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781194750; x=1812730750;
  h=date:from:to:cc:subject:message-id;
  bh=+CxkmQJabNpri45oIxbUGHZHBBP4UmRrVT6Ei6Y9lI0=;
  b=QIujpievlhcp9k/vBLtkwHvZnRamDoKZWg5IzAhdPjb7pX95U7tDATSa
   JB/RR3M6c0uIyhB8YsG3pIRl8E7k6IdKFpfNp0gvF2FFrbjX4nh7I75yW
   xT693wAk+V0UU+JsOssDgcEscBlK6AncNtFfOXx5VSi/yK2C3Mz0f1IK1
   arTLhjwAnjqfDN7Xxvnxa8i+YAlMaYstTl+rrMJvGsGLexvO45TjB3JqF
   Gqx/39Yj++VNRWe0yLGvBn8XSps0Pz4iIz+SSj5qTJ4Eg30VNPQuNdjEK
   +EqFbIrVdsBmPP/WF3o+DWPV/MKFWZNByzL7q/LNxUBTMPomFFz3I9rpO
   g==;
X-CSE-ConnectionGUID: rF26m0OfQYu8D4h5u/cTNw==
X-CSE-MsgGUID: nelixYgSQfSLrDXBImrWWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92579344"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92579344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:19:06 -0700
X-CSE-ConnectionGUID: nrGAadj3Qba7wD6e4w7yEA==
X-CSE-MsgGUID: vta0o+oYSce6lLjd/FJ1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="284617309"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2026 09:19:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXi7S-00000000NSS-0yQ1;
	Thu, 11 Jun 2026 16:19:02 +0000
Date: Fri, 12 Jun 2026 00:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_lt_phy.c:246:35: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202606120029.ZTaxZGeL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: e1455196ada3ed892742b6b3459be7e6980a1590 drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
date:   7 months ago
config: i386-randconfig-062-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120029.ZTaxZGeL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120029.ZTaxZGeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1455196ada3 ("drm/i915/ltphy: Read PHY_VDR_0_CONFIG register")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120029.ZTaxZGeL-lkp@intel.com/

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
