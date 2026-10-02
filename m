Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065FB2264CA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 18:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966793; cv=none; b=bg41HidBsYpmIGPbof6efsnsy3LcxBxjOFf/Gv7S2c207eUTOT6SdyglrvNFFX8srfCQcs+LE6UWJbLGmERAJRbWp8PKLRQx+5yFoo+00akU3EFwb9ZegOCnbrPHKKcnHOkGPAqFFjLgVDPSbNiYGIuSWfKdnIWwh6B3n6OYc18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966793; c=relaxed/simple;
	bh=WRFaxUBmLdFNLxJbypXBCyH7UA7T0f3RiPKWPDQ5ALY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wu4SC/6WtaKIi7ZvTwZIBu/ImZUvakDRVtHSD2dx8rKwWv2khV+D0gu0qEwBLRV/LoS2Gduo/eVeUfOvEkn2FTE6KvVlbJb25R8XPkAD5kHppynJTRtV1X1M/5w6j8MgsqIC+YireuPOv+AIIAWz4KQWhjo3wn7pWc4zFUOs2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oI0HWNFN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oI0HWNFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790966791; x=1822502791;
  h=date:from:to:cc:subject:message-id;
  bh=WRFaxUBmLdFNLxJbypXBCyH7UA7T0f3RiPKWPDQ5ALY=;
  b=oI0HWNFN56dw7l1FQnyb1vlCKpuhP+HxGSDRk2OEAPE0axYBBbiIotEz
   Cn0kWKZP+oeNbza9PqWGWZjbjZMhFuEyK2HvYccpag0d4EpT1m0m1p2Vg
   rSjp63HyVYDYbGJqO2guy/a56wpbORQv+v/iEWaygWX89B+9iYdPGMvwE
   IuvHOhOUQemLzIvV2vjk0RtS74Q6dzNlVOIAGD9NMF0ogJa1Mcqj79hhB
   PnFLn2jjG/wN/efynNl5zdQBVb/Pp+z5cL3kISYT0GOiyO2L/ieuRj/9n
   ZmMdYSDLIYoYisInRZnDXUENwt96FkNtuyEVN/1pP697UlRi05l0VRZ3Z
   g==;
X-CSE-ConnectionGUID: VDP1C+dJSGmu/gyPmj1AEg==
X-CSE-MsgGUID: XubPPbeKSjOnaruMthos2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="101901014"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101901014"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 11:46:30 -0700
X-CSE-ConnectionGUID: 5ttSxcj0SuSymmDHqD2qSg==
X-CSE-MsgGUID: d8rnD8Y8Tdae0gR6rHehVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="304266138"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2026 11:46:28 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCiH4-000000000iN-3VoO;
	Fri, 02 Oct 2026 18:46:26 +0000
Date: Fri, 02 Oct 2026 20:45:44 +0200
From: kernel test robot <lkp@intel.com>
To: Caden Chien <chih-wei.chien@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 68/175]
 drivers/gpu/drm/amd/amdgpu/vpe_v3_0.c:138:27: sparse: sparse: cast to
 restricted __le32
Message-ID: <202610022032.6A96GbFc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   41505ac433cc4c5179deee8860d197b04f6d1c1d
commit: 99587803152eaac444591b852394e20e665a32fd [68/175] drm/amdgpu/vpe: add vpe v3.0.0 support
config: microblaze-randconfig-r2309-20261002 (https://download.01.org/0day-ci/archive/20261002/202610022032.6A96GbFc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022032.6A96GbFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022032.6A96GbFc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/vpe_v3_0.c:138:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vpe_v3_0.c:139:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vpe_v3_0.c:141:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vpe_v3_0.c:142:25: sparse: sparse: cast to restricted __le32
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:247:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:248:37: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:257:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:257:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:257:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:263:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:263:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:263:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:670:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:818:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:880:16: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:1019:27: sparse: sparse: symbol 'vpe_ip_funcs' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:1032:27: sparse: sparse: symbol 'vpe2_ip_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:1045:27: sparse: sparse: symbol 'vpe3_ip_funcs' was not declared. Should it be static?

vim +138 drivers/gpu/drm/amd/amdgpu/vpe_v3_0.c

    59	
    60	static int vpe_v3_0_load_microcode(struct amdgpu_vpe *vpe)
    61	{
    62		struct amdgpu_device *adev = vpe->ring.adev;
    63		const struct vpe_firmware_header_v1_0 *vpe_hdr;
    64		const __le32 *data;
    65		uint32_t ucode_offset[2], ucode_size[2], size_dw, ret;
    66		uint32_t f32_offset, f32_cntl, reg_data;
    67	
    68		ret = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_CNTL));
    69		ret = REG_SET_FIELD(ret, VPEC_CNTL, UMSCH_INT_ENABLE, 0);
    70		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_CNTL), ret);
    71	
    72		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_CNTL2));
    73		reg_data = REG_SET_FIELD(reg_data, VPEC_CNTL2, IB_FIFO_WATERMARK, 1);
    74		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_CNTL2), reg_data);
    75	
    76		if (amdgpu_vpe_configure_dpm(vpe))
    77			dev_warn(adev->dev, "VPE DPM not enabled.\n");
    78	
    79		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
    80	
    81			f32_offset = vpe_get_reg_offset(vpe, 0, regVPEC_F32_CNTL);
    82			f32_cntl = RREG32(f32_offset);
    83			f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, HALT, 0);
    84			f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH1_RESET, 0);
    85	
    86			adev->vpe.cmdbuf_cpu_addr[0] = f32_offset;
    87			adev->vpe.cmdbuf_cpu_addr[1] = f32_cntl;
    88	
    89			return amdgpu_vpe_psp_update_sram(adev);
    90		}
    91	
    92		/* Halt and Check F32 cleaness */
    93		f32_offset = vpe_get_reg_offset(vpe, 0, regVPEC_F32_CNTL);
    94		f32_cntl = RREG32(f32_offset);
    95		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, HALT, 1);
    96		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH1_RESET, 1);
    97		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH1_CHECKSUM_CLR, 1);
    98		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH0_CHECKSUM_CLR, 1);
    99		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_F32_CNTL), f32_cntl);
   100	
   101		f32_cntl = RREG32(f32_offset);
   102		if (!REG_GET_FIELD(f32_cntl, VPEC_F32_CNTL, HALT)) {
   103			dev_err(adev->dev, "VPEC is not halted");
   104			return -EBUSY;
   105		}
   106	
   107		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH1_CHECKSUM_CLR, 0);
   108		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH0_CHECKSUM_CLR, 0);
   109		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_F32_CNTL), f32_cntl);
   110	
   111		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_UCODE_CHECKSUM));
   112		if (reg_data) {
   113			dev_err(adev->dev, "VPE FW checksum 0 not clean");
   114			return -EBUSY;
   115		}
   116		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_UCODE1_CHECKSUM));
   117		if (reg_data) {
   118			dev_err(adev->dev, "VPE FW checksum 1 not clean");
   119			return -EBUSY;
   120		}
   121	
   122		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_STATUS2));
   123		if (REG_GET_FIELD(reg_data, VPEC_STATUS2, TH0F32_INSTR_PTR)) {
   124			dev_err(adev->dev, "VPE FW initial status not clean");
   125			return -EBUSY;
   126		}
   127	
   128		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_STATUS6));
   129		if (REG_GET_FIELD(reg_data, VPEC_STATUS6, TH1F32_INSTR_PTR)) {
   130			dev_err(adev->dev, "VPE FW initial status not clean");
   131			return -EBUSY;
   132		}
   133		/* end of F32 cleaness check */
   134	
   135		vpe_hdr = (const struct vpe_firmware_header_v1_0 *)adev->vpe.fw->data;
   136	
   137		/* Thread 0(command thread) ucode offset/size */
 > 138		ucode_offset[0] = le32_to_cpu(vpe_hdr->header.ucode_array_offset_bytes);
   139		ucode_size[0] = le32_to_cpu(vpe_hdr->ctx_ucode_size_bytes);
   140		/* Thread 1(control thread) ucode offset/size */
   141		ucode_offset[1] = le32_to_cpu(vpe_hdr->ctl_ucode_offset);
   142		ucode_size[1] = le32_to_cpu(vpe_hdr->ctl_ucode_size_bytes);
   143	
   144		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_PG_CNTL));
   145		reg_data = REG_SET_FIELD(reg_data, VPEC_PG_CNTL, PG_EN, 0);
   146		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_PG_CNTL), reg_data);
   147	
   148		for (int j = 0; j < vpe->num_instances; j++) {
   149			for (int i = 0; i < 2; i++) {
   150				if (i > 0)
   151					WREG32(vpe_get_reg_offset(vpe, j, regVPEC_UCODE_ADDR), VPE_THREAD1_UCODE_OFFSET);
   152				else
   153					WREG32(vpe_get_reg_offset(vpe, j, regVPEC_UCODE_ADDR), 0);
   154	
   155				data = (const __le32 *)(adev->vpe.fw->data + ucode_offset[i]);
   156				size_dw = ucode_size[i] / sizeof(__le32);
   157	
   158				while (size_dw--) {
   159					if (amdgpu_emu_mode && size_dw % 500 == 0)
   160						msleep(1);
   161					WREG32(vpe_get_reg_offset(vpe, j, regVPEC_UCODE_DATA), le32_to_cpup(data++));
   162				}
   163			}
   164		}
   165	
   166		reg_data = RREG32(vpe_get_reg_offset(vpe, 0, regVPEC_PG_CNTL));
   167		reg_data = REG_SET_FIELD(reg_data, VPEC_PG_CNTL, PG_EN, 1);
   168		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_PG_CNTL), reg_data);
   169	
   170		/* Unhalt F32 */
   171		f32_cntl = RREG32(f32_offset);
   172		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, HALT, 0);
   173		f32_cntl = REG_SET_FIELD(f32_cntl, VPEC_F32_CNTL, TH1_RESET, 0);
   174		WREG32(vpe_get_reg_offset(vpe, 0, regVPEC_F32_CNTL), f32_cntl);
   175	
   176		return 0;
   177	}
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
