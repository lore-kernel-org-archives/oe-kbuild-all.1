Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0D48C8CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125895; cv=none; b=PVT3kkz6A6XubECoGibSIWEHIVVd5sAq/iwXsrMaPkTCc67lAsZzPNwzs3Azanj1pgSOFZMZfc8JnoXiwQN8Qprl309OMK3TzZMOjsASbDuGAlOL45PPHb5Jqc3NGiAVm61uK4/JzPyl4rjQeuWfN54u1urUENPVJ6xkEAQS3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125895; c=relaxed/simple;
	bh=ZGhSqfIk+5k4iIi2DOMmT4J2Xm5S+At/dIxkFy2/tmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lGsclx9vPW/phRUsJz3MW+CgNEXtWdTre84Si2jYPSN5GE1PQU6UO8Wj8VWXf8c3gbVhu4LRFgHAyzsQiSuiIt/yR884cmOeJMEQIMLl7TB9nbaV0yFb2/xKU0kXfdQJEwFqsCgbMMuzdJBf2210tGYfgmFmanpWK7Nm9LYWZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXejFW5g; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXejFW5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784125891; x=1815661891;
  h=date:from:to:cc:subject:message-id;
  bh=ZGhSqfIk+5k4iIi2DOMmT4J2Xm5S+At/dIxkFy2/tmY=;
  b=LXejFW5glgphY/rIiOi/SVyNRTfv0it8W2Tx2feJ6/c9MvHZlp/Wqzzc
   YimfCv7Zgr0kOCbiyThfmDzv+fgOgqs4xrvCznGtBjY74UoU+OVbXcYqt
   wb2shT93YEO937J6zVTQgxstaEqmgPfSVJWyLeBvnmdxP7kwZCxPWgUMq
   eESpKwC7bB5HFycVCWGGytXrjfdi1D9UEO7ncUVSdyBkXYFbv9bfx/Joq
   8vC007eMFBakfCYEIB40pFCWOdJuH6q/eDvGLNm8Cmqg/qivUoWqCWNSa
   PnZaL6eUfqPFIutsLSIdGCMsZ/KU1cfXRKk9iPM+37kNjzNACtzS5RxUq
   g==;
X-CSE-ConnectionGUID: PLXz+degQ6SLeTMsSvNlJA==
X-CSE-MsgGUID: 8nuwRKD/Rdypy2ZXodT1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84804638"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84804638"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:31:29 -0700
X-CSE-ConnectionGUID: ZSNBqF+1RJOiRijBU3VgIQ==
X-CSE-MsgGUID: +Ga4qH5mTM2GqHXkR1zoOA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2026 07:31:28 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk0dy-000000004G9-0gHi;
	Wed, 15 Jul 2026 14:31:26 +0000
Date: Wed, 15 Jul 2026 16:30:55 +0200
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Chen <michael.chen@amd.com>
Subject: [agd5f:drm-next 155/155] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'mes' not
 described in 'amdgpu_mes_alloc_gang_ctx_index'
Message-ID: <202607151650.TKVNHhs5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   5ab89b491f215f69b750130ead2ff6bbde6c0e2e
commit: 7ca36e897bceeedf917bf98f024f5d2c8e87324d [155/155] drm/amdgpu: add mes gang contex alloc/free helper
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607151650.TKVNHhs5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607151650.TKVNHhs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607151650.TKVNHhs5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'mes' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'queue' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'mes' not described in 'amdgpu_mes_free_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'queue' not described in 'amdgpu_mes_free_gang_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'mes' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1087 function parameter 'queue' not described in 'amdgpu_mes_alloc_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'mes' not described in 'amdgpu_mes_free_gang_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1112 function parameter 'queue' not described in 'amdgpu_mes_free_gang_ctx_index'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
