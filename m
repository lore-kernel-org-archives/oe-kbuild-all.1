Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C823A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676281155; x=1707817155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEwm2zVMkeqZ3NVW28YS0S0AxKRS/dLVpYYDWw6ZF2g=;
  b=NeEIiFcNTkIzvLWKA0doeau4rRzMXIExRFbKZzVhymyTwgQqsNisUMWb
   g14XZromCS0RCGRBsbfbET1aXfeuJ1VkB/z/SLQoS2zAw4xUTMY82sNAn
   NuhrD1gMCu9JnHasGiMiWOoCuz4zAWt6vG1asDCJrIuffZ4hSEbP7Tful
   iII9alnLoYE5g/fHdeNPsDte4RUBUxc4sWOXibPJh4BaC7ifQSzjV4tKX
   +geubUF9eoFnU2u3/1by9tm+wOqlKPu2HPFmQnXu1tS5K0MqQsuJnwoHq
   bQzA12PWI/y996/3HUXgi+bytZrfpTP7Yw6k5QI/Ubk6Bh/dXR0OOhOa2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329481867"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="329481867"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 01:39:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="618593942"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="618593942"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 01:39:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRVIm-0007ev-2l;
	Mon, 13 Feb 2023 09:39:12 +0000
Date: Mon, 13 Feb 2023 17:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 183/193]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous
 prototype for 'nvkm_gsp_fwsec_v2'
Message-ID: <202302131701.JEMroxCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   ab3448c2873e0fbcf1fd710cccb52dc548bdf449
commit: e5a4b3a2f16e4dac606a44ae4a3ab43240c0fca8 [183/193] drm/nouveau/gsp/tu102-: add support for booting GSP-RM
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302131701.JEMroxCt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout e5a4b3a2f16e4dac606a44ae4a3ab43240c0fca8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131701.JEMroxCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:172:1: warning: no previous prototype for 'nvkm_gsp_fwsec_v2' [-Wmissing-prototypes]
     172 | nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
         | ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:222:1: warning: no previous prototype for 'nvkm_gsp_fwsec_v3' [-Wmissing-prototypes]
     222 | nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
         | ^~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c: In function 'tu102_gsp_booter_ctor':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c:40:29: warning: variable 'meta' set but not used [-Wunused-but-set-variable]
      40 |         u32 loc, sig, cnt, *meta;
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
https://github.com/intel/lkp-tests
