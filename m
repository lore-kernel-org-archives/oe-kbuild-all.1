Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A65515696B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714754507; cv=none; b=FWMB/yL+GMA0YDJlHA7eulQcYavsya8l6abW8++bp7rYoi+k34prOqM7mHhVWW4tDukcSn0U1SPagW6XFq9fi6gRmfi7sMHHjqjrnCc+36XeVpEU5FpplGPnlH8pnbdqWuG/j9550qDp02MKhrqI6J2qy7CLRndUDj+8O4AJiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714754507; c=relaxed/simple;
	bh=mY04v8dkuc4MqpAvILe3MMNm6lM4byhyaGyhmiuhXzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0ct/E23qVKb9haGlOpkYveZnrWXCKRnVYbdqFW8q3CTAT/6foAahlDZhrkbRRseOfewIVLfwABqXpdxAc//b4iW2s5uIqvOQhZ4iAmNWX4/ocmRm9BzrRGClwromGigB+ikBv4Dq2H76qNYxuC8ZZlPEX+zuqB+S95UswgR/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=appwWKRm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="appwWKRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714754505; x=1746290505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mY04v8dkuc4MqpAvILe3MMNm6lM4byhyaGyhmiuhXzc=;
  b=appwWKRmBvyTi0NUG204vk6QimN+KBvqWNjLdv/Ru17NYpSGEsbQJMlL
   /q0EvhSQt499dznvilNX3j97nsZvMQagQoJjZDfyu7pUu8EixSC/tMxnk
   HW80y+a1qfJzX97MMQJju0iA+3oHqAZVBgfAhBN6N99sQLk2/VNHQgJnP
   hg2T5q10x6n/MhbFE7nx/rI3I3KWLbvZ86RkVxGUbMwuGdMX6jy7Czpg3
   nqVJJa1nKokcR/j8vO4zG+eGFi6ld7NZ9Vc9RaaAdqdMiQHD68+dLDb8B
   l9TZ8C0rDkybDdqPSdFzPQjH6TQUJjruiWa5t7wlMJgxx4piZfCHH8dlu
   A==;
X-CSE-ConnectionGUID: Yo3M2tXVSiK6N51wCnQQEw==
X-CSE-MsgGUID: puta32ttQouQJfHPNqzPuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21254067"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21254067"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 09:41:44 -0700
X-CSE-ConnectionGUID: /JNRSm3DR92EuF4QQ8PKaA==
X-CSE-MsgGUID: qxk6hwU6S6K0eSRXpb1IzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28088147"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2024 09:41:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2vye-000BuE-1d;
	Fri, 03 May 2024 16:41:40 +0000
Date: Sat, 4 May 2024 00:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Likun Gao <Likun.Gao@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 262/362]
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c:48:54: error: '_imu.bin' directive
 output may be truncated writing 8 bytes into a region of size between 4 and
 33
Message-ID: <202405040042.cmVvoffN-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240504/202405040042.cmVvoffN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040042.cmVvoffN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040042.cmVvoffN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/imu_v12_0.c: In function 'imu_v12_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/imu_v12_0.c:48:54: error: '_imu.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
      48 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/imu_v12_0.c:48:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
      48 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
