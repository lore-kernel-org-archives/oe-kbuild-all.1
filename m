Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93C6ABD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676643438; x=1708179438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGGmXhRoqf0hSOXBLrEHiAim/c53jbZS1hm2qkDRVb8=;
  b=J3J5cVfpbkGT39XRqzIEqgXgXr+UBKpsSj5xGXwTCVWGETlBnkk0F39I
   0NGfpRTBwPlo6Lcqo6rdLOWz6fBlM/gmSuKJWPJ6lbhRSLR8XIjj61Yyq
   zrri9XUGnUsSKU7YRwUZYZQhwr0PfuP9ZT+ZYkgE9OYhC6/PD//HkhHsV
   FufnqU5/BuMDwGHKKbdwAT2acTZ9FkBdoAakogrOac8fmaeY6yQx3wbsX
   22ssYsWFIM3q3c03gixKf+PAKxNrrEhKySBXCV+6BEP6IQTvzULzAeQKx
   +Q2LSHWWwniWE4bkdCek4P5deIHadd0DSMa0EP6l9wPc5OGq6YP7Zq86x
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396669594"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="396669594"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672596517"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="672596517"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2023 06:17:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT1Y3-000BX3-1d;
	Fri, 17 Feb 2023 14:17:15 +0000
Date: Fri, 17 Feb 2023 22:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!
Message-ID: <202302172233.c0Ll5p9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec35307e18ba8174e2a3f701956059f6a36f22fb
commit: 5750121ae7382ebac8d47ce6d68012d6cd1d7926 kbuild: list sub-directories in ./Kbuild
date:   5 months ago
config: nios2-randconfig-r033-20230217 (https://download.01.org/0day-ci/archive/20230217/202302172233.c0Ll5p9m-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5750121ae7382ebac8d47ce6d68012d6cd1d7926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5750121ae7382ebac8d47ce6d68012d6cd1d7926
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172233.c0Ll5p9m-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__mulsi3" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "__mulsi3" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/test_lockup.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/bch.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/lz4/lz4_compress.ko] undefined!
>> ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/lz4/lz4hc_compress.ko] undefined!
ERROR: modpost: "__mulsi3" [drivers/phy/marvell/phy-pxa-28nm-hsic.ko] undefined!
ERROR: modpost: "__mulsi3" [drivers/pinctrl/pinctrl-single.ko] undefined!
ERROR: modpost: "__mulsi3" [drivers/gpio/gpio-aggregator.ko] undefined!
WARNING: modpost: suppressed 324 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
