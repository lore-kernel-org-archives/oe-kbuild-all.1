Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165D15533F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714746282; cv=none; b=EqBnhdUfOpvWce+IRTI3zLmh5n9jxTr5faiZgK9zBtzwbAQc8dbNzFV1I6+e0gYYhUoDbXeCsRMvONEYIgdphR1zSq+yfcSrQgElFbTqz1P21l2gdoU8trK9//u7aiG4qs4m/EsGHl2Gp5j+g5EvcZeRgwaaEhY2fmouYyoyx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714746282; c=relaxed/simple;
	bh=EkB67/Rtu+hy9aEh2/6UatHCbR2f+6JryxFtMx9+T50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgPj4gtuE0G7G/jN+jH+5enTvbFgyhlVCw9wA9dhQHYcHtqucY6Cks3FCP7lxXxXY6K7BQ+qfH3zR+hzcygvFETLolse4OQMdKrChst2Tvmuvr6+FjA5+/nLrOMZ2UF7hG+oa4QCqpJdy9sgoTBBGqc6x4J6SJWntyaXk0t2Mzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCVVtc2H; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCVVtc2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714746280; x=1746282280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkB67/Rtu+hy9aEh2/6UatHCbR2f+6JryxFtMx9+T50=;
  b=TCVVtc2Hc6sQfzMT+oEt2JYIy0NTyac5PW64O6Aaglj1Sr7Vz4n7G9Gi
   6OQB9tnr1AT9RtpchNonnmM6mXtzhzgVorwQ8Jqbxj7dMy34YUSLnz/J3
   nucr4MPWbfDr5704d78sBvQ1hBlLH5sig74qvtOXDn8/0u6s7FViYxiN0
   F5j09wAR5g2psHSYdEn6SPIDRYZC+MdROfxGkZ839VTw92BVPtaMv8TBj
   JSUripOC3QivGRFhD5j4I+qrZveqfV1S/40CrcDXvvarhjtmchoStfOG7
   f8mxXm5mml+E0bREQKsyD7pX1pSQhJACY0PjUHxmiItBhigDtQfgt9xfu
   g==;
X-CSE-ConnectionGUID: BG473jy4SIuJn3PyvIGPUw==
X-CSE-MsgGUID: VhSYLka8SdynYZfRq20LYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21705583"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21705583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:24:37 -0700
X-CSE-ConnectionGUID: g29DZ2DOSZGkvSz0hO+qNw==
X-CSE-MsgGUID: iLLm61siRS2/j1gKYwgNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="31969465"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 May 2024 07:24:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tpx-000Bl8-0a;
	Fri, 03 May 2024 14:24:33 +0000
Date: Fri, 3 May 2024 22:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 260/362]
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:54: error: '_pfp.bin' directive
 output may be truncated writing 8 bytes into a region of size between 4 and
 33
Message-ID: <202405032208.8mieAYda-lkp@intel.com>
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
commit: 52cb80c12e8a647aa9c903903d58916e6c1c4d38 [260/362] drm/amdgpu: Add gfx v12_0 ip block support (v6)
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405032208.8mieAYda-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032208.8mieAYda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032208.8mieAYda-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c: In function 'gfx_v12_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:54: error: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     422 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     422 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:429:54: error: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     429 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:429:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     429 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:437:62: error: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     437 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:437:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     437 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:449:54: error: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:449:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +422 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c

   408	
   409	static int gfx_v12_0_init_microcode(struct amdgpu_device *adev)
   410	{
   411		char fw_name[40];
   412		char ucode_prefix[30];
   413		int err;
   414		const struct rlc_firmware_header_v2_0 *rlc_hdr;
   415		uint16_t version_major;
   416		uint16_t version_minor;
   417	
   418		DRM_DEBUG("\n");
   419	
   420		amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
   421	
 > 422		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
   423		err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
   424		if (err)
   425			goto out;
   426		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_PFP);
   427		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_PFP_P0_STACK);
   428	
 > 429		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
   430		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
   431		if (err)
   432			goto out;
   433		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_ME);
   434		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_ME_P0_STACK);
   435	
   436		if (!amdgpu_sriov_vf(adev)) {
 > 437			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
   438			err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
   439			if (err)
   440				goto out;
   441			rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
   442			version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
   443			version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
   444			err = amdgpu_gfx_rlc_init_microcode(adev, version_major, version_minor);
   445			if (err)
   446				goto out;
   447		}
   448	
 > 449		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
   450		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
   451		if (err)
   452			goto out;
   453		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_MEC);
   454		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_MEC_P0_STACK);
   455		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_RS64_MEC_P1_STACK);
   456	
   457		if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO)
   458			err = gfx_v12_0_init_toc_microcode(adev, ucode_prefix);
   459	
   460		/* only one MEC for gfx 12 */
   461		adev->gfx.mec2_fw = NULL;
   462	
   463	out:
   464		if (err) {
   465			amdgpu_ucode_release(&adev->gfx.pfp_fw);
   466			amdgpu_ucode_release(&adev->gfx.me_fw);
   467			amdgpu_ucode_release(&adev->gfx.rlc_fw);
   468			amdgpu_ucode_release(&adev->gfx.mec_fw);
   469		}
   470	
   471		return err;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
