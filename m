Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E611EBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9xbVL4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697569731; x=1729105731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pyX2JOWwqAkhbZpTwcwwjk8LSYSa2UMO7e9IIOfRWsU=;
  b=d9xbVL4HniqlblVOSgUjsTI4A0BsdIvOohAUYCMh0i/bZ/cuErfuLpe5
   ttUcPoclRSKU2QA5RFkXABkLiPwL0qOHObE4oJ32Azjnm8jaFX26qqSMq
   xFb8rwAOIcs4qWRU6fFRRIRSn4PCGkcL3bHkVFQBhbiKeVEI8c/LfJOmp
   P3111jDH3Vhr53bH05c/62rrko5wmRXVr+UjE92QEmIJm9XiPzXm5EWNx
   Bexi1pfiaT/eZb/LTM/q4ws3vh8e28gTi/ivT8ZgtcD5qCBcQ8cs4zrNL
   mQhuJpsCmFb7aEHe+NNmTSFexraEoaqObTM4/CaNSR5sVI+Rgt8QNh2bA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370928841"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="370928841"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 12:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="879918247"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="879918247"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Oct 2023 12:08:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qspQr-0009z1-2d;
	Tue, 17 Oct 2023 19:08:45 +0000
Date: Wed, 18 Oct 2023 03:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gourav Samaiya <gsamaiya@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning:
 variable 'loc' set but not used
Message-ID: <202310180242.pNOBOe8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 4b569ded09fdadb0c14f797c8dae4e8bc4bbad9f drm/nouveau/acr/ga102: initial support
date:   11 months ago
config: x86_64-randconfig-x053-20230725 (https://download.01.org/0day-ci/archive/20231018/202310180242.pNOBOe8n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180242.pNOBOe8n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180242.pNOBOe8n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c: In function 'nvkm_acr_lsfw_load_sig_image_desc_v2':
>> drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
     221 |                 u32 loc, sig, cnt, *meta;
         |                     ^~~


vim +/loc +221 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c

   179	
   180	int
   181	nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
   182					     struct nvkm_falcon *falcon,
   183					     enum nvkm_acr_lsf_id id,
   184					     const char *path, int ver,
   185					     const struct nvkm_acr_lsf_func *func)
   186	{
   187		const struct firmware *fw;
   188		struct nvkm_acr_lsfw *lsfw;
   189		const struct nvfw_ls_desc_v2 *desc;
   190		int ret = 0;
   191	
   192		lsfw = nvkm_acr_lsfw_load_sig_image_desc_(subdev, falcon, id, path, ver, func, &fw);
   193		if (IS_ERR(lsfw))
   194			return PTR_ERR(lsfw);
   195	
   196		desc = nvfw_ls_desc_v2(subdev, fw->data);
   197	
   198		lsfw->secure_bootloader = desc->secure_bootloader;
   199		lsfw->bootloader_size = ALIGN(desc->bootloader_size, 256);
   200		lsfw->bootloader_imem_offset = desc->bootloader_imem_offset;
   201	
   202		lsfw->app_size = ALIGN(desc->app_size, 256);
   203		lsfw->app_start_offset = desc->app_start_offset;
   204		lsfw->app_imem_entry = desc->app_imem_entry;
   205		lsfw->app_resident_code_offset = desc->app_resident_code_offset;
   206		lsfw->app_resident_code_size = desc->app_resident_code_size;
   207		lsfw->app_resident_data_offset = desc->app_resident_data_offset;
   208		lsfw->app_resident_data_size = desc->app_resident_data_size;
   209		lsfw->app_imem_offset = desc->app_imem_offset;
   210		lsfw->app_dmem_offset = desc->app_dmem_offset;
   211	
   212		lsfw->ucode_size = ALIGN(lsfw->app_resident_data_offset, 256) + lsfw->bootloader_size;
   213		lsfw->data_size = lsfw->app_size + lsfw->bootloader_size - lsfw->ucode_size;
   214	
   215		nvkm_firmware_put(fw);
   216	
   217		if (lsfw->secure_bootloader) {
   218			const struct firmware *hsbl;
   219			const struct nvfw_ls_hsbl_bin_hdr *hdr;
   220			const struct nvfw_ls_hsbl_hdr *hshdr;
 > 221			u32 loc, sig, cnt, *meta;
   222	
   223			ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
   224			if (ret)
   225				return ret;
   226	
   227			hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
   228			hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
   229			meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
   230			loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
   231			sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
   232			cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
   233	
   234			lsfw->fuse_ver = meta[0];
   235			lsfw->engine_id = meta[1];
   236			lsfw->ucode_id = meta[2];
   237			lsfw->sig_size = hshdr->sig_prod_size / cnt;
   238			lsfw->sig_nr = cnt;
   239			lsfw->sigs = kmemdup(hsbl->data + hshdr->sig_prod_offset + sig,
   240					     lsfw->sig_nr * lsfw->sig_size, GFP_KERNEL);
   241			nvkm_firmware_put(hsbl);
   242			if (!lsfw->sigs)
   243				ret = -ENOMEM;
   244		}
   245	
   246		return ret;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
