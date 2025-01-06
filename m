Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A61524B0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 22:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736203318; cv=none; b=BbjkRgddpQlah5q0qYFbPseCSzFq+CsM1viIyGJ8hU2bqDQhFkSh8/N9MpbBk1h8KiAynf/+35yMwO+bSM0do+zYne+DTVBofbZccpqUJNL+XHQX1Xw8V4KRQ4zMStv6Rrb4w8QyI21/Fjm/fqy6HaIoZZ2RgsVWjuBNniv15kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736203318; c=relaxed/simple;
	bh=hUde2dIT3Ev7f/Sacwj/raOrjNoe1o+PyetA9wMiVfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DtVQfr8s0C9qjzNuNkcZFkeMdHr0nQJ21xo5j5tDaGX2o31cHIdGlz+0zVzq1HNVANDur0IWn61H1E8NezVAKNmDdXSPqMUGevBrdkhNHqZTUpxXq7X2Hzys4Ia4GjSqa3Tz9V+zaFkLKMmFxNBtkpUwu1Zf4BGyYdODCy/XqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKvXThiT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKvXThiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736203317; x=1767739317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUde2dIT3Ev7f/Sacwj/raOrjNoe1o+PyetA9wMiVfs=;
  b=YKvXThiTGOarCZQabPH3M4cnhd5lk4H1cZx9HdDm9IXO4ASVzCeBslve
   m9UHnttPWauxPJvRWf6HW1AoAL9fSnozLPU+if++g3Y1bY8PdSlUYJQ9L
   c3560xiNpRlYpbtGKt4cmnCb/X5nf+GG88p/IILzv5bFd4yLoaZx2iRx+
   Fd6Meus3yf1Nx3c1z55z3rAB1lk9y9FTJv8V31gBY3sPjwXKmKo+KiU9W
   QSOolQz9R7kUamAKrbZxhCY9sHfy8C9Vk3nj4DH5uki0Td4RzBmw4c2oa
   UMt+WXfSUPhGhFXdI64RzC7q/aT/PJqlNgi/YUOVly8HgOoM7RPRQfqul
   Q==;
X-CSE-ConnectionGUID: jAA/prMzRfWVzkuHN2xpvA==
X-CSE-MsgGUID: vqufGbRqTXWHkGgrmy1RWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46860296"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="46860296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 14:41:56 -0800
X-CSE-ConnectionGUID: qBk/23UNTSKgPc+XEd0JgA==
X-CSE-MsgGUID: +ybekhg6TbizpnkOtuxHwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103069588"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jan 2025 14:41:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUvnD-000DzT-1m;
	Mon, 06 Jan 2025 22:41:51 +0000
Date: Tue, 7 Jan 2025 06:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [agd5f:drm-next 204/279]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c:418:87:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202501070603.mTOGB1cT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   6c9c97387be1bf4a5881fe1a6cd00acd4322f283
commit: be4e3509314af751f08677f428f93c306aaa2f8e [204/279] drm/amd/display: DML21 Reintegration For Various Fixes
config: x86_64-randconfig-121-20250106 (https://download.01.org/0day-ci/archive/20250107/202501070603.mTOGB1cT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070603.mTOGB1cT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070603.mTOGB1cT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c:418:87: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c:418:90: sparse: sparse: Using plain integer as NULL pointer

vim +418 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c

   390	
   391	/*
   392	* For a given set of pipe start/end x positions, checks to see it can support the input mcache splitting.
   393	* It also attempts to "optimize" by finding a shift if the default 0 shift does not work.
   394	*/
   395	static bool find_shift_for_valid_cache_id_assignment(int *mcache_boundaries, unsigned int num_boundaries,
   396		int *pipe_vp_startx, int *pipe_vp_endx, unsigned int pipe_count, int shift_granularity, int *shift)
   397	{
   398		int max_shift = 0xFFFF;
   399		unsigned int pipe_index;
   400		unsigned int i, slice_width;
   401		bool success = false;
   402	
   403		for (i = 0; i < num_boundaries; i++) {
   404			if (i == 0)
   405				slice_width = mcache_boundaries[i];
   406			else
   407				slice_width = mcache_boundaries[i] - mcache_boundaries[i - 1];
   408	
   409			if (max_shift > (int)slice_width) {
   410				max_shift = slice_width;
   411			}
   412		}
   413	
   414		for (*shift = 0; *shift <= max_shift; *shift += shift_granularity) {
   415			success = true;
   416			for (pipe_index = 0; pipe_index < pipe_count; pipe_index++) {
   417				if (!calculate_first_second_splitting(mcache_boundaries, num_boundaries, *shift,
 > 418					pipe_vp_startx[pipe_index], pipe_vp_endx[pipe_index], 0, 0)) {
   419					success = false;
   420					break;
   421				}
   422			}
   423			if (success)
   424				break;
   425		}
   426	
   427		return success;
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
