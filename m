Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA9E3C07
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682275709; x=1713811709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q40IpPsrC41JHHCzq5FbV4+z6CYbMPhSxdpK0PYELIY=;
  b=LJ0lTCWFGkQ1MoJfBeoD36iKTXi0XWjr4nPdmVV3CmFnZ1A6Ca97znt4
   BiFyVoAP+d+52cgUGQC7QAU3jhFJkFfTqzZNIq9Q36i6i77tA8fNtYdEn
   DV4qwsl0Fw9k+cJOugXuLMtqcOeimstkRtVoKqUO9wEeEtaybqbfgox3P
   dq366A9Rjs/tqC/d+OwIrtnGR+NiH7TyM5i4tubj3C6+tbMi/8wZPSnx+
   Mr5k0kK6dX+4ENPDynUzl5wZbnFcW4bfoSZ+Wrdo0sezoMU2lvFsPJDZz
   SNcGidNSSc5Y0sAth2jZ3lP1UDFXQEj2WOQ6D9V3EKEqo+DFr2TTGIv9H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="346327729"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="346327729"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 11:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="1022454936"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="1022454936"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2023 11:48:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqel8-000i38-2D;
	Sun, 23 Apr 2023 18:48:26 +0000
Date: Mon, 24 Apr 2023 02:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 26/40] drm/amd/display: add CRTC shaper LUT support
 to amd color pipeline
Message-ID: <202304240219.4mzX9F5L-lkp@intel.com>
References: <20230423141051.702990-27-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230423141051.702990-27-mwen@igalia.com>

Hi Melissa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230421]
[cannot apply to drm-misc/drm-misc-next v6.3-rc7 v6.3-rc6 v6.3-rc5 linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-fix-segment-distribution-for-linear-LUTs/20230423-221602
base:   next-20230421
patch link:    https://lore.kernel.org/r/20230423141051.702990-27-mwen%40igalia.com
patch subject: [RFC PATCH 26/40] drm/amd/display: add CRTC shaper LUT support to amd color pipeline
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304240219.4mzX9F5L-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/474b7772c7abf6138de47078874bc4b00b5bf881
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Melissa-Wen/drm-amd-display-fix-segment-distribution-for-linear-LUTs/20230423-221602
        git checkout 474b7772c7abf6138de47078874bc4b00b5bf881
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240219.4mzX9F5L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:527: warning: expecting prototype for amdgpu_dm_lut3d_size(). Prototype was for amdgpu_dm_get_lut3d_size() instead


vim +527 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c

bacba5117b71f1 Melissa Wen   2023-04-23  516  
bacba5117b71f1 Melissa Wen   2023-04-23  517  /**
bacba5117b71f1 Melissa Wen   2023-04-23  518   * amdgpu_dm_lut3d_size - get expected size according to hw color caps
bacba5117b71f1 Melissa Wen   2023-04-23  519   * @adev: amdgpu device
bacba5117b71f1 Melissa Wen   2023-04-23  520   * @lut_size: default size
bacba5117b71f1 Melissa Wen   2023-04-23  521   *
bacba5117b71f1 Melissa Wen   2023-04-23  522   * Return:
bacba5117b71f1 Melissa Wen   2023-04-23  523   * lut_size if DC 3D LUT is supported, zero otherwise.
bacba5117b71f1 Melissa Wen   2023-04-23  524   */
bacba5117b71f1 Melissa Wen   2023-04-23  525  static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
bacba5117b71f1 Melissa Wen   2023-04-23  526  					 uint32_t lut_size)
bacba5117b71f1 Melissa Wen   2023-04-23 @527  {
bacba5117b71f1 Melissa Wen   2023-04-23  528  	return adev->dm.dc->caps.color.mpc.num_3dluts ? lut_size : 0;
2da05dc4c5ba22 Joshua Ashton 2023-04-23  529  }
2da05dc4c5ba22 Joshua Ashton 2023-04-23  530  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
