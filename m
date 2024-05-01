Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2036A433D4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570524; cv=none; b=DijVGf4LkmPzBWuOpHUD/a7V9aLZ23LwDoB0Ic8gPPubysFT1HXmTJDDAR+Dy/dOj18NYln5wgbBtIiLBYmvGbOmLF3KdmsYtUpmljKOg+1Mj7Yw1Q/nEWF33TZzZseGse7Mg3TSCIV5AdRZzco9HkL4gNLUZmCMZK8TCYuaLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570524; c=relaxed/simple;
	bh=07TIKvOPB4VyhDClHWR02rziWUkzDlVHKgt/FjUIO2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLdBL3ogiyYsbjV4mCf/vbhlkvOXxY5vjmed2iVpFh3Pmjln56/7IAmEDTk1MICmTOtHE8oZiqF1J0LZk2687Cz07xS5l0yTgpqPTFWLEM0KCt9j4Hahd/VGJBqBs7eEL1bl/2FyGA4958ng9Y5n8WpyGzm62Dyi8uCYCFNDAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMo4Vzx3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMo4Vzx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714570522; x=1746106522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07TIKvOPB4VyhDClHWR02rziWUkzDlVHKgt/FjUIO2U=;
  b=TMo4Vzx3ppZHKmHLyp7YfpdmQGhCMJZF2pM0XljDaRYzRb6nEjLCp0gL
   kHtjke8ewLwW+NPFUypPBHf/qkMA7bvB5/mUaCpe/FCkG9kmwjyErVHs0
   uU76o7bNuGt3sevz+xCHUfzmHZTT4yZeXxAN5vYpiTbFmPoJkSYnx5xUy
   1pBvtga7Vussh5I2d16+IkXflW4Xw+RqHnUA327g5av7WNrWgGaft0hrI
   E2ZhzRcljf60NIOGFQfGsgRYR56lIgDdgcjdD0gMoEBLAc+QrSY4Xa7Yc
   0U0OT0wOskIcj9/yVC6j+JXATLYmdSwlkmdd32yoRaJmZQuCRjSNLgdpp
   g==;
X-CSE-ConnectionGUID: UOdYFJTRQ2iaSd5DAKYsgg==
X-CSE-MsgGUID: Qc4B4p4OQjWu/lf76zNwFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14077109"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="14077109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 06:35:21 -0700
X-CSE-ConnectionGUID: bIXdqYcLQVSEBXPTwYzkFw==
X-CSE-MsgGUID: qks5NLE8Qsm5aPKfM4wfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="27269741"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2024 06:35:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2A7B-0009Y6-1N;
	Wed, 01 May 2024 13:35:17 +0000
Date: Wed, 1 May 2024 21:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Likun Gao <Likun.Gao@amd.com>
Subject: [linux-next:master 9749/10134]
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c:290: warning: Function parameter or
 struct member 'vmhub' not described in 'gmc_v12_0_flush_gpu_tlb'
Message-ID: <202405012128.UZdRC5sp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 075b44aa210bd8be1c2c23ba742218fc4fc2bfa8 [9749/10134] drm/amdgpu: Add gmc v12_0 ip block support (v7)
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405012128.UZdRC5sp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012128.UZdRC5sp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012128.UZdRC5sp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c:290: warning: Function parameter or struct member 'vmhub' not described in 'gmc_v12_0_flush_gpu_tlb'
>> drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c:290: warning: Function parameter or struct member 'flush_type' not described in 'gmc_v12_0_flush_gpu_tlb'
>> drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c:330: warning: Function parameter or struct member 'flush_type' not described in 'gmc_v12_0_flush_gpu_tlb_pasid'
>> drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c:330: warning: Function parameter or struct member 'all_hub' not described in 'gmc_v12_0_flush_gpu_tlb_pasid'
>> drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c:330: warning: Function parameter or struct member 'inst' not described in 'gmc_v12_0_flush_gpu_tlb_pasid'


vim +290 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c

   279	
   280	/**
   281	 * gmc_v12_0_flush_gpu_tlb - gart tlb flush callback
   282	 *
   283	 * @adev: amdgpu_device pointer
   284	 * @vmid: vm instance to flush
   285	 *
   286	 * Flush the TLB for the requested page table.
   287	 */
   288	static void gmc_v12_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
   289						uint32_t vmhub, uint32_t flush_type)
 > 290	{
   291		if ((vmhub == AMDGPU_GFXHUB(0)) && !adev->gfx.is_poweron)
   292			return;
   293	
   294		/* flush hdp cache */
   295		adev->hdp.funcs->flush_hdp(adev, NULL);
   296	
   297		/* This is necessary for SRIOV as well as for GFXOFF to function
   298		 * properly under bare metal
   299		 */
   300		if ((adev->gfx.kiq[0].ring.sched.ready || adev->mes.ring.sched.ready) &&
   301		    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev))) {
   302			struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
   303			const unsigned eng = 17;
   304			u32 inv_req = hub->vmhub_funcs->get_invalidate_req(vmid, flush_type);
   305			u32 req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
   306			u32 ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
   307	
   308			amdgpu_gmc_fw_reg_write_reg_wait(adev, req, ack, inv_req,
   309					1 << vmid, GET_INST(GC, 0));
   310			return;
   311		}
   312	
   313		mutex_lock(&adev->mman.gtt_window_lock);
   314		gmc_v12_0_flush_vm_hub(adev, vmid, vmhub, 0);
   315		mutex_unlock(&adev->mman.gtt_window_lock);
   316		return;
   317	}
   318	
   319	/**
   320	 * gmc_v12_0_flush_gpu_tlb_pasid - tlb flush via pasid
   321	 *
   322	 * @adev: amdgpu_device pointer
   323	 * @pasid: pasid to be flush
   324	 *
   325	 * Flush the TLB for the requested pasid.
   326	 */
   327	static void gmc_v12_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
   328						  uint16_t pasid, uint32_t flush_type,
   329						  bool all_hub, uint32_t inst)
 > 330	{
   331		uint16_t queried;
   332		int vmid, i;
   333	
   334		for (vmid = 1; vmid < 16; vmid++) {
   335			bool valid;
   336	
   337			valid = gmc_v12_0_get_vmid_pasid_mapping_info(adev, vmid,
   338								      &queried);
   339			if (!valid || queried != pasid)
   340				continue;
   341	
   342			if (all_hub) {
   343				for_each_set_bit(i, adev->vmhubs_mask,
   344						 AMDGPU_MAX_VMHUBS)
   345					gmc_v12_0_flush_gpu_tlb(adev, vmid, i,
   346								flush_type);
   347			} else {
   348				gmc_v12_0_flush_gpu_tlb(adev, vmid, AMDGPU_GFXHUB(0),
   349							flush_type);
   350			}
   351		}
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
