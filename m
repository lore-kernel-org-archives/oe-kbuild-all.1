Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F34EC9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 05:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683870521; x=1715406521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imK9QJNZTtYNdZwKWY9XndSnpYxtWKJLA9eEY5vKtBk=;
  b=fUoL2jh3140mrHHhxvNBLGkp/gf0ydJ8ZGYRYFItZ03DdFfrEozp0rz+
   OkwdBYTNVxI8vJ466IbNA7WQ4kY7tBlzjAKwzebKWNh9sf6KXNeAP7Lt8
   iJ8XU1yYmAaWzIoAKsmkx/mGUfS5FfoDdxoSfq1NhY/xuJA2gyI/VB1JA
   TBwwkK484npsjWk/A0Y8Og8+Bd34W1QFH0bIF7qDttYWeYxsnuvKIzrnk
   p4dtTfrJQTAvKgZ+l6AKom/f/v+02jj44iuIvrzl5qjYC6ACMU/nQ2mPA
   0/SquznPAAMyG+V6Ami111dGb2A2c1SjkHZoqBestBuBduw2nqqYrKu8Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348205109"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="348205109"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 22:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730679066"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="730679066"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 May 2023 22:48:39 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxLdt-0004ZT-2c;
	Fri, 12 May 2023 05:48:37 +0000
Date: Fri, 12 May 2023 13:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 415/436] clk-mt8195-apmixedsys.c:undefined
 reference to `mtk_clk_unregister_pllfhs'
Message-ID: <202305121330.5WP91cgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5589aa31461720ef9a6e0439a5b4e2ecf98c2910
commit: 05f325ba73111fe95321062ed6207dff7fcd7399 [415/436] UPSTREAM: clk: mediatek: mt8195: Add support for frequency hopping through FHCTL
config: loongarch-buildonly-randconfig-r005-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121330.5WP91cgL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 05f325ba73111fe95321062ed6207dff7fcd7399
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121330.5WP91cgL-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8195-apmixedsys.o: in function `clk_mt8195_apmixed_remove':
>> clk-mt8195-apmixedsys.c:(.text+0x40): undefined reference to `mtk_clk_unregister_pllfhs'
   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8195-apmixedsys.o: in function `clk_mt8195_apmixed_probe':
>> clk-mt8195-apmixedsys.c:(.text+0xc8): undefined reference to `fhctl_parse_dt'
>> loongarch64-linux-ld: clk-mt8195-apmixedsys.c:(.text+0xec): undefined reference to `mtk_clk_register_pllfhs'
>> loongarch64-linux-ld: clk-mt8195-apmixedsys.c:(.text+0x1ac): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
