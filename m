Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5E9443
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761870341; cv=none; b=YJ9tObobAbXY76B3+MIh9gzk8dY7m38mG5KTdNI1O9BQSj00PvN57J7Ue0ZIuUrIZdXCsBh39JxniEDMRGojcWrpRLa8e6tuQOOeCdkzAa9czg5sjGqAiIYWUmq0ERysfu4L8QFKWJTa6B0CCimVylX9vKLiA83I3wk/z/NN/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761870341; c=relaxed/simple;
	bh=aFnKO06GeyTblpNHBlpbPvnlH8veG9q2jyqsiGbI3TU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePkudLjuITLM78n9dJWtjrwshFWUqR7yRC5VCS/Vl8g4Ow0BP9ENnNWvN0d1yXOZzTNnTY72TaenuRyCgS+83QNFQOWMaL9BeHDgr6LjyLyx8IURjpCasHvbVZ8AhlLYkcj46DHcu4XxbDqyi2z58y71/v/i0ET91Y6tdtxHA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSy76DcG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSy76DcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761870340; x=1793406340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFnKO06GeyTblpNHBlpbPvnlH8veG9q2jyqsiGbI3TU=;
  b=jSy76DcGeYDeoI0gr4H8qh5ZmK6PQ+41QK4TTYfiw/4kaUjkEEKxuQqz
   szWDCShKfxb3c3pWs1PqwScE6BfU8XZQmrdMJYq3w/SPqdJY7NN8uOoTc
   3LOYaEcZEn7uhaHyhncLGFV4ZyLx/sQ75U701XPzLqhVj8sF283VjopsR
   gU67npISOICr2RgjcPzGPTbfoFHC/VjRxIqwHvcPT6+Cz4fzcYE/W/m0Y
   i3yxy+fyLLub3SNqLATGBYpnqzyoz2x/DjnZg0XWNfF7QdMS8H3NO8kLW
   DPMqrCX/dauxXWvI4PnpzH39+XldCe+ErJsXLkniM8+6kdpMXIxFhoghY
   Q==;
X-CSE-ConnectionGUID: zKdQUAo/TSyYMRlcV/Achg==
X-CSE-MsgGUID: NgFUze6YTee+xnykVxvz0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63232768"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="63232768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 17:25:39 -0700
X-CSE-ConnectionGUID: R0aX2wVWROmN+v/lVLMxjQ==
X-CSE-MsgGUID: WXzAeHMiRreuY67W8Z7QIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="216932807"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2025 17:25:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEcxQ-000Mcj-0y;
	Fri, 31 Oct 2025 00:25:33 +0000
Date: Fri, 31 Oct 2025 08:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>, waynelin <Wayne.Lin@amd.com>
Subject: [linux-next:master 4172/5042]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_top/dml2_top_soc15.c:418:87:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202510310832.WXlsHA38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Austin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   131f3d9446a6075192cdd91f197989d98302faa6
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c [4172/5042] drm/amd/display: Rename dml2 to dml2_0 folder
config: i386-randconfig-061-20251030 (https://download.01.org/0day-ci/archive/20251031/202510310832.WXlsHA38-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310832.WXlsHA38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310832.WXlsHA38-lkp@intel.com/

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
