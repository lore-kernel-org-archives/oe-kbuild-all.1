Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE37C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679332194; x=1710868194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OR1UyYBPC9yPM56t9PkrDQHTTdT+NY4zHiPk3Wf+s7o=;
  b=P01RPY28dthxdUmWwMLfk2SIdJjhgKGZjWVp5nfa1H6Ls0CFc56Z7kFG
   5FLLFwTlb8wQr4BvUB1Yis6bPgSbXgiLfZrJzDFU1uGUl90U5N/+BOoSW
   XY2LwUPqpzcutpsSAtdD0KmkHEu1ewD/RXrSWNblfVFF3dy27WCfxukyk
   N4FbUqPUmsI3djGVikgrVm8SAqRWSmyV1uKS/Ifb1Xvc/Xu0zct/5jSoi
   AmbeKJ5EkNhdd14pvpYH3KKU0aoOlibQJCL5/YFHmOa18tEN0s0JdPl6q
   DmuaqrhhO3ds7hmbyMNmE7Fb1dK2r2KxgRwBfraq78zsCahp7YVZtsYS4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318372163"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="318372163"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 10:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855330701"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="855330701"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2023 10:09:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peJ13-000BB6-1f;
	Mon, 20 Mar 2023 17:09:49 +0000
Date: Tue, 21 Mar 2023 01:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [linux-next:master 2631/4847] loongarch64-linux-ld:
 clk-mt8192-apmixedsys.c:undefined reference to `mtk_clk_register_pllfhs'
Message-ID: <202303210120.dbV1HBO1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
commit: 124294ff468fb3e2767473f2e317cd0ffa7eff90 [2631/4847] clk: mediatek: mt8192: Move apmixedsys clock driver to its own file
config: loongarch-randconfig-r021-20230320 (https://download.01.org/0day-ci/archive/20230321/202303210120.dbV1HBO1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=124294ff468fb3e2767473f2e317cd0ffa7eff90
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 124294ff468fb3e2767473f2e317cd0ffa7eff90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210120.dbV1HBO1-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: loongarch64-linux-ld: DWARF error: could not find abbrev number 13498
   drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_remove':
   clk-mt8173-apmixedsys.c:(.text+0x3c): undefined reference to `mtk_clk_unregister_pllfhs'
   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `.LBB29':
   clk-mt8173-apmixedsys.c:(.text+0xe0): undefined reference to `fhctl_parse_dt'
   loongarch64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x104): undefined reference to `mtk_clk_register_pllfhs'
   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `.L9':
   clk-mt8173-apmixedsys.c:(.text+0x1c8): undefined reference to `mtk_clk_unregister_pllfhs'
   loongarch64-linux-ld: loongarch64-linux-ld: DWARF error: could not find abbrev number 234009
   drivers/clk/mediatek/clk-mt8192-apmixedsys.o: in function `clk_mt8192_apmixed_remove':
   clk-mt8192-apmixedsys.c:(.text+0x48): undefined reference to `mtk_clk_unregister_pllfhs'
   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8192-apmixedsys.o: in function `clk_mt8192_apmixed_probe':
   clk-mt8192-apmixedsys.c:(.text+0xc0): undefined reference to `fhctl_parse_dt'
>> loongarch64-linux-ld: clk-mt8192-apmixedsys.c:(.text+0xe4): undefined reference to `mtk_clk_register_pllfhs'
>> loongarch64-linux-ld: clk-mt8192-apmixedsys.c:(.text+0x160): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
