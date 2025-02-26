Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74D2153FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573894; cv=none; b=XZSgpdEzsbAve/Ri1U2EFeRba+BLfZ2aGkK1ibPiv7ksfSi6iKTbj/0R+yJUaELRA7SK2y9akquZ2rdRNXO+T7roqD9I4PWX8t0Hq8hJCMY4q9m7G3V7BWikc7SKbRCvlhxTL1zv43Yh5T4vJweNVKFPOKm/kn3DkIelxqypTW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573894; c=relaxed/simple;
	bh=PMSY+E7Tx5z7Al8tk6Qtx+EQtN/E4iivuPsDMShlV7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3wrWzFKD/B4s/EOmgQvxNP1J85+zQKB3MEF9BofrLc6u3MZWNMjedaCOSuyXJJRMvByYTxZsrmr7l2Pj8T4Mq9Y32Vq9RT7kXWaTwOz1z+447cJZhEJX2psoqkoZlUg0H97S2Vqq23E1kRRnSxfhWb9lHqHLXejGrstnTwk858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1qcW8Ob; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1qcW8Ob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740573893; x=1772109893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMSY+E7Tx5z7Al8tk6Qtx+EQtN/E4iivuPsDMShlV7M=;
  b=e1qcW8Ob4X0vEdaB6WBk07TsXn2oLMAKeLcEp0Fd/gDTbHL3c7cn0RYi
   UM4SD0FP4AIJGmZixJYS9YJ/R4n5a47EVSbkwLgecQqYCx/J7CWUYwNl2
   8XjMHqa+xzyTwNGaTnEwNiCvug52xWpurxFfPe4L3YS8AGa5Zd8BT1QIH
   2R0dfrBdOo0i402A8MItLyebQ7edCjSGBf9uYytcac0eMWeWG/z+ruV72
   pzxuOHSuOQnOnMdAExPOAiU/kQJCZF8HuG2eMFUw3mXRvlqnJc5AUI4iL
   ipETeB83NgQpIR0myef/e4XT7eEUFJkVtKX9zdQ76pd8JoKk/q8nnopHW
   g==;
X-CSE-ConnectionGUID: Pga/YSgXQyOVxCgCS5kXYQ==
X-CSE-MsgGUID: lDrDAqkGRtKwsA82SRq8Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41611846"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41611846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:44:53 -0800
X-CSE-ConnectionGUID: rdIj75CbS6GOyt9Rw65rGQ==
X-CSE-MsgGUID: QdfG9WVkSxSqjgtNGv5hCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116503606"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2025 04:44:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnGmN-000Bhb-3B;
	Wed, 26 Feb 2025 12:44:47 +0000
Date: Wed, 26 Feb 2025 20:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Jesse.zhang" <Jesse.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Jesse Zhang <jesse.zhang@amd.com>
Subject: [linux-next:master 6186/6583]
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:473: warning: Function parameter or
 struct member 'adev' not described in
 'amdgpu_sdma_register_on_reset_callbacks'
Message-ID: <202502262053.lncZxoNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: f33044952c24f85a1527f91440b89d4423840de2 [6186/6583] drm/amdgpu/kfd: Add shared SDMA reset functionality with callback support
config: i386-buildonly-randconfig-003-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262053.lncZxoNt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502262053.lncZxoNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262053.lncZxoNt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:473: warning: Function parameter or struct member 'adev' not described in 'amdgpu_sdma_register_on_reset_callbacks'


vim +473 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c

   463	
   464	/**
   465	 * amdgpu_sdma_register_on_reset_callbacks - Register SDMA reset callbacks
   466	 * @funcs: Pointer to the callback structure containing pre_reset and post_reset functions
   467	 *
   468	 * This function allows KFD and AMDGPU to register their own callbacks for handling
   469	 * pre-reset and post-reset operations for engine reset. These are needed because engine
   470	 * reset will stop all queues on that engine.
   471	 */
   472	void amdgpu_sdma_register_on_reset_callbacks(struct amdgpu_device *adev, struct sdma_on_reset_funcs *funcs)
 > 473	{
   474		if (!funcs)
   475			return;
   476	
   477		/* Initialize the list node in the callback structure */
   478		INIT_LIST_HEAD(&funcs->list);
   479	
   480		/* Add the callback structure to the global list */
   481		list_add_tail(&funcs->list, &adev->sdma.reset_callback_list);
   482	}
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
