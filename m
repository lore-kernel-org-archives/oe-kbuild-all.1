Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BCD19470
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714762972; cv=none; b=oQgL17QczNEZ+Cq1ue10ftDK1ZsAwmcSoOAwFQoQZnY5wMfIHJVjjsorKdEu5y47C8E475CPNEN7DOlzMIrQThSWb2ud0RVPv7B662JVeB4H77BOqUUYe9QmZ0GJyeRhXqSn1WcR9Ct1JltY26URGv1j24W7Ydgcdj/ftjjIpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714762972; c=relaxed/simple;
	bh=zdRjvVVKlKQavuMsdqQfkdRF5wDsOj70oINt0SSmr8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkXYWN8xgIT8/M//lt9Ymm/cgMZsBBfyqUIQ/wRMIkQLXOpu0rKTqBOW8z7Q4VxK4oWxWtoMeSpzqPvDLB29PAb5I8tTkOcFYeqtDdoh59FWA6zjYwoY6fM5qwylumveTvTGZ57+RDNEG2JSw5wQSCmkU9QqvNbFt7S9htNN7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJvlXX8B; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJvlXX8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714762970; x=1746298970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zdRjvVVKlKQavuMsdqQfkdRF5wDsOj70oINt0SSmr8w=;
  b=aJvlXX8BpdULy7LWxyroIGbc2uEsnMduVRGp4heVk6IXSrmF2C07MGg5
   ujv+FE1vA+4L57mc/+6yMPOmQB/4Qy6jD0rYfKs856Lpa94C4WQ4XVY81
   wyEtsxcTmJyXi24Dj/hHy75kXsmUyvbNLfoZsRuGwbOaynGduKiGI8pSh
   QpOW/H9vHsW0F01aBLN7yTxYy2Nmu1AGPDH2hgunrTLP+K4GoF/ex93wF
   FF4Kajt1yYKnWo9wfoZqXOKmQQQwaK5wS9t/c7IBY5G+dXaykNAu/Q4Xo
   C85JCgAVAPZzs14lzpW+16O6n8tPJHHtmD8wEiK8YbMTRGErHvJO50bna
   Q==;
X-CSE-ConnectionGUID: pmJSjnpASK6bLRj51+xAUA==
X-CSE-MsgGUID: c5UVeGMrSJq/6rZBekcKVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369555"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 12:02:49 -0700
X-CSE-ConnectionGUID: ix9B0rnQQeOxn9nmiHkvhg==
X-CSE-MsgGUID: BLrd3DppQJuvCjRywom4kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27941003"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2024 12:02:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2yBB-000C1s-2P;
	Fri, 03 May 2024 19:02:45 +0000
Date: Sat, 4 May 2024 03:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Likun Gao <Likun.Gao@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 262/362]
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c:48:54: warning: '_imu.bin' directive
 output may be truncated writing 8 bytes into a region of size between 4 and
 33
Message-ID: <202405040213.lQTzHmwl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   b0923d5d80facb205cc2b7f82994ab5c3eef3181
commit: 32d1637689893971b65658a359d03ef4fa30e049 [262/362] drm/amd/amdgpu: imu fw loading support
config: csky-randconfig-r031-20220611 (https://download.01.org/0day-ci/archive/20240504/202405040213.lQTzHmwl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040213.lQTzHmwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040213.lQTzHmwl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/imu_v12_0.c: In function 'imu_v12_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/imu_v12_0.c:48:54: warning: '_imu.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
      48 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/imu_v12_0.c:48:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
      48 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +48 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c

    35	
    36	static int imu_v12_0_init_microcode(struct amdgpu_device *adev)
    37	{
    38		char fw_name[40];
    39		char ucode_prefix[30];
    40		int err;
    41		const struct imu_firmware_header_v1_0 *imu_hdr;
    42		struct amdgpu_firmware_info *info = NULL;
    43	
    44		DRM_DEBUG("\n");
    45	
    46		amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
    47	
  > 48		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
    49		err = amdgpu_ucode_request(adev, &adev->gfx.imu_fw, fw_name);
    50		if (err)
    51			goto out;
    52		imu_hdr = (const struct imu_firmware_header_v1_0 *)adev->gfx.imu_fw->data;
    53		adev->gfx.imu_fw_version = le32_to_cpu(imu_hdr->header.ucode_version);
    54	
    55		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
    56			info = &adev->firmware.ucode[AMDGPU_UCODE_ID_IMU_I];
    57			info->ucode_id = AMDGPU_UCODE_ID_IMU_I;
    58			info->fw = adev->gfx.imu_fw;
    59			adev->firmware.fw_size +=
    60				ALIGN(le32_to_cpu(imu_hdr->imu_iram_ucode_size_bytes), PAGE_SIZE);
    61			info = &adev->firmware.ucode[AMDGPU_UCODE_ID_IMU_D];
    62			info->ucode_id = AMDGPU_UCODE_ID_IMU_D;
    63			info->fw = adev->gfx.imu_fw;
    64			adev->firmware.fw_size +=
    65				ALIGN(le32_to_cpu(imu_hdr->imu_dram_ucode_size_bytes), PAGE_SIZE);
    66		}
    67	
    68	out:
    69		if (err) {
    70			dev_err(adev->dev,
    71				"gfx12: Failed to load firmware \"%s\"\n",
    72				fw_name);
    73			amdgpu_ucode_release(&adev->gfx.imu_fw);
    74		}
    75	
    76		return err;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
