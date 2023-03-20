Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8DA1861
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679318087; x=1710854087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrhrKa5vsAfTp1XKV/Jg584vYmw1ySNY4eD9B4BH/fo=;
  b=SsTEdBJQAhOfV5WKIQXyNStaB5p38fvE15FTpVdSowPZYfCJunKVSq6L
   oJR2hARzeZ/S/liBDnQkZwQMeEPJb6wIJBbjOwnnD6Egbo9L06gqHMD8V
   uNKjPlzVGSamsIMtAqER1a+va65WxEQPmSZoktsrHoZ8BbA6WA49my0nZ
   KXW92XquI7TVNF2+HMuP+DhEkVsriFa+r50mLrVm8LcplnnyFzi/kkd3g
   QtjPidIPylW7mGLlO0Jp3h7agvR9d3Fv6mkJhdicAqbqWo+uJrwjlVmzF
   ObBf0Sj242Y6Stq37PWNngVJR6tGsmic/yb9964AR33ifPCeEBRwtvb9J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322497724"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="322497724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 06:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="711350879"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="711350879"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Mar 2023 06:14:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peFLW-000B34-29;
	Mon, 20 Mar 2023 13:14:42 +0000
Date: Mon, 20 Mar 2023 21:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [linux-next:master 2621/4847] loongarch64-linux-ld:
 clk-mt8173-apmixedsys.c:undefined reference to `mtk_clk_register_pllfhs'
Message-ID: <202303202113.O9pAgJGQ-lkp@intel.com>
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
commit: a451da86cf6d10e94372d20622ec41aac9ec00b5 [2621/4847] clk: mediatek: Add MODULE_LICENSE() where missing
config: loongarch-randconfig-r021-20230320 (https://download.01.org/0day-ci/archive/20230320/202303202113.O9pAgJGQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a451da86cf6d10e94372d20622ec41aac9ec00b5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a451da86cf6d10e94372d20622ec41aac9ec00b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303202113.O9pAgJGQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: loongarch64-linux-ld: DWARF error: could not find abbrev number 13498
   drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_remove':
   clk-mt8173-apmixedsys.c:(.text+0x3c): undefined reference to `mtk_clk_unregister_pllfhs'
   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `.LBB29':
   clk-mt8173-apmixedsys.c:(.text+0xe0): undefined reference to `fhctl_parse_dt'
>> loongarch64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x104): undefined reference to `mtk_clk_register_pllfhs'
   loongarch64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `.L9':
   clk-mt8173-apmixedsys.c:(.text+0x1c8): undefined reference to `mtk_clk_unregister_pllfhs'
   loongarch64-linux-ld: loongarch64-linux-ld: DWARF error: could not find abbrev number 39877427
   drivers/clk/mediatek/clk-mt8192.o: in function `clk_mt8192_apmixed_probe':
   clk-mt8192.c:(.text+0x10c): undefined reference to `fhctl_parse_dt'
   loongarch64-linux-ld: clk-mt8192.c:(.text+0x130): undefined reference to `mtk_clk_register_pllfhs'
   loongarch64-linux-ld: clk-mt8192.c:(.text+0x1ac): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
