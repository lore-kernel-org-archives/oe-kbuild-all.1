Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606DC10F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 01:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713747826; cv=none; b=qJ48hS43xXSpaqJ+5D2kvuaBWWznO53T4nDIil0XNVJHhlCHfwdcegMyZimTKajd5+3X0d/ClRQe8es78PAvK+LH0DQaVqkLoIt9l1ayDrCzFe0GIxYvJBtf43Kzw7ZXyA9ZY9O8Q5Vdn8RjZRr+ZAa/atrupnipG6uOegNBHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713747826; c=relaxed/simple;
	bh=qiPO1NHz0kbJY8bYGXm3s8yceudeGfc1yRs6U13uqo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DI7//tRc9g+Ac2pn1Z1BBbNWWh9lysNTLDZj8tDUa7X/bdOiDa8/YRavc92ZAkLHibrNtuURQfwphtlusCpFscIFXYp1qlob3sM05IQNhM/u96BGLTNAzoDgrBw6KMAm7yDKLVyeTLw3FPe2T37YoYITkFalc22osc1pvdZJwh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPOpRw9k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPOpRw9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713747824; x=1745283824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qiPO1NHz0kbJY8bYGXm3s8yceudeGfc1yRs6U13uqo4=;
  b=nPOpRw9krYUF9TGB5Ed3su7IptlppXJ4p28RBX3BM/9nkZRD1gEK/4ez
   8j7roEaWNi3MRhqEK+GoB0IXsGv1VZzgXRcxUrG5a1lTcxjORMVrlCihP
   BR5fMSzywo59pQPu0lBEE3xTG1Dfa/NnLHb0lux81wO3kMzQ6XkXzGbR1
   MSR02BCeSCCIApJ3fBD2sMJiTKzku8+nkWdVmfdnUS0J0vha6yPQq4b4D
   3PhnVV0oxsZSv6v1CcH1t8uol4u7FMrCOumMk/b/rHPxGi/SIDiA88MvP
   txxkvd3gGPQ2bmslCT2304BJ7AJymoZc+csZiltKlc1vg9LRymKdl0siY
   Q==;
X-CSE-ConnectionGUID: uMTZ/OvlTD+1zHGFozad0Q==
X-CSE-MsgGUID: mxOHaSV3SbaBiKREM2QqBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20695674"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="20695674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 18:03:44 -0700
X-CSE-ConnectionGUID: Xfuv+BONT06tgUj/p+JQOA==
X-CSE-MsgGUID: Wb0LZv9BQ0eBF1dQLIdZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="23732411"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Apr 2024 18:03:43 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryi5s-000CFG-0R;
	Mon, 22 Apr 2024 01:03:40 +0000
Date: Mon, 22 Apr 2024 09:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 27/120] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE when selected by
 DRM_I915_DEBUG
Message-ID: <202404220837.oj6VcZDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   38754b03c1e9b8458c1e6e664b00cecafb6376c3
commit: 138103e8979187d309ef9bcd5645825ed9170652 [27/120] UPSTREAM: drm/i915/dp: Add support for DP tunnel BW allocation
config: i386-kismet-CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE-CONFIG_DRM_I915_DEBUG-0-0 (https://download.01.org/0day-ci/archive/20240422/202404220837.oj6VcZDh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240422/202404220837.oj6VcZDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220837.oj6VcZDh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE when selected by DRM_I915_DEBUG
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
     Depends on [n]: HAS_IOMEM [=y] && REF_TRACKER [=n] && DRM_DISPLAY_DP_TUNNEL [=y] && DEBUG_KERNEL [=y] && EXPERT [=y]
     Selected by [y]:
     - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n] && DRM_I915_DP_TUNNEL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
