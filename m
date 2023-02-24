Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86D15A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 01:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677201699; x=1708737699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4hGqo8LCsdI86MamM5JCzlhXxjPzPO3kkKPBgGgXoo0=;
  b=dpNBaQC9P1XzRaSi6Us0Gf4nt6YR2rUt/v+XTwzM9btlGhgmPIuY+1fB
   Tr0PSy58w6XoaY7ksymMN8gvAYaMiIvcdJKlgcdS+TndLXTsIaXe8d1Lh
   OvcJDOWTOxoqTTssgeqvus7omWUWewueq0yWHPNuU1ABliI83AG7yvBu+
   b01E7eEvx17vqxhMyfIhHtQxWaxO/ERrmVanwCaEDbNM6eopl7SfTPsaS
   QV0cPzPoRZulkgfhRp8IkUH34U4MIzNvLBpKqn0YF2FB+dlOBoL12vpab
   xHc5YLTfprFcz3oj3OigMmdHOE9y5VOoIwL4ATA5kr35tySORk6x45QlS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332058258"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="332058258"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 17:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="918257257"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="918257257"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2023 17:21:30 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVMm9-000204-2t;
	Fri, 24 Feb 2023 01:21:29 +0000
Date: Fri, 24 Feb 2023 09:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jane Jian <Jane.Jian@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next 10/28] drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:81:29:
 warning: variable 'ring' set but not used
Message-ID: <202302240921.IdCekMrr-lkp@intel.com>
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
commit: 6dcb38a19efaa71c95c017652177cecb5be4191d [10/28] drm/amdgpu/vcn: set and use harvest config
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302240921.IdCekMrr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 6dcb38a19efaa71c95c017652177cecb5be4191d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240921.IdCekMrr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c: In function 'vcn_v4_0_early_init':
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:81:29: warning: variable 'ring' set but not used [-Wunused-but-set-variable]
      81 |         struct amdgpu_ring *ring;
         |                             ^~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ring +81 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

    69	
    70	/**
    71	 * vcn_v4_0_early_init - set function pointers and load microcode
    72	 *
    73	 * @handle: amdgpu_device pointer
    74	 *
    75	 * Set ring and irq function pointers
    76	 * Load microcode from filesystem
    77	 */
    78	static int vcn_v4_0_early_init(void *handle)
    79	{
    80		struct amdgpu_device *adev = (struct amdgpu_device *)handle;
  > 81		struct amdgpu_ring *ring;
    82	
    83		if (amdgpu_sriov_vf(adev)) {
    84			adev->vcn.harvest_config = VCN_HARVEST_MMSCH;
    85			for (int i = 0; i < adev->vcn.num_vcn_inst; ++i) {
    86				ring = &adev->vcn.inst[i].ring_enc[0];
    87				if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_RING, i)) {
    88					adev->vcn.harvest_config |= 1 << i;
    89					dev_info(adev->dev, "VCN%d is disabled by hypervisor\n", i);
    90				}
    91			}
    92		}
    93	
    94		/* re-use enc ring as unified ring */
    95		adev->vcn.num_enc_rings = 1;
    96	
    97		vcn_v4_0_set_unified_ring_funcs(adev);
    98		vcn_v4_0_set_irq_funcs(adev);
    99		vcn_v4_0_set_ras_funcs(adev);
   100	
   101		return amdgpu_vcn_early_init(adev);
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
