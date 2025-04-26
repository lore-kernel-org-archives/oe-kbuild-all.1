Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820725C702
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Apr 2025 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745683101; cv=none; b=R5bsytoPTeTDU7i6yRwW58T0ngk6P9nLH+7MQ1D9AmsRAOSOqgEL2CC+ZL6XejA8aZL0vnRTbQnqmfv+cl1WKJqtPUwuS135kKQke1Q6s6+oTf2eEp8OG7K9RWCBiOdeEX5saJcdMzi/JG69UNwm9QplEqyexsKdvZmjKUenCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745683101; c=relaxed/simple;
	bh=QvWssyGW6dMZkAmmfo99P/c0i6wBrHho57YA9Sb0npE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VV9ivadlz3gJVB7LTmDnHdml/ZQGgxDTrn5y7M7h2UxuD2gYYvVkf3XAs3K9amYYDdH5NbDoTI1o4xopdDa3TVVlA9IoIZ79e36+WyniX/WGvCdH77YjJLoCLpIr4heS1Ywe4H9JelqaC3vkhdD4G4ZT6Q1+o83q/a+6AzP6UVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVO9y5wC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVO9y5wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745683100; x=1777219100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvWssyGW6dMZkAmmfo99P/c0i6wBrHho57YA9Sb0npE=;
  b=kVO9y5wCIh3tndfe802cGVR94oIXNT2T6RSLYXm/QoFRsZFuJdHK87OA
   yHZCzw040rPQLaBWoAu6Zt5Zj8k/anNL5jbOFREUk4QhQLnuD8drWOq+H
   0/A1IFxlqgvOzgGGxxWklc4/LQAk4sGpMaEz3CEAeQKRDfGoeuheoyUvl
   05c7BigRwKp0jFPzYNzLJzuEs1yPwwUlnfXEIDS6oQIoywmbadMeSrc8t
   aa0KDOsVFh/2lv1ktC0fXApRGKHHFyjZjjhKbG++Wt8YlsGwVQUtMr7pQ
   s1vdKEUujJxri7xUWXwGfDD/yYQe3nnXXJY2RhidFcAEw7foXFnUyqUf+
   Q==;
X-CSE-ConnectionGUID: UgRQjUuDRVuBsLkTnncjHw==
X-CSE-MsgGUID: 5Z6ODDzxRn2V8Znd8DgNjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="50993847"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="50993847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 08:58:18 -0700
X-CSE-ConnectionGUID: 2vEr5gz1S/y3CulU83JLAw==
X-CSE-MsgGUID: Vqg5r5wVRwaES00n2qxAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="133117275"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2025 08:58:15 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8huv-0005t9-2A;
	Sat, 26 Apr 2025 15:58:13 +0000
Date: Sat, 26 Apr 2025 23:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>, linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3209: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504262320.z3me9W8d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 52cb80c12e8a647aa9c903903d58916e6c1c4d38 drm/amdgpu: Add gfx v12_0 ip block support (v6)
date:   12 months ago
config: sparc-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262320.z3me9W8d-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262320.z3me9W8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262320.z3me9W8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:3209: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                    * For gfx 12, rlc firmware loading relies on smu firmware is
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:4562: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                            * GFX12 could support more than 4 SEs, while the bitmap


vim +3209 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c

  3152	
  3153	static int gfx_v12_0_hw_init(void *handle)
  3154	{
  3155		int r;
  3156		struct amdgpu_device *adev = (struct amdgpu_device *)handle;
  3157	
  3158		if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
  3159			if (adev->gfx.imu.funcs) {
  3160				/* RLC autoload sequence 1: Program rlc ram */
  3161				if (adev->gfx.imu.funcs->program_rlc_ram)
  3162					adev->gfx.imu.funcs->program_rlc_ram(adev);
  3163			}
  3164			/* rlc autoload firmware */
  3165			r = gfx_v12_0_rlc_backdoor_autoload_enable(adev);
  3166			if (r)
  3167				return r;
  3168		} else {
  3169			if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
  3170				if (adev->gfx.imu.funcs && (amdgpu_dpm > 0)) {
  3171					if (adev->gfx.imu.funcs->load_microcode)
  3172						adev->gfx.imu.funcs->load_microcode(adev);
  3173					if (adev->gfx.imu.funcs->setup_imu)
  3174						adev->gfx.imu.funcs->setup_imu(adev);
  3175					if (adev->gfx.imu.funcs->start_imu)
  3176						adev->gfx.imu.funcs->start_imu(adev);
  3177				}
  3178	
  3179				/* disable gpa mode in backdoor loading */
  3180				gfx_v12_0_disable_gpa_mode(adev);
  3181			}
  3182		}
  3183	
  3184		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) ||
  3185		    (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)) {
  3186			r = gfx_v12_0_wait_for_rlc_autoload_complete(adev);
  3187			if (r) {
  3188				dev_err(adev->dev, "(%d) failed to wait rlc autoload complete\n", r);
  3189				return r;
  3190			}
  3191		}
  3192	
  3193		adev->gfx.is_poweron = true;
  3194	
  3195		if (get_gb_addr_config(adev))
  3196			DRM_WARN("Invalid gb_addr_config !\n");
  3197	
  3198		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)
  3199			gfx_v12_0_config_gfx_rs64(adev);
  3200	
  3201		r = gfx_v12_0_gfxhub_enable(adev);
  3202		if (r)
  3203			return r;
  3204	
  3205		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT ||
  3206		     adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) &&
  3207		     (amdgpu_dpm == 1)) {
  3208			/**
> 3209			 * For gfx 12, rlc firmware loading relies on smu firmware is
  3210			 * loaded firstly, so in direct type, it has to load smc ucode
  3211			 * here before rlc.
  3212			 */
  3213			if (!(adev->flags & AMD_IS_APU)) {
  3214				r = amdgpu_pm_load_smu_firmware(adev, NULL);
  3215				if (r)
  3216					return r;
  3217			}
  3218		}
  3219	
  3220		gfx_v12_0_constants_init(adev);
  3221	
  3222		if (adev->nbio.funcs->gc_doorbell_init)
  3223			adev->nbio.funcs->gc_doorbell_init(adev);
  3224	
  3225		r = gfx_v12_0_rlc_resume(adev);
  3226		if (r)
  3227			return r;
  3228	
  3229		/*
  3230		 * init golden registers and rlc resume may override some registers,
  3231		 * reconfig them here
  3232		 */
  3233		gfx_v12_0_tcp_harvest(adev);
  3234	
  3235		r = gfx_v12_0_cp_resume(adev);
  3236		if (r)
  3237			return r;
  3238	
  3239		return r;
  3240	}
  3241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
