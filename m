Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EB1D968E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737698877; cv=none; b=tzDItMTkF3Yp1icRjGqpeXRr9kIEOCCdNoMlDLZvnLIluGS/nfw17DTGkZbOR14yNU7Hr9yEM1Rf75iogci2ZkjZD728e3C6M4hwoxP1v2BJCEZaTIG6oKOMd8JBciOUtLEI5TGhTv4fRyxN/J0+sM6g3KqA0p9YZIyT+34umPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737698877; c=relaxed/simple;
	bh=4RIg8J9BwenUQVXi+xlAozRK2C+OXO+y70BivbC3jpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/7FsBh8dkEzFzrVmMS+IbwEwbeYWtB0USCmyVaJJt529nQNAXgqpjh8eZFhRoo0ankifvkBSh4IfAY9z/ffwuPFBThyVSgq54/lKNluADAGKmrCEQ8Uo/Lt9A5VDrBYUV7+IKxlN/b/mjIZkMtuxrBHS4/bBthveo7Fqbel2/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRcaSVPJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRcaSVPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737698876; x=1769234876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4RIg8J9BwenUQVXi+xlAozRK2C+OXO+y70BivbC3jpA=;
  b=KRcaSVPJfAk3OnRrLZ5j/QvVAm7u5OoZsVkdkqMRm/u/BSDhjIskBZLd
   JeP7qdBs6jg1Gkd9C/5HTAwXd/I0HzAtX2z8ni7EGxvq8vbe6pSSsifTF
   G8m5E2uChBcAIwoeFHpSaZtUcJc7bCAVwoOzqU9DHFNfu+fW/MDu6isvh
   6OS0XaFu0XZzf7AyPwzrrzXJk+AfLlpQARmT1shuHjmKiHtWSHzG2p3Le
   IyDzRbRDJSfszwohj3EjtTQ5Ywmat5ipJqP+f2HKfOApWX4lNW7yLNncl
   mec6QUZYzKy3BAANJ28hDUCEhDLSGiO6oXtT3oBr+KDv8UqZHOyhVlywV
   Q==;
X-CSE-ConnectionGUID: KnmhB09nTA2mzCeezwTUMw==
X-CSE-MsgGUID: upD0zY34TJmnsodTQ65XNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38369228"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38369228"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 22:07:56 -0800
X-CSE-ConnectionGUID: wy9R0mG1Tgq+/H5bLq0tNQ==
X-CSE-MsgGUID: DGdV/rOuQQOBUJAFRPZF9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108115795"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jan 2025 22:07:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbCrA-000cFN-0i;
	Fri, 24 Jan 2025 06:07:52 +0000
Date: Fri, 24 Jan 2025 14:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE when
 selected by DRM_I915_DEBUG
Message-ID: <202501241353.Yrh5T1GX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   347178a7b340b18dd42720734014ac33ad71e0da
commit: 1faa166c29d789b4b0d6337b95355fdc2e7422f3 [1/1] UPSTREAM: drm/i915/dp: Add support for DP tunnel BW allocation
config: i386-kismet-CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE-CONFIG_DRM_I915_DEBUG-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241353.Yrh5T1GX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241353.Yrh5T1GX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241353.Yrh5T1GX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE when selected by DRM_I915_DEBUG
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
     Depends on [n]: HAS_IOMEM [=y] && REF_TRACKER [=n] && DRM_DISPLAY_DP_TUNNEL [=y] && DEBUG_KERNEL [=y] && EXPERT [=y]
     Selected by [y]:
     - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n] && DRM_I915_DP_TUNNEL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
