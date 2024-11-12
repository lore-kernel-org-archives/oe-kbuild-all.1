Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030322EE69
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407967; cv=none; b=QKo4GUCjpWN12rb8wAS3rTLeLpZSTO9XqgtG7xMi3uBwbBRickz4pq0wUFX5xM0AV8nDRnk2K6zKLQUzkCBPorYgSY7XzwnJkxiWqxIx5d9/yYeTRLX9ZUJuiD66GccV4hXi2OafatUdnCMWeVkR7T4BfY89d/1+muxGWqCEtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407967; c=relaxed/simple;
	bh=ePoPGYJEKPnZ++BmMhr70STyN0+bMY16muwHTNMQdnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXyMzmH68Bs/a+l8sPHhOS/gY7aR7ORrbcNqXshkq/JC9KbYyXf/UJcSX+VbYDCpUej44MGBpcjePqoOisywY/rDSJss4SvyoDu+iydr+obJuciWfV6icqg20WiLamjpZZOIrLmHEg2MyGB8MmEz5KlBDyeMHP5/EQO8HBiiZps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUqN4mPK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUqN4mPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731407965; x=1762943965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePoPGYJEKPnZ++BmMhr70STyN0+bMY16muwHTNMQdnQ=;
  b=eUqN4mPKXufVCZh6XGoNEwwL+xLU6fBKmzGS2mvDb0sz6NOliw3bQWdV
   PP5kVmjliUyQn07WSd2CsxW74gFhVR+c1RoVt5nDuoseuUdUtyDwPjzYm
   6XZGWBqGXMcZ1hSQDfOCEBCUwxkyAzLdgugidDo1y0jHsQw9sE4ERNpD7
   FwE3jy+FNcB8FyECnyXpS+5DFCa1II81z3kqyy5CpicPwTIDnuFIjZGWR
   ShoQA2tCh2FLOrbgrVmhw54Lan9tb2GLBeGrIdtect3zCezHP4HLNdy6l
   hN/GpVXllPA5xC+ZhjTX1h7+NnW528nxpUczdtxX4Ymlr+bSM5xsdqpLg
   g==;
X-CSE-ConnectionGUID: mGdrSiH4Rumgo3t1FCWwNg==
X-CSE-MsgGUID: cwJDmpQoQgOcEG40qEIKKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="42638694"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="42638694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:39:25 -0800
X-CSE-ConnectionGUID: lJUIRA2uTjOVX32LtQU7Ag==
X-CSE-MsgGUID: Egn54nfpT1Oq8xRjzSv1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="91412083"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 02:39:22 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAoIq-0000tz-1z;
	Tue, 12 Nov 2024 10:39:20 +0000
Date: Tue, 12 Nov 2024 18:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1282/1302]
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1165: warning: Function parameter or
 struct member 'inst' not described in 'vcn_v5_0_0_set_unified_ring_funcs'
Message-ID: <202411121837.AwQbWjmK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   0bd74ab31ce2ca6e35c9f7f7c9b72bd9c78619ed
commit: 6887ed045cc767247ccfaa048917314eb91e76eb [1282/1302] drm/amdgpu: set funcs for each vcn instance
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411121837.AwQbWjmK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121837.AwQbWjmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121837.AwQbWjmK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:767: warning: Function parameter or struct member 'inst' not described in 'vcn_v5_0_0_start'
   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:949: warning: Function parameter or struct member 'inst' not described in 'vcn_v5_0_0_stop'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1165: warning: Function parameter or struct member 'inst' not described in 'vcn_v5_0_0_set_unified_ring_funcs'
>> drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:1336: warning: Function parameter or struct member 'inst' not described in 'vcn_v5_0_0_set_irq_funcs'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1093: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_start'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1551: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_stop'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:1939: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_set_unified_ring_funcs'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:2147: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_set_irq_funcs'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1104: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_3_start'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1310: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_3_stop'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1545: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_3_set_unified_ring_funcs'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:1736: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_3_set_irq_funcs'
--
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:996: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_5_start'
   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1205: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_5_stop'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1428: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_5_set_unified_ring_funcs'
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:1599: warning: Function parameter or struct member 'inst' not described in 'vcn_v4_0_5_set_irq_funcs'


vim +1165 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c

b6d1a06320519ac Sonny Jiang          2023-04-25  1156  
b6d1a06320519ac Sonny Jiang          2023-04-25  1157  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1158   * vcn_v5_0_0_set_unified_ring_funcs - set unified ring functions
b6d1a06320519ac Sonny Jiang          2023-04-25  1159   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1160   * @adev: amdgpu_device pointer
b6d1a06320519ac Sonny Jiang          2023-04-25  1161   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1162   * Set unified ring functions
b6d1a06320519ac Sonny Jiang          2023-04-25  1163   */
6887ed045cc7672 Boyuan Zhang         2024-10-05  1164  static void vcn_v5_0_0_set_unified_ring_funcs(struct amdgpu_device *adev, int inst)
b6d1a06320519ac Sonny Jiang          2023-04-25 @1165  {
6887ed045cc7672 Boyuan Zhang         2024-10-05  1166  	if (adev->vcn.harvest_config & (1 << inst))
6887ed045cc7672 Boyuan Zhang         2024-10-05  1167  		return;
b6d1a06320519ac Sonny Jiang          2023-04-25  1168  
6887ed045cc7672 Boyuan Zhang         2024-10-05  1169  	adev->vcn.inst[inst].ring_enc[0].funcs = &vcn_v5_0_0_unified_ring_vm_funcs;
6887ed045cc7672 Boyuan Zhang         2024-10-05  1170  	adev->vcn.inst[inst].ring_enc[0].me = inst;
b6d1a06320519ac Sonny Jiang          2023-04-25  1171  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1172  
b6d1a06320519ac Sonny Jiang          2023-04-25  1173  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1174   * vcn_v5_0_0_is_idle - check VCN block is idle
b6d1a06320519ac Sonny Jiang          2023-04-25  1175   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1176   * @handle: amdgpu_device pointer
b6d1a06320519ac Sonny Jiang          2023-04-25  1177   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1178   * Check whether VCN block is idle
b6d1a06320519ac Sonny Jiang          2023-04-25  1179   */
b6d1a06320519ac Sonny Jiang          2023-04-25  1180  static bool vcn_v5_0_0_is_idle(void *handle)
b6d1a06320519ac Sonny Jiang          2023-04-25  1181  {
b6d1a06320519ac Sonny Jiang          2023-04-25  1182  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
b6d1a06320519ac Sonny Jiang          2023-04-25  1183  	int i, ret = 1;
b6d1a06320519ac Sonny Jiang          2023-04-25  1184  
b6d1a06320519ac Sonny Jiang          2023-04-25  1185  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
b6d1a06320519ac Sonny Jiang          2023-04-25  1186  		if (adev->vcn.harvest_config & (1 << i))
b6d1a06320519ac Sonny Jiang          2023-04-25  1187  			continue;
b6d1a06320519ac Sonny Jiang          2023-04-25  1188  
b6d1a06320519ac Sonny Jiang          2023-04-25  1189  		ret &= (RREG32_SOC15(VCN, i, regUVD_STATUS) == UVD_STATUS__IDLE);
b6d1a06320519ac Sonny Jiang          2023-04-25  1190  	}
b6d1a06320519ac Sonny Jiang          2023-04-25  1191  
b6d1a06320519ac Sonny Jiang          2023-04-25  1192  	return ret;
b6d1a06320519ac Sonny Jiang          2023-04-25  1193  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1194  
b6d1a06320519ac Sonny Jiang          2023-04-25  1195  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1196   * vcn_v5_0_0_wait_for_idle - wait for VCN block idle
b6d1a06320519ac Sonny Jiang          2023-04-25  1197   *
991c4e135a47fd3 Sunil Khatri         2024-10-02  1198   * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
b6d1a06320519ac Sonny Jiang          2023-04-25  1199   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1200   * Wait for VCN block idle
b6d1a06320519ac Sonny Jiang          2023-04-25  1201   */
d8b02111508526a Sunil Khatri         2024-09-30  1202  static int vcn_v5_0_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
b6d1a06320519ac Sonny Jiang          2023-04-25  1203  {
d8b02111508526a Sunil Khatri         2024-09-30  1204  	struct amdgpu_device *adev = ip_block->adev;
b6d1a06320519ac Sonny Jiang          2023-04-25  1205  	int i, ret = 0;
b6d1a06320519ac Sonny Jiang          2023-04-25  1206  
b6d1a06320519ac Sonny Jiang          2023-04-25  1207  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
b6d1a06320519ac Sonny Jiang          2023-04-25  1208  		if (adev->vcn.harvest_config & (1 << i))
b6d1a06320519ac Sonny Jiang          2023-04-25  1209  			continue;
b6d1a06320519ac Sonny Jiang          2023-04-25  1210  
b6d1a06320519ac Sonny Jiang          2023-04-25  1211  		ret = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE,
b6d1a06320519ac Sonny Jiang          2023-04-25  1212  			UVD_STATUS__IDLE);
b6d1a06320519ac Sonny Jiang          2023-04-25  1213  		if (ret)
b6d1a06320519ac Sonny Jiang          2023-04-25  1214  			return ret;
b6d1a06320519ac Sonny Jiang          2023-04-25  1215  	}
b6d1a06320519ac Sonny Jiang          2023-04-25  1216  
b6d1a06320519ac Sonny Jiang          2023-04-25  1217  	return ret;
b6d1a06320519ac Sonny Jiang          2023-04-25  1218  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1219  
b6d1a06320519ac Sonny Jiang          2023-04-25  1220  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1221   * vcn_v5_0_0_set_clockgating_state - set VCN block clockgating state
b6d1a06320519ac Sonny Jiang          2023-04-25  1222   *
e24ee44724c5b19 Srinivasan Shanmugam 2024-11-06  1223   * @ip_block: amdgpu_ip_block pointer
b6d1a06320519ac Sonny Jiang          2023-04-25  1224   * @state: clock gating state
b6d1a06320519ac Sonny Jiang          2023-04-25  1225   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1226   * Set VCN block clockgating state
b6d1a06320519ac Sonny Jiang          2023-04-25  1227   */
12bdba8c6e0fec7 Boyuan Zhang         2024-10-07  1228  static int vcn_v5_0_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
12bdba8c6e0fec7 Boyuan Zhang         2024-10-07  1229  					  enum amd_clockgating_state state)
b6d1a06320519ac Sonny Jiang          2023-04-25  1230  {
12bdba8c6e0fec7 Boyuan Zhang         2024-10-07  1231  	struct amdgpu_device *adev = ip_block->adev;
b6d1a06320519ac Sonny Jiang          2023-04-25  1232  	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
b6d1a06320519ac Sonny Jiang          2023-04-25  1233  	int i;
b6d1a06320519ac Sonny Jiang          2023-04-25  1234  
b6d1a06320519ac Sonny Jiang          2023-04-25  1235  	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
b6d1a06320519ac Sonny Jiang          2023-04-25  1236  		if (adev->vcn.harvest_config & (1 << i))
b6d1a06320519ac Sonny Jiang          2023-04-25  1237  			continue;
b6d1a06320519ac Sonny Jiang          2023-04-25  1238  
b6d1a06320519ac Sonny Jiang          2023-04-25  1239  		if (enable) {
b6d1a06320519ac Sonny Jiang          2023-04-25  1240  			if (RREG32_SOC15(VCN, i, regUVD_STATUS) != UVD_STATUS__IDLE)
b6d1a06320519ac Sonny Jiang          2023-04-25  1241  				return -EBUSY;
b6d1a06320519ac Sonny Jiang          2023-04-25  1242  			vcn_v5_0_0_enable_clock_gating(adev, i);
b6d1a06320519ac Sonny Jiang          2023-04-25  1243  		} else {
b6d1a06320519ac Sonny Jiang          2023-04-25  1244  			vcn_v5_0_0_disable_clock_gating(adev, i);
b6d1a06320519ac Sonny Jiang          2023-04-25  1245  		}
b6d1a06320519ac Sonny Jiang          2023-04-25  1246  	}
b6d1a06320519ac Sonny Jiang          2023-04-25  1247  
b6d1a06320519ac Sonny Jiang          2023-04-25  1248  	return 0;
b6d1a06320519ac Sonny Jiang          2023-04-25  1249  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1250  
b6d1a06320519ac Sonny Jiang          2023-04-25  1251  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1252   * vcn_v5_0_0_set_powergating_state - set VCN block powergating state
b6d1a06320519ac Sonny Jiang          2023-04-25  1253   *
e24ee44724c5b19 Srinivasan Shanmugam 2024-11-06  1254   * @ip_block: amdgpu_ip_block pointer
b6d1a06320519ac Sonny Jiang          2023-04-25  1255   * @state: power gating state
b6d1a06320519ac Sonny Jiang          2023-04-25  1256   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1257   * Set VCN block powergating state
b6d1a06320519ac Sonny Jiang          2023-04-25  1258   */
c9188ea9675f468 Boyuan Zhang         2024-09-29  1259  static int vcn_v5_0_0_set_powergating_state(struct amdgpu_ip_block *ip_block,
c9188ea9675f468 Boyuan Zhang         2024-09-29  1260  		enum amd_powergating_state state)
b6d1a06320519ac Sonny Jiang          2023-04-25  1261  {
c9188ea9675f468 Boyuan Zhang         2024-09-29  1262  	struct amdgpu_device *adev = ip_block->adev;
f31471fc722a0da Boyuan Zhang         2024-09-29  1263  	int inst = ip_block->instance;
b6d1a06320519ac Sonny Jiang          2023-04-25  1264  	int ret;
b6d1a06320519ac Sonny Jiang          2023-04-25  1265  
f31471fc722a0da Boyuan Zhang         2024-09-29  1266  	if (state == adev->vcn.inst[inst].cur_state)
b6d1a06320519ac Sonny Jiang          2023-04-25  1267  		return 0;
b6d1a06320519ac Sonny Jiang          2023-04-25  1268  
b6d1a06320519ac Sonny Jiang          2023-04-25  1269  	if (state == AMD_PG_STATE_GATE)
125ac87dc334a06 Boyuan Zhang         2024-10-01  1270  		ret = vcn_v5_0_0_stop(adev, inst);
b6d1a06320519ac Sonny Jiang          2023-04-25  1271  	else
125ac87dc334a06 Boyuan Zhang         2024-10-01  1272  		ret = vcn_v5_0_0_start(adev, inst);
b6d1a06320519ac Sonny Jiang          2023-04-25  1273  
b6d1a06320519ac Sonny Jiang          2023-04-25  1274  	if (!ret)
f31471fc722a0da Boyuan Zhang         2024-09-29  1275  		adev->vcn.inst[inst].cur_state = state;
b6d1a06320519ac Sonny Jiang          2023-04-25  1276  
b6d1a06320519ac Sonny Jiang          2023-04-25  1277  	return ret;
b6d1a06320519ac Sonny Jiang          2023-04-25  1278  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1279  
b6d1a06320519ac Sonny Jiang          2023-04-25  1280  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1281   * vcn_v5_0_0_process_interrupt - process VCN block interrupt
b6d1a06320519ac Sonny Jiang          2023-04-25  1282   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1283   * @adev: amdgpu_device pointer
b6d1a06320519ac Sonny Jiang          2023-04-25  1284   * @source: interrupt sources
b6d1a06320519ac Sonny Jiang          2023-04-25  1285   * @entry: interrupt entry from clients and sources
b6d1a06320519ac Sonny Jiang          2023-04-25  1286   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1287   * Process VCN block interrupt
b6d1a06320519ac Sonny Jiang          2023-04-25  1288   */
b6d1a06320519ac Sonny Jiang          2023-04-25  1289  static int vcn_v5_0_0_process_interrupt(struct amdgpu_device *adev, struct amdgpu_irq_src *source,
b6d1a06320519ac Sonny Jiang          2023-04-25  1290  	struct amdgpu_iv_entry *entry)
b6d1a06320519ac Sonny Jiang          2023-04-25  1291  {
b6d1a06320519ac Sonny Jiang          2023-04-25  1292  	uint32_t ip_instance;
b6d1a06320519ac Sonny Jiang          2023-04-25  1293  
b6d1a06320519ac Sonny Jiang          2023-04-25  1294  	switch (entry->client_id) {
b6d1a06320519ac Sonny Jiang          2023-04-25  1295  	case SOC15_IH_CLIENTID_VCN:
b6d1a06320519ac Sonny Jiang          2023-04-25  1296  		ip_instance = 0;
b6d1a06320519ac Sonny Jiang          2023-04-25  1297  		break;
b6d1a06320519ac Sonny Jiang          2023-04-25  1298  	case SOC15_IH_CLIENTID_VCN1:
b6d1a06320519ac Sonny Jiang          2023-04-25  1299  		ip_instance = 1;
b6d1a06320519ac Sonny Jiang          2023-04-25  1300  		break;
b6d1a06320519ac Sonny Jiang          2023-04-25  1301  	default:
b6d1a06320519ac Sonny Jiang          2023-04-25  1302  		DRM_ERROR("Unhandled client id: %d\n", entry->client_id);
b6d1a06320519ac Sonny Jiang          2023-04-25  1303  		return 0;
b6d1a06320519ac Sonny Jiang          2023-04-25  1304  	}
b6d1a06320519ac Sonny Jiang          2023-04-25  1305  
b6d1a06320519ac Sonny Jiang          2023-04-25  1306  	DRM_DEBUG("IH: VCN TRAP\n");
b6d1a06320519ac Sonny Jiang          2023-04-25  1307  
b6d1a06320519ac Sonny Jiang          2023-04-25  1308  	switch (entry->src_id) {
b6d1a06320519ac Sonny Jiang          2023-04-25  1309  	case VCN_4_0__SRCID__UVD_ENC_GENERAL_PURPOSE:
b6d1a06320519ac Sonny Jiang          2023-04-25  1310  		amdgpu_fence_process(&adev->vcn.inst[ip_instance].ring_enc[0]);
b6d1a06320519ac Sonny Jiang          2023-04-25  1311  		break;
b6d1a06320519ac Sonny Jiang          2023-04-25  1312  	case VCN_4_0__SRCID_UVD_POISON:
b6d1a06320519ac Sonny Jiang          2023-04-25  1313  		amdgpu_vcn_process_poison_irq(adev, source, entry);
b6d1a06320519ac Sonny Jiang          2023-04-25  1314  		break;
b6d1a06320519ac Sonny Jiang          2023-04-25  1315  	default:
b6d1a06320519ac Sonny Jiang          2023-04-25  1316  		DRM_ERROR("Unhandled interrupt: %d %d\n",
b6d1a06320519ac Sonny Jiang          2023-04-25  1317  			  entry->src_id, entry->src_data[0]);
b6d1a06320519ac Sonny Jiang          2023-04-25  1318  		break;
b6d1a06320519ac Sonny Jiang          2023-04-25  1319  	}
b6d1a06320519ac Sonny Jiang          2023-04-25  1320  
b6d1a06320519ac Sonny Jiang          2023-04-25  1321  	return 0;
b6d1a06320519ac Sonny Jiang          2023-04-25  1322  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1323  
b6d1a06320519ac Sonny Jiang          2023-04-25  1324  static const struct amdgpu_irq_src_funcs vcn_v5_0_0_irq_funcs = {
b6d1a06320519ac Sonny Jiang          2023-04-25  1325  	.process = vcn_v5_0_0_process_interrupt,
b6d1a06320519ac Sonny Jiang          2023-04-25  1326  };
b6d1a06320519ac Sonny Jiang          2023-04-25  1327  
b6d1a06320519ac Sonny Jiang          2023-04-25  1328  /**
b6d1a06320519ac Sonny Jiang          2023-04-25  1329   * vcn_v5_0_0_set_irq_funcs - set VCN block interrupt irq functions
b6d1a06320519ac Sonny Jiang          2023-04-25  1330   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1331   * @adev: amdgpu_device pointer
b6d1a06320519ac Sonny Jiang          2023-04-25  1332   *
b6d1a06320519ac Sonny Jiang          2023-04-25  1333   * Set VCN block interrupt irq functions
b6d1a06320519ac Sonny Jiang          2023-04-25  1334   */
6887ed045cc7672 Boyuan Zhang         2024-10-05  1335  static void vcn_v5_0_0_set_irq_funcs(struct amdgpu_device *adev, int inst)
b6d1a06320519ac Sonny Jiang          2023-04-25 @1336  {
6887ed045cc7672 Boyuan Zhang         2024-10-05  1337  	if (adev->vcn.harvest_config & (1 << inst))
6887ed045cc7672 Boyuan Zhang         2024-10-05  1338  		return;
b6d1a06320519ac Sonny Jiang          2023-04-25  1339  
6887ed045cc7672 Boyuan Zhang         2024-10-05  1340  	adev->vcn.inst[inst].irq.num_types = adev->vcn.num_enc_rings + 1;
6887ed045cc7672 Boyuan Zhang         2024-10-05  1341  	adev->vcn.inst[inst].irq.funcs = &vcn_v5_0_0_irq_funcs;
b6d1a06320519ac Sonny Jiang          2023-04-25  1342  }
b6d1a06320519ac Sonny Jiang          2023-04-25  1343  

:::::: The code at line 1165 was first introduced by commit
:::::: b6d1a06320519ac3bfda6ce81067a1bc409b9cff drm/amdgpu: add VCN_5_0_0 IP block support

:::::: TO: Sonny Jiang <sonny.jiang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
