Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B3C1C84A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 01:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006399; cv=none; b=MSTN8IdP18WlNUE1jUcOOgeYuxPf81pd3xcrQiABaxxY7p5RLauAOt2xDeQE0a1utMhAT8VMsujgm5qR1kfN83+Qea3v20F5IszoFJNpPlb+0LAoRBRJZfXKjyjK4Xbl1vomtsDKtFKIfU7l02uPRv3/O5m8pbQ/wXHbNNeU4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006399; c=relaxed/simple;
	bh=R7WTYl1yoCDSOGZ93SMaoVZoYKoPYwZJfUbG53GIlgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EzbjU/29Bu3khpEjLPAeg+OZN/DedMOSWvjVtxVm0hhIlqMnp3152eJVrXzPNwEp/8Qo7UM4btuS1c5icYkcS5TYLPweDuIaYbhKbDSCAwb0tCQUCRDZXeSIdqk3gZhuVnZ/h0iy+lwFlcviP6NhBB2U5J6Sm+IRcOCSYOJ72nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQrUvbgd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQrUvbgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775006398; x=1806542398;
  h=date:from:to:cc:subject:message-id;
  bh=R7WTYl1yoCDSOGZ93SMaoVZoYKoPYwZJfUbG53GIlgs=;
  b=CQrUvbgdMRXJ5NFlVE/cBjv3PmZs3HTD9zsbnRhEVoDKAezAcEz49SFQ
   TawkiR7O8peQjscj8GEm+V0aZ+x1KtjCSKkta1NSBRmfVMAsP0LikTZUk
   kR9j8vkd8UMidokHydvhZTbFy1LAZEMzEBeZonBGE7mFKnogexm4zAAqa
   x58lx1SEPYe/gSyGmT27x+Gs+M9XI39EY1jmKcd22c/HcmnKkl+4A95xJ
   6PoMuHb7MrXViv6U8OU+3kZl2ffgor1TGbYAp0LhWgtzlftlVOulEsew+
   Qr3E0w9rDNoYCzSrRjq6g1sVZsdEMPZTze5FJqV3a9ATFCdhdsTIl9MT2
   Q==;
X-CSE-ConnectionGUID: sgH21ZGITI6XkpG3k/U1Dw==
X-CSE-MsgGUID: XxGuJGxHS1an3ByLKZHbaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93618137"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="93618137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:19:58 -0700
X-CSE-ConnectionGUID: tI2L1IMKQ7u0PLzXZk6S3w==
X-CSE-MsgGUID: eD6bhgW6R36iNwxNnjDeIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230595815"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 18:19:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7kFM-000000008av-2In7;
	Wed, 01 Apr 2026 01:19:52 +0000
Date: Wed, 01 Apr 2026 03:19:06 +0200
From: kernel test robot <lkp@intel.com>
To: Ray Wu <ray.wu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [linux-next:master 10091/10705] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function
 parameter 'dm' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
Message-ID: <202604010344.wySEY79J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 754003486c3cc95f2fcb9d6b71a779047d6db95c [10091/10705] drm/amd/display: Add Idle state manager(ISM)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260401/202604010344.wySEY79J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010344.wySEY79J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010344.wySEY79J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function parameter 'dm' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function parameter 'acrtc' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function parameter 'stream' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function parameter 'dm' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function parameter 'acrtc' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function parameter 'stream' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:44 function parameter 'current_state' not described in 'dm_ism_next_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:44 function parameter 'event' not described in 'dm_ism_next_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:44 function parameter 'next_state' not described in 'dm_ism_next_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:153 function parameter 'ism' not described in 'dm_ism_get_idle_allow_delay'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:153 function parameter 'stream' not described in 'dm_ism_get_idle_allow_delay'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:216 function parameter 'ism' not described in 'dm_ism_insert_record'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:44 function parameter 'current_state' not described in 'dm_ism_next_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:44 function parameter 'event' not described in 'dm_ism_next_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:44 function parameter 'next_state' not described in 'dm_ism_next_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:153 function parameter 'ism' not described in 'dm_ism_get_idle_allow_delay'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:153 function parameter 'stream' not described in 'dm_ism_get_idle_allow_delay'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_ism.c:216 function parameter 'ism' not described in 'dm_ism_insert_record'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
