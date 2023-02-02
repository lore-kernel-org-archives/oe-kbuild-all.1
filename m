Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC287A5A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675316113; x=1706852113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDbEuUmwp+V/2lN4nebIRxklWGbX08aAHigqONFSZvo=;
  b=Q1Of8ipqbBdettKrtbGpQ2saQbhTXuhwSLAKuiaUeEbgsgPjelht4t1w
   OlZe9alPFCIdN4sJSOfeTKnqta6NBT/ecIl9OHMDLEJRCIx4B0wMZbC/5
   wYCuOA6JenC3amOdA91im9tqU7AcbgD4jmlSW1LB2S6B0tImFPFjv/zs/
   lixHJyE3umIynfsGMTH7NyonFIDVLCAjQ0C35T/Pf86yWK2L/Zr5cNgcQ
   mvsRhFg2vM7yYpthGX+V3P6qxKXKupKEFDRdJ3TkHGuykcbYwsgS4i/4Y
   xrI3bqJVRrJnvorPfuO7sKvpOBAKaU4yea1i8jFtgrVMjVk/WMx6uQ83J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327008157"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="327008157"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 21:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665149076"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="665149076"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 21:35:12 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNSFb-0006Bv-1C;
	Thu, 02 Feb 2023 05:35:11 +0000
Date: Thu, 2 Feb 2023 13:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: undefined reference to `ftrace_likely_update'
Message-ID: <202302021357.6J6gmGma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f266ccaa2f5228bfe67ad58a94ca4e0109b954a
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   5 months ago
config: s390-randconfig-r044-20230202 (https://download.01.org/0day-ci/archive/20230202/202302021357.6J6gmGma-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54d9469bc515dc5fcbc20eecbe19cea868b70d68
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 54d9469bc515dc5fcbc20eecbe19cea868b70d68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/purgatory/purgatory: in function `sha256_update':
>> (.text+0x248c): undefined reference to `ftrace_likely_update'
>> s390-linux-ld: (.text+0x24a4): undefined reference to `ftrace_likely_update'
   s390-linux-ld: (.text+0x24bc): undefined reference to `ftrace_likely_update'
   s390-linux-ld: (.text+0x29b4): undefined reference to `ftrace_likely_update'
   s390-linux-ld: (.text+0x29cc): undefined reference to `ftrace_likely_update'
   s390-linux-ld: arch/s390/purgatory/purgatory:(.text+0x29e4): more undefined references to `ftrace_likely_update' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
