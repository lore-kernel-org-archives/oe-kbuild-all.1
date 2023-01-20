Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963EBBD33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674201290; x=1705737290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLWaooH3G7dvcca9gRkF1ZZxjSe8r8SRF3+vlqHpddA=;
  b=hcefrNBM8NiqmTf0j2aSsztYPoljPdHXCX6dYBdt/nWASLnesDffKon4
   qbQYUyGj5BYJhirJSRWFjRf4K6CcfV8Gp2H5c9RePGeNpZ2BkwL1IHFP8
   RpBLgZp+kuoPaK/62z4imdWHP+G7eRvKr7KpMzS2Rtrfd7P4vYQUAh29x
   9nQgF0Y/mHowZV12x2dhuRDEGpmhdgoF0RvMLu9SFlpVHqhOw+Dih8cGW
   1vld0pDniOLe1AVLcUZeqN/7ZLH4XMB5TnQqmE+u0vN2tvvGk7ATCIW9M
   UX90tagFc0A+gA4ohqNt7feEfLYS9nYcUsQE9jc4fk9suCkFumfpx79LR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327621519"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="327621519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="768606936"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="768606936"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 23:54:48 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pImEZ-0002La-1f;
	Fri, 20 Jan 2023 07:54:47 +0000
Date: Fri, 20 Jan 2023 15:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error:
 drivers/gpu/drm/drm_gem_atomic_helper.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202301201512.EiN9Iw3N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: a3ef7d9efab99668235c656ad7626d5dfebbeeb0 UPSTREAM: drm: Add additional atomic helpers for shadow-buffered planes
date:   1 year, 8 months ago
config: riscv-randconfig-r042-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201512.EiN9Iw3N-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=a3ef7d9efab99668235c656ad7626d5dfebbeeb0
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core62-50-1
        git checkout a3ef7d9efab99668235c656ad7626d5dfebbeeb0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/gpu/drm/drm_bridge_connector.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_crtc_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dp_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dsc.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_probe_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_plane_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dp_mst_topology.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_atomic_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_kms_helper_common.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dp_dual_mode_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_simple_kms_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_modeset_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_scdc_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/gpu/drm/drm_gem_atomic_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_gem_framebuffer_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_atomic_state_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_damage_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_format_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_self_refresh_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/bridge/panel.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
