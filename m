Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E202CAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686508394; x=1718044394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9dfQjBDSqNln7ievt1C3vyyVY1mTAWaxRqqfJISJpI=;
  b=lLFsynDpIChkoLqNwpB1RUGraZo7sg8oK4yF2h6XRo5/1p82kd21ESB6
   IT/bL0e3I9j6yWO88sTqiYjTX6wlpHJSVqTQOwJL40M3KL64AnAOdMHa8
   A1FGoLGuQUi61QiZwX0Ss3YbKPZcIlBC0UwRl9doTny1UTowb49v2COoi
   8TIiSw8P6nEMO4KaybJz6dA4z6NNizG4U+rLdBhnzcP486c0nlh+u9myY
   T44Ls+Jbz7HbzLpAgOd9ivDEBKi1FZG0dGXLIUZOCrn01kQxy+x1feQ1S
   nvLedFEimGFmT/HZ4QYYMb2zbldUOBzlHRraxFS2wivqRqlkNfHidvRsJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="357884533"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="357884533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 11:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="1041083485"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="1041083485"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2023 11:33:13 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8PsG-000B36-1W;
	Sun, 11 Jun 2023 18:33:12 +0000
Date: Mon, 12 Jun 2023 02:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.4-esp32 11/25] ERROR: modpost: vmlinux:
 'memmove' exported twice. Previous export was in vmlinux
Message-ID: <202306120203.QPVgnqvy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.4-esp32
head:   9301aa5e085a229d190cf0b28b98319d9517b118
commit: afe1febb66ae8910447fe0553ae098305e960b66 [11/25] WIP: xtensa: esp32: add platform
config: xtensa-randconfig-c023-20230611 (https://download.01.org/0day-ci/archive/20230612/202306120203.QPVgnqvy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jcmvbkbc/linux-xtensa/commit/afe1febb66ae8910447fe0553ae098305e960b66
        git remote add jcmvbkbc-xtensa https://github.com/jcmvbkbc/linux-xtensa
        git fetch --no-tags jcmvbkbc-xtensa xtensa-6.4-esp32
        git checkout afe1febb66ae8910447fe0553ae098305e960b66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306120203.QPVgnqvy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: 'memmove' exported twice. Previous export was in vmlinux
>> ERROR: modpost: vmlinux: 'memcpy' exported twice. Previous export was in vmlinux
>> ERROR: modpost: vmlinux: 'memset' exported twice. Previous export was in vmlinux
WARNING: modpost: lib/test_bitmap.o: section mismatch in reference: find_nth_bit (section: .text.unlikely) -> test_print (section: .init.rodata)
WARNING: modpost: EXPORT symbol "memmove" [vmlinux] version generation failed, symbol will not be versioned.
Is "memmove" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "memcpy" [vmlinux] version generation failed, symbol will not be versioned.
Is "memcpy" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "memset" [vmlinux] version generation failed, symbol will not be versioned.
Is "memset" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
