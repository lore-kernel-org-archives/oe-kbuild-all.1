Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A0320D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676925931; x=1708461931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e1VF4s3CkaG0KaXAKiE4vR/uPxvzPsIJdVfZNv0agTQ=;
  b=VIbFy1hhlIeWg0QHkWrngu0xKioG9gzACL1eUXxoLnMr2NvUil7J/9NM
   luip/N37kQ5WZ5koBAKuTXg87HgwyXzpFJw7OVE21dCPCF4Cy7CahDpnd
   44eXCl8Kc4JCptVk7WRK4o4pIm1rNKm7dYZIaiBKS8q0aiatJj+frFeR2
   xHaBgR+q2dpUrHte68Fg2pVwqqTdDDCkWF/VgpKIs9wWBySLAgEoN0O58
   wuHFnNOI9HPPSz5Gd09rx0RmtRFSYgeRHLLATZQzPcfmy9W15tTfXBZNq
   IIXfPijI33UNURPk6m9+fmDFRgDu5I1xaVHfvIPtn2bLdgTIWmpVHyB1o
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332493448"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="332493448"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 12:45:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="916951734"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="916951734"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Feb 2023 12:45:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUD2O-000EAH-1g;
	Mon, 20 Feb 2023 20:45:28 +0000
Date: Tue, 21 Feb 2023 04:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error:
 drivers/gpu/drm/drm_gem_atomic_helper.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302210445.3hBctIvJ-lkp@intel.com>
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
date:   1 year, 9 months ago
config: riscv-randconfig-r031-20230219 (https://download.01.org/0day-ci/archive/20230221/202302210445.3hBctIvJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210445.3hBctIvJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/gpu/drm/drm_bridge_connector.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_crtc_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dp_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dsc.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_probe_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_plane_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dp_mst_topology.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_atomic_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_kms_helper_common.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_dp_dual_mode_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_simple_kms_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_modeset_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_scdc_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/gpu/drm/drm_gem_atomic_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_gem_framebuffer_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_atomic_state_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_damage_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_format_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_self_refresh_helper.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/bridge/panel.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
