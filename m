Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793AE195
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677206078; x=1708742078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/JcSWSyNJLdvE/BM9I9JBhysqQCEExtTrrgDsxvYvnA=;
  b=W70F3F7FSRPSIOLqgFI467Bt5wL+7E1uWXRSa0W7LnrUjX/LB3AJtBne
   Qj+/Sh9mPV3IomyhedCxG0mKKyEqr6KU7BR+LBAaEs1+iqkQhFk11CMry
   Wm5KLdopKlJQyyVSwkzt6y3gnkID7YSL6pzVl2K63/+m+W2//JbPi3xMO
   k04i88VV5FuBMS3MHqhh0PzqciJtVxstqId613RLEip631Ek+G3qGRcE6
   Q+gQPVzCZIbaY77sGIMLEt+Ww5813ToOMEd1ZiWLmf/9aliPrkY5KcshY
   USw5hM1V47Y+NwEcwGt1KCEDAFuhCkLMzTlkxhkxAvFj5CKNgKPrwJE4e
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332068256"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="332068256"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 18:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="622568025"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="622568025"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2023 18:34:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVNur-00023R-0x;
	Fri, 24 Feb 2023 02:34:33 +0000
Date: Fri, 24 Feb 2023 10:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Candice Li <candice.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>
Subject: [agd5f:drm-next 19/28] drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:212:6:
 warning: no previous prototype for 'umc_v8_10_convert_error_address'
Message-ID: <202302241002.wEjrGSVU-lkp@intel.com>
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
commit: 2d53b579f3f217d5b88fb6708dcaef28f7b9fc0b [19/28] drm/amdgpu: Add convert_error_address function for umc v8_10
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302241002.wEjrGSVU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 2d53b579f3f217d5b88fb6708dcaef28f7b9fc0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241002.wEjrGSVU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:212:6: warning: no previous prototype for 'umc_v8_10_convert_error_address' [-Wmissing-prototypes]
     212 | void umc_v8_10_convert_error_address(struct amdgpu_device *adev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/umc_v8_10.h:27,
                    from drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:23:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/umc_v8_10_convert_error_address +212 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c

   211	
 > 212	void umc_v8_10_convert_error_address(struct amdgpu_device *adev,
   213					    struct ras_err_data *err_data, uint64_t err_addr,
   214					    uint32_t ch_inst, uint32_t umc_inst,
   215					    uint32_t node_inst, uint64_t mc_umc_status)
   216	{
   217		uint64_t na_err_addr_base;
   218		uint64_t na_err_addr, retired_page_addr;
   219		uint32_t channel_index, addr_lsb, col = 0;
   220		int ret = 0;
   221	
   222		channel_index =
   223			adev->umc.channel_idx_tbl[node_inst * adev->umc.umc_inst_num *
   224						adev->umc.channel_inst_num +
   225						umc_inst * adev->umc.channel_inst_num +
   226						ch_inst];
   227	
   228		/* the lowest lsb bits should be ignored */
   229		addr_lsb = REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, AddrLsb);
   230		err_addr &= ~((0x1ULL << addr_lsb) - 1);
   231		na_err_addr_base = err_addr & ~(0x3ULL << UMC_V8_10_NA_C5_BIT);
   232	
   233		/* loop for all possibilities of [C6 C5] in normal address. */
   234		for (col = 0; col < UMC_V8_10_NA_COL_2BITS_POWER_OF_2_NUM; col++) {
   235			na_err_addr = na_err_addr_base | (col << UMC_V8_10_NA_C5_BIT);
   236	
   237			/* Mapping normal error address to retired soc physical address. */
   238			ret = umc_v8_10_swizzle_mode_na_to_pa(adev, channel_index,
   239							na_err_addr, &retired_page_addr);
   240			if (ret) {
   241				dev_err(adev->dev, "Failed to map pa from umc na.\n");
   242				break;
   243			}
   244			dev_info(adev->dev, "Error Address(PA): 0x%llx\n",
   245				retired_page_addr);
   246			amdgpu_umc_fill_error_record(err_data, na_err_addr,
   247					retired_page_addr, channel_index, umc_inst);
   248		}
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
