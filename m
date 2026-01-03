Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF914A35
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767460586; cv=none; b=FjgKOYtqsxkENqh8a6Us2wQyns6E6vLjJbYVzduc6lsHUneTC8nIuqYY1V6TAE/qxibQZG8f5p0meDcBkL0dumJFwf8aOqFHIbG9/pSa670lPjQstOU6LuKX2OqxAMokDWYkU+SmX2XNV8bK8+6i2/FYFAZF50PK7V0olKpCnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767460586; c=relaxed/simple;
	bh=v4AIt0RW1yD0AGROp5Aot2uZS8MFo6SMgqQdNpxUyjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RsPAmzCG5hU6TFwVjrQ59HM2yL/dNqvFB7Xgr1IApMO5ngNK5KQdyX02BhDU3W7ueUA6C8wSH3WvO0xTfhNolmY5oTfq+GBQ00oHvAJNm1HR4QGr0k+rETCuqFeROQmh5UWSg6Aay3hJXijpg6037pqIOVit+IT7Xj2T4gQ4iwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLBb9KU9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLBb9KU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767460584; x=1798996584;
  h=date:from:to:cc:subject:message-id;
  bh=v4AIt0RW1yD0AGROp5Aot2uZS8MFo6SMgqQdNpxUyjA=;
  b=ZLBb9KU9/JMjID35ALW2S5o/RnzxwmWz4of0uvXNmLMV46F66Uu16lot
   T6AzQDXuwioExZUMi2cEdyakIQolmXZkTK+wReAZLEPfuwT8Xa7iVv64W
   7MEG6N+sb1uUzaoi+ueWFdGNPBR3B+hVHc+tnKNVnM8Yaz4o9N1YFUwT6
   A9AhYURCfZyQYiCZuqq4crU5ZyYfv3HCb6bamZ0+hsaI76d0r/ubcqSgx
   StCN6sqTRxZaOFwSg6kDlqXPpbOzEpwvKmS1X8yIPuqzysmNvLbz1rxSN
   LVbZ7jxYbR875rQ7GPRhSGOyy1U4PttJBKr8RBkj5sO6p3eiae2U+P7ti
   A==;
X-CSE-ConnectionGUID: zF1ULBisT9Kkqgr35Np1Pg==
X-CSE-MsgGUID: B4iJ0iisSraIHq+hSESK9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="67915823"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="67915823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 09:16:24 -0800
X-CSE-ConnectionGUID: BmiBEChCSouW3gJwl4zHhg==
X-CSE-MsgGUID: vbXNGlZsRZCtdt2kWXg0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="207073995"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2026 09:16:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc5Ei-000000000AH-2Q8t;
	Sat, 03 Jan 2026 17:16:20 +0000
Date: Sun, 04 Jan 2026 01:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_dpe.c:749:36: sparse: sparse:
 symbol 'dpe_crtc_helper_funcs' was not declared. Should it be static?
Message-ID: <202601040115.RGbN8ExM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 4dd668f97d174ae807ce0cc6b552f4a32c3f64e2 [1/1] ANDROID: drm: kirin: Add kirin960 dpe driver support
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260104/202601040115.RGbN8ExM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040115.RGbN8ExM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040115.RGbN8ExM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/hisilicon/kirin/kirin_drm_dpe.c:749:36: sparse: sparse: symbol 'dpe_crtc_helper_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/hisilicon/kirin/kirin_drm_dpe.c:757:29: sparse: sparse: symbol 'dpe_crtc_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/hisilicon/kirin/kirin_drm_dpe.c:1051:37: sparse: sparse: symbol 'dpe_plane_helper_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/hisilicon/kirin/kirin_drm_dpe.c:1056:30: sparse: sparse: symbol 'dpe_plane_funcs' was not declared. Should it be static?

vim +/dpe_crtc_helper_funcs +749 drivers/gpu/drm/hisilicon/kirin/kirin_drm_dpe.c

   748	
 > 749	const struct drm_crtc_helper_funcs dpe_crtc_helper_funcs = {
   750		.atomic_enable = dpe_crtc_atomic_enable,
   751		.atomic_disable = dpe_crtc_atomic_disable,
   752		.mode_set_nofb = dpe_crtc_mode_set_nofb,
   753		.atomic_begin = dpe_crtc_atomic_begin,
   754		.atomic_flush = dpe_crtc_atomic_flush,
   755	};
   756	
 > 757	const struct drm_crtc_funcs dpe_crtc_funcs = {
   758		.destroy = drm_crtc_cleanup,
   759		.set_config = drm_atomic_helper_set_config,
   760		.page_flip = drm_atomic_helper_page_flip,
   761		.reset = drm_atomic_helper_crtc_reset,
   762		.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
   763		.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
   764		.enable_vblank = dpe_enable_vblank,
   765		.disable_vblank = dpe_disable_vblank,
   766	};
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
