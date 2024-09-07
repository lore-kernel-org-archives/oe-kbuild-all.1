Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE615A843
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730689; cv=none; b=sP6WQc3EwJvE/PGx6tAJHRQG/pIL3eaDZ8dPlqPb2HpFAnXfM1rT4A9Zk+CeWmTlfg9RJHCznoV/TrPyXXPq3v/FZufzqlpWfGyQN0TncolZCRvmrmwUdL5qLtU3wKfF2d3WzmrwJkrrE1/j4zg/HRlWmcn88PPHH3J64+3WwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730689; c=relaxed/simple;
	bh=ut056WosS5bH9O8MuEeJK01sOG52OioJ7v3sbE25gXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQIDxrnozGMJskGGadnJZq/p7SOBBaMo9AZnEgTv7xtV8taRYFUdw54PVTNn1sOepyDBzmqB1apc/bUcbt7wJ4H//D/clL4+F4PAagVAY9UKzbQFpL/VQjV5mRf3RXRiKoYOKCtkaKOpqwSPHUOOoQyxz8qyNG24ydsROj/UnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zjg2HNwK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zjg2HNwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725730687; x=1757266687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ut056WosS5bH9O8MuEeJK01sOG52OioJ7v3sbE25gXI=;
  b=Zjg2HNwKlREYaA8KD1s6wpIS2kly01dHXXb4QPI5v2G4NaGoPjTwMRoa
   Tb/9/mVSYpuvoh41GjeZWfaUiM2vLWRXdGt817UPNhL3PO30mdpQuxEKQ
   b5WuoRGZTrkIEQz1uGfeBJABj4LIsrYJIv2aIuKB0mxrHiONgApj8Gazr
   tOqQTckr560hqJWGK/wTFiKJJj2A0yQ4kZUhl+aEgE04nCnUhpnXI4i6a
   asSrXMoNiNFtgRWpSFRkFil7ah2MoqVqgcEkqOWFLs7IFMWpIA5bwJf4G
   KCtZ7zSwq55/CDKPK7ORG9sv+jfblrtEN6uxOAxvHNdfdKJ3q4ooPj1PT
   Q==;
X-CSE-ConnectionGUID: tqfrAfWvT9mRqIJHwYaPzA==
X-CSE-MsgGUID: z9/ec/uASwCJ4h8Mn+wvsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24265631"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24265631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:38:05 -0700
X-CSE-ConnectionGUID: ZK29G6hORkmc0tIX2+Hk3g==
X-CSE-MsgGUID: 5CN3PwV5QuOZDtTQgqAoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66788055"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Sep 2024 10:38:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzNp-000Cn5-1e;
	Sat, 07 Sep 2024 17:38:01 +0000
Date: Sun, 8 Sep 2024 01:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10291/10296]
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:416:18: warning: this 'if' clause
 does not guard...
Message-ID: <202409080140.ncu18wOy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: be28b79807f6ed29ff87ffedfac848ea50c1e2fe [10291/10296] fix up for "lib/string_choices: Add str_true_false()/str_false_true() helper'
config: s390-randconfig-r004-20220823 (https://download.01.org/0day-ci/archive/20240908/202409080140.ncu18wOy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080140.ncu18wOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080140.ncu18wOy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c: In function 'mes_v11_0_reset_queue_mmio':
>> drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:416:18: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     416 |                 for (i = 0; i < adev->usec_timeout; i++) {
         |                  ^~
   In file included from include/linux/delay.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:62,
                    from drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:26:
   arch/s390/include/asm/delay.h:21:19: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
      21 | #define udelay(n) __udelay((unsigned long)(n))
         |                   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:418:25: note: in expansion of macro 'udelay'
     418 |                         break;
         |                         ^~~~~~


vim +/if +416 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c

028c3fb37e705b Jack Xiao   2022-04-13  363  
178ad0e280c088 Jiadong Zhu 2024-07-04  364  static int mes_v11_0_reset_queue_mmio(struct amdgpu_mes *mes, uint32_t queue_type,
178ad0e280c088 Jiadong Zhu 2024-07-04  365  				      uint32_t me_id, uint32_t pipe_id,
178ad0e280c088 Jiadong Zhu 2024-07-04  366  				      uint32_t queue_id, uint32_t vmid)
178ad0e280c088 Jiadong Zhu 2024-07-04  367  {
178ad0e280c088 Jiadong Zhu 2024-07-04  368  	struct amdgpu_device *adev = mes->adev;
178ad0e280c088 Jiadong Zhu 2024-07-04  369  	uint32_t value;
178ad0e280c088 Jiadong Zhu 2024-07-04  370  	int i, r = 0;
178ad0e280c088 Jiadong Zhu 2024-07-04  371  
178ad0e280c088 Jiadong Zhu 2024-07-04  372  	amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
178ad0e280c088 Jiadong Zhu 2024-07-04  373  
178ad0e280c088 Jiadong Zhu 2024-07-04  374  	if (queue_type == AMDGPU_RING_TYPE_GFX) {
178ad0e280c088 Jiadong Zhu 2024-07-04  375  		dev_info(adev->dev, "reset gfx queue (%d:%d:%d: vmid:%d)\n",
178ad0e280c088 Jiadong Zhu 2024-07-04  376  			 me_id, pipe_id, queue_id, vmid);
178ad0e280c088 Jiadong Zhu 2024-07-04  377  
178ad0e280c088 Jiadong Zhu 2024-07-04  378  		mutex_lock(&adev->gfx.reset_sem_mutex);
178ad0e280c088 Jiadong Zhu 2024-07-04  379  		gfx_v11_0_request_gfx_index_mutex(adev, true);
178ad0e280c088 Jiadong Zhu 2024-07-04  380  		/* all se allow writes */
178ad0e280c088 Jiadong Zhu 2024-07-04  381  		WREG32_SOC15(GC, 0, regGRBM_GFX_INDEX,
178ad0e280c088 Jiadong Zhu 2024-07-04  382  			     (uint32_t)(0x1 << GRBM_GFX_INDEX__SE_BROADCAST_WRITES__SHIFT));
178ad0e280c088 Jiadong Zhu 2024-07-04  383  		value = REG_SET_FIELD(0, CP_VMID_RESET, RESET_REQUEST, 1 << vmid);
178ad0e280c088 Jiadong Zhu 2024-07-04  384  		if (pipe_id == 0)
178ad0e280c088 Jiadong Zhu 2024-07-04  385  			value = REG_SET_FIELD(value, CP_VMID_RESET, PIPE0_QUEUES, 1 << queue_id);
178ad0e280c088 Jiadong Zhu 2024-07-04  386  		else
178ad0e280c088 Jiadong Zhu 2024-07-04  387  			value = REG_SET_FIELD(value, CP_VMID_RESET, PIPE1_QUEUES, 1 << queue_id);
178ad0e280c088 Jiadong Zhu 2024-07-04  388  		WREG32_SOC15(GC, 0, regCP_VMID_RESET, value);
178ad0e280c088 Jiadong Zhu 2024-07-04  389  		gfx_v11_0_request_gfx_index_mutex(adev, false);
178ad0e280c088 Jiadong Zhu 2024-07-04  390  		mutex_unlock(&adev->gfx.reset_sem_mutex);
178ad0e280c088 Jiadong Zhu 2024-07-04  391  
178ad0e280c088 Jiadong Zhu 2024-07-04  392  		mutex_lock(&adev->srbm_mutex);
178ad0e280c088 Jiadong Zhu 2024-07-04  393  		soc21_grbm_select(adev, me_id, pipe_id, queue_id, 0);
178ad0e280c088 Jiadong Zhu 2024-07-04  394  		/* wait till dequeue take effects */
178ad0e280c088 Jiadong Zhu 2024-07-04  395  		for (i = 0; i < adev->usec_timeout; i++) {
178ad0e280c088 Jiadong Zhu 2024-07-04  396  			if (!(RREG32_SOC15(GC, 0, regCP_GFX_HQD_ACTIVE) & 1))
178ad0e280c088 Jiadong Zhu 2024-07-04  397  				break;
178ad0e280c088 Jiadong Zhu 2024-07-04  398  			udelay(1);
178ad0e280c088 Jiadong Zhu 2024-07-04  399  		}
178ad0e280c088 Jiadong Zhu 2024-07-04  400  		if (i >= adev->usec_timeout) {
178ad0e280c088 Jiadong Zhu 2024-07-04  401  			dev_err(adev->dev, "failed to wait on gfx hqd deactivate\n");
178ad0e280c088 Jiadong Zhu 2024-07-04  402  			r = -ETIMEDOUT;
178ad0e280c088 Jiadong Zhu 2024-07-04  403  		}
178ad0e280c088 Jiadong Zhu 2024-07-04  404  
178ad0e280c088 Jiadong Zhu 2024-07-04  405  		soc21_grbm_select(adev, 0, 0, 0, 0);
178ad0e280c088 Jiadong Zhu 2024-07-04  406  		mutex_unlock(&adev->srbm_mutex);
178ad0e280c088 Jiadong Zhu 2024-07-04  407  	} else if (queue_type == AMDGPU_RING_TYPE_COMPUTE) {
178ad0e280c088 Jiadong Zhu 2024-07-04  408  		dev_info(adev->dev, "reset compute queue (%d:%d:%d)\n",
178ad0e280c088 Jiadong Zhu 2024-07-04  409  			 me_id, pipe_id, queue_id);
178ad0e280c088 Jiadong Zhu 2024-07-04  410  		mutex_lock(&adev->srbm_mutex);
178ad0e280c088 Jiadong Zhu 2024-07-04  411  		soc21_grbm_select(adev, me_id, pipe_id, queue_id, 0);
178ad0e280c088 Jiadong Zhu 2024-07-04  412  		WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 0x2);
178ad0e280c088 Jiadong Zhu 2024-07-04  413  		WREG32_SOC15(GC, 0, regSPI_COMPUTE_QUEUE_RESET, 0x1);
178ad0e280c088 Jiadong Zhu 2024-07-04  414  
178ad0e280c088 Jiadong Zhu 2024-07-04  415  		/* wait till dequeue take effects */
178ad0e280c088 Jiadong Zhu 2024-07-04 @416  		for (i = 0; i < adev->usec_timeout; i++) {
178ad0e280c088 Jiadong Zhu 2024-07-04  417  			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
178ad0e280c088 Jiadong Zhu 2024-07-04  418  			break;
178ad0e280c088 Jiadong Zhu 2024-07-04  419  			udelay(1);
178ad0e280c088 Jiadong Zhu 2024-07-04  420  		}
178ad0e280c088 Jiadong Zhu 2024-07-04  421  		if (i >= adev->usec_timeout) {
178ad0e280c088 Jiadong Zhu 2024-07-04  422  			dev_err(adev->dev, "failed to wait on hqd deactivate\n");
178ad0e280c088 Jiadong Zhu 2024-07-04  423  			r = -ETIMEDOUT;
178ad0e280c088 Jiadong Zhu 2024-07-04  424  		}
178ad0e280c088 Jiadong Zhu 2024-07-04  425  		soc21_grbm_select(adev, 0, 0, 0, 0);
178ad0e280c088 Jiadong Zhu 2024-07-04  426  		mutex_unlock(&adev->srbm_mutex);
178ad0e280c088 Jiadong Zhu 2024-07-04  427  	}
178ad0e280c088 Jiadong Zhu 2024-07-04  428  
178ad0e280c088 Jiadong Zhu 2024-07-04  429  	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
178ad0e280c088 Jiadong Zhu 2024-07-04  430  	return r;
178ad0e280c088 Jiadong Zhu 2024-07-04  431  }
178ad0e280c088 Jiadong Zhu 2024-07-04  432  

:::::: The code at line 416 was first introduced by commit
:::::: 178ad0e280c088f5abfa61793cb992fa120d1830 drm/amdgpu/mes11: implement mmio queue reset for gfx11

:::::: TO: Jiadong Zhu <Jiadong.Zhu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
