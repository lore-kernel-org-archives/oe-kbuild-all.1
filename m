Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C027220E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679995322; x=1711531322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NEodsf9qOMz0LrPdYsRrX9vLsE9vQRvcCQWk2WPyZ6k=;
  b=ASKhLtdENutje/tw/F43G2kC+T6f+8BdBum61/N2fLX5dCAEieUI5/TI
   i6FEzBrDrrsDVWcb2TFX+FYh2JW2F9Mp/LUcC3DHI2KmjlSpqAhrcrcrp
   0+FESL7+SaPJrfWX+4ZPJ7vJmiuM6i+Xf+NPx/tosl/lOWHIEbd945TcK
   wMC5AIbwvEaR70zltKvdqrWwZVQPi/Mo+zBaI5jlsbEm4sI0iN0fL/TjG
   dZdmF5XnrvoCOpU8rv+ldvWGIz0QmYku8dE0o9/p9N5Wab1xuOwMS0zh1
   Ax0IA5IeY6OoXl9Y0Fbtmrd4y0MauVq05OxBCEWob/k5P/eTWFWbgJXc+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320168606"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="320168606"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 02:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="753067432"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="753067432"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 02:21:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph5Wf-000IQh-2Y;
	Tue, 28 Mar 2023 09:21:57 +0000
Date: Tue, 28 Mar 2023 17:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Felix.Kuehling@amd.com,
	Jonathan.kim@amd.com
Subject: Re: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch
 points operation
Message-ID: <202303281754.75Z2VixI-lkp@intel.com>
References: <20230327184339.125016-27-jonathan.kim@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327184339.125016-27-jonathan.kim@amd.com>

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-tip/drm-tip next-20230328]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230327184339.125016-27-jonathan.kim%40amd.com
patch subject: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch points operation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281754.75Z2VixI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/8c5e1781294f7e41d41632cb46e533c598933cd8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
        git checkout 8c5e1781294f7e41d41632cb46e533c598933cd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281754.75Z2VixI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:10: warning: no previous prototype for 'kgd_gfx_aldebaran_clear_address_watch' [-Wmissing-prototypes]
     164 | uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:63,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:22:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:781:10: warning: no previous prototype for 'kgd_gfx_v11_clear_address_watch' [-Wmissing-prototypes]
     781 | uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:63,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:23:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kgd_gfx_aldebaran_clear_address_watch +164 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c

   163	
 > 164	uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
   165						uint32_t watch_id)
   166	{
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
