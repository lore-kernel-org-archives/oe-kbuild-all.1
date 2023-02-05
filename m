Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4797F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675577953; x=1707113953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4OrNJv66Ynm9Zi8rrdy3PD49wOaXKNYSuUl0ciqnDg=;
  b=Scc8k1lnoy/o0y9LDt580x78/aA5Q7waX2/xxshlLPh6mN6ri+/3W6z0
   GWRx1UFgOe5Oo3M8+DZVX4PWTwVfI231TXq2mO7olZ6UGw0OsVZmBYTpp
   KAtMULhYHCTxo6IHTdu8/OgEgkkMtHNyenFKHZmbcb3vs3d1y6FBnAzVl
   g9EPUL45WlzKu/0V1GQSwVTA8SlZXWfsbhD106fcotl7/G1XVQ9gIaI2n
   WEG9pglZfERMpem5PKh4hoEIDNXLt/+K8qC16Xt1rHUnVjCXHk7y+x2uP
   hfwP7eXvNJTnFkbsphwGB+/uP2ZBhS8DTpe+Iyvl12qptgFCsgFgrGVrP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415236588"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="415236588"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="790117681"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="790117681"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 22:19:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYMo-0001n2-1X;
	Sun, 05 Feb 2023 06:19:10 +0000
Date: Sun, 5 Feb 2023 14:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-test 18/39] clk-mt6795-apmixedsys.c:undefined reference to
 `mtk_clk_unregister_pllfhs'
Message-ID: <202302051429.kH7ali29-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-test
head:   14d84237ad57de7b0f267d290ae87e40842965b4
commit: f29de3daf8b0286bbc41acd2ccb676f5af48d7be [18/39] clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230205/202302051429.kH7ali29-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=f29de3daf8b0286bbc41acd2ccb676f5af48d7be
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout f29de3daf8b0286bbc41acd2ccb676f5af48d7be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/mediatek/clk-mt6795-apmixedsys.o: in function `clk_mt6795_apmixed_remove':
>> clk-mt6795-apmixedsys.c:(.text+0x34): undefined reference to `mtk_clk_unregister_pllfhs'
   arm-linux-gnueabi-ld: drivers/clk/mediatek/clk-mt6795-apmixedsys.o: in function `clk_mt6795_apmixed_probe':
>> clk-mt6795-apmixedsys.c:(.text+0x98): undefined reference to `fhctl_parse_dt'
>> arm-linux-gnueabi-ld: clk-mt6795-apmixedsys.c:(.text+0xb8): undefined reference to `mtk_clk_register_pllfhs'
>> arm-linux-gnueabi-ld: clk-mt6795-apmixedsys.c:(.text+0x1c4): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
