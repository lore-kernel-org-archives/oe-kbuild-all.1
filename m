Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156E363098
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 03:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775012438; cv=none; b=WC0lhgaQnXPdeUjPsiv/E6v/SczQ6FX5ARTDQCo7I5QdKuM0m8GBIUxRSdIsXHj0le0GnuWYmry6wPyIzC1242u5ugUsAJ5OSZmkeD7q9ve1q6C6BGSXWIYmtQIVyh3QhYrndc2C8DJ9fZDiLBjuUsmtRtacMo8vB9Wfg7rjWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775012438; c=relaxed/simple;
	bh=Z+VCgF2yq7HFWBaB5qSSA+ecGoHYzhR67IuGANVkM8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KBp8PRnUTy4s/trz++TQu8cyMT+4s0BkVzzWRzKTZo9/9M7p1n00bBjqL/PzAbrN8YBNVMkOAfxl7hfhMrTDa7+AyCgywJEG/FTNP1deHxxttMccpAfOR/lmkW1QDq/YCsHkdxD/7n/JKAMSZkO7KrKIHZ6xsY4SDRNX/gWhdJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR9abOiG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR9abOiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775012434; x=1806548434;
  h=date:from:to:cc:subject:message-id;
  bh=Z+VCgF2yq7HFWBaB5qSSA+ecGoHYzhR67IuGANVkM8w=;
  b=IR9abOiGFy9QgWEqbIuyj/ATRlYiH/2awHNuzaXdWBIEKgDVW0Czpf7g
   sNbTr1v0XyD9x9DSvlsSq/d+TNoHwyWmjlMn9a4H6NQAZLHjy3dMZ7k3H
   hWcBjYiXdyoDT60Ct2CsyHxiifUVOF8049Ve9tdiDrlGwp0paL9W1xa4x
   RBQbHn6pclLBqk1WsXPZ0gA1XaMg5dU7PxaUdCkBE2mFcbF+W/Y/D9Okk
   2vp5tc3ebH6jPH1QrDL15DIC/ItLH6sb7P415PzC8sgG2uAKEvjZlcr7G
   pDjc20UmP57uA0V09X5stFeZKQLLodj2WjxYbYIFihZ+I1KhNYDlyN4Cw
   A==;
X-CSE-ConnectionGUID: dt9WMc6URDKDkB60Kj0CYw==
X-CSE-MsgGUID: FIdY3e+DR0OBl5Ou6bKRdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76156202"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76156202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 20:00:32 -0700
X-CSE-ConnectionGUID: PrfzLpNjSWWRWOYCgJftCA==
X-CSE-MsgGUID: a6jONP8UStKii/ima3RWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231480941"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2026 20:00:30 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7loh-000000004gE-1XZ7;
	Wed, 01 Apr 2026 03:00:27 +0000
Date: Wed, 01 Apr 2026 11:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ray Wu <ray.wu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [linux-next:master 10091/10705] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:131 function
 parameter 'dm' not described in 'amdgpu_dm_crtc_set_panel_sr_feature'
Message-ID: <202604011056.g3xwD1sM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 754003486c3cc95f2fcb9d6b71a779047d6db95c [10091/10705] drm/amd/display: Add Idle state manager(ISM)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260401/202604011056.g3xwD1sM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011056.g3xwD1sM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011056.g3xwD1sM-lkp@intel.com/

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
