Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349902367A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524648; cv=none; b=PDKvw5LdILv+QkpXnRSYz04rr75gVt3cbDKTR0jP8DKyWMi20+ZJhm5/WM74wDNF2xK67gk3SdLsM4LEECrxYt3osX5Ary1AGR7VJKN8uUZcthZiZUjcN9Sao3Y/z5WTG712oT2ALuJHXE6M7DinmwMxGF3jWofpF0g9xD9/iLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524648; c=relaxed/simple;
	bh=sMj3IX4r96WyHCc61qyK3UBb5qXNt4RxuJx5rtiDh7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q41si86gZj3pJEIl/9P9O+xSOPcIc9Gnn+4QKilcV5ezzurEEReUSBtM//mYDIhWQ2+nUOZuZQ1dWkGrOkGvCRqTRb7ZNxoz+SZTzoT2RiRzmJYLu3bkwhhXgiZ2vaKaMsM4V8NhAA6ZNkx+WE4F58R9lIGC9vw+SylHOn/hT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGwyj05C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGwyj05C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752524647; x=1784060647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMj3IX4r96WyHCc61qyK3UBb5qXNt4RxuJx5rtiDh7M=;
  b=IGwyj05CElzhNZL0celfHrTT8b4AynW8FOoDZeQqtp/LxfyE4s8uZ+Ga
   BON4iJBufRy+xlp3cVfSKCA0GHMVVb5O7hHCOpsnKMvKNge5cCyEMF0ep
   K6vEC4I4zWIgjeJUhS9EHD2deIz0TXbiw9nslzAHex2j2/2hpAFLjEO6g
   EZvFAC67aELjUPMgBxmlgc9cQ+chwokkoNAVKsKpCcqrH+770uTE6u/oS
   WhqxFcYNg24WBoNBdEwod6TuUXScHwbPEpgAryJlbq/69JFOeIKP9pRZi
   p0Z8/xgek2MYd5lEqLPb7jfyOQSULWvkJ4oHXdChsPLcqQgEnF5CAWYtP
   g==;
X-CSE-ConnectionGUID: B+mOBwY1TJ6e0X/nj7MIVQ==
X-CSE-MsgGUID: Z2tue1WrS2O44J1AyZCXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53838354"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53838354"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 13:24:05 -0700
X-CSE-ConnectionGUID: dVXYUD6ETFWa0xpk4dlKvA==
X-CSE-MsgGUID: rf87MI/BTX6FruPu8wTM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161334826"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2025 13:24:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubPiU-0009IU-0F;
	Mon, 14 Jul 2025 20:24:02 +0000
Date: Tue, 15 Jul 2025 04:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1087:5-49: duplicated
 argument to && or ||
Message-ID: <202507150432.U0cALR6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 8c62a31607f6589545ef1c0a85f2924dee39430b drm/msm/dpu: allow using two SSPP blocks for a single plane
date:   7 months ago
config: arm-randconfig-r064-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150432.U0cALR6W-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1087:5-49: duplicated argument to && or ||

vim +1087 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

  1050	
  1051	static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
  1052						  struct drm_atomic_state *state)
  1053	{
  1054		struct drm_plane_state *plane_state =
  1055			drm_atomic_get_plane_state(state, plane);
  1056		struct drm_plane_state *old_plane_state =
  1057			drm_atomic_get_old_plane_state(state, plane);
  1058		struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
  1059		struct drm_crtc_state *crtc_state;
  1060		int ret;
  1061	
  1062		if (plane_state->crtc)
  1063			crtc_state = drm_atomic_get_new_crtc_state(state,
  1064								   plane_state->crtc);
  1065	
  1066		ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
  1067		if (ret)
  1068			return ret;
  1069	
  1070		if (!plane_state->visible) {
  1071			/*
  1072			 * resources are freed by dpu_crtc_assign_plane_resources(),
  1073			 * but clean them here.
  1074			 */
  1075			pstate->pipe.sspp = NULL;
  1076			pstate->r_pipe.sspp = NULL;
  1077	
  1078			return 0;
  1079		}
  1080	
  1081		/*
  1082		 * Force resource reallocation if the format of FB or src/dst have
  1083		 * changed. We might need to allocate different SSPP or SSPPs for this
  1084		 * plane than the one used previously.
  1085		 */
  1086		if (!old_plane_state || !old_plane_state->fb ||
> 1087		    old_plane_state->src_w != plane_state->src_w ||
  1088		    old_plane_state->src_h != plane_state->src_h ||
  1089		    old_plane_state->src_w != plane_state->src_w ||
  1090		    old_plane_state->crtc_h != plane_state->crtc_h ||
  1091		    msm_framebuffer_format(old_plane_state->fb) !=
  1092		    msm_framebuffer_format(plane_state->fb))
  1093			crtc_state->planes_changed = true;
  1094	
  1095		return 0;
  1096	}
  1097	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
