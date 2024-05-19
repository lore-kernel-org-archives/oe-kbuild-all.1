Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CF37492
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 May 2024 02:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716085531; cv=none; b=qCmfGcORFhvnrZRKHVGX34XQ5MQM8lPOVQatmiKrgTiKm/IshNksIQVAfTBrj2w0t9NjFv5/qVad2D+cLfelzQPZcMIe66YpB/19/7qtiJSGZP6gGbDblxP1BL5+yd4DVuUNztAVZtJUq1AOUqWleAVFFKMiotcLeSNpWntGlT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716085531; c=relaxed/simple;
	bh=FRahZ+NCxJ1suqHAuDSZKrqGIu0Ozk7n71Jb9i4GBIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k38yPHcmp6u4XVKp1k5A1E8W9g4m4CsJj4AkVm4w5yoy6HkQ/xA33bhIF81sjvzX1C7NQ+IhvfaV8KOhOsQdYCZbziRH60CZO71P83GTN3Bm3+BpKyW7txKj9F3J90+CQNHMMgJJ38AojTNjFAULyVz3fNUKg+K7Ml5DmDc68dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVCeyPj5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVCeyPj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716085530; x=1747621530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FRahZ+NCxJ1suqHAuDSZKrqGIu0Ozk7n71Jb9i4GBIg=;
  b=BVCeyPj5n3xwP7jGkhFpsX2RjQZo2lMKEeIlX1KD3yn7Si4De7RmETFT
   Yl/UHkRi4aACwDh/gB5VWYSpoP82bFpbmNxTIRroS+M4bvyTPSxmQySHE
   v2FimcP8Kb7I0VJUY79zxH1N4+Y71DpRGiLREoYFq+RHPaiy7ERUdOnDo
   +MXSbVh1m49CkiUW0gjd3brHbIUuPUnf8oTIPb7OuGEtN/Bnn64BYzuQS
   4HpIcqocskF9Z6OYCEBKMNz9/78ZMx7YnwjP9IRwdZCs4jQQMpGOaNFsl
   pyo3EO7Wra3dBZ2eUsbd0nsCmoMlN5xZIncUjDlwIWaTg6dfN+UZAaHG0
   g==;
X-CSE-ConnectionGUID: ZCXMBgGsRoKVOLDRy1YJCg==
X-CSE-MsgGUID: qSzA1XdpTi6nlpgdq6Z7JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="15182504"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="15182504"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 19:25:29 -0700
X-CSE-ConnectionGUID: BaV3NbFLRFSmj1103tSLQQ==
X-CSE-MsgGUID: Z15zlduJQruo582JVWVwBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32307250"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2024 19:25:27 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8WEn-0002r7-1a;
	Sun, 19 May 2024 02:25:25 +0000
Date: Sun, 19 May 2024 10:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [agd5f:amd-staging-drm-next 1416/1476]
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:192:58: warning: 'snprintf' output
 may be truncated before the last format character
Message-ID: <202405191041.7Dbr0Gn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   4a9fae65869eac0788a20f77d8ecd8aaf0cbb86a
commit: 26809e058bfc051dbf1647824b5328a95c5ba29b [1416/1476] drm/amd/amdgpu: Add ISP driver support
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405191041.7Dbr0Gn6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191041.7Dbr0Gn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191041.7Dbr0Gn6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c: In function 'isp_early_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:192:58: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     192 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                          ^
   In function 'isp_load_fw_by_psp',
       inlined from 'isp_early_init' at drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:218:8:
   drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:192:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
     192 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +192 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c

   181	
   182	static int isp_load_fw_by_psp(struct amdgpu_device *adev)
   183	{
   184		const struct common_firmware_header *hdr;
   185		char ucode_prefix[30];
   186		char fw_name[40];
   187		int r = 0;
   188	
   189		/* get isp fw binary name and path */
   190		amdgpu_ucode_ip_version_decode(adev, ISP_HWIP, ucode_prefix,
   191					       sizeof(ucode_prefix));
 > 192		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
   193	
   194		/* read isp fw */
   195		r = amdgpu_ucode_request(adev, &adev->isp.fw, fw_name);
   196		if (r) {
   197			amdgpu_ucode_release(&adev->isp.fw);
   198			return r;
   199		}
   200	
   201		hdr = (const struct common_firmware_header *)adev->isp.fw->data;
   202	
   203		adev->firmware.ucode[AMDGPU_UCODE_ID_ISP].ucode_id =
   204			AMDGPU_UCODE_ID_ISP;
   205		adev->firmware.ucode[AMDGPU_UCODE_ID_ISP].fw = adev->isp.fw;
   206	
   207		adev->firmware.fw_size +=
   208			ALIGN(le32_to_cpu(hdr->ucode_size_bytes), PAGE_SIZE);
   209	
   210		return r;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
