Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA3194A67
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863463; cv=none; b=AEQeMGBWcy3SKsp/kU6+OEfhoA8eEGCu3EoYcMX2T+eg1pLujzHOCVgtp4Oj02Qr4MXcIkJDj0Kn+03q6cgJtTC4NjFsceAT1KDAU9L7HHdRhBJ6Tsez9cEtLlaQs5p7DJ5b9Ph4YTTZhkJfhCAIKMnfH1zXw5hbEHaM/Q0Ud/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863463; c=relaxed/simple;
	bh=5lxrxIvoBUMik1KRYjcoEQDL7XhotazrgH0VYwDdwW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bxT6yVsU2FRy9BJDtNL1b42phVziriaVxy1QWGMFXdaoYqejKjXlvdc6JVa1jF9Wm+coadaGvOoIS+YYzz1XPWsaPiTpwfy6gCPa9vBENhcFvbBoKY9ZZ4DPWo1bECkI6rJZpgtF4ha9v7NHFaY6iKVkZu2y+aLg7nqUbeI+Tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrRfSCkb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrRfSCkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727863461; x=1759399461;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5lxrxIvoBUMik1KRYjcoEQDL7XhotazrgH0VYwDdwW4=;
  b=RrRfSCkbJjtcTK0GA8UQg1OkQYTk6Q1UPjX059WREynqzX9nid7g//bG
   41mJH/0MShHku/lFU1quAUfuV/TSLk5lFATMoflx2XazRNG0gfKCp8qWc
   Xumy0JLji1aZO/gWwjNv1aW+A/rMJJPwZu9d1sSH4LnRveRL4iJTa8np6
   Rcyb+87ooKrVVtL5qh67HPypccCwmUII+4rWScSqQ5Bq9eTl4v+urPCTG
   +SXAjf3HzQFJtbT5eX7QKT7aXB1LABCgdwLba0CNtkjZzHMsYcd0x4bxs
   bSOusjUYCJfXuQ7CP2V2IYiCrlK0yDoZnDfQaT6fKGvAk3wtAzZ95ZFV6
   g==;
X-CSE-ConnectionGUID: Ec+1Id41RbSoOTuJIRUVHg==
X-CSE-MsgGUID: 9b44Z2FmTQ6BY4eQoRC3fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="29897347"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="29897347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:04:13 -0700
X-CSE-ConnectionGUID: ko9ScsCyRhOWqI7kGCyv6A==
X-CSE-MsgGUID: NUh4wwhIQCWX8ogwstuFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74383559"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2024 03:04:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svwDI-000Rtn-29;
	Wed, 02 Oct 2024 10:04:08 +0000
Date: Wed, 2 Oct 2024 18:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 1759/2025]
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:485: warning: Function parameter or
 struct member 'ip_block' not described in 'jpeg_v1_0_sw_init'
Message-ID: <202410021805.ih3ycw6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sunil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
commit: d5347e8d2711bb01c79698408ec189a7b7cfe45e [1759/2025] drm/amdgpu: update the handle ptr in sw_init
config: riscv-buildonly-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20241002/202410021805.ih3ycw6J-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021805.ih3ycw6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021805.ih3ycw6J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:466: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:485: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v1_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c:485: warning: Excess function parameter 'handle' description in 'jpeg_v1_0_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:49: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:69: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c:69: warning: Excess function parameter 'handle' description in 'jpeg_v2_0_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:58: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:89: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v2_5_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:89: warning: Excess function parameter 'handle' description in 'jpeg_v2_5_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:104: warning: Excess function parameter 'handle' description in 'vcn_v1_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:126: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v1_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:126: warning: Excess function parameter 'handle' description in 'vcn_v1_0_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:56: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:56: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:78: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c:78: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:69: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_5_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:69: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:102: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_5_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c:102: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_5_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:50: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v5_0_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:50: warning: Excess function parameter 'handle' description in 'jpeg_v5_0_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:70: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v5_0_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c:70: warning: Excess function parameter 'handle' description in 'jpeg_v5_0_0_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:50: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v3_0_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:50: warning: Excess function parameter 'handle' description in 'jpeg_v3_0_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:83: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v3_0_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c:83: warning: Excess function parameter 'handle' description in 'jpeg_v3_0_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:76: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_3_early_init'
   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:76: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_3_early_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:96: warning: Function parameter or struct member 'ip_block' not described in 'jpeg_v4_0_3_sw_init'
>> drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c:96: warning: Excess function parameter 'handle' description in 'jpeg_v4_0_3_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:113: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:113: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:132: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_5_sw_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:132: warning: Excess function parameter 'handle' description in 'vcn_v4_0_5_sw_init'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:119: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_5_early_init'
   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:119: warning: Excess function parameter 'handle' description in 'vcn_v2_5_early_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:159: warning: Function parameter or struct member 'ip_block' not described in 'vcn_v2_5_sw_init'
>> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:159: warning: Excess function parameter 'handle' description in 'vcn_v2_5_sw_init'
..


vim +485 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c

bb0db70f3f75e0 Leo Liu         2019-11-08  477  
bb0db70f3f75e0 Leo Liu         2019-11-08  478  /**
bb0db70f3f75e0 Leo Liu         2019-11-08  479   * jpeg_v1_0_sw_init - sw init for JPEG block
bb0db70f3f75e0 Leo Liu         2019-11-08  480   *
bb0db70f3f75e0 Leo Liu         2019-11-08  481   * @handle: amdgpu_device pointer
bb0db70f3f75e0 Leo Liu         2019-11-08  482   *
bb0db70f3f75e0 Leo Liu         2019-11-08  483   */
d5347e8d2711bb Sunil Khatri    2024-09-26  484  int jpeg_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
bb0db70f3f75e0 Leo Liu         2019-11-08 @485  {
d5347e8d2711bb Sunil Khatri    2024-09-26  486  	struct amdgpu_device *adev = ip_block->adev;
bb0db70f3f75e0 Leo Liu         2019-11-08  487  	struct amdgpu_ring *ring;
bb0db70f3f75e0 Leo Liu         2019-11-08  488  	int r;
bb0db70f3f75e0 Leo Liu         2019-11-08  489  
bb0db70f3f75e0 Leo Liu         2019-11-08  490  	/* JPEG TRAP */
bb0db70f3f75e0 Leo Liu         2019-11-08  491  	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN, 126, &adev->jpeg.inst->irq);
bb0db70f3f75e0 Leo Liu         2019-11-08  492  	if (r)
bb0db70f3f75e0 Leo Liu         2019-11-08  493  		return r;
bb0db70f3f75e0 Leo Liu         2019-11-08  494  
bc224553843e52 James Zhu       2022-05-24  495  	ring = adev->jpeg.inst->ring_dec;
f4caf5842652f0 Hawking Zhang   2022-09-14  496  	ring->vm_hub = AMDGPU_MMHUB0(0);
bb0db70f3f75e0 Leo Liu         2019-11-08  497  	sprintf(ring->name, "jpeg_dec");
1c6d567bdf73a2 Nirmoy Das      2020-04-01  498  	r = amdgpu_ring_init(adev, ring, 512, &adev->jpeg.inst->irq,
c107171b8d3241 Christian König 2021-02-02  499  			     0, AMDGPU_RING_PRIO_DEFAULT, NULL);
bb0db70f3f75e0 Leo Liu         2019-11-08  500  	if (r)
bb0db70f3f75e0 Leo Liu         2019-11-08  501  		return r;
bb0db70f3f75e0 Leo Liu         2019-11-08  502  
bc224553843e52 James Zhu       2022-05-24  503  	adev->jpeg.internal.jpeg_pitch[0] = adev->jpeg.inst->external.jpeg_pitch[0] =
bb0db70f3f75e0 Leo Liu         2019-11-08  504  		SOC15_REG_OFFSET(JPEG, 0, mmUVD_JPEG_PITCH);
bb0db70f3f75e0 Leo Liu         2019-11-08  505  
bb0db70f3f75e0 Leo Liu         2019-11-08  506  	return 0;
bb0db70f3f75e0 Leo Liu         2019-11-08  507  }
bb0db70f3f75e0 Leo Liu         2019-11-08  508  

:::::: The code at line 485 was first introduced by commit
:::::: bb0db70f3f75e0d994a627f22c3ff2d8ec6191c4 drm/amdgpu: separate JPEG1.0 code out from VCN1.0

:::::: TO: Leo Liu <leo.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
