Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3B4499BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783726519; cv=none; b=m6SW2YztHTmf+jHBDhG1MnXGvaRUJrlCdmgTYyKkyEn+PunaFiozh+BPiwTQY3Fyt1PhAhFgfrKo3sZkBFBB1LS1ZW+t+tjIXQuOqnjUJEVF+qBhvWk6mb4I9fn2/eIKYWjsM6cSA/dogU1niiyZ1RvZgbuaeOOy2DxecV9Jrv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783726519; c=relaxed/simple;
	bh=UaCS0ywvYBd9zP3VsjlBLUgd0fAJKemmcjrXr/wxFxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eoylNAP2M4iTSY2e1deROvjSAKUm7uWwawujZpANC+OhFqvG3MuFzzsBU1QUAZWL6km6anRwV96+dAWBPhSNtfiToUC7g/uqmCNN85tPAHZYXsOeLMnmzUSqgon8Bpv7TMVNig9MZR6q/Jb/3wGZ0jw3welNk2vA5bw7y0tbmHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EROidjil; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EROidjil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783726517; x=1815262517;
  h=date:from:to:cc:subject:message-id;
  bh=UaCS0ywvYBd9zP3VsjlBLUgd0fAJKemmcjrXr/wxFxU=;
  b=EROidjilqIaFnHD9N1JoQZe9w+S/g4AsiMrXWRg03zjFSpziRhQEwZwY
   xNNGUpO383IOyZScYxZN1TJgJcYX4kvwO5IQFgHHJbIds9tr7clQ4N1qW
   i+7c3RcTP2WfB7Yr9/KonNWkP1Quqfg2UHzLQkFBih0Af9xa5dGooou29
   6QqjGKRh0XWQWBpERys4jW6RNYmX+s9n3KdjcrQcbIPFqkILtmrsmIB+c
   Rc7v3MKbKmnrfUWCQed6fvfPsCrtXji3zkdM3eeWXjeECW8urg6HgcDXA
   c5H29h7supghVnjK2JEf3obHfIRB2NDp6v8KtdHyOqbuyRp9xySzxsQs/
   g==;
X-CSE-ConnectionGUID: c04P5iRpSL+mpGCvEhduTA==
X-CSE-MsgGUID: uWOME+KtT3+o9+8ZxibxwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84208423"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84208423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 16:35:16 -0700
X-CSE-ConnectionGUID: 6sRIxaEeQTOPlyLPkPZXjQ==
X-CSE-MsgGUID: Hb6zvBHCS02+uapdmKJ5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253273601"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Jul 2026 16:35:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiKkR-00000000JUW-490c;
	Fri, 10 Jul 2026 23:35:11 +0000
Date: Sat, 11 Jul 2026 07:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 3/3]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Function
 parameter or struct member 'queue_cnt' not described in 'get_wave_count'
Message-ID: <202607110752.Txfr0okT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mukul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   50e1c056e3c4a98a2dc65dbc0f4e988618868744
commit: 6ae9e1aba97e4cdaa31a0bfdc07497ad0e915c84 [3/3] drm/amdkfd: Update logic for CU occupancy calculations
config: x86_64-buildonly-randconfig-001 (https://download.01.org/0day-ci/archive/20260711/202607110752.Txfr0okT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110752.Txfr0okT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6ae9e1aba97e ("drm/amdkfd: Update logic for CU occupancy calculations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110752.Txfr0okT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Function parameter or struct member 'queue_cnt' not described in 'get_wave_count'
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
