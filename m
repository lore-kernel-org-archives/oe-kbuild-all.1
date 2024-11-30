Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBB1369AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732947698; cv=none; b=TqyNVPPlyi4QGgUEMzZZbVEXv5+dPYRzFTewbh9AXyme+4+TCVksEvQV9xulSCgEicvTn3oe7AniQtP9DdNCBy87QMcZeYXgHREZdHVu2CEcRAiWAlYx8T2NiQ9biEshSFYP38ME4VJHXixmoegjadZawnVI+gh3jucxXDyMaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732947698; c=relaxed/simple;
	bh=vyep6ZJeE0dj9MacX9WcB2e3c5BtOhWZ1Nw2RLYz0Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISjfjM3clUn+uRiqWCY+eMCH1l6fAq9LWa0DJdkLlcjZXZiY/dbnSArpq2YjIKDJ00I7+IfaSptGm6XVKBKGpCa5JMMcIHZt/j6i94eeFRADkeanC6jIUygT4qFFRSEL41Wr7/bBuHUjgR5O7RLxcQY6AoL4q4E4pqJQi9+DtQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWDAG/A6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWDAG/A6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732947696; x=1764483696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyep6ZJeE0dj9MacX9WcB2e3c5BtOhWZ1Nw2RLYz0Rk=;
  b=JWDAG/A6NhKt4WtQbKanV3La7X574f+TVKMVsndKaZcH9kvmY1bcLpqX
   s6/btXEotH2D1M/pNY2aMuEWSEirq9WUY4o0QuDQZKwo8RWWnTWQL3LcT
   PlWyH5nvcdVZJoeYyGgfMJ59FVtFB/FM8Whol5S8jMBVDJDxgyx8Rn5sy
   Nz+yOXMMB2JyoD9f/Hgf3lrcKRfPwBO6E9lJhtbofoUozufF5mBF+CNXq
   5ecfwplufR3MVFZuDQ94R4Mj1MrC0Rz6iXpg6MQUPt+ht5V3/Vq662Rwy
   g/JUBLFINosXjMUhH24X3zJaPtaCBF1ZS3B2ZcFljgCsVRuCY4k+uAE0G
   Q==;
X-CSE-ConnectionGUID: K1WwpEdWRZCaHQM8zzxDaw==
X-CSE-MsgGUID: B/UyJJz1QTCW1Rau0G93rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33224548"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33224548"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 22:21:34 -0800
X-CSE-ConnectionGUID: +AUBWU1QQ6e6+uSnRQNwsQ==
X-CSE-MsgGUID: O7xPA0iiRYitXsC/BkREDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93023916"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 22:21:33 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHGrC-00008Q-1o;
	Sat, 30 Nov 2024 06:21:30 +0000
Date: Sat, 30 Nov 2024 14:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [lumag-msm:test-dpu-virtual-wide 18/25]
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:803: warning: Function parameter or
 struct member 'global_state' not described in 'dpu_rm_release_all_sspp'
Message-ID: <202411301404.a00Ee0Fp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm test-dpu-virtual-wide
head:   1fa167178f166a008766557a7b968a4d9d8e83fa
commit: 21c2f756cc574238b8732e41d49aadc963429dc3 [18/25] drm/msm/dpu: add support for virtual planes
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241130/202411301404.a00Ee0Fp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301404.a00Ee0Fp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301404.a00Ee0Fp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:803: warning: Function parameter or struct member 'global_state' not described in 'dpu_rm_release_all_sspp'
>> drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:803: warning: Excess function parameter 'rm' description in 'dpu_rm_release_all_sspp'


vim +803 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c

   794	
   795	/**
   796	 * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
   797	 *	blocks previously reserved for that use case.
   798	 * @rm: DPU Resource Manager handle
   799	 * @crtc: DRM CRTC handle
   800	 */
   801	void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
   802				     struct drm_crtc *crtc)
 > 803	{
   804		uint32_t crtc_id = crtc->base.id;
   805	
   806		_dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
   807			ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
   808	}
   809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
