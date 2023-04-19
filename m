Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C53C30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681906677; x=1713442677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdEpCM5SghwvzaVOhexkTVd+CpGIpf3x2gFC+NvjfoM=;
  b=dm57hdgbQ7E7jHSbQCNV1aSW0B5GKHNvx+4hNaUdLItZclAD0W0vVKEf
   13p0JlTsXLez950sIiQbOSMcJQ6hJeoxSrefyNG7fTqbWHUgfIHIECbgR
   BZrwSjUFV9ab19lfdJV4Yti/KP4+2y0yF2Q+pYlEdk86nstAW/VTpR3i/
   7monc0rnNlsOh1Lcc03oH1Nh/97AfBO2E1JCyMZppFgCMTrXk/EQ4P4qJ
   sES03ZKaVwPyKhbUGdsHxeuPU9g6uGjEZBg9yZz6kdC5s2aQwiJxf9EBy
   9hn1MP46JpZH4OZssQIRO/91w0wzBB4Go5M7V4IdMEo8iafIcp1axYW72
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410661376"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="410661376"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 05:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="760725074"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="760725074"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 05:17:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp6kv-000erz-2n;
	Wed, 19 Apr 2023 12:17:49 +0000
Date: Wed, 19 Apr 2023 20:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Le Ma <le.ma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 62/67]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning:
 'golden_settings_gc_9_4_3' defined but not used
Message-ID: <202304192048.uuNplYDR-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304192048.uuNplYDR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 86301129698be52f8398f92ea8564168f6bfcae1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304192048.uuNplYDR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1049:6: warning: no previous prototype for 'gfx_v9_4_3_disable_gpa_mode' [-Wmissing-prototypes]
    1049 | void gfx_v9_4_3_disable_gpa_mode(struct amdgpu_device *adev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: 'golden_settings_gc_9_4_3' defined but not used [-Wunused-const-variable=]
      48 | static const struct soc15_reg_golden golden_settings_gc_9_4_3[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/golden_settings_gc_9_4_3 +48 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c

    47	
  > 48	static const struct soc15_reg_golden golden_settings_gc_9_4_3[] = {
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
