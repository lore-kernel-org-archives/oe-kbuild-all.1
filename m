Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DDAD2E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 03:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677209377; x=1708745377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P0suZm1r/ET8nElU8tKsO9hQabKlH2AKY4+th2UQDgg=;
  b=VsTWtpmtjpD+HBseCAyzuR1iCV2NzgdzWZq/XwxFPHaBykoWUe+/kXFk
   RyBY7ZkZI5GAgzhwvHD9XP5ap1HBkvfhYCGtHUiEDe4yLMJcg5L96GS42
   ShxAkaDcmDmP0SrwnjVPDssjQE7amuuzlFDqbRNm61YdQ3I/MSxF/3nE0
   br+komzXt2wELS0FPVCnTXM1J7IYYxESR8IeKapsg0cj0GmBFZVhbp8hL
   sPsbo8tpxGEUu358GchrLlBfKUfN1jku8Wv58dWvM3XA9v1b1h7N9q0ol
   z/3fvxQ5fu6w4fjl26jXjt45ULdt/i6VRjBtJ3jfopAEOJatyaDGHyHCd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335622429"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="335622429"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 19:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="650216216"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="650216216"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Feb 2023 19:29:35 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVOm6-00025b-2l;
	Fri, 24 Feb 2023 03:29:34 +0000
Date: Fri, 24 Feb 2023 11:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Candice Li <candice.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>
Subject: [agd5f:drm-next 20/28]
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:437:37: warning: variable
 'channel_index' set but not used
Message-ID: <202302241112.3r21D5OW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   4f101d5710a84f334b05a96713000ce8dfd4d598
commit: b1e9a718af2ec3d21734a8357e8f22aa3bb68bfb [20/28] drm/amdgpu: Add ecc info query interface for umc v8_10
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302241112.3r21D5OW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout b1e9a718af2ec3d21734a8357e8f22aa3bb68bfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241112.3r21D5OW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:212:6: warning: no previous prototype for 'umc_v8_10_convert_error_address' [-Wmissing-prototypes]
     212 | void umc_v8_10_convert_error_address(struct amdgpu_device *adev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/umc_v8_10.c: In function 'umc_v8_10_ecc_info_query_error_address':
>> drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:437:37: warning: variable 'channel_index' set but not used [-Wunused-but-set-variable]
     437 |         uint32_t eccinfo_table_idx, channel_index;
         |                                     ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/umc_v8_10.h:27,
                    from drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:23:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/channel_index +437 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c

   430	
   431	static void umc_v8_10_ecc_info_query_error_address(struct amdgpu_device *adev,
   432						struct ras_err_data *err_data,
   433						uint32_t ch_inst,
   434						uint32_t umc_inst,
   435						uint32_t node_inst)
   436	{
 > 437		uint32_t eccinfo_table_idx, channel_index;
   438		uint64_t mc_umc_status, err_addr;
   439	
   440		struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
   441	
   442		eccinfo_table_idx = node_inst * adev->umc.umc_inst_num *
   443					  adev->umc.channel_inst_num +
   444					  umc_inst * adev->umc.channel_inst_num +
   445					  ch_inst;
   446		channel_index =
   447			adev->umc.channel_idx_tbl[node_inst * adev->umc.umc_inst_num *
   448							  adev->umc.channel_inst_num +
   449							  umc_inst * adev->umc.channel_inst_num +
   450							  ch_inst];
   451	
   452		mc_umc_status = ras->umc_ecc.ecc[eccinfo_table_idx].mca_umc_status;
   453	
   454		if (mc_umc_status == 0)
   455			return;
   456	
   457		if (!err_data->err_addr)
   458			return;
   459	
   460		/* calculate error address if ue error is detected */
   461		if (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, Val) == 1 &&
   462		    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, AddrV) == 1 &&
   463		    (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, UECC) == 1)) {
   464	
   465			err_addr = ras->umc_ecc.ecc[eccinfo_table_idx].mca_umc_addr;
   466			err_addr = REG_GET_FIELD(err_addr, MCA_UMC_UMC0_MCUMC_ADDRT0, ErrorAddr);
   467	
   468			umc_v8_10_convert_error_address(adev, err_data, err_addr,
   469						ch_inst, umc_inst, node_inst, mc_umc_status);
   470		}
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
