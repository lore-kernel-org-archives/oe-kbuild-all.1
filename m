Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1071BD9DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313852; cv=none; b=IqaHJso4GEy/+ND0r7Qmlz3uQZQ7MC3dMjI6Z5gcjjXwctP85ATY2sDy35P4wNlf1vpm1+oZHhoq3VEtf6/yuTkCQ4Y73wRdNhqAtPuhvX1f7BNeT6BZlhjxql+ZmhEmt+GNxgiM8aYTRulyeUg21aT79fkRzI8LIY5rT6ZOZHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313852; c=relaxed/simple;
	bh=jVBc5m4wqoUIrHzQHrmv05tAMGI+i8zjtxb9aYbb5kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J610lzMfLcCNcdkjCe0G+8rJUJ8dl20AbXx3xLqVqMkNUpfUNPB73T/F27LXAOU7u0xit5VVDWL5wyGqenL3wQGOs1XgzqhOQCTuO0/tRL2KwnDehvSY1HzUSAx4TDjpncO9rm3I3vNxyTbGeJQPvclK3feHsIZH31KPKK3IvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdPf28GU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdPf28GU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732313850; x=1763849850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVBc5m4wqoUIrHzQHrmv05tAMGI+i8zjtxb9aYbb5kA=;
  b=UdPf28GUjEwXwcbZi4RNY9h6kXAGgK/CWq3Mgb3mYeEfaNdOcaQbBObZ
   +hccQoamBdFASBT1t3sdaYZouDyuddAAmlbfNtMjPEDQqpaa6G8lXeQFK
   6r1rzSNviz7f1UCx/LYLgW7Klf1k0i0iLf05buMHnCzZ1BMBEF1ixMY3U
   BF06KIXpN62OtitsHPadvAcR85HrKnb79NSlaD3xTn8x3Gl/WGpQQnZWl
   47WUHAZWkDZZ/9EJBpoa4/W6H/7qWvhbUnZZ7S+NLyaEMWuVXTkcfS0QF
   Z/bd668JbVM7gAHNvQj+022qnKnSc/T0uef4Izf/HkBCtvXLMiwDFOIr7
   A==;
X-CSE-ConnectionGUID: cRxoGb0bQ6KhfjHl97Z2Vg==
X-CSE-MsgGUID: ZPeR/XHmR3WNPfAIuyBHMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50002159"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="50002159"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 14:17:26 -0800
X-CSE-ConnectionGUID: uKwY+Ke0SDOLC7sKUF56cA==
X-CSE-MsgGUID: BQsCAlkESzeYUazP+MMJPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95632473"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 14:17:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEbxq-0004FX-32;
	Fri, 22 Nov 2024 22:17:22 +0000
Date: Sat, 23 Nov 2024 06:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1198/1393]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:359: warning: Function
 parameter or struct member 'inst' not described in 'smu_dpm_set_power_gate'
Message-ID: <202411230631.ziml8n2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Boyuan,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   52a0eae4140af43141a217398938aaa26241fa39
commit: d2a617c63ca3c0d143874c2942abf2b6fbf07a04 [1198/1393] drm/amd/pm: add inst to set_powergating_by_smu
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411230631.ziml8n2F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230631.ziml8n2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230631.ziml8n2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:359: warning: Function parameter or struct member 'inst' not described in 'smu_dpm_set_power_gate'


vim +359 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c

4b5b855c240a48 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Li Ma         2024-06-06  340  
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  341  /**
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  342   * smu_dpm_set_power_gate - power gate/ungate the specific IP block
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  343   *
bc7d6c12054dcd drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Darren Powell 2020-12-03  344   * @handle:        smu_context pointer
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  345   * @block_type: the IP block to power gate/ungate
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  346   * @gate:       to power gate if true, ungate otherwise
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  347   *
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  348   * This API uses no smu->mutex lock protection due to:
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  349   * 1. It is either called by other IP block(gfx/sdma/vcn/uvd/vce).
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  350   *    This is guarded to be race condition free by the caller.
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  351   * 2. Or get called on user setting request of power_dpm_force_performance_level.
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  352   *    Under this case, the smu->mutex lock protection is already enforced on
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  353   *    the parent API smu_force_performance_level of the call path.
cf3fde893d3a86 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-11-06  354   */
d2b0b4832b90fa drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-03-25  355  static int smu_dpm_set_power_gate(void *handle,
c6ce68e67659fd drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Evan Quan     2021-03-19  356  				  uint32_t block_type,
d2a617c63ca3c0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Boyuan Zhang  2024-10-02  357  				  bool gate,
d2a617c63ca3c0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Boyuan Zhang  2024-10-02  358  				  int inst)
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25 @359  {
bc7d6c12054dcd drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Darren Powell 2020-12-03  360  	struct smu_context *smu = handle;
d2a617c63ca3c0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Boyuan Zhang  2024-10-02  361  	int ret = 0;
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  362  
85c1b9bd13b0b2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2021-11-25  363  	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled) {
85c1b9bd13b0b2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2021-11-25  364  		dev_WARN(smu->adev->dev,
85c1b9bd13b0b2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2021-11-25  365  			 "SMU uninitialized but power %s requested for %u!\n",
85c1b9bd13b0b2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2021-11-25  366  			 gate ? "gate" : "ungate", block_type);
2b7ad277e96577 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-05-25  367  		return -EOPNOTSUPP;
85c1b9bd13b0b2 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lijo Lazar    2021-11-25  368  	}
774e335b878c1e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-04-07  369  
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  370  	switch (block_type) {
f6b4b4a1dbf3cc drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  371  	/*
f6b4b4a1dbf3cc drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  372  	 * Some legacy code of amdgpu_vcn.c and vcn_v2*.c still uses
f6b4b4a1dbf3cc drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  373  	 * AMD_IP_BLOCK_TYPE_UVD for VCN. So, here both of them are kept.
f6b4b4a1dbf3cc drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  374  	 */
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  375  	case AMD_IP_BLOCK_TYPE_UVD:
f6b4b4a1dbf3cc drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  376  	case AMD_IP_BLOCK_TYPE_VCN:
d2a617c63ca3c0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Boyuan Zhang  2024-10-02  377  		ret = smu_dpm_set_vcn_enable(smu, !gate, inst);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  378  		if (ret)
c303e4d34dde30 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Boyuan Zhang  2024-10-02  379  			dev_err(smu->adev->dev, "Failed to power %s VCN instance %d!\n",
d2a617c63ca3c0 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Boyuan Zhang  2024-10-02  380  				gate ? "gate" : "ungate", inst);
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  381  		break;
73c86d628d6aa3 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Hawking Zhang 2019-06-24  382  	case AMD_IP_BLOCK_TYPE_GFX:
73c86d628d6aa3 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Hawking Zhang 2019-06-24  383  		ret = smu_gfx_off_control(smu, gate);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  384  		if (ret)
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  385  			dev_err(smu->adev->dev, "Failed to %s gfxoff!\n",
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  386  				gate ? "enable" : "disable");
73c86d628d6aa3 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Hawking Zhang 2019-06-24  387  		break;
a90a24d581a919 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Prike Liang   2019-09-11  388  	case AMD_IP_BLOCK_TYPE_SDMA:
a90a24d581a919 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Prike Liang   2019-09-11  389  		ret = smu_powergate_sdma(smu, gate);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  390  		if (ret)
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  391  			dev_err(smu->adev->dev, "Failed to power %s SDMA!\n",
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  392  				gate ? "gate" : "ungate");
a90a24d581a919 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Prike Liang   2019-09-11  393  		break;
0db2ab99c9fbbd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Leo Liu       2019-11-08  394  	case AMD_IP_BLOCK_TYPE_JPEG:
a64c9e15e6247e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-01-03  395  		ret = smu_dpm_set_jpeg_enable(smu, !gate);
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  396  		if (ret)
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  397  			dev_err(smu->adev->dev, "Failed to power %s JPEG!\n",
7951e7c036490e drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  398  				gate ? "gate" : "ungate");
0db2ab99c9fbbd drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Leo Liu       2019-11-08  399  		break;
d60fbf2d254acc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lang Yu       2023-05-17  400  	case AMD_IP_BLOCK_TYPE_VPE:
d60fbf2d254acc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lang Yu       2023-05-17  401  		ret = smu_dpm_set_vpe_enable(smu, !gate);
d60fbf2d254acc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lang Yu       2023-05-17  402  		if (ret)
d60fbf2d254acc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lang Yu       2023-05-17  403  			dev_err(smu->adev->dev, "Failed to power %s VPE!\n",
d60fbf2d254acc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lang Yu       2023-05-17  404  				gate ? "gate" : "ungate");
d60fbf2d254acc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Lang Yu       2023-05-17  405  		break;
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  406  	default:
1fdfe8cacb35a0 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  407  		dev_err(smu->adev->dev, "Unsupported block type!\n");
1fdfe8cacb35a0 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2020-06-05  408  		return -EINVAL;
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  409  	}
72e91f37a81768 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-25  410  
3697b339c64f82 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan     2019-10-16  411  	return ret;
ea2d0bf8c7f07c drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-17  412  }
ea2d0bf8c7f07c drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang    2019-01-17  413  

:::::: The code at line 359 was first introduced by commit
:::::: 72e91f37a81768c81aa7ac78169f5a3259c621ac drm/amd/powerplay: implement dpm enable functions of uvd & vce for smu

:::::: TO: Kevin Wang <kevin1.wang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
