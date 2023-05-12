Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FEA41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683869379; x=1715405379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EtNT564NYfFi/Sl7hCLjTxuTwJo+TE/1vnw09mMMvo=;
  b=RKQUwgmOx5kLe3XyBJ/DUcXbe7PiIY8CdJiWudXxA+PsbP/NE4AMNi7J
   JO0KKD/fpqC42afSL7Dg1xYsD5vgOUZ8qAP5jOjyVId4X86/JdynhBz0a
   OPV9xUQ90nHeNV2e77YUPpLac6he9yuSGGzT+9bfFSyudMBB6L495qzwn
   vsH2UJlNsbUj93LvepXYytx/yb7TfyAMHEMlQeXIa1ZaPA+djuXXQKVAw
   sJlMphwHpDMKYan+W2wzlxJYlIMUml+9WuqZ6W5XIdP+O0Jt6CnjvYvkl
   SEH0vnDy6NwE/U69OUIN4cxhd1T7vKXgaUJQw9yju6DOdAKUb/R7nQokn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331070932"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="331070932"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 22:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029923561"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="1029923561"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 22:29:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxLLV-0004Yc-1O;
	Fri, 12 May 2023 05:29:37 +0000
Date: Fri, 12 May 2023 13:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 413/436] clk-mt8173-apmixedsys.c:undefined
 reference to `mtk_clk_unregister_pllfhs'
Message-ID: <202305121303.GF8y0JCc-lkp@intel.com>
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
commit: c5c3f8b409530ff3b52199af84699d6a0313625a [413/436] UPSTREAM: clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: powerpc-buildonly-randconfig-r002-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121303.GF8y0JCc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout c5c3f8b409530ff3b52199af84699d6a0313625a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121303.GF8y0JCc-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_remove':
>> clk-mt8173-apmixedsys.c:(.text+0x104): undefined reference to `mtk_clk_unregister_pllfhs'
   powerpc-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_probe':
>> clk-mt8173-apmixedsys.c:(.text+0x228): undefined reference to `fhctl_parse_dt'
>> powerpc-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x244): undefined reference to `mtk_clk_register_pllfhs'
>> powerpc-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x3c4): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
