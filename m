Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5334676D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468020; cv=none; b=B3nZQB5IZ3nZRkSygt9a5E7L2gNLhWdACnxk1PZhrOOPxrZTQa36zxMlljhLqrpUJZVogy0UVF6E1QuYjL+YVRO7/AyUjvfxrjPoLxFC4zGoBJh3+5AvP0HoV4oiZOlZGbPzbB1LnIq/pzBHfpDs7ODleNwxnZvEREmmtWmQaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468020; c=relaxed/simple;
	bh=3aX+sjyUD3Gah2BLJZPA206bg4FrMDJPWgfbMWkKyz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9fiZ9Fhn1TWSqF/M/0UaQPS8DC8Y/VHyqvHAlDHLI+02Lv0BxvgIQDkLjaBm8864UhgZ+M9ThG3jmPxngXCHmd8PVf61f5qTgzHQERdwf/virz5QAhp+Z9FLFTyYU3BHDe+X+1K4bloG4mti4BHT6QSsF96BTTQG2DEq3H21t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH+qv/+d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH+qv/+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768468018; x=1800004018;
  h=date:from:to:cc:subject:message-id;
  bh=3aX+sjyUD3Gah2BLJZPA206bg4FrMDJPWgfbMWkKyz8=;
  b=NH+qv/+do8BSjB/z6kg0TqF173/+vD/VPgqx12XofpoqeRpwo3d6SgFm
   e3evtjiGKNlDNJfvUC9Uk2gA7nRwRd3wiI89Pd4x8vm5PyKe8UQjFl9li
   iB/FuV8ZROPJKpc+wIcLOnBNK5dXyyNeZkmu30aHC13wKbDB0WLQ4PwlG
   FILbDwkYskXkdZ4RTAeQx0NCRc2cGvDVmLFwafvWhqvftA/R1DBgDIUHW
   r4SGA9MKBnW7y131wgsBX2p1bevUn+/dZzIYGAdAPyWpEGJ/PIZwFbsSB
   s5Jrliq+de7eASIXJdASeS4othe9m4131t6LWrri0Y6Q8PTrXt480uimZ
   w==;
X-CSE-ConnectionGUID: RGaOeazvQca5ysOOlkGyqg==
X-CSE-MsgGUID: BvLxqqOpSaK8B3mu7+AlEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73613099"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73613099"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:06:56 -0800
X-CSE-ConnectionGUID: GFy+iWpxQ/mvxSspDe+r+Q==
X-CSE-MsgGUID: OrnW6NkoRL6blPw3/wGylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205189433"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 01:06:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgJJc-00000000HmL-3KsG;
	Thu, 15 Jan 2026 09:06:52 +0000
Date: Thu, 15 Jan 2026 17:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6683/6771] Warning:
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:415 expecting prototype for
 smu_msg_proto_v1_send_msg(). Prototype was for smu_msg_v1_send_msg() instead
Message-ID: <202601151728.S6JnRtXc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: bc58a21c9515b018e93e48c4ef0cc8fd6366a849 [6683/6771] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
config: x86_64-buildonly-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151728.S6JnRtXc-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151728.S6JnRtXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151728.S6JnRtXc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:415 expecting prototype for smu_msg_proto_v1_send_msg(). Prototype was for smu_msg_v1_send_msg() instead
--
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1924 expecting prototype for amdgpu_ttm_mmio_remap_bo_init(). Prototype was for amdgpu_ttm_alloc_mmio_remap_bo() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
