Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8AB214EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689178382; x=1720714382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hiEKGPg6R5TGr1os1mjumN6MVqZ6DnqvDnm4e+Z7NrI=;
  b=Ij/TRyiqkLBIl0aZQPhmgyAOFmSMee+HsOYPwt6S/fBT/pEMth9eVv2Q
   Se3caihcDlvXnVrAq2w/eNy7J0iKbeAhZR8Slr9EDyDmrfOszzDekrlVR
   dIK8dParByC42soFUv77fIZyfQ6iayFoYX01zzGgBe9jepteYglPI/ef2
   e2N3cAyZTrxhVluJDoINYTfh1tWlBfsDZirj8AztN0gDbHG1jWcbAexzS
   hMA6Ge/aYyZsxA45n483dsc1ioJV4Am+cicAdRxVKE84EJg7qbJvbNB3N
   9D5n/y9L4MQAF2jkNcsLlYUC0ukdsP1QlqkqcYBSslenR93xUWehqTdU7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431068950"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="431068950"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 09:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835206402"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="835206402"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2023 09:13:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJcSZ-0005of-1c;
	Wed, 12 Jul 2023 16:12:59 +0000
Date: Thu, 13 Jul 2023 00:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 70/83]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous
 prototype for 'nvkm_gsp_fwsec_v2'
Message-ID: <202307130031.xw4VdIuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3f6fc48703e02597683babc04c512ca13bb95e19
commit: f96cac9d383d166bb0a7d85437ed2d87ee8610e9 [70/83] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307130031.xw4VdIuI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130031.xw4VdIuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130031.xw4VdIuI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous prototype for 'nvkm_gsp_fwsec_v2' [-Wmissing-prototypes]
     172 | nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
         | ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:222:1: warning: no previous prototype for 'nvkm_gsp_fwsec_v3' [-Wmissing-prototypes]
     222 | nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
         | ^~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c: In function 'tu102_gsp_booter_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c:39:29: warning: variable 'meta' set but not used [-Wunused-but-set-variable]
      39 |         u32 loc, sig, cnt, *meta;
         |                             ^~~~


vim +/nvkm_gsp_fwsec_v2 +172 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c

   170	
   171	int
 > 172	nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
   173			  const struct nvkm_falcon_ucode_desc_v2 *desc, u32 size, u32 init_cmd,
   174			  struct nvkm_falcon_fw *fw)
   175	{
   176		struct nvkm_subdev *subdev = &gsp->subdev;
   177		const struct firmware *bl;
   178		const struct nvfw_bin_hdr *hdr;
   179		const struct nvfw_bl_desc *bld;
   180		int ret;
   181	
   182		/* Build ucode. */
   183		ret = nvkm_falcon_fw_ctor(gsp->func->fwsec, name, subdev->device, true,
   184					  (u8 *)desc + size, desc->IMEMLoadSize + desc->DMEMLoadSize,
   185					  &gsp->falcon, fw);
   186		if (WARN_ON(ret))
   187			return ret;
   188	
   189		fw->nmem_base_img = 0;
   190		fw->nmem_base = desc->IMEMPhysBase;
   191		fw->nmem_size = desc->IMEMLoadSize - desc->IMEMSecSize;
   192	
   193		fw->imem_base_img = 0;
   194		fw->imem_base = desc->IMEMSecBase;
   195		fw->imem_size = desc->IMEMSecSize;
   196	
   197		fw->dmem_base_img = desc->DMEMOffset;
   198		fw->dmem_base = desc->DMEMPhysBase;
   199		fw->dmem_size = desc->DMEMLoadSize;
   200	
   201		/* Bootloader. */
   202		ret = nvkm_firmware_get(subdev, "acr/bl", 0, &bl);
   203		if (ret)
   204			return ret;
   205	
   206		hdr = nvfw_bin_hdr(subdev, bl->data);
   207		bld = nvfw_bl_desc(subdev, bl->data + hdr->header_offset);
   208	
   209		fw->boot_addr = bld->start_tag << 8;
   210		fw->boot_size = bld->code_size;
   211		fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
   212		if (!fw->boot)
   213			ret = -ENOMEM;
   214	
   215		nvkm_firmware_put(bl);
   216	
   217		/* Patch in interface data. */
   218		return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
   219	}
   220	
   221	int
 > 222	nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
   223			  const struct nvkm_falcon_ucode_desc_v3 *desc, u32 size, u32 init_cmd,
   224			  struct nvkm_falcon_fw *fw)
   225	{
   226		struct nvkm_device *device = gsp->subdev.device;
   227		struct nvkm_bios *bios = device->bios;
   228		int ret;
   229	
   230		/* Build ucode. */
   231		ret = nvkm_falcon_fw_ctor(gsp->func->fwsec, name, device, true,
   232					  (u8 *)desc + size, desc->IMEMLoadSize + desc->DMEMLoadSize,
   233					  &gsp->falcon, fw);
   234		if (WARN_ON(ret))
   235			return ret;
   236	
   237		fw->imem_base_img = 0;
   238		fw->imem_base = desc->IMEMPhysBase;
   239		fw->imem_size = desc->IMEMLoadSize;
   240		fw->dmem_base_img = desc->IMEMLoadSize;
   241		fw->dmem_base = desc->DMEMPhysBase;
   242		fw->dmem_size = ALIGN(desc->DMEMLoadSize, 256);
   243		fw->dmem_sign = desc->PKCDataOffset;
   244		fw->boot_addr = 0;
   245		fw->fuse_ver = desc->SignatureVersions;
   246		fw->ucode_id = desc->UcodeId;
   247		fw->engine_id = desc->EngineIdMask;
   248	
   249		/* Patch in signature. */
   250		ret = nvkm_falcon_fw_sign(fw, fw->dmem_base_img + desc->PKCDataOffset, 96 * 4,
   251					  nvbios_pointer(bios, 0), desc->SignatureCount,
   252					  (u8 *)desc + 0x2c - (u8 *)nvbios_pointer(bios, 0), 0, 0);
   253		if (WARN_ON(ret))
   254			return ret;
   255	
   256		/* Patch in interface data. */
   257		return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
