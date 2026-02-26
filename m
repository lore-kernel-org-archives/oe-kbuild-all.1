Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C135A3B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134330; cv=none; b=ueaPS1hLLG/aWTf0WZTH4NbNu1ZML771vkVa0n0hqB/elCTjumXJ9jnxUjwaXafH2Io+UNLWVqjL08iij+7PzPstO6k7wDoGyxlf1tPMxzDJS3vGh+11wOu4SZpF2Wctf0dw2/ydg2Q2Ttvldo0cuSiWYeqIRA+CJLFPxzEf/D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134330; c=relaxed/simple;
	bh=eTdKl5spSa1A6AVSmznzAJ1kTOe1kQzN5dta1eEGtNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r0A4M9N6uCeTtu/pPv/xkBQXjiROAUeYVXop32zUYqLR7COTdRL1peHEsRXO22KXp7HrSQ67JKKlEjaEmkRCmDGR7CNZJR83OpCnt5YI1Uh1fbByA+KXROzQK79fNtJ0LSkpaU1h5bHJVxu+Js8PfBxZDhat3FwLQasKtEcJxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hx/o8uYB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hx/o8uYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772134322; x=1803670322;
  h=date:from:to:cc:subject:message-id;
  bh=eTdKl5spSa1A6AVSmznzAJ1kTOe1kQzN5dta1eEGtNQ=;
  b=Hx/o8uYB/h01papWKd8CGWY+pvsEyx9KeYyv3zbvurRYTGZF7VzMp6uu
   xFLa7GYbwtJHSfmw30qp0ScQugnqnrlY7mPM0P8N+4PIKPqKb9wxMAo6e
   EBpwsf/MXIIMpPaYBB3W/P4WpaRSGlAIhbs1CTNAD7nklVBHhBNV7+y2D
   IWYMxdUTuDzyH3pvfs3a7MRUfn9PtxMVmxXYOgTzVmbIM1cIovOXzemR/
   NuFRHMkUc0kt8+wTYW8macNdfhqBhYA5JE+8EyjI1EvCHbReTtmo6bTdL
   YXIWTGSNdRIkQCsIdMTyA+WIfZbWpGRaUZxq+F/VNbwMjsrxx9yxWaStr
   w==;
X-CSE-ConnectionGUID: Ej5IW8/qQsO6io5LH+qIzg==
X-CSE-MsgGUID: GiVpCZSJRcmAcfY7ayKCeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73080512"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73080512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:32:02 -0800
X-CSE-ConnectionGUID: lD+qXQDJSWueqofE1t2Mqg==
X-CSE-MsgGUID: kxhtpH+7RLCNIvaRQcThpQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Feb 2026 11:31:59 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvh56-000000009o7-40qu;
	Thu, 26 Feb 2026 19:31:36 +0000
Date: Fri, 27 Feb 2026 03:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Jinzhou Su <jinzhou.su@amd.com>
Subject: [linux-next:master 2182/2633]
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:521:1: error: static assertion
 failed: "amdsriov_ras_telemetry must be 64 KB"
Message-ID: <202602270328.Vbi7C0da-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d6661873f6b54c75195780a40d66bad3d482d8f
commit: cb48a6b2b61d7ebf2f1099041067800ffd8a5c2d [2182/2633] drm/amd/ras: use dedicated memory as vf ras command buffer
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260227/202602270328.Vbi7C0da-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270328.Vbi7C0da-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270328.Vbi7C0da-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h:27,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:86,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:44:
>> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:521:1: error: static assertion failed: "amdsriov_ras_telemetry must be 64 KB"
     521 | _Static_assert(
         | ^~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:86,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:27:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:521:1: error: static assertion failed: "amdsriov_ras_telemetry must be 64 KB"
     521 | _Static_assert(
         | ^~~~~~~~~~~~~~


vim +521 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h

   506	
   507	_Static_assert(
   508		sizeof(struct amd_sriov_msg_vf2pf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
   509		"amd_sriov_msg_vf2pf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
   510	
   511	_Static_assert(
   512		sizeof(struct amd_sriov_msg_pf2vf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
   513		"amd_sriov_msg_pf2vf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
   514	
   515	_Static_assert(AMD_SRIOV_MSG_RESERVE_UCODE % 4 == 0,
   516		       "AMD_SRIOV_MSG_RESERVE_UCODE must be multiple of 4");
   517	
   518	_Static_assert(AMD_SRIOV_MSG_RESERVE_UCODE > AMD_SRIOV_UCODE_ID__MAX,
   519		       "AMD_SRIOV_MSG_RESERVE_UCODE must be bigger than AMD_SRIOV_UCODE_ID__MAX");
   520	
 > 521	_Static_assert(
   522		sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
   523	"amdsriov_ras_telemetry must be " stringification(AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1) " KB");
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
