Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40207535A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920757; cv=none; b=t3d86IEFsVVSJCSBVuh98CWSs+ObdEpd65z4RvxG8IO8t+b5WTrhrpvUU3nJF1QTKmW1463LojDEssbxEznuHGG634abbUXMH3IIru2HIFrGbJVzeS4WZBj/9jcRfPZegDQVAqiwU51BfAKC71ZpAmuDEh+NZI5xfbU2SmA0jE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920757; c=relaxed/simple;
	bh=GJ7Mh5VwKalEzb+WiiKolGvo2cxi0DVuXkkEK1B7d1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMfCgXZsk0Kehl/eK/I7zqvkCqXHJbJav5yVAcbjDPxqclb1KFalvUh4otT4TxV7iv9M7Fj978Yxi6necSyjPYyUQh3QFAMc9PZjN7oP1pgqa6uCnSLDbLJklApCruL/CzimSHykoGjxjNDPPIrqqBLbdW3ahbrwvqtOrMGtwuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYf3fbUo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYf3fbUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707920755; x=1739456755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJ7Mh5VwKalEzb+WiiKolGvo2cxi0DVuXkkEK1B7d1A=;
  b=VYf3fbUoIkfq7GEv5oEd7esGUSpDh3lt07oqMsd9GotqzX3kn+UJuNbg
   QqwXC6LAk794+ULMZOzy+sgPGGwx4CHPHFNb2u6vUEX8pHGoTqseYqRc4
   3bHZWCRRBcq7TPZSIaMER2YzlLfLhhFaNEgpWFfX21Wki52BYX9rvM9MX
   b8VqLyWyrXg8AQJr/J46AX3mX/UJ1BBV/s6XNLYBHCuZBH+0VpMOsEIdl
   LBao9NclpEoHmmueKn4ralcyzhfoWxrSz7pC1S08gyeB8QSWGsu//+aef
   v6FzpwvLhhezY5m/ucMEidIX35fmHjAQl+PC3/LkMovMoC1EQGWAJp80d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19475899"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="19475899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 06:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3520394"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2024 06:25:53 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raGCs-0008pY-18;
	Wed, 14 Feb 2024 14:25:50 +0000
Date: Wed, 14 Feb 2024 22:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1703/1726]
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:392: warning: Function parameter or
 member 'ih' not described in 'ih_v7_0_get_wptr'
Message-ID: <202402142238.RuNkEP7j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   f0ec34378e0c33a23efa875aa8836b363ae44d8b
commit: b6ba7a165b13666d57ce6ad1c86935ef2d3d040d [1703/1726] drm/amdgpu: Add ih v7_0 ip block support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240214/202402142238.RuNkEP7j-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402142238.RuNkEP7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402142238.RuNkEP7j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:392: warning: Function parameter or member 'ih' not described in 'ih_v7_0_get_wptr'
>> drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:432: warning: Function parameter or member 'ih' not described in 'ih_v7_0_irq_rearm'
>> drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:458: warning: Function parameter or member 'ih' not described in 'ih_v7_0_set_rptr'


vim +392 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c

   379	
   380	/**
   381	 * ih_v7_0_get_wptr - get the IH ring buffer wptr
   382	 *
   383	 * @adev: amdgpu_device pointer
   384	 *
   385	 * Get the IH ring buffer wptr from either the register
   386	 * or the writeback memory buffer.  Also check for
   387	 * ring buffer overflow and deal with it.
   388	 * Returns the value of the wptr.
   389	 */
   390	static u32 ih_v7_0_get_wptr(struct amdgpu_device *adev,
   391				      struct amdgpu_ih_ring *ih)
 > 392	{
   393		u32 wptr, tmp;
   394		struct amdgpu_ih_regs *ih_regs;
   395	
   396		wptr = le32_to_cpu(*ih->wptr_cpu);
   397		ih_regs = &ih->ih_regs;
   398	
   399		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
   400			goto out;
   401	
   402		wptr = RREG32_NO_KIQ(ih_regs->ih_rb_wptr);
   403		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
   404			goto out;
   405		wptr = REG_SET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW, 0);
   406	
   407		/* When a ring buffer overflow happen start parsing interrupt
   408		 * from the last not overwritten vector (wptr + 32). Hopefully
   409		 * this should allow us to catch up.
   410		 */
   411		tmp = (wptr + 32) & ih->ptr_mask;
   412		dev_warn(adev->dev, "IH ring buffer overflow "
   413			 "(0x%08X, 0x%08X, 0x%08X)\n",
   414			 wptr, ih->rptr, tmp);
   415		ih->rptr = tmp;
   416	
   417		tmp = RREG32_NO_KIQ(ih_regs->ih_rb_cntl);
   418		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
   419		WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
   420	out:
   421		return (wptr & ih->ptr_mask);
   422	}
   423	
   424	/**
   425	 * ih_v7_0_irq_rearm - rearm IRQ if lost
   426	 *
   427	 * @adev: amdgpu_device pointer
   428	 *
   429	 */
   430	static void ih_v7_0_irq_rearm(struct amdgpu_device *adev,
   431				       struct amdgpu_ih_ring *ih)
 > 432	{
   433		uint32_t v = 0;
   434		uint32_t i = 0;
   435		struct amdgpu_ih_regs *ih_regs;
   436	
   437		ih_regs = &ih->ih_regs;
   438	
   439		/* Rearm IRQ / re-write doorbell if doorbell write is lost */
   440		for (i = 0; i < MAX_REARM_RETRY; i++) {
   441			v = RREG32_NO_KIQ(ih_regs->ih_rb_rptr);
   442			if ((v < ih->ring_size) && (v != ih->rptr))
   443				WDOORBELL32(ih->doorbell_index, ih->rptr);
   444			else
   445				break;
   446		}
   447	}
   448	
   449	/**
   450	 * ih_v7_0_set_rptr - set the IH ring buffer rptr
   451	 *
   452	 * @adev: amdgpu_device pointer
   453	 *
   454	 * Set the IH ring buffer rptr.
   455	 */
   456	static void ih_v7_0_set_rptr(struct amdgpu_device *adev,
   457				       struct amdgpu_ih_ring *ih)
 > 458	{
   459		struct amdgpu_ih_regs *ih_regs;
   460	
   461		if (ih->use_doorbell) {
   462			/* XXX check if swapping is necessary on BE */
   463			*ih->rptr_cpu = ih->rptr;
   464			WDOORBELL32(ih->doorbell_index, ih->rptr);
   465	
   466			if (amdgpu_sriov_vf(adev))
   467				ih_v7_0_irq_rearm(adev, ih);
   468		} else {
   469			ih_regs = &ih->ih_regs;
   470			WREG32(ih_regs->ih_rb_rptr, ih->rptr);
   471		}
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
