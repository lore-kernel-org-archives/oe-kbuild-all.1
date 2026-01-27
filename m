Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEFE279DB3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552639; cv=none; b=eTP/gz5nahGX8R4sMqmwp5uBOJIh+oe4BTNgpOndcVSkEpM8JhESsYwQP4blAWGrB9/lJUEpemktXSjWmlFa66jKvY99X4yXBS5lcSAEEzF9v/QIZ8JYjgM3YqZ7pgr5Wkshh/4MNCOczI4qiqR7o1w/XybA5HZYp4OzGTAr1FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552639; c=relaxed/simple;
	bh=6erxTfURXx+nk+tIDD9yXbhI495DDu2Y2ge4ieyYaQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=abVbEMxyVRaEjhbk751pu+wfww918hTFb9E75hd2/wobTmgTjCyS9VBAUMZZIA/r0manLEFOtbQPfftfxJ13L02fsWpkPWtMozUlTfCYwQK0b77Ki05Io8XRlQAqBw+80xMoHQldbvGi/ZLElQqEyO06UhOR0Xtzql0ZfTi/NIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG5LIq2b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG5LIq2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769552638; x=1801088638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6erxTfURXx+nk+tIDD9yXbhI495DDu2Y2ge4ieyYaQ4=;
  b=DG5LIq2bO9cvkkWFcGqTUceLY8WvX008ZRPO0s3z3XPCIf5qmgh7zri6
   3zwcgL/kGvIbk57wWIp9EvI8A343EPb5tF9jLcBLQaAbRuwCCyC18KqxE
   TugYM1m3b2Vt4USgsTI80BRVRnb9VRCxy5h7YYh3tETp7VDcmwfC2j6Ew
   wW+U14P+HjJ+nxtuYBd6Rt0m3kt54oMrP3lgegTRSSpFaagwZQ/xttB8g
   WQgBRF/utsIIWvSviFoCRzUmXLBof1ZyBaItPGE+dZDF2O5cT/IZwYTZx
   S3SkPQSBBoL/OiSrAiXtrBMnXJ5QmhSs/8Hpui+rHMbkISCiu3heLKp6x
   A==;
X-CSE-ConnectionGUID: skleanwjTY+E6rDKEK1rEQ==
X-CSE-MsgGUID: BEZ3rPU5RrKdgli8QW3s0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81393761"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81393761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 14:23:58 -0800
X-CSE-ConnectionGUID: uQHGbjvhQTWp4HajGuA2OA==
X-CSE-MsgGUID: 6NLV+5aiQYeOl9XxZ6F8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="239350959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 14:23:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkrTV-00000000YyG-0nFs;
	Tue, 27 Jan 2026 22:23:53 +0000
Date: Wed, 28 Jan 2026 06:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, waynelin <Wayne.Lin@amd.com>
Subject: 
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml2=5F0/dml21/s?=
 =?us-ascii?Q?rc/dml2=5Ftop/dml2=5Ftop=5Fsoc15.c:418:87:?= sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202601280639.U7mtvVdD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Austin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c drm/amd/display: Rename dml2 to dml2_0 folder
date:   3 months ago
config: powerpc64-randconfig-r113-20260126 (https://download.01.org/0day-ci/archive/20260128/202601280639.U7mtvVdD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280639.U7mtvVdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280639.U7mtvVdD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c:418:87: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c:418:90: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c:1119:15: sparse: sparse: memset with byte count of 1804368
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
