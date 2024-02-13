Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1A37710
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707825472; cv=none; b=XU6w7/+Yp8VD4gTxez/L3MX9JMG0bn5uJ98jJzdg0PBCT2He+rRno4g64vU841xRvxB6iX3FCj/UCxRayj5w6A4gzYZCQ/5e6t6Bs4YM5QUYFusJhz8LJftF/jOIdYJSyLhI7HsEOxtE5IHgHnNGz9u0HvP3rbEdcCK3eh5eAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707825472; c=relaxed/simple;
	bh=zCi0/8QCwrodvYnJpEPkyRVQpl/IXXCzu6mJMZnoYRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfI26UqvAg4QD1RpysF82xDekoSW8Bezpf26VjPdx6eljCM2Rt+0o3hntNnWSn3A0iaxrPYSNWqrhXZDFDFDgf2WgssK/AcX6/jK9oz7Jlzsg1SXwsMIhm8rGrXVvGjetOhtRbWiHq22K9Q8rsB+I6RJDe+2UFl7dzNgb7ijkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhqwsfkS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhqwsfkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707825471; x=1739361471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCi0/8QCwrodvYnJpEPkyRVQpl/IXXCzu6mJMZnoYRg=;
  b=YhqwsfkSZ/QTssSnLffBrAxuZSmt7x4reFLOF8DNLgslu5xNjtJNE6gi
   EA+KtdO+QWNUZjdkCSStk9ZqLYfHRMfesXJokASprhyOndmbqi+XjEC2O
   402wmECxWBUFlQLgBhweyPh161Qfxplo8oama65rY1Cslc5xtKuTvKsy5
   pRa3PlSzODvbydEyQ9/DgHUmyDlkTaTkNuamuMi3ODQ8EWmMTmkz0jcjg
   EmLzIZPHgwhCqEl+bMZY+d833zs7Wa/MNOSsg81ANz9LS7p4KN7cDAS6A
   wcghdGZUNBaR4gwWsXbZBX6tca9/55ijgGbIlfxybGUEXTFrP/u35DZ80
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="4792929"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="4792929"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2910679"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2024 03:57:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZrQ1-0007hm-2a;
	Tue, 13 Feb 2024 11:57:45 +0000
Date: Tue, 13 Feb 2024 19:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 6193/6424]
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:392: warning: Function parameter or
 struct member 'ih' not described in 'ih_v7_0_get_wptr'
Message-ID: <202402131939.ajKHyCog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
commit: 12443fc53e7d7fad52cb4b534dea6be525d05d62 [6193/6424] drm/amdgpu: Add ih v7_0 ip block support
config: arm-randconfig-001-20240213 (https://download.01.org/0day-ci/archive/20240213/202402131939.ajKHyCog-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131939.ajKHyCog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131939.ajKHyCog-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:392: warning: Function parameter or struct member 'ih' not described in 'ih_v7_0_get_wptr'
>> drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:432: warning: Function parameter or struct member 'ih' not described in 'ih_v7_0_irq_rearm'
>> drivers/gpu/drm/amd/amdgpu/ih_v7_0.c:458: warning: Function parameter or struct member 'ih' not described in 'ih_v7_0_set_rptr'


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
