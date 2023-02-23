Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E328ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677166449; x=1708702449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WAuR3op7vAkigsHeldJKWuWOLmy2ZsFxxgEGhU3mKlQ=;
  b=HxdJsk5cDObvLBfTKdEvFEKPg1epP09bSKpZQW1l6HgaSADELdpxlXa/
   otsANlUZykKnpxqf2YNUBIvKJr2xRZXsAoRbySSNixtJViRnLnrk7Eole
   Yj7kvQhxqiwBuEAekNasBQwG7D/heY2D+cbYcVDHAScL6kNrfcApS+pGH
   cR0EfhzuGNGIWN2yOqAfwVYznZKmoqWtNpCKFCEd3/x9jOmACG4VyKnu1
   51xN9OkvjtCH1DvGSiKp0fzmKYx5O2XyUpj/BGe9YaAdNbvt3dB3KjxEf
   acnFfQqyYkdOED1r9ppQt8MhXZJEZvvevc7jJQWNtfLxjKw0zRG/eJqcB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335469019"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="335469019"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 07:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="702827231"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="702827231"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2023 07:34:06 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVDbh-0001Qg-0s;
	Thu, 23 Feb 2023 15:34:05 +0000
Date: Thu, 23 Feb 2023 23:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gourav Samaiya <gsamaiya@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning:
 variable 'loc' set but not used
Message-ID: <202302232310.LzVcEhwE-lkp@intel.com>
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
head:   a5c95ca18a98d742d0a4a04063c32556b5b66378
commit: 4b569ded09fdadb0c14f797c8dae4e8bc4bbad9f drm/nouveau/acr/ga102: initial support
date:   4 months ago
config: ia64-buildonly-randconfig-r006-20230222 (https://download.01.org/0day-ci/archive/20230223/202302232310.LzVcEhwE-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4b569ded09fdadb0c14f797c8dae4e8bc4bbad9f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4b569ded09fdadb0c14f797c8dae4e8bc4bbad9f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232310.LzVcEhwE-lkp@intel.com/

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
https://github.com/intel/lkp-tests
