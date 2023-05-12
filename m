Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C97E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 02:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683860083; x=1715396083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0kQ9s+8WkxbZYoObmnoGIZtW/vFC8p4LDz1mQQMmCw=;
  b=mqghojvPG/jLl+SsuavpWUa2g9vW+4sz68d7OVzDMkf0H+Z+3N8HtqS/
   YFaVEoJfmTxUQtiYiCp9QcPqtJtH+kMoYxWVq8v/Be9vk1MBLShRwg+tW
   O3W3KM8Is2eTr2DW3Gau6ztRMSTfggmqaW0nqZdZh0Gb5a1uaRl7RsTEc
   0zLHTjy1TCHLZxw6p+H35A3+hIPDGfC32buX8lveCkAm+IXKaJ3zwvSX8
   JMhBXqTSSQOpBAyLqcaJuuBgYrOcMK3S8cVzeTy7vzjW3DBIzWCyWRWO6
   6uTU8X2Zs9WK1Y0YII/tWQrdvPFir8tG5DlEzPeBA8BWoJBGycOHhMKPH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348183105"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="348183105"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 19:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703003016"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="703003016"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 May 2023 19:54:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxIvR-0004Rg-37;
	Fri, 12 May 2023 02:54:33 +0000
Date: Fri, 12 May 2023 10:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 414/436] clk-mt8192.c:undefined reference to
 `fhctl_parse_dt'
Message-ID: <202305121051.hm3RTPka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   9263d42cea01307513da0d70336b7a44ca574a5b
commit: c9375b7b7166d355b8e42aa6f7345498c10e6ff7 [414/436] UPSTREAM: clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
config: csky-randconfig-r005-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121051.hm3RTPka-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout c9375b7b7166d355b8e42aa6f7345498c10e6ff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121051.hm3RTPka-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/clk/mediatek/clk-mt8192.o: in function `clk_mt8192_apmixed_probe':
>> clk-mt8192.c:(.text+0x88): undefined reference to `fhctl_parse_dt'
>> csky-linux-ld: clk-mt8192.c:(.text+0x9a): undefined reference to `mtk_clk_register_pllfhs'
>> csky-linux-ld: clk-mt8192.c:(.text+0xde): undefined reference to `mtk_clk_unregister_pllfhs'
   csky-linux-ld: drivers/clk/mediatek/clk-mt8192.o: in function `clk_mt8192_probe':
   clk-mt8192.c:(.text+0x128): undefined reference to `fhctl_parse_dt'
   csky-linux-ld: clk-mt8192.c:(.text+0x130): undefined reference to `mtk_clk_register_pllfhs'
   csky-linux-ld: clk-mt8192.c:(.text+0x148): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
