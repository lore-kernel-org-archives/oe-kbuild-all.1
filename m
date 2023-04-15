Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336837C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681554871; x=1713090871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdkDBgRWW8FzI3P1M774/hW9ogW7G0aL/AEVCyhMACk=;
  b=la11OzlI/g0d3hZfGpgCaWsIje6Yy44ohJUaVkkl7vzJSBCrbep6IDdy
   63q2mRYizrIP3gvyLgsjFEWTx7DPGM5Fk6wgFyN9SOwG/1usmnvTG/UM2
   RU9OjCRULZI/2spfRDcSiorK9aOyKBat3pzUMqa2kD4peuhjihQXnBlGi
   f1zt8YkTgRnSQaj1rHj+1xt+O5aCuecJbRsMt5cByg3H42yaoW3n0434s
   sCUnGM4AUwL10LSwoCMlNt6Z3s7/+NK8nfv37hVEv+3U+FfSY59gSGidn
   7DrE01OF6MpP0/9v7oL1OZV6XJAJUXcUcilOBn6u71WDjGqb8/JJbV4lU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407524023"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="407524023"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 03:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="936321705"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="936321705"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2023 03:34:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pndEi-000asL-2k;
	Sat, 15 Apr 2023 10:34:28 +0000
Date: Sat, 15 Apr 2023 18:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1515/9838] ERROR: modpost: "__udivdi3"
 [drivers/gpu/drm/bridge/nwl-dsi.ko] undefined!
Message-ID: <202304151854.Cc69Uj70-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 09734170119b1928548a9adc0ace25f1fa45876e [1515/9838] LF-1373-1: drm/bridge: nwl-dsi: Add support for video_pll
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230415/202304151854.Cc69Uj70-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/09734170119b1928548a9adc0ace25f1fa45876e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 09734170119b1928548a9adc0ace25f1fa45876e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151854.Cc69Uj70-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/bridge/nwl-dsi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
