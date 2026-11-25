Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641689;
	b=iLChXlQH9t/vCN2SFoVWKfMuOO87idSsm3gJacDathxe/8p3wQdiNyYw1Cvnjxsw23oj
	 53Bmxf0p4L+HNHnWu8vou/32qb2QvzuCGoJMOpscckSBscBGemtMl4b/kEp8ANA8I1AQ/
	 M6zDY6rhmTuXlyF812OUVJLp5B4YZvaAlvGX95GJ6DlMl5BD3afdSb5VozgF2RhjX2gp2
	 w/h9kZZ20pQ9bwQnYSnN+9IDiN0jBsUgrhKNzaC+53vha+S431Zg1lj8xdscdyowvfwQn
	 GiItoKBYvmS175ZD733VY7U/6tnWQoi9GRG5UdXcx2JtuFlisKXVQA1wM7fkv2PMx+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641689;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QlI0kXAz3VYJmMLg0EFzQuAi2/N3cBQqgoW0Z8b6eOc=;
	b=FV8z+pqDyQ/EumOhPDJqsV3sxB9ykVGJROciWvucB1jDVQYbywabuuXKSDFKKzG52ikk
	 iJbCUjLzR++cK4zFRCMee6HfxTnKvpXDN8VJnO3DbQSXzFDf+vq2HbtKiiRtJL/8L/xvq
	 RLFKlOat6E/IIqSpxNSIi1+2ICiI6gtP1EuBmtIwADdrS7cMzptzpqr9+wTTOQNiBJwtw
	 6KK0yNuHe7IDy22NnQDhp7k+P1KpFOu4DYpk6GP+OnhHpVDGszo5z5+gKre66wAoF6UFP
	 kshBtaGpAqoYFLEdU2ZHI/sKs/CACK1CcX/S+0iQ4zKVFgaQHrYI2L308k3HxQXplKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iO7mQ76t;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B4606A336
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 21:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858B4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iO7mQ76t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795641688; x=1827177688;
  h=date:from:to:cc:subject:message-id;
  bh=EzfiiWQNT4U7dLsbRRrH8khTnL1QI+m0YTMqZbJYqGA=;
  b=iO7mQ76tQcJZRRBChhw5kpgBY2Sm6HBMNKYufv3JUPesQxgFSeHYZjnd
   UwwE6z1mOI+TNh0J7bw/BOm3NMAIT+hSPy9eSrs4NkVqDzcify4WIudaC
   w9WKy/IsCbhHsYPeuzSF8TB2ZPV74M49jdh3K88s0EcyBMnqaA7u3Mw8p
   8tZPusIBdAQBHqTRg2NwtnujGhNcHfWLmitEoRg39XPTz4Xl3gOIALmrb
   sdgYAdWB9l5DOzDxpUXSi9qFGuLIpMWIcIJtt0d3CrqwErBAB4QOTkhDW
   JvxXpjGBFBP/ZSih5zZ+yawEPFe2puoHt8F4S9rtt375k9kB3Q/S56HsZ
   A==;
X-CSE-ConnectionGUID: IyPtW02eRVSs7AVTstcwaA==
X-CSE-MsgGUID: gq1fXF9cRwioCidE1paWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4426837"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4426837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:21:28 -0800
X-CSE-ConnectionGUID: NFaC0dRfTt22erRodXVdvQ==
X-CSE-MsgGUID: lrDDAHTBSYWN0qgy/kjDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12562831"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2026 13:21:27 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWKQc-0000000006J-1Tfc;
	Wed, 25 Nov 2026 21:21:22 +0000
Date: Wed, 25 Nov 2026 22:20:45 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Min <Frank.Min@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 242/243]
 drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3247 gfx_v13_0_kiq_init_register()
 warn: inconsistent indenting
Message-ID: <20261125221227.RQ0LyZcG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   fc652f23f1c3c727e561ca66bafd58000208e3a9
commit: 927b76f7ad93303364ed2895154f61a41e371f10 [242/243] drm/amdgpu: Add gfx v13 ip block
config: sparc64-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125221227.RQ0LyZcG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125221227.RQ0LyZcG-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3247 gfx_v13_0_kiq_init_register() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c:3693 gfx_v13_0_set_userq_eop_interrupts() warn: missing unwind goto?

vim +3247 drivers/gpu/drm/amd/amdgpu/gfx_v13_0.c

  3212	
  3213	static int gfx_v13_0_kiq_init_register(struct amdgpu_ring *ring)
  3214	{
  3215		struct amdgpu_device *adev = ring->adev;
  3216		struct v13_compute_mqd *mqd = ring->mqd_ptr;
  3217		int j;
  3218	
  3219		/* inactivate the queue */
  3220		if (amdgpu_sriov_vf(adev))
  3221			WREG32_SOC15(GC, 0, regCP_HQD_ACTIVE, 0);
  3222	
  3223		/* disable wptr polling */
  3224		WREG32_FIELD15_PREREG(GC, 0, CP_PQ_WPTR_POLL_CNTL, EN, 0);
  3225	
  3226		/* write the EOP addr */
  3227		WREG32_SOC15(GC, 0, regCP_HQD_EOP_BASE_ADDR,
  3228		       mqd->cp_hqd_eop_base_addr_lo);
  3229		WREG32_SOC15(GC, 0, regCP_HQD_EOP_BASE_ADDR_HI,
  3230		       mqd->cp_hqd_eop_base_addr_hi);
  3231	
  3232		/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
  3233		WREG32_SOC15(GC, 0, regCP_HQD_EOP_CONTROL,
  3234		       mqd->cp_hqd_eop_control);
  3235	
  3236		/* enable doorbell? */
  3237		WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
  3238		       mqd->cp_hqd_pq_doorbell_control);
  3239	
  3240		/* disable the queue if it's active */
  3241		if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
  3242			WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
  3243			for (j = 0; j < adev->usec_timeout; j++) {
  3244				if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
  3245					break;
  3246				udelay(1);
> 3247			if (amdgpu_emu_mode == 1)
  3248				msleep(1);
  3249			}
  3250			WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST,
  3251			       mqd->cp_hqd_dequeue_request);
  3252			WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR,
  3253			       mqd->cp_hqd_pq_rptr);
  3254			WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_LO,
  3255			       mqd->cp_hqd_pq_wptr_lo);
  3256			WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_HI,
  3257			       mqd->cp_hqd_pq_wptr_hi);
  3258		}
  3259	
  3260		/* set the pointer to the MQD */
  3261		WREG32_SOC15(GC, 0, regCP_MQD_BASE_ADDR,
  3262		       mqd->cp_mqd_base_addr_lo);
  3263		WREG32_SOC15(GC, 0, regCP_MQD_BASE_ADDR_HI,
  3264		       mqd->cp_mqd_base_addr_hi);
  3265	
  3266		/* set MQD vmid to 0 */
  3267		WREG32_SOC15(GC, 0, regCP_MQD_CONTROL,
  3268		       mqd->cp_mqd_control);
  3269	
  3270		/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
  3271		WREG32_SOC15(GC, 0, regCP_HQD_PQ_BASE,
  3272		       mqd->cp_hqd_pq_base_lo);
  3273		WREG32_SOC15(GC, 0, regCP_HQD_PQ_BASE_HI,
  3274		       mqd->cp_hqd_pq_base_hi);
  3275	
  3276		/* set up the HQD, this is similar to CP_RB0_CNTL */
  3277		WREG32_SOC15(GC, 0, regCP_HQD_PQ_CONTROL,
  3278		       mqd->cp_hqd_pq_control);
  3279	
  3280		/* set the wb address whether it's enabled or not */
  3281		WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR,
  3282			mqd->cp_hqd_pq_rptr_report_addr_lo);
  3283		WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
  3284			mqd->cp_hqd_pq_rptr_report_addr_hi);
  3285	
  3286		/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
  3287		WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR,
  3288		       mqd->cp_hqd_pq_wptr_poll_addr_lo);
  3289		WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR_HI,
  3290		       mqd->cp_hqd_pq_wptr_poll_addr_hi);
  3291	
  3292		/* enable the doorbell if requested */
  3293		if (ring->use_doorbell) {
  3294			WREG32_SOC15(GC, 0, regCP_MEC_DOORBELL_RANGE_LOWER,
  3295				(adev->doorbell_index.kiq * 2) << 2);
  3296			WREG32_SOC15(GC, 0, regCP_MEC_DOORBELL_RANGE_UPPER,
  3297				(adev->doorbell_index.userqueue_end * 2) << 2);
  3298		}
  3299	
  3300		WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
  3301		       mqd->cp_hqd_pq_doorbell_control);
  3302	
  3303		/* reset read and write pointers, similar to CP_RB0_WPTR/_RPTR */
  3304		WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_LO,
  3305		       mqd->cp_hqd_pq_wptr_lo);
  3306		WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_HI,
  3307		       mqd->cp_hqd_pq_wptr_hi);
  3308	
  3309		/* set the vmid for the queue */
  3310		WREG32_SOC15(GC, 0, regCP_HQD_VMID, mqd->cp_hqd_vmid);
  3311	
  3312		WREG32_SOC15(GC, 0, regCP_HQD_PERSISTENT_STATE,
  3313		       mqd->cp_hqd_persistent_state);
  3314	
  3315		/* activate the queue */
  3316		WREG32_SOC15(GC, 0, regCP_HQD_ACTIVE,
  3317		       mqd->cp_hqd_active);
  3318	
  3319		if (ring->use_doorbell)
  3320			WREG32_FIELD15_PREREG(GC, 0, CP_PQ_STATUS, DOORBELL_ENABLE, 1);
  3321	
  3322		return 0;
  3323	}
  3324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
