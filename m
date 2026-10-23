Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763316;
	b=xHdM8kTDRnx2Cy90nEz9FKEaNh0ndHH3GQaRr/gkNGYi5zLOJMDw27LQRAIv8pfcxj7s
	 fVKXc2xTkTwfJlb5OVUC6SPqJ+u6mBcOCg2PgZPSmr4z2rMvukTHPG5fXceyhv1krFn5c
	 U7UeJLIAeWszTtUBEuqXxVyVBcq6tKnKVztvdJ8DDnB70Z5vckZ6IE3D18JMqa6Q171WV
	 s2qhbfQeDGwAQ5sNqS3C6mOnGF5QjMCfbsuVD4HBjZGtECobguAJCRbjJiD15q+lzelZ6
	 SDwfbVKGduwdHVJ+jg/2sMQBfY++/UIA79SB4n8p42DLLqfDtxqitRWfFa7361Hyfbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763316;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y4f8r3RjGhjEhilCToNwzH58QEkdy6ZCvwnmtL7jxuw=;
	b=HSjvXo6tL+6FUSENsaRuQUMiLhX28CqUrTaTT8rUlf14cVv8scIwuXEoiIMTWU0r/kLn
	 LbMKaCfaYMS2G3xWdHzek+M4ZegzfNy2YHZotEwkZHWsdS0hE/Sm64f31Agwq7pDmMNjG
	 erKlycbIGzt0O4stDpbdWQQO2yP2mEfKsEYbu3Yl9O+zQDWUGW5mRqpTqP8rhxv2f5tLD
	 2zQu6tyFxqh7rmEUvkS63fnCmmLB11lYBwTrIQn9C4EtddF0QfLg8PI+ZiRmZMFkWE0qC
	 QavQyIFZIWzSDR6PHwUs3rXjL7z3RtDvC0eK+TnbBSGBWWU53QRc6e9rzPJJqyIpo0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CpvlpnQK;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE37606A31D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 13:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE37606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CpvlpnQK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792763316; x=1824299316;
  h=date:from:to:cc:subject:message-id;
  bh=NJ3VPKw2aqbdrdI7PIauuNbg7LISHWcy+YzgnsGwdXE=;
  b=CpvlpnQK21TZHLZtmZx4a9o9wMVguDS/RlbaK85g94DPzTWAG3DvzNYd
   acU50K4wANhQxS3L9Xh/Yl2+82SulBfZWKKA3E1G/Dq9VtXnI1zJ9HauP
   yVCSX0sijxR/hhdgAUB49G0AhlWy7Byn4+3xubvsb6Dsc1edCVTSSJTin
   0gOZ+o3tkRkFaUZIab4nNat4x+2ph7U3rSBvo/WQJ492VG7Xw6zYVWQ/2
   9K8+Yo+gHKvoqprsytaedB0wy+cYp3PoTjNoz4Kht5Cu0ZhhEjcLmKv5h
   VJIUgkc/RdjU8ytfQLBMAegxV4ydSs/Hol1G9ErXDY1BZ0y3YY/1880kU
   Q==;
X-CSE-ConnectionGUID: BgYnWpvFS4GZHltSg/rK6g==
X-CSE-MsgGUID: uzwUXh7ZRqqqaMJ3ZubDpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1511823"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1511823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:48:35 -0700
X-CSE-ConnectionGUID: Eb5dc8miQkqbxbs9AOLpog==
X-CSE-MsgGUID: VbTS9ULYQP+YymQkdf8q/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3972598"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 06:48:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKFdH-00000000SlO-1C9P;
	Fri, 23 Oct 2026 13:48:31 +0000
Date: Fri, 23 Oct 2026 21:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:954: warning: Function
 parameter or struct member 'queue_cnt' not described in 'get_wave_count'
Message-ID: <202610232120.xzWu8N8g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mukul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e64d278d669fa423e1337ad06c6672336c13bea9
commit: 6ae9e1aba97e4cdaa31a0bfdc07497ad0e915c84 [0/2] drm/amdkfd: Update logic for CU occupancy calculations
config: x86_64-randconfig-1011-20261020 (https://download.01.org/0day-ci/archive/20261023/202610232120.xzWu8N8g-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610232120.xzWu8N8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6ae9e1aba97e ("drm/amdkfd: Update logic for CU occupancy calculations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610232120.xzWu8N8g-lkp@intel.com/

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
