Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E0253356
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761157861; cv=none; b=EK5aZycpRITQk6gR/U0WvccVuX9jo2T6SoqcbkqzM0MUUOQnQrhZxoUGTDOUqjcG2Wk6grp6ZnQZ7T0Dt6N7Enkeyo806w2aA82FKZlonAxwl3+GUMqdYL6zJNBiJBk8LBDlz1dmf7OZacyF2lzKrGT4Z5M9zf70JGC++Fn+8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761157861; c=relaxed/simple;
	bh=1vIITsNGj3Kxplei/PvL0TkKOzpU6uWwJU3ODqVcDUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkwzyeuFdneSB10XCC1O1OS8M6zOTPFCNM5PP5oIA3Qb8uNPmnUaMxDQ2AFxmg4JWnEBsCyfJkU7hDt2rUKMK4kSCG+8VdTxJVimp+1dSEmOBMR72pfk5PZl39eXzwTfRYJRk3UMuDvtJJsSjQUBcqXiwxKtPNE1VljHDMiiM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCV27Kbl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCV27Kbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761157859; x=1792693859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vIITsNGj3Kxplei/PvL0TkKOzpU6uWwJU3ODqVcDUU=;
  b=nCV27KblEbSbiKESdXoFxACGbziQR/JyD5A1sr/rlI0q9woTxtIXAiEQ
   L0KXONUliLcYMgnY2TehJP2l/JlriUadgJl2v71lbaUKFHYmP+QjIpT5d
   tmeIbzjHRcqw3RrIHduIY6fPIBbf8AQZcO79TlzRLh95HyW/a6OXwciS5
   aAbKeDUkajShQA3Y4a0N3epXfBajzLtj2x4PcI8rY70K6MDez5MqumW6F
   fkAedxBTcx7Xcu2II4bwPAgHj41t8ofAAKbz4VnzOKK7OGt/2q3Y/6XOj
   Cm7aVOKrAyRUUO4dY0phWt+lWogCarXfC4twEj9wlTIVkJJ8i2MpRJwaY
   A==;
X-CSE-ConnectionGUID: TOOddYkRQmOz1C4EzQiMpw==
X-CSE-MsgGUID: sPPCuZ8uRwChlqCa71w6KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63464586"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63464586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:30:58 -0700
X-CSE-ConnectionGUID: 8GTfgR6BSzuFUGN+X2n7bw==
X-CSE-MsgGUID: PXrazzpaTdSEvHNXXbepPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214884546"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2025 11:30:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBdbm-000Ce5-1z;
	Wed, 22 Oct 2025 18:30:51 +0000
Date: Thu, 23 Oct 2025 02:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ellen Pan <yunru.pan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: [linux-next:master 3047/3483]
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:884
 amdgpu_virt_init_critical_region() warn: unsigned 'init_hdr_offset' is never
 less than zero.
Message-ID: <202510230222.gjGA0A40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: 07009df6494dc9272b233eeddc10d26f545ff09a [3047/3483] drm/amdgpu: Introduce SRIOV critical regions v2 during VF init
config: x86_64-randconfig-161-20251022 (https://download.01.org/0day-ci/archive/20251023/202510230222.gjGA0A40-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230222.gjGA0A40-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:884 amdgpu_virt_init_critical_region() warn: unsigned 'init_hdr_offset' is never less than zero.

vim +/init_hdr_offset +884 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c

   870	
   871	int amdgpu_virt_init_critical_region(struct amdgpu_device *adev)
   872	{
   873		struct amd_sriov_msg_init_data_header *init_data_hdr = NULL;
   874		uint32_t init_hdr_offset = adev->virt.init_data_header.offset;
   875		uint32_t init_hdr_size = adev->virt.init_data_header.size_kb << 10;
   876		uint64_t vram_size;
   877		int r = 0;
   878		uint8_t checksum = 0;
   879	
   880		/* Skip below init if critical region version != v2 */
   881		if (adev->virt.req_init_data_ver != GPU_CRIT_REGION_V2)
   882			return 0;
   883	
 > 884		if (init_hdr_offset < 0) {
   885			dev_err(adev->dev, "Invalid init header offset\n");
   886			return -EINVAL;
   887		}
   888	
   889		vram_size = RREG32(mmRCC_CONFIG_MEMSIZE);
   890		if (!vram_size || vram_size == U32_MAX)
   891			return -EINVAL;
   892		vram_size <<= 20;
   893	
   894		if ((init_hdr_offset + init_hdr_size) > vram_size) {
   895			dev_err(adev->dev, "init_data_header exceeds VRAM size, exiting\n");
   896			return -EINVAL;
   897		}
   898	
   899		/* Allocate for init_data_hdr */
   900		init_data_hdr = kzalloc(sizeof(struct amd_sriov_msg_init_data_header), GFP_KERNEL);
   901		if (!init_data_hdr)
   902			return -ENOMEM;
   903	
   904		amdgpu_device_vram_access(adev, (uint64_t)init_hdr_offset, (uint32_t *)init_data_hdr,
   905						sizeof(struct amd_sriov_msg_init_data_header), false);
   906	
   907		/* Table validation */
   908		if (strncmp(init_data_hdr->signature,
   909					AMDGPU_SRIOV_CRIT_DATA_SIGNATURE,
   910					AMDGPU_SRIOV_CRIT_DATA_SIG_LEN) != 0) {
   911			dev_err(adev->dev, "Invalid init data signature: %.4s\n",
   912				init_data_hdr->signature);
   913			r = -EINVAL;
   914			goto out;
   915		}
   916	
   917		checksum = amdgpu_virt_crit_region_calc_checksum(
   918				(uint8_t *)&init_data_hdr->initdata_offset,
   919				(uint8_t *)init_data_hdr +
   920				sizeof(struct amd_sriov_msg_init_data_header));
   921		if (checksum != init_data_hdr->checksum) {
   922			dev_err(adev->dev, "Found unmatching checksum from calculation 0x%x and init_data 0x%x\n",
   923					checksum, init_data_hdr->checksum);
   924			r = -EINVAL;
   925			goto out;
   926		}
   927	
   928		memset(&adev->virt.crit_regn, 0, sizeof(adev->virt.crit_regn));
   929		memset(adev->virt.crit_regn_tbl, 0, sizeof(adev->virt.crit_regn_tbl));
   930	
   931		adev->virt.crit_regn.offset = init_data_hdr->initdata_offset;
   932		adev->virt.crit_regn.size_kb = init_data_hdr->initdata_size_in_kb;
   933	
   934		/* Validation and initialization for each table entry */
   935		if (IS_SRIOV_CRIT_REGN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_IPD_TABLE_ID)) {
   936			if (!init_data_hdr->ip_discovery_size_in_kb ||
   937					init_data_hdr->ip_discovery_size_in_kb > DISCOVERY_TMR_SIZE) {
   938				dev_err(adev->dev, "Invalid %s size: 0x%x\n",
   939					amdgpu_virt_dynamic_crit_table_name[AMD_SRIOV_MSG_IPD_TABLE_ID],
   940					init_data_hdr->ip_discovery_size_in_kb);
   941				r = -EINVAL;
   942				goto out;
   943			}
   944	
   945			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_IPD_TABLE_ID].offset =
   946				init_data_hdr->ip_discovery_offset;
   947			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_IPD_TABLE_ID].size_kb =
   948				init_data_hdr->ip_discovery_size_in_kb;
   949		}
   950	
   951		if (IS_SRIOV_CRIT_REGN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID)) {
   952			if (!init_data_hdr->vbios_img_size_in_kb) {
   953				dev_err(adev->dev, "Invalid %s size: 0x%x\n",
   954					amdgpu_virt_dynamic_crit_table_name[AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID],
   955					init_data_hdr->vbios_img_size_in_kb);
   956				r = -EINVAL;
   957				goto out;
   958			}
   959	
   960			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID].offset =
   961				init_data_hdr->vbios_img_offset;
   962			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_VBIOS_IMG_TABLE_ID].size_kb =
   963				init_data_hdr->vbios_img_size_in_kb;
   964		}
   965	
   966		if (IS_SRIOV_CRIT_REGN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID)) {
   967			if (!init_data_hdr->ras_tele_info_size_in_kb) {
   968				dev_err(adev->dev, "Invalid %s size: 0x%x\n",
   969					amdgpu_virt_dynamic_crit_table_name[AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID],
   970					init_data_hdr->ras_tele_info_size_in_kb);
   971				r = -EINVAL;
   972				goto out;
   973			}
   974	
   975			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID].offset =
   976				init_data_hdr->ras_tele_info_offset;
   977			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_RAS_TELEMETRY_TABLE_ID].size_kb =
   978				init_data_hdr->ras_tele_info_size_in_kb;
   979		}
   980	
   981		if (IS_SRIOV_CRIT_REGN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID)) {
   982			if (!init_data_hdr->dataexchange_size_in_kb) {
   983				dev_err(adev->dev, "Invalid %s size: 0x%x\n",
   984					amdgpu_virt_dynamic_crit_table_name[AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID],
   985					init_data_hdr->dataexchange_size_in_kb);
   986				r = -EINVAL;
   987				goto out;
   988			}
   989	
   990			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID].offset =
   991				init_data_hdr->dataexchange_offset;
   992			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_DATAEXCHANGE_TABLE_ID].size_kb =
   993				init_data_hdr->dataexchange_size_in_kb;
   994		}
   995	
   996		if (IS_SRIOV_CRIT_REGN_ENTRY_VALID(init_data_hdr, AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID)) {
   997			if (!init_data_hdr->bad_page_size_in_kb) {
   998				dev_err(adev->dev, "Invalid %s size: 0x%x\n",
   999					amdgpu_virt_dynamic_crit_table_name[AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID],
  1000					init_data_hdr->bad_page_size_in_kb);
  1001				r = -EINVAL;
  1002				goto out;
  1003			}
  1004	
  1005			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID].offset =
  1006				init_data_hdr->bad_page_info_offset;
  1007			adev->virt.crit_regn_tbl[AMD_SRIOV_MSG_BAD_PAGE_INFO_TABLE_ID].size_kb =
  1008				init_data_hdr->bad_page_size_in_kb;
  1009		}
  1010	
  1011		adev->virt.is_dynamic_crit_regn_enabled = true;
  1012	
  1013	out:
  1014		kfree(init_data_hdr);
  1015		init_data_hdr = NULL;
  1016	
  1017		return r;
  1018	}
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
