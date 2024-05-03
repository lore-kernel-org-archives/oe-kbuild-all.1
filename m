Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160C10A1A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714753846; cv=none; b=XnF/wntqVXGNyue7oGEjhnScq6o5eSwCPlwSicSQgfzo9MGVPjQNsQt1Z9Cf2yFdmVYXrlWDTP+MFCBNdVBPxQeQKUg9z/O6lNQa4N0bX5DSdd+tFtFCTIDalgKIpIQXuoi/aESD7NchAUKE1vbKT21/RhpYo8MyUEYawzGGr0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714753846; c=relaxed/simple;
	bh=SxoL0kblxMoUnT46pxYoQcfRky76SRT+Nm5MHrRk0XY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkn/jbVTE9i3YROUNFJSExSegN66DxKGolYv5U8SgxxrhEd6ZznRWJ9ikYOwsFlSHlQOxZGJImyL/IzZd3SdEFWNykpQNryLYcC751a8S+abkmw81F/GoB51Yi3epbY0rSwduCq72OEVXkMKBV5VvGkGXl+RiKr/B4MqBIu9pFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXREnS4k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXREnS4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714753845; x=1746289845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SxoL0kblxMoUnT46pxYoQcfRky76SRT+Nm5MHrRk0XY=;
  b=RXREnS4kaQchqunnsoJNpQOm7+t+P0d0dURyiUYGbwYiPxDl0Oy6d1ZB
   DPy5fNHgpQlMwUbkZiJSbyMBlWsW6s1lU/qHkkpfN2LBeSroFdLdiz/Am
   2yFDE+eCv9UXQGdFwpCdKFUp2xEIvyMdxqQ5t+qOIya3VC+G7HUgMn5ri
   pQJ9DoVlJQrqVEgA/3mp4StvyKu6qtxrNaYFDdZb7c+pqAQ5ovpmuZ+a8
   fiCx0BmbKVDsqrWeRCl8rmu+JCqpg6v/vB2nz7NLtvnf6VpSY4sb1zJsE
   ksb7UOTOUlHwf8ohz4c2zrgUBSvjkjq0NWE6EYb4hH0JuaEm/a6yvLU8H
   w==;
X-CSE-ConnectionGUID: IjS/KDoaRyuOR633P1/nhA==
X-CSE-MsgGUID: A4kIA1ZnTEm3StYjvAulFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21121128"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21121128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 09:30:44 -0700
X-CSE-ConnectionGUID: Zn0KOpGhRKi1GZrtV2U2Yw==
X-CSE-MsgGUID: KPPLBvsISJWAWVpq1ul0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28086183"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2024 09:30:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2vo0-000BtS-08;
	Fri, 03 May 2024 16:30:40 +0000
Date: Sat, 4 May 2024 00:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 260/362]
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:54: warning: '_pfp.bin' directive
 output may be truncated writing 8 bytes into a region of size between 4 and
 33
Message-ID: <202405040033.a1kpCWLf-lkp@intel.com>
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
config: csky-randconfig-r031-20220611 (https://download.01.org/0day-ci/archive/20240504/202405040033.a1kpCWLf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040033.a1kpCWLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040033.a1kpCWLf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c: In function 'gfx_v12_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:54: warning: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     422 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     422 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:429:54: warning: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     429 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:429:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     429 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:437:62: warning: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     437 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:437:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     437 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:449:54: warning: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:449:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
