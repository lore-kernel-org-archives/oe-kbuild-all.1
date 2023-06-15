Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB617748
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686839138; x=1718375138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZzk2IHwWH3zapCM9XLnwtm2tVbH0y4dZzy8aUEIPu0=;
  b=AbFU0nsQ1F1kcD6hsXEWws5FHK3HTSF+vPKciwl6lfA2HpGHEZt99JG4
   KAuW4lsuG+2mwOqtwWhUSzDsbwI7DV8cBkYUzH1DEyMfy8ZKrWaXv0B9Q
   nLBGDkqfMgXSx6CNRJHpMAPM6DvdeJF/wkXXjHtYq+Jp/XWVhJFfQpCqG
   Fa+JSYvLYsHghGCeXlNNh0KjRAV4dgsTdLi4VrK3uUN553DSlhCIaQ4JT
   DW01Al2l4r3BisECWlmg8SAovWGdonWp9RIynAY4Kj3b8KuBtipmfqeU/
   V+nUXeeKqjRczPJVcR4NlzmebEZolUy1jU9QY2u7JRnn3WimztNbdGMsu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362319684"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="362319684"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825284997"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="825284997"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2023 06:32:37 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9n5Y-0001w5-2Y;
	Thu, 15 Jun 2023 13:32:36 +0000
Date: Thu, 15 Jun 2023 21:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] aarch64-linux-ld:
 hid-core.c:undefined reference to `uhid_hid_driver'
Message-ID: <202306152155.AA3xGieE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e699d543bbc9d7614db3e01323c9321437304286
commit: e699d543bbc9d7614db3e01323c9321437304286 [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230615/202306152155.AA3xGieE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout e699d543bbc9d7614db3e01323c9321437304286
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152155.AA3xGieE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
   hid-core.c:(.text+0x1fd4): undefined reference to `uhid_hid_driver'
   aarch64-linux-ld: drivers/hid/hid-core.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `uhid_hid_driver' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hid-core.c:(.text+0x1fd4): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: hid-core.c:(.text+0x1fd8): undefined reference to `uhid_hid_driver'
   aarch64-linux-ld: drivers/hid/hid-core.o: in function `hid_add_field':
   hid-core.c:(.text+0x27d8): undefined reference to `uhid_hid_driver'
   aarch64-linux-ld: drivers/hid/hid-core.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `uhid_hid_driver' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hid-core.c:(.text+0x27d8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hid-core.c:(.text+0x27e0): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
