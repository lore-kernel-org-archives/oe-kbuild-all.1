Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0F718C002
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727350095; cv=none; b=mr5RhEyqyT6bgZhC5OsBRigUYNV4pnZyYYSmhQ9nJfSP2R1x50zk0kSvjMpM76bi6uiiYs7IJ+HJ5Iq2wveq9ggbF8IazGtFDYvnYwHi0GwliLWNPLSJqbrXj6UbWuMq0jj9mxpnshsIt47WG0tO2NZAqOrLL0io2+AHG/Vqpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727350095; c=relaxed/simple;
	bh=eqSYkpovMfKJ8kW3CltApStL4jI8vpjPVaAYGlhdKMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RN/7ZHn1XTBwLzOdraPvO4p2Moc13mfN+nDjO/I7HDPmCiMBG8E1KxgXXpCy4kW/SIg9n+qonRO+f49O/1OuoWxyKqShuTbDwoNTuwjwsSGBZPq9Z9XksxBLq4evQf4fZ2e0xedXEnUmEz0w46zyn8MRvcVR4qwBr8QMzP0YAzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d98TgDhz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d98TgDhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727350093; x=1758886093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eqSYkpovMfKJ8kW3CltApStL4jI8vpjPVaAYGlhdKMY=;
  b=d98TgDhz3iw5G/nderf6z5sStVljp0K01uLz5+mYtHFg6a1DO56dvoJd
   npKvroUnM56FDTtnJTIHlIZBKsM4XC+RBWSBHkFkDrykrlTQwLHwM1+VU
   GtKfsw+4JuCTP5SG+FjUBU8P1k6XXY7Fiv7Zqj+gnOc89fVk48UAlCmex
   qjBZtniYWER2rNSWl3Btp7pbfp6w/HyhiAtvOUy74IFmI3BtSrW/VEIwe
   w1DliUs0s9uKWxyn8m85TFt7vxFoT9zA4EEkc5id0oNHrci1HrDwcG6xt
   KB92n1Ak3bh1ih80f1X3g9GXj/6DDcT7r0MDEM5JloMaPiYFEY5P9/a8R
   A==;
X-CSE-ConnectionGUID: MmAVc5xpRlavapyNXg/lgQ==
X-CSE-MsgGUID: imTTGtiWS4W/nk4nxrS1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26592770"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="26592770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:28:13 -0700
X-CSE-ConnectionGUID: IxG84eVbQCimiYtANIOlcw==
X-CSE-MsgGUID: 7Tg6cxfyTGSQm0WcOdHnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="72201184"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2024 04:28:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stmfI-000Kdf-2o;
	Thu, 26 Sep 2024 11:28:08 +0000
Date: Thu, 26 Sep 2024 19:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: [linux-next:master 12634/12811]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Function
 parameter or struct member 'queue_cnt' not described in 'get_wave_count'
Message-ID: <202409261959.rMXKsRHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92fc9636d1471b7f68bfee70c776f7f77e747b97
commit: 6ae9e1aba97e4cdaa31a0bfdc07497ad0e915c84 [12634/12811] drm/amdkfd: Update logic for CU occupancy calculations
config: x86_64-randconfig-r062-20240327 (https://download.01.org/0day-ci/archive/20240926/202409261959.rMXKsRHU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261959.rMXKsRHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261959.rMXKsRHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Function parameter or struct member 'queue_cnt' not described in 'get_wave_count'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess function parameter 'wave_cnt' description in 'get_wave_count'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Excess function parameter 'vmid' description in 'get_wave_count'


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
