Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E301DF748
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765654877; cv=none; b=NPPmJRe18VsCYgeOuADFnC87s/xUQB/cLo/v0ie5bvFELgMGsmA+ceoNLTaDKsr7iebgoLitlPxi5mkhUtmvTbgN5g+oTqLxR8QT59aOYR6QnS/GKuprwJZq1uUstdqkoOcnkM0Ke95F3hHpvB3xIdNYlb3ZdLqji/oEOQMEdnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765654877; c=relaxed/simple;
	bh=la/KzIwdJkwjuNVOKh2qwlxdX1R/B8b2kyOqAbRo1Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxjfONbS1NK9NrpqF9QOV6wgKLz3egF5MnDiKn2zjnxcKCu+FcOtrbxhAsA7+GikUnvud+8PzqL2ZBHOaY9zbhk89KIANYLSTp6EI68OMvXgZOBhB3gbdGmOxKgsz7xoLEX16FcTk+wBVY6Vw7d1EXV3dV6wOFhydwmVKPXAaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewhK0jW5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewhK0jW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765654876; x=1797190876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=la/KzIwdJkwjuNVOKh2qwlxdX1R/B8b2kyOqAbRo1Dg=;
  b=ewhK0jW58qcwlO6kYf6jDrCKl4GIrkQ+N8HfMuraT2XtZ8I8NjE4XDir
   ADk17s2m+leAHaPMi1tyRxSWQTBneHgD5siIDsnodQE3ank/g+lI3Snbz
   DCS0AyHMn/xyONuaS7XczuM8xjW3Nz1xbotsqSQAZKUEePmZZxopGdMOW
   dKTIA/tp9sMCn5HcsEvl3/wnR15amUEjTIa4bgWDotl/E0MuIkFw4Dcbm
   Ui7xhlbDHgH9ShSf3LEpwS8sh3o0en6pT54V8RIkutcKiEJEaSnlLxjvu
   mXQaXu8hz3TI0SmgXsmt/z9SJYEFDEpAMx+CtPf74Wj10mXBuFBpkRWii
   g==;
X-CSE-ConnectionGUID: H/4/8LmHRumnrQSY/3UJwg==
X-CSE-MsgGUID: 3s8yUvfwRUWsU2fwKKEN/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79076268"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79076268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:41:15 -0800
X-CSE-ConnectionGUID: L9HXJsfGRvSIPt3lYkPfzA==
X-CSE-MsgGUID: k17iJDtuTROefGr05fwl9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228016523"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 11:41:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVUO-0000000087J-2Nsh;
	Sat, 13 Dec 2025 19:41:12 +0000
Date: Sun, 14 Dec 2025 03:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 0/2]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess
 function parameter 'wave_cnt' description in 'get_wave_count'
Message-ID: <202512140317.IrUvoDdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mukul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   16188c9444ac9af88549d1db5dfe7760418a22b7
commit: 6ae9e1aba97e4cdaa31a0bfdc07497ad0e915c84 [0/2] drm/amdkfd: Update logic for CU occupancy calculations
config: x86_64-buildonly-randconfig-003-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140317.IrUvoDdV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140317.IrUvoDdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140317.IrUvoDdV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Function parameter or struct member 'queue_cnt' not described in 'get_wave_count'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess function parameter 'wave_cnt' description in 'get_wave_count'
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess function parameter 'vmid' description in 'get_wave_count'


vim +954 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c

43a4bc828c5b15 Ramesh Errabolu       2020-09-29  939  
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  940  /**
1fdbbc123f55de Fabio M. De Francesco 2021-04-23  941   * get_wave_count: Read device registers to get number of waves in flight for
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  942   * a particular queue. The method also returns the VMID associated with the
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  943   * queue.
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  944   *
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  945   * @adev: Handle of device whose registers are to be read
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  946   * @queue_idx: Index of queue in the queue-map bit-field
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  947   * @wave_cnt: Output parameter updated with number of waves in flight
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  948   * @vmid: Output parameter updated with VMID of queue whose wave count
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  949   *        is being collected
3eeb0d037a5435 Srinivasan Shanmugam  2023-05-30  950   * @inst: xcc's instance number on a multi-XCC setup
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  951   */
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  952  static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
6ae9e1aba97e4c Mukul Joshi           2024-09-16  953  		struct kfd_cu_occupancy *queue_cnt, uint32_t inst)
43a4bc828c5b15 Ramesh Errabolu       2020-09-29 @954  {
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  955  	int pipe_idx;
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  956  	int queue_slot;
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  957  	unsigned int reg_val;
6ae9e1aba97e4c Mukul Joshi           2024-09-16  958  	unsigned int wave_cnt;
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  959  	/*
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  960  	 * Program GRBM with appropriate MEID, PIPEID, QUEUEID and VMID
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  961  	 * parameters to read out waves in flight. Get VMID if there are
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  962  	 * non-zero waves in flight.
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  963  	 */
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  964  	pipe_idx = queue_idx / adev->gfx.mec.num_queue_per_pipe;
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  965  	queue_slot = queue_idx % adev->gfx.mec.num_queue_per_pipe;
e2069a7b0880cc Mukul Joshi           2022-05-09  966  	soc15_grbm_select(adev, 1, pipe_idx, queue_slot, 0, inst);
6ae9e1aba97e4c Mukul Joshi           2024-09-16  967  	reg_val = RREG32_SOC15_IP(GC, SOC15_REG_OFFSET(GC, inst,
6ae9e1aba97e4c Mukul Joshi           2024-09-16  968  				  mmSPI_CSQ_WF_ACTIVE_COUNT_0) + queue_slot);
6ae9e1aba97e4c Mukul Joshi           2024-09-16  969  	wave_cnt = reg_val & SPI_CSQ_WF_ACTIVE_COUNT_0__COUNT_MASK;
6ae9e1aba97e4c Mukul Joshi           2024-09-16  970  	if (wave_cnt != 0) {
6ae9e1aba97e4c Mukul Joshi           2024-09-16  971  		queue_cnt->wave_cnt += wave_cnt;
6ae9e1aba97e4c Mukul Joshi           2024-09-16  972  		queue_cnt->doorbell_off =
6ae9e1aba97e4c Mukul Joshi           2024-09-16  973  			(RREG32_SOC15(GC, inst, mmCP_HQD_PQ_DOORBELL_CONTROL) &
6ae9e1aba97e4c Mukul Joshi           2024-09-16  974  			 CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET_MASK) >>
6ae9e1aba97e4c Mukul Joshi           2024-09-16  975  			 CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
6ae9e1aba97e4c Mukul Joshi           2024-09-16  976  	}
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  977  }
43a4bc828c5b15 Ramesh Errabolu       2020-09-29  978  

:::::: The code at line 954 was first introduced by commit
:::::: 43a4bc828c5b156f08024fd0a966c5c2a3f09af1 drm/amd/amdgpu: Define and implement a function that collects number of waves that are in flight.

:::::: TO: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
