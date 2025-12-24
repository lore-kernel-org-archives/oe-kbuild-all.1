Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634C2877FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766615799; cv=none; b=bkYJzGtzWS8TRiMMUCqvIyvHwSfcdGFh2kgxiXYUMai3iXTaaHPNGrx9GPmB3X4Ew5itgtZN/zIsNMk46VPAiPT7/NDYQ/zDqBDPmoHr+VuiJI+qo4GFaEHQlGPDPVjZfpIMRHlOle+giI3zOCZ8taavxEPdpcuadUkZj5N8p7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766615799; c=relaxed/simple;
	bh=uzAIoINphWKHoVhSKo19qPBCxIMAlTKVaWPMzqCWPZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RuvPbczxOyt/k9PF6pg+HX5Wyb4uZsMH80fWVeqg6DadY5sYS6dCS8Qnz4DySFAB7z/NrJdBVEYwhgy2/+aU/V2wqHwOswKlgGT7heFHx3WATWhLijOL7+9O6kgjyvsW3K/UenoBmSYfeO0ttBlon1ybotcwBzbIj4PuXFZpVnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiqsNk33; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiqsNk33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766615798; x=1798151798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzAIoINphWKHoVhSKo19qPBCxIMAlTKVaWPMzqCWPZs=;
  b=CiqsNk33l5hn3wKk6KVNfJhvCX21BCsXU1QPPRKjU//9nE2DaxvnFkMq
   eUhdYH8RuZdImG+dF6bBNdX7EZ8h9VHYbAKiFasf/2cXmCJuUA2chpcc8
   fRnR+RQhnnBB6qMyjUl7k3MzDPYNbrPWIhtfmt/ViDjUYIRJwhaFzxML9
   OTrblmBydBd7wfG/bK1rR3P20FVzzMxT8nKsKz4YhuSQGCmWCElhVH3Pq
   lMAsKLiMCOV8FbjkbGZCO5/n2fe7GHdgRyRldwmHcHEda7OOmHRswooG2
   Sn87vw/lbwhrgKi35qbU4dco75UPkok/SY7UqdCa7K+72NOcg52JpKtDd
   w==;
X-CSE-ConnectionGUID: Q/uglDSGTJmIL8yARtMLZg==
X-CSE-MsgGUID: Wm980Ds7QeSNnYfj0PPYuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68601059"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68601059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 14:36:38 -0800
X-CSE-ConnectionGUID: D2BFcyhPTm+l0KTEqyfnYQ==
X-CSE-MsgGUID: Fc8vvH2/QCyFwaXyOsh7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="199247548"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Dec 2025 14:36:35 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYXT4-000000003WH-1VV6;
	Wed, 24 Dec 2025 22:36:30 +0000
Date: Thu, 25 Dec 2025 06:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, waynelin <Wayne.Lin@amd.com>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml2=5F0/dml21/s?=
 =?us-ascii?Q?rc/dml2=5Ftop/dml2=5Ftop=5Fsoc15.c:418:87:?= sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202512250637.YJF49yZb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c drm/amd/display: Rename dml2 to dml2_0 folder
date:   8 weeks ago
config: i386-randconfig-063-20251221 (https://download.01.org/0day-ci/archive/20251225/202512250637.YJF49yZb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250637.YJF49yZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250637.YJF49yZb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c:418:87: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c:418:90: sparse: sparse: Using plain integer as NULL pointer
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:7192:56: sparse: sparse: symbol 'core_dcn4_g6_temp_read_blackout_table' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:11176:73: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:11177:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:11735:74: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:11736:70: sparse: sparse: Using plain integer as NULL pointer

vim +418 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c

be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  390  
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  391  /*
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  392  * For a given set of pipe start/end x positions, checks to see it can support the input mcache splitting.
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  393  * It also attempts to "optimize" by finding a shift if the default 0 shift does not work.
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  394  */
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  395  static bool find_shift_for_valid_cache_id_assignment(int *mcache_boundaries, unsigned int num_boundaries,
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  396  	int *pipe_vp_startx, int *pipe_vp_endx, unsigned int pipe_count, int shift_granularity, int *shift)
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  397  {
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  398  	int max_shift = 0xFFFF;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  399  	unsigned int pipe_index;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  400  	unsigned int i, slice_width;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  401  	bool success = false;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  402  
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  403  	for (i = 0; i < num_boundaries; i++) {
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  404  		if (i == 0)
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  405  			slice_width = mcache_boundaries[i];
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  406  		else
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  407  			slice_width = mcache_boundaries[i] - mcache_boundaries[i - 1];
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  408  
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  409  		if (max_shift > (int)slice_width) {
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  410  			max_shift = slice_width;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  411  		}
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  412  	}
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  413  
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  414  	for (*shift = 0; *shift <= max_shift; *shift += shift_granularity) {
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  415  		success = true;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  416  		for (pipe_index = 0; pipe_index < pipe_count; pipe_index++) {
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  417  			if (!calculate_first_second_splitting(mcache_boundaries, num_boundaries, *shift,
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25 @418  				pipe_vp_startx[pipe_index], pipe_vp_endx[pipe_index], 0, 0)) {
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  419  				success = false;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  420  				break;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  421  			}
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  422  		}
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  423  		if (success)
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  424  			break;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  425  	}
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  426  
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  427  	return success;
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  428  }
be4e3509314af7 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c Austin Zheng 2024-11-25  429  

:::::: The code at line 418 was first introduced by commit
:::::: be4e3509314af751f08677f428f93c306aaa2f8e drm/amd/display: DML21 Reintegration For Various Fixes

:::::: TO: Austin Zheng <Austin.Zheng@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
