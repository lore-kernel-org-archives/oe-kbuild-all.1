Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504E131E84B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955729; cv=none; b=s/U4c6jf2Mn0uy5xqRqbu6a9cv8q1/A5jXw3ICdlIBRtjBYi8s0eFjDrVwJ8tURGikwV/dtTaPKjGLsrbpPPAUM7xXeEFGbMkxQDOecHcT+7XSYmilYwL9WUK/8z58McLvnghgJ9CAuA6scGghhPXRAE0ChXvEfe+8RlglKsqHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955729; c=relaxed/simple;
	bh=LqHpVbUFIjKGYDClgNZnxDrmDmlIAUTL0p2Tj4Uq2Is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OFc5UPfVOPUmhna30G0s5eBTtvbWxwzKfHvSsArjM88Am8+lHsk8plhU6esfz0lK9J5CXGJWzmg6L/G6q/A7Q/2xYzgrHBtUYZ+802AlWmIA+yOQEgYCdRkjmt3HC3ntSsUeWNwD7Nz5yyD7drIwpRsOy6wO8HDxOCM7og9ozkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNxRIo0L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNxRIo0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955728; x=1822491728;
  h=date:from:to:cc:subject:message-id;
  bh=LqHpVbUFIjKGYDClgNZnxDrmDmlIAUTL0p2Tj4Uq2Is=;
  b=gNxRIo0LqxxqcU5p60q2yyJccuRcWzWwQxD6mQKRQRhkAXdAgqtaWMg+
   yJwzhjAyzXuLNT5p2iOgOpdvA/kv5zSTjvYnwxKpyMBvwtEyomi/jLu51
   gWyI9huDJe3hQwp+M6GD4/xshmrYIwyzs9EIYZLX1qIn9Aj3VUt1+KUq0
   cMKEmnmNxV3aVgvKq+YFcW1UVjjMxIF9u4M1Qj+F5HrKjLeeMh+OKYuf3
   CSSQByj+nALOpDugXlCE7R79flXNFW2kX1tS6kZgPXdVUOlKd9kZPVYKC
   8ydaD4Eh9L0VyhsjD7hLCb1rg32ypUMWNtUtDJRIdzRuqAPYyyctYLMGU
   Q==;
X-CSE-ConnectionGUID: hV8J1PlqTl6wtwmLd1gv2A==
X-CSE-MsgGUID: TNcKlu9NRcCgobWIdqHILQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="95535964"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="95535964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:42:08 -0700
X-CSE-ConnectionGUID: Ms/RM9ePQ6WnNmh9lF8jqw==
X-CSE-MsgGUID: 7pgZoI/xTxGbDNssBLO3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275461137"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Oct 2026 08:42:05 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCfOd-000000000eG-38jt;
	Fri, 02 Oct 2026 15:42:03 +0000
Date: Fri, 02 Oct 2026 17:41:44 +0200
From: kernel test robot <lkp@intel.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Frank Min <Frank.Min@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 43/174]
 drivers/gpu/drm/amd/amdgpu/ih_v8_0.c:412:16: sparse: sparse: cast to
 restricted __le32
Message-ID: <202610021704.tBU4uCyL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   b596733c95f394cc304f590dabe3bc218f88158e
commit: 327edf9e92d8dc992532b39f4542b537a6a5122f [43/174] drm/amdgpu: Add ih v8_0 support
config: microblaze-randconfig-r2309-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021704.tBU4uCyL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021704.tBU4uCyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021704.tBU4uCyL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/ih_v8_0.c:412:16: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/ih_v8_0.c:509:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] wptr @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/ih_v8_0.c:509:25: sparse:     expected unsigned int [usertype] wptr
   drivers/gpu/drm/amd/amdgpu/ih_v8_0.c:509:25: sparse:     got restricted __le32 [usertype]

vim +412 drivers/gpu/drm/amd/amdgpu/ih_v8_0.c

   394	
   395	/**
   396	 * ih_v8_0_get_wptr() - get the IH ring buffer wptr
   397	 *
   398	 * @adev: amdgpu_device pointer
   399	 * @ih: IH ring buffer to fetch wptr
   400	 *
   401	 * Get the IH ring buffer wptr from either the register
   402	 * or the writeback memory buffer.  Also check for
   403	 * ring buffer overflow and deal with it.
   404	 * Returns the value of the wptr.
   405	 */
   406	static u32 ih_v8_0_get_wptr(struct amdgpu_device *adev,
   407				      struct amdgpu_ih_ring *ih)
   408	{
   409		u32 wptr, tmp;
   410		struct amdgpu_ih_regs *ih_regs;
   411	
 > 412		wptr = le32_to_cpu(*ih->wptr_cpu);
   413		ih_regs = &ih->ih_regs;
   414	
   415		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
   416			goto out;
   417	
   418		wptr = RREG32_NO_KIQ(ih_regs->ih_rb_wptr);
   419		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
   420			goto out;
   421		wptr = REG_SET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW, 0);
   422	
   423		/* When a ring buffer overflow happen start parsing interrupt
   424		 * from the last not overwritten vector (wptr + 32). Hopefully
   425		 * this should allow us to catch up.
   426		 */
   427		tmp = (wptr + 32) & ih->ptr_mask;
   428		dev_warn(adev->dev, "IH ring buffer overflow "
   429			 "(0x%08X, 0x%08X, 0x%08X)\n",
   430			 wptr, ih->rptr, tmp);
   431		ih->rptr = tmp;
   432	
   433		tmp = RREG32_NO_KIQ(ih_regs->ih_rb_cntl);
   434		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
   435		WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
   436	
   437		/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
   438		 * can be detected.
   439		 */
   440		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
   441		WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
   442	out:
   443		return (wptr & ih->ptr_mask);
   444	}
   445	
   446	/**
   447	 * ih_v8_0_irq_rearm - rearm IRQ if lost
   448	 *
   449	 * @adev: amdgpu_device pointer
   450	 * @ih: IH ring to match
   451	 *
   452	 */
   453	static void ih_v8_0_irq_rearm(struct amdgpu_device *adev,
   454				      struct amdgpu_ih_ring *ih)
   455	{
   456		uint32_t v = 0;
   457		uint32_t i = 0;
   458		struct amdgpu_ih_regs *ih_regs;
   459	
   460		ih_regs = &ih->ih_regs;
   461	
   462		/* Rearm IRQ / re-write doorbell if doorbell write is lost */
   463		for (i = 0; i < MAX_REARM_RETRY; i++) {
   464			v = RREG32_NO_KIQ(ih_regs->ih_rb_rptr);
   465			if ((v < ih->ring_size) && (v != ih->rptr))
   466				WDOORBELL32(ih->doorbell_index, ih->rptr);
   467			else
   468				break;
   469		}
   470	}
   471	
   472	/**
   473	 * ih_v8_0_set_rptr - set the IH ring buffer rptr
   474	 *
   475	 * @adev: amdgpu_device pointer
   476	 * @ih: IH ring buffer to set rptr
   477	 */
   478	static void ih_v8_0_set_rptr(struct amdgpu_device *adev,
   479				     struct amdgpu_ih_ring *ih)
   480	{
   481		struct amdgpu_ih_regs *ih_regs;
   482	
   483		if (ih->use_doorbell) {
   484			/* XXX check if swapping is necessary on BE */
   485			*ih->rptr_cpu = ih->rptr;
   486			WDOORBELL32(ih->doorbell_index, ih->rptr);
   487	
   488			if (amdgpu_sriov_vf(adev))
   489				ih_v8_0_irq_rearm(adev, ih);
   490		} else {
   491			ih_regs = &ih->ih_regs;
   492			WREG32(ih_regs->ih_rb_rptr, ih->rptr);
   493		}
   494	}
   495	
   496	/**
   497	 * ih_v8_0_self_irq - dispatch work for ring 1
   498	 *
   499	 * @adev: amdgpu_device pointer
   500	 * @source: irq source
   501	 * @entry: IV with WPTR update
   502	 *
   503	 * Update the WPTR from the IV and schedule work to handle the entries.
   504	 */
   505	static int ih_v8_0_self_irq(struct amdgpu_device *adev,
   506				    struct amdgpu_irq_src *source,
   507				    struct amdgpu_iv_entry *entry)
   508	{
 > 509		uint32_t wptr = cpu_to_le32(entry->src_data[0]);
   510	
   511		switch (entry->ring_id) {
   512		case 1:
   513			*adev->irq.ih1.wptr_cpu = wptr;
   514			schedule_work(&adev->irq.ih1_work);
   515			break;
   516		default: break;
   517		}
   518		return 0;
   519	}
   520	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
