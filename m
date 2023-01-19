Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE2A93E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674150245; x=1705686245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sdr2ob7kGV6zr9X4/GlfrIezQAzMTpA9m7zpDp2RQR8=;
  b=lTKkvQJFht5gWhcWc9SE04Pf0QYOyAA+7axUIBQ76BG1/9PTHF3IdkLN
   zonOUrURZBE1SuNenmJdqqgzvSfQKvMGfK4PbY4g01+5SlsRc7laLgwqw
   LGTXRMfFR4megJmwcBq9zsCMnSzvhEWCWFT8GMfHb0iwBIuCm939HfhsI
   yTF216BTGgncgpUgBwDosSTDo5JuelqF59EEXxXUQ8jzT2FHtZEhPvQxM
   HjjQxDUgKP6q44oNyOqg+qucJu24mDazoDb0a1XJY+/jp6DQSXkor0PS1
   rihBZLU0yLwsjHkx04Mmwfl/k+eBcf5BdkahaQ+64hGh5vexyHWjkDegQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="387728770"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="387728770"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 09:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834062413"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="834062413"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 09:44:03 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIYxH-0001gw-0J;
	Thu, 19 Jan 2023 17:44:03 +0000
Date: Fri, 20 Jan 2023 01:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: arch/arm64/kernel/alternative.c:267:14: warning: no previous
 prototype for 'alt_cb_patch_nops'
Message-ID: <202301200104.yU4JQ35I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: d926079f17bf8aa47485b6a55be1fc0175dbd1db arm64: alternatives: add shared NOP callback
date:   4 months ago
config: arm64-buildonly-randconfig-r001-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200104.yU4JQ35I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d926079f17bf8aa47485b6a55be1fc0175dbd1db
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d926079f17bf8aa47485b6a55be1fc0175dbd1db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/alternative.c:267:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
     267 | noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
         |              ^~~~~~~~~~~~~~~~~


vim +/alt_cb_patch_nops +267 arch/arm64/kernel/alternative.c

   266	
 > 267	noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
