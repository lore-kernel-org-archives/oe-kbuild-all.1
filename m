Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD774CB5B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265662; cv=none; b=h8zSihUY69ypAvbG3dYWBh26px5XCz2+FkgRukw/cY+3Kkvk4HbADGXRO4C/O+yyQZMPxRBO/XbEnQv0Z7SrwR3KVkDdzRaaJM8YVFQai+MOVQwk8tfKFSyvi+0ftY3dd4nVDlXSCvsg70DdvTlgSUnydOWYwtkTz8BJ8/8VpLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265662; c=relaxed/simple;
	bh=F2CsFEfWiTbFJQyVCU1ukBuMYudXGhXA+USN614DUTU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MtTm/A8/UeVzYTPh04wUpxM+gujYBkpchtAvEW+PDTGQFax9EN6s8yD7lCl3P8I7iW1AjklWIChMoyNU+sEEV3r/o9jmP3SI9POxrhaAPGZr50mYzDxfUUp2cPc6sDn2BeQu6UX1WsyQbeYvwC6vcVgWgsSevT2+s773VPFc+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+S847Fh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+S847Fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767265659; x=1798801659;
  h=date:from:to:cc:subject:message-id;
  bh=F2CsFEfWiTbFJQyVCU1ukBuMYudXGhXA+USN614DUTU=;
  b=K+S847Fhh4bFI8h+9GvV3dTp7DZD+CBG/LTeDcfH/gstgqzyTgu6kETf
   RDVmpzk8TPnRQWrUghuX5vQE06jNqzdBl8DP96hRHkHWjnaNRvj5ivGr+
   aO5u/fwR3GgJFgXkSjdFABzoBdQvzHTbdDwCOGE9SNvYefzSOBAmLKlee
   ngxXYPU7gKy6UioHBd+BVNEGhSz34FkNKtpdvYouVdC4DFkDdBpv8LxEg
   0kd2H5ac7vSP9/jFjyopM+LDwJ2R75xISftdhJD91T86+gJUakHCDCWPQ
   slYDeGIBObQNqL7JSmepWM3vPKg5dvn7QaxWyHOFM8tdJlVqY34ijdmOR
   A==;
X-CSE-ConnectionGUID: D7c5eu7ZS6mJUv+QmiqgjA==
X-CSE-MsgGUID: IIJHHSlNSluSEawEGMZufw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68787433"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="68787433"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 03:07:39 -0800
X-CSE-ConnectionGUID: WIr62LIyRXmfb1L17/+fqQ==
X-CSE-MsgGUID: KssvcoWiSsakybgAS0Ayng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="206138323"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2026 03:07:37 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbGWl-000000001qT-1JzC;
	Thu, 01 Jan 2026 11:07:35 +0000
Date: Thu, 01 Jan 2026 19:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [drm-msm:msm-next-external-fixes 32/32]
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c:365:19: error: redefinition of
 'a6xx_gpu'
Message-ID: <202601011939.DSyCwgBI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-external-fixes
head:   bcf2c5315e73f60104224b7fbf07a3d9f213efab
commit: bcf2c5315e73f60104224b7fbf07a3d9f213efab [32/32] drm/msm: Wait for MMU devcoredump when waiting for GMU
config: arm64-randconfig-003-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011939.DSyCwgBI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011939.DSyCwgBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011939.DSyCwgBI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: In function 'a6xx_gmu_set_oob':
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:365:19: error: redefinition of 'a6xx_gpu'
     struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
                      ^~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:360:19: note: previous definition of 'a6xx_gpu' was here
     struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
                      ^~~~~~~~


vim +/a6xx_gpu +365 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

   356	
   357	/* Trigger a OOB (out of band) request to the GMU */
   358	int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
   359	{
   360		struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
   361		struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
   362		int ret;
   363		u32 val;
   364		int request, ack;
 > 365		struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
   366	
   367		WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
   368	
   369		/* Skip OOB calls since RGMU is not enabled */
   370		if (adreno_has_rgmu(adreno_gpu))
   371			return 0;
   372	
   373		if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
   374			return -EINVAL;
   375	
   376		if (gmu->legacy) {
   377			request = a6xx_gmu_oob_bits[state].set;
   378			ack = a6xx_gmu_oob_bits[state].ack;
   379		} else {
   380			request = a6xx_gmu_oob_bits[state].set_new;
   381			ack = a6xx_gmu_oob_bits[state].ack_new;
   382			if (!request || !ack) {
   383				DRM_DEV_ERROR(gmu->dev,
   384					      "Invalid non-legacy GMU request %s\n",
   385					      a6xx_gmu_oob_bits[state].name);
   386				return -EINVAL;
   387			}
   388		}
   389	
   390		/* Trigger the equested OOB operation */
   391		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
   392	
   393		do {
   394			/* Wait for the acknowledge interrupt */
   395			ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
   396				val & (1 << ack), 100, 10000);
   397	
   398			if (!ret)
   399				break;
   400	
   401			if (completion_done(&a6xx_gpu->base.fault_coredump_done))
   402				break;
   403	
   404			/* We may timeout because the GMU is temporarily wedged from
   405			 * pending faults from the GPU and we are taking a devcoredump.
   406			 * Wait until the MMU is resumed and try again.
   407			 */
   408			wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
   409		} while (true);
   410	
   411		if (ret)
   412			DRM_DEV_ERROR(gmu->dev,
   413				"Timeout waiting for GMU OOB set %s: 0x%x\n",
   414					a6xx_gmu_oob_bits[state].name,
   415					gmu_read(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO));
   416	
   417		/* Clear the acknowledge interrupt */
   418		gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_CLR, 1 << ack);
   419	
   420		return ret;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
