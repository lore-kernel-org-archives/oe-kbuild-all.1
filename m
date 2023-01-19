Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8A179
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 00:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674086669; x=1705622669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7GVkD5IUPUIIZEvPny/VoRJg98qZe3nzw0KFpY3DZQ=;
  b=hxWkZAiGjcMtbNzriLPXZY6DMyoPpiMRBqjmD++wCvDxU4yA8uHJYE0h
   O0waUK9QMsfhL0+zd4juVsMwIjMyDCu5CFl6y0J4H3ZKoNqHXzQXyy0o4
   eAthmAK0Z6/TAl7IaqhmUhtDmdrGoh6pmclnlMNxh3Mw77ZnJ9ZJs7XhO
   P9Pncp2HAPhWItGdl6ejAxEmK0VqOEs45JYFQNuapeDTvLRbugdAA4BiA
   R2AVqGownI1O3VBKvpl8IKgmIXgYkN2FG4EiTjn+tWjjQPKlmwYecBYuo
   AUEgvWWsf6aY+6QGmJZOYG/VMsU1Qc6+oKeDHk0ABZg7LxcZWCkr/SZ+G
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352394155"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="352394155"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728439986"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="728439986"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 16:04:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIIPk-0000qI-0I;
	Thu, 19 Jan 2023 00:04:20 +0000
Date: Thu, 19 Jan 2023 08:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 12/37] ERROR: modpost:
 "devm_clk_hw_register" [drivers/clk/clk-apple-nco.ko] undefined!
Message-ID: <202301190754.SnDrQkEL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   3dfab1933a51b42de8c58ab36a3b2552cb7baad8
commit: 5d6c14c8b47d94d358a3ec606ae5096758392ccd [12/37] ASoC: apple: Add macaudio machine driver
config: m68k-randconfig-r003-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190754.SnDrQkEL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/5d6c14c8b47d94d358a3ec606ae5096758392ccd
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout 5d6c14c8b47d94d358a3ec606ae5096758392ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_clk_hw_register" [drivers/clk/clk-apple-nco.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
   Depends on [n]: COMMON_CLK [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
