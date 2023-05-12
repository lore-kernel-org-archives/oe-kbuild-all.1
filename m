Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03701ECF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 05:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683869381; x=1715405381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhkTsWiYZnYcUPTMcDp+v3VxyMwV2aUDl9ZiFp2NGTE=;
  b=J0zg+JZGVonTBKBH6H5Ll3JDP1SFiWSgZnN3A9jwMNfV4CFfz9Xt6gyb
   zKjD1sj1ETsiaBXKtpw5ctucBHtJhtHmyVNMxWxs1eIAk9C7xJ+5wiHey
   1hS2eLMTsbIXdp+S4Soi+gJJIWXo1DUjcwXjyVhcU310BjTFhFQ1QVzSm
   0TMgEaIcRnRSbNiyZ6q+yDjvlKcSyZ6mUjglpbQ41fNmIOwlifujCSoMB
   +e7by97Dv8Uq/oxqOn32QaS1a0sp11k8IXi/9uz5NkeXehQtrIG5Z00B7
   1iAutNDl+dAEzaRQNePzk2KgyPuqaGSZ6/pl9xEScNJfvKLMYVsDXn8Su
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331070935"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="331070935"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 22:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029923562"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="1029923562"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 22:29:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxLLV-0004YY-1G;
	Fri, 12 May 2023 05:29:37 +0000
Date: Fri, 12 May 2023 13:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 415/436] clk-mt8195-apmixedsys.c:undefined
 reference to `mtk_clk_unregister_pllfhs'
Message-ID: <202305121344.ZKKCpxIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   101c17a196db9c062b3a17541bba4585f6e5681f
commit: 05f325ba73111fe95321062ed6207dff7fcd7399 [415/436] UPSTREAM: clk: mediatek: mt8195: Add support for frequency hopping through FHCTL
config: csky-randconfig-r005-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121344.ZKKCpxIH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 05f325ba73111fe95321062ed6207dff7fcd7399
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121344.ZKKCpxIH-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/clk/mediatek/clk-mt8192.o: in function `clk_mt8192_apmixed_probe':
   clk-mt8192.c:(.text+0x88): undefined reference to `fhctl_parse_dt'
   csky-linux-ld: clk-mt8192.c:(.text+0x9a): undefined reference to `mtk_clk_register_pllfhs'
   csky-linux-ld: clk-mt8192.c:(.text+0xde): undefined reference to `mtk_clk_unregister_pllfhs'
   csky-linux-ld: drivers/clk/mediatek/clk-mt8192.o: in function `clk_mt8192_probe':
   clk-mt8192.c:(.text+0x128): undefined reference to `fhctl_parse_dt'
   csky-linux-ld: clk-mt8192.c:(.text+0x130): undefined reference to `mtk_clk_register_pllfhs'
   csky-linux-ld: clk-mt8192.c:(.text+0x148): undefined reference to `mtk_clk_unregister_pllfhs'
   csky-linux-ld: drivers/clk/mediatek/clk-mt8195-apmixedsys.o: in function `clk_mt8195_apmixed_remove':
>> clk-mt8195-apmixedsys.c:(.text+0x26): undefined reference to `mtk_clk_unregister_pllfhs'
>> csky-linux-ld: clk-mt8195-apmixedsys.c:(.text+0x4c): undefined reference to `mtk_clk_unregister_pllfhs'
   csky-linux-ld: drivers/clk/mediatek/clk-mt8195-apmixedsys.o: in function `clk_mt8195_apmixed_probe':
>> clk-mt8195-apmixedsys.c:(.text+0x70): undefined reference to `fhctl_parse_dt'
>> csky-linux-ld: clk-mt8195-apmixedsys.c:(.text+0x82): undefined reference to `mtk_clk_register_pllfhs'
   csky-linux-ld: clk-mt8195-apmixedsys.c:(.text+0xcc): undefined reference to `mtk_clk_unregister_pllfhs'
>> csky-linux-ld: clk-mt8195-apmixedsys.c:(.text+0xf4): undefined reference to `fhctl_parse_dt'
   csky-linux-ld: clk-mt8195-apmixedsys.c:(.text+0xfc): undefined reference to `mtk_clk_register_pllfhs'
   csky-linux-ld: clk-mt8195-apmixedsys.c:(.text+0x114): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
