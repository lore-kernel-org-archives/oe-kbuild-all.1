Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968A15D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681872208; x=1713408208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPduDyh57AGM//zdcHX4JyRkJWmoCpUtPS8QVDpfAYA=;
  b=ejkwq4g8qNWsE6qVkD8vp1QIpk918ESeDMrPoDyeDD4oWWieSL1ZcSY0
   ITXl5nSAnzFUMHJCY15JDf/kHZJ6y8VKYoCnSuDhRVxqGIJf0eI/CvE02
   Nf8A0b+YRCHZcz4Vnw549VzCSds+dgUgRy2zJQbxqzNMDsmRAG4tWzqxb
   VGz2sz2dMDMiEBl1tYWhOPWjSjhyYIkbmZF4Jkvvvkj1AJMYn9RRQOqL7
   +uEZ+pEcaD/SdX9i1lqDPJFNmYsvm7m22u2XC73xxqmnvXhexSnYOHpTQ
   7AMm43qe3QORPA2dx1fcIle60eqyt9ykQV4IamKXUGnJjZSzBkJ14DX/i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408243406"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="408243406"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 19:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="641590339"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="641590339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2023 19:43:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poxn1-000eOZ-2t;
	Wed, 19 Apr 2023 02:43:23 +0000
Date: Wed, 19 Apr 2023 10:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Le Ma <le.ma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 62/67]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1049:6: warning: no previous
 prototype for 'gfx_v9_4_3_disable_gpa_mode'
Message-ID: <202304191022.ce3Iza7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   86b20703e4c5a3c39891def0a68e7438aeca9db9
commit: 86301129698be52f8398f92ea8564168f6bfcae1 [62/67] drm/amdgpu: split gc v9_4_3 functionality from gc v9_0
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304191022.ce3Iza7A-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 86301129698be52f8398f92ea8564168f6bfcae1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191022.ce3Iza7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1049:6: warning: no previous prototype for 'gfx_v9_4_3_disable_gpa_mode' [-Wmissing-prototypes]
    1049 | void gfx_v9_4_3_disable_gpa_mode(struct amdgpu_device *adev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: 'golden_settings_gc_9_4_3' defined but not used [-Wunused-const-variable=]
      48 | static const struct soc15_reg_golden golden_settings_gc_9_4_3[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/gfx_v9_4_3_disable_gpa_mode +1049 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c

  1048	
> 1049	void gfx_v9_4_3_disable_gpa_mode(struct amdgpu_device *adev)
  1050	{
  1051		uint32_t data;
  1052	
  1053		data = RREG32_SOC15(GC, 0, regCPC_PSP_DEBUG);
  1054		data |= CPC_PSP_DEBUG__UTCL2IUGPAOVERRIDE_MASK;
  1055		WREG32_SOC15(GC, 0, regCPC_PSP_DEBUG, data);
  1056	}
  1057	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
