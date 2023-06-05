Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B7DDC0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685987057; x=1717523057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQIXFtP7eiRGv8vkX+rS6UtresAGhNkxGgx9OE7Ovmw=;
  b=OtfToDyb0aacOwgu5vtd6AgrJ9bUTw1HMQY4F14N1ePd1ZehDV8FBZXe
   xJZ3aucdPifDTQbiGziLSHiQyT/9Vayu8ahomsfiMILEZs1SbOuO02Lp7
   cVeMR4rw7Mtomwe/7tRhgBylBQYKJP35Kf10EFYgBtPyVf+fE/IiMl3hF
   GFn7b/zoPCblwxYQ5KEEx8oehhM/JDKV8n72mRJGdw8JnOnFamDlEcv6x
   +oCTertdMnf63G6pLBjKeZPAoWDEY4ovuso70/zq2/2yXF7JiCf/1oVFM
   LYWgF0WpkrAZP18PUZ8bDtW+UF3MnKOIiMtEDQUfysPb3YNHOIkhO4J7B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346030712"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="346030712"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 10:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738439140"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="738439140"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 10:44:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6EFb-0004Jb-1R;
	Mon, 05 Jun 2023 17:44:15 +0000
Date: Tue, 6 Jun 2023 01:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/hvhe 17/17]
 aarch64-linux-ld:./arch/arm64/kernel/vmlinux.lds:175: undefined symbol
 `aic_impdef_timer_control' referenced in expression
Message-ID: <202306060152.KFWpJ8Zk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/hvhe
head:   5e26eb73be2775c0877f3d473ff3c5cbcde7e092
commit: 5e26eb73be2775c0877f3d473ff3c5cbcde7e092 [17/17] KVM: arm64: Terrible timer hack for M1 with hVHE
config: arm64-randconfig-r026-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060152.KFWpJ8Zk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=5e26eb73be2775c0877f3d473ff3c5cbcde7e092
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/hvhe
        git checkout 5e26eb73be2775c0877f3d473ff3c5cbcde7e092
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060152.KFWpJ8Zk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld:./arch/arm64/kernel/vmlinux.lds:175: undefined symbol `aic_impdef_timer_control' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
