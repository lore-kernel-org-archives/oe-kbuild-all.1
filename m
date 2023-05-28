Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63272360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 01:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685237032; x=1716773032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7BiqE8HI/XRgSlHeftEiyg3Y8Fr0FF4K3r7+eUArq+s=;
  b=KDbPHEBrUogxO9sBP+guMP3W6emQt0jYc/vg0tSmBiDpBovdjiIS0ur5
   g2qWEuMAJaOhrmNywejmt9gLYvWYvwkyq7kM3c4qehyuYF4EnlIEJzG+R
   7x98okZz/MPsy6MGlusg0EDpwTWccTk5U4KhUMB9cvRVedpR0d5q5T+T6
   jAQ4xbqybPuBF4kSNE9u/TDb6kPq6ieBJv70quJBgqF5IwZbSgc7egZw0
   iqwRA+ckf/yO25+CIIBBY00KoUz13KGUCO+uNN6Scl18O0p800B8HkLIq
   sVFbjT+ScAg+tIGRvXyf0sX9dPXfTdT7FLt/rFhpnruMv3qojWqGAf+O/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="382719197"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="382719197"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 18:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="849947168"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="849947168"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2023 18:23:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q358Q-000KME-0M;
	Sun, 28 May 2023 01:23:50 +0000
Date: Sun, 28 May 2023 09:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/m2-pmu 11/70]
 arch/arm64/kvm/emulate-nested.c:114:8: warning: type qualifiers ignored on
 function return type
Message-ID: <202305280908.q9bx2cV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/m2-pmu
head:   131aded73e283912aefdb8fc34be0d9e05713cef
commit: 4caccf2e2682beb347648efcf5ab01e0cf589dc8 [11/70] KVM: arm64: nv: Add trap forwarding infrastructure
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230528/202305280908.q9bx2cV6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=4caccf2e2682beb347648efcf5ab01e0cf589dc8
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms hack/m2-pmu
        git checkout 4caccf2e2682beb347648efcf5ab01e0cf589dc8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280908.q9bx2cV6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/emulate-nested.c:114:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     114 | static const enum coarse_grain_trap_id get_trap_config(u32 sysreg)
         |        ^~~~~


vim +114 arch/arm64/kvm/emulate-nested.c

   113	
 > 114	static const enum coarse_grain_trap_id get_trap_config(u32 sysreg)
   115	{
   116		return xa_to_value(xa_load(&sr_forward_xa, sysreg));
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
