Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE7632
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 06:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674455642; x=1705991642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxNxVNpDASesrpSqqUxkWoun0cUE85HT2W/p2X4o1qM=;
  b=hdW8nbxfEMuONO5kpJ62Z97O9w6WP0TrTdIRi0qC7Wee2aR6KITi38kF
   XeMZ59fJXKJ/126yf3g4rdVEEdwpTGm7LfCiKVj6x6SdAcOwRQQRTk7V5
   lqvFTdgIqgfG3LBgxVWOP6b+VcKciBuDxHtHiIBa4Z7AdWhWcsTYpC5E8
   lHDoEKuIMTYdSjdLMOnTULLIZrQtad4jQBC7d/l7xS+cEb6Pf3m+s6Sce
   jNtjEkdTsKVqirx3Esfe12iOK2pZHFERvqCPfbl+R75dUcWusfuDEqDp+
   Eq9jdEnO/R/O76Lm4H0QASm5VW7oMN2rQvBif4IYNMTR+nhLNfvNhasAq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="323668864"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="323668864"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 22:34:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="654782764"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="654782764"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Jan 2023 22:33:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJqP0-0005TU-1u;
	Mon, 23 Jan 2023 06:33:58 +0000
Date: Mon, 23 Jan 2023 14:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: arch/mips/bcm47xx/setup.c:undefined reference to `fixed_phy_add'
Message-ID: <202301231443.tZp0eLH6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: 61f2b7c7497ba96cdde5bbaeb9e07f4c48f41f97 Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
date:   4 months ago
config: mips-randconfig-r015-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231443.tZp0eLH6-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=61f2b7c7497ba96cdde5bbaeb9e07f4c48f41f97
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 61f2b7c7497ba96cdde5bbaeb9e07f4c48f41f97
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mipsel-linux-ld: mipsel-linux-ld: DWARF error: could not find abbrev number 70
   arch/mips/bcm47xx/setup.o: in function `bcm47xx_register_bus_complete':
>> arch/mips/bcm47xx/setup.c:(.init.text+0x130): undefined reference to `fixed_phy_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
