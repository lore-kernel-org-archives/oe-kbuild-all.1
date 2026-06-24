Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C974386571
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 06:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281028; cv=none; b=ikCnCWrFiFLW14UBvT328lrEyF86VOtkhkXut/GX9cdSR07t7gqlE9okukOazCM1BIhJQg54NmNb03oX9ewmR1j6gU/8+dauZgj1rQnqiYRteGtIs0P38Dm/F1GC37HX4fAtQKNW7WsoV2nyqTwuoDeTr3KdSXOaUG4m8VEYLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281028; c=relaxed/simple;
	bh=3d5/iKzBFv1mncR2FL0wkfScXdkl9Ljz1/Yu/RJNm4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K2M3tLOH+VnR8akJiJ9pCPaVZ98bSz3GlvjrVJ31kWGl44IzjuNJ+1xsmOseJWQgk5N+lUNgB4NN0+QGr0X0woCtz+SaAmwY+Nt1mj+adKAdWKJTU/Tg7eX3Qh06Ik5sbmiqHiFqsvtEjYnE5TnJ7hRH5tcyA85XYAzTWTJymGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doqMmJkJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doqMmJkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782281025; x=1813817025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3d5/iKzBFv1mncR2FL0wkfScXdkl9Ljz1/Yu/RJNm4o=;
  b=doqMmJkJyihYs+BKG1Nl7VvbRgss5ni7g1xBVKVkd7RBtdbDzW66sCLT
   J8UJjJKPKxUwWcG67J5CEE/2x19xgkZF/qcsn3Dcl60EMkFtFWTvV1q4K
   19vOMquR+mNYK+F8cxIDyh5ShJ3cvVzVq8hzSWwSmy68YwgthDNLlfF3+
   gv+VxG1Cs6cNS6iQZeOq9vWMZ628SvSYNNnsjX5NgDpBgR6s21we1QBNm
   VHLuux9EP8qpy5VpiWyNSwhpHmoXqtSW+g4W5tAGQD8C7Xk4l4g6/Tn7y
   bnpnprex2NifAjZgTgUbS7JKerh8DlBnQMeYpsSxTnrhKp//UAAhvGqpr
   g==;
X-CSE-ConnectionGUID: SDpKSmliQzWBCupAGrxZgA==
X-CSE-MsgGUID: YmraIUckT9yMm4fHLqAvXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93392240"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="93392240"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 23:03:44 -0700
X-CSE-ConnectionGUID: 75wYr+IhTZ2svqxJ92gSRQ==
X-CSE-MsgGUID: 5acSAejqT8iS/dzPJQp/xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="245392467"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 23:03:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcGhv-0000000039j-3gbg;
	Wed, 24 Jun 2026 06:03:34 +0000
Date: Wed, 24 Jun 2026 14:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Chenyu Chen <chen-yu.chen@amd.com>
Subject: [linux-next:master 14089/15099]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/../.?=
 =?us-ascii?Q?./../amdgpu/amdgv=5Fsriovmsg.h:519:49:?= sparse: sparse:
 static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
Message-ID: <202606241431.L9VUbAKp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: 179b22085ef0177fa3c78afa2858100d59f5a991 [14089/15099] drm/amd/display: Add KUnit tests for amdgpu_dm_backlight
config: sparc-randconfig-r133-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241431.L9VUbAKp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241431.L9VUbAKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241431.L9VUbAKp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/../../../amdgpu/amdgpu_virt.h, ...):
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/../../../amdgpu/amdgv_sriovmsg.h:519:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"

vim +519 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/../../../amdgpu/amdgv_sriovmsg.h

1721bc1b2afaefb Bokun Zhang 2020-07-15  517  
1721bc1b2afaefb Bokun Zhang 2020-07-15  518  _Static_assert(
1721bc1b2afaefb Bokun Zhang 2020-07-15 @519  	sizeof(struct amd_sriov_msg_vf2pf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
1721bc1b2afaefb Bokun Zhang 2020-07-15  520  	"amd_sriov_msg_vf2pf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
1721bc1b2afaefb Bokun Zhang 2020-07-15  521  

:::::: The code at line 519 was first introduced by commit
:::::: 1721bc1b2afaefbd880b4606f5147b4ff487904c drm/amdgpu: Update VF2PF interface

:::::: TO: Bokun Zhang <Bokun.Zhang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
