Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2979B3A3E91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988265; cv=none; b=U/g13Pb/FRWwQGFZ3ZUEo5KGxlXV3IReaeHkk7c0lzXTwJtAuomloPkix14eFoDpBSAJG2FC692NilFWYW5pLr28Z1x8/jM8IuIgMQoctquswP7Bhwskp7EBxM9G1z6vGM0Pl3JzfiTBIHqsxSodeTPAN9L5thFogGNy66S8/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988265; c=relaxed/simple;
	bh=d9GOBagysHwiCgZ4POnPAuFwtLXY/pr7iLSHpSquDtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tvBZZXLyuceRlt38h2x8arbYzLj4ZkXr/OU905stMTwHHuJSTUDVsWuw4fL/LctXHa8P4vxW2/+flext8GBnN/MG6QKsiead7apOD0RCqIuYXCsbj93ezmBAvnK058xxSMFO1iLvVJXh3bHjaf7P9+gbIzefTl3aIHYbEyBnzO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwADP/98; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwADP/98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774988263; x=1806524263;
  h=date:from:to:cc:subject:message-id;
  bh=d9GOBagysHwiCgZ4POnPAuFwtLXY/pr7iLSHpSquDtQ=;
  b=dwADP/98dpHbSngyDxYuer9QuTQx7C0rPOCuiTCF9iiq27Z4zVT7/bNy
   wnf8URk8yZ/7NCl89+dP5eIwaVBf7z2x1ONtNCg4OR5m/j2OB2JEQ40/5
   fjO7F2KsIReGxYDEuybGqAqzc7UFu93h3cfhR2b4n/+JncfvHaKeiUgaP
   Hu/GFtDR9CO1Lv3raZyrr8+KtI371gf4fEJdNS8ZZXMAHNbsYFAmXWGRA
   SO08MVsSj0HaAHThxDlH4oDS0lvPwqBXTJkfiucYBoBTUIwkgrP7BKt5t
   agg6/BrHplgGJEeiBlar+Rlwx6i/QZBKfha5XHgn0aqNAhQULtT8tCbvG
   g==;
X-CSE-ConnectionGUID: 5YDkHW8BQVKZN8R9pKLweA==
X-CSE-MsgGUID: k+tCsJL5SnWdYa3EmJTEgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63569340"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="63569340"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 13:17:42 -0700
X-CSE-ConnectionGUID: bjeFsDJnSsiYdYtQXLUX9A==
X-CSE-MsgGUID: JxD4GtcZRhO3+ka5+y5PZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223165352"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 13:17:40 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7fWs-000000004Dt-0vwS;
	Tue, 31 Mar 2026 20:17:38 +0000
Date: Wed, 01 Apr 2026 04:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:961
 dmub_srv_wait_for_pending() warn: inconsistent indenting
Message-ID: <202604010451.mxTKtQnZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: a3b7dc4a1ec4e184f48c2f8205d2ec88d31310fe drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
date:   12 months ago
config: x86_64-randconfig-161-20260329 (https://download.01.org/0day-ci/archive/20260401/202604010451.mxTKtQnZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010451.mxTKtQnZ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:961 dmub_srv_wait_for_pending() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:862 dmub_srv_fb_cmd_execute() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:994 dmub_srv_wait_for_idle() warn: inconsistent indenting

vim +961 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   940	
   941	enum dmub_status dmub_srv_wait_for_pending(struct dmub_srv *dmub,
   942						uint32_t timeout_us)
   943	{
   944		uint32_t i;
   945		const uint32_t polling_interval_us = 1;
   946		struct dmub_srv_inbox scratch_reg_inbox0 = dmub->reg_inbox0;
   947		struct dmub_srv_inbox scratch_inbox1 = dmub->inbox1;
   948		const volatile struct dmub_srv_inbox *reg_inbox0 = &dmub->reg_inbox0;
   949		const volatile struct dmub_srv_inbox *inbox1 = &dmub->inbox1;
   950	
   951		if (!dmub->hw_init ||
   952				!dmub->hw_funcs.get_inbox1_wptr)
   953			return DMUB_STATUS_INVALID;
   954	
   955		/* take a snapshot of the required mailbox state */
   956		scratch_inbox1.rb.wrpt = dmub->hw_funcs.get_inbox1_wptr(dmub);
   957	
   958		for (i = 0; i <= timeout_us; i += polling_interval_us) {
   959				scratch_inbox1.rb.rptr = dmub->hw_funcs.get_inbox1_rptr(dmub);
   960	
 > 961			scratch_reg_inbox0.is_pending = scratch_reg_inbox0.is_pending &&
   962					dmub->hw_funcs.read_reg_inbox0_rsp_int_status &&
   963					!dmub->hw_funcs.read_reg_inbox0_rsp_int_status(dmub);
   964	
   965			if (scratch_inbox1.rb.rptr > dmub->inbox1.rb.capacity)
   966				return DMUB_STATUS_HW_FAILURE;
   967	
   968			/* check current HW state first, but use command submission vs reported as a fallback */
   969			if ((dmub_rb_empty(&scratch_inbox1.rb) ||
   970					inbox1->num_reported >= scratch_inbox1.num_submitted) &&
   971					(!scratch_reg_inbox0.is_pending ||
   972					reg_inbox0->num_reported >= scratch_reg_inbox0.num_submitted))
   973				return DMUB_STATUS_OK;
   974	
   975			udelay(polling_interval_us);
   976		}
   977	
   978		return DMUB_STATUS_TIMEOUT;
   979	}
   980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
