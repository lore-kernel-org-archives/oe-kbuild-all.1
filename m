Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3D13ACC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694890759; x=1726426759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lV2PkrUkeqws2LHeZUiF6KSwLyLY8aoxJ0xM0/5IoXE=;
  b=VxBDKwPet5CzjNZT2VYawIHZI063bwthDgTG4drUTMXonp+4gVYzVBwt
   bfHqr1fTKYKKiBOAeQvcPejxJx/eZsXW7tv5+2q7biQxfZF4bdID4ebjr
   wnJPyEkbrhJzafCOKrNrRYGUoEWIk0YDzn4o5jPInQcBGz2tEUt4wWAQ5
   eSYkX7WsQOA2IxjdAkVjjvxnlXim2S3mbs8hlpza080U5XMWkFumMg9Yb
   swfSXbBV2mdv8CsMHLXFx4rMbLzm3N5P8jG9SXartSVlK8+MFQRF4sfti
   b9oQqMz9x4gxnA8+WWVldaJ+cwV7R/dmTJjhrxKYkKC0MAymCXTHhsLIK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="445911243"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="445911243"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="695091735"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="695091735"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2023 11:59:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhaVf-0004Zo-0F;
	Sat, 16 Sep 2023 18:59:15 +0000
Date: Sun, 17 Sep 2023 02:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 8/32]
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:449:54: warning: '_toc.bin' directive
 output may be truncated writing 8 bytes into a region of size between 4 and
 33
Message-ID: <202309170214.0nyOdvwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   de10967a8b79627cbe295d7331f84fc9cff3bcef
commit: ab5b9b701262f2f2c916d70b757382da1a64a1d3 [8/32] ZEN: Disable stack conservation for GCC
config: loongarch-randconfig-002-20230917 (https://download.01.org/0day-ci/archive/20230917/202309170214.0nyOdvwy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170214.0nyOdvwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170214.0nyOdvwy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c: In function 'gfx_v11_0_init_microcode':
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:500:54: warning: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     500 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:500:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     500 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:517:54: warning: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     517 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:517:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     517 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:530:62: warning: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     530 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:530:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     530 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:542:54: warning: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     542 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:542:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     542 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:449:54: warning: '_toc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   In function 'gfx_v11_0_init_toc_microcode',
       inlined from 'gfx_v11_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:558:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:449:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +449 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

3d879e81f0f9ed Hawking Zhang     2022-04-13  442  
e045aec89d1b6c Mario Limonciello 2022-12-28  443  static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev, const char *ucode_prefix)
c88135c089e4d1 Mario Limonciello 2023-01-03  444  {
c88135c089e4d1 Mario Limonciello 2023-01-03  445  	const struct psp_firmware_header_v1_0 *toc_hdr;
c88135c089e4d1 Mario Limonciello 2023-01-03  446  	int err = 0;
c88135c089e4d1 Mario Limonciello 2023-01-03  447  	char fw_name[40];
c88135c089e4d1 Mario Limonciello 2023-01-03  448  
c88135c089e4d1 Mario Limonciello 2023-01-03 @449  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
c88135c089e4d1 Mario Limonciello 2023-01-03  450  	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
c88135c089e4d1 Mario Limonciello 2023-01-03  451  	if (err)
c88135c089e4d1 Mario Limonciello 2023-01-03  452  		goto out;
c88135c089e4d1 Mario Limonciello 2023-01-03  453  
c88135c089e4d1 Mario Limonciello 2023-01-03  454  	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
c88135c089e4d1 Mario Limonciello 2023-01-03  455  	adev->psp.toc.fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
c88135c089e4d1 Mario Limonciello 2023-01-03  456  	adev->psp.toc.feature_version = le32_to_cpu(toc_hdr->sos.fw_version);
c88135c089e4d1 Mario Limonciello 2023-01-03  457  	adev->psp.toc.size_bytes = le32_to_cpu(toc_hdr->header.ucode_size_bytes);
c88135c089e4d1 Mario Limonciello 2023-01-03  458  	adev->psp.toc.start_addr = (uint8_t *)toc_hdr +
c88135c089e4d1 Mario Limonciello 2023-01-03  459  				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
c88135c089e4d1 Mario Limonciello 2023-01-03  460  	return 0;
c88135c089e4d1 Mario Limonciello 2023-01-03  461  out:
c88135c089e4d1 Mario Limonciello 2023-01-03  462  	amdgpu_ucode_release(&adev->psp.toc_fw);
c88135c089e4d1 Mario Limonciello 2023-01-03  463  	return err;
c88135c089e4d1 Mario Limonciello 2023-01-03  464  }
c88135c089e4d1 Mario Limonciello 2023-01-03  465  

:::::: The code at line 449 was first introduced by commit
:::::: c88135c089e4d126ad1b2d9494a32d3d9160df4e drm/amd: Use `amdgpu_ucode_*` helpers for GFX11

:::::: TO: Mario Limonciello <mario.limonciello@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
