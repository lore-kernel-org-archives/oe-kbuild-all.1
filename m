Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F78F6C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 20:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680381702; x=1711917702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6GFJpEvvurWD0HrL0aipRBNovPQt8PiXZKN6Q3vjWqg=;
  b=jH0qEBVqEj+7IelJfbAnkINmzYY+D35QoE6GzxxVQaLqLzO0VWMV7BpE
   A3lEYnk6bd287ds8oo+Np5x3zHUU10dAtv2nkxJZaTDmr9iIoePcZzTZP
   ru7Kh2KurO8SUnX9OPhXD/JKA4pnwW2jz42/mmNzBlm1Zmq/jfAMyW4/q
   f1DQlDvTo8DCJY1ZYNBtQhvrwjyUBM+VfWjVkfh1RS48K5VtOjkRIp4NF
   q2NUEOW537YzO8ZNrwQeJZCfsk7dzCO0KBUqdXTfTu2p4hrKWWi6EtTFC
   LFEC0+3ahkmjGL2SMPPq1v8yPMcF1/Qv1ijeJg6ze0J+2mhqb1WZ9H3aL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404431744"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="404431744"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 13:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="685494398"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="685494398"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Apr 2023 13:41:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pii2c-000N1Z-0v;
	Sat, 01 Apr 2023 20:41:38 +0000
Date: Sun, 2 Apr 2023 04:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [clk:clk-mediatek 78/82] Fix definition of struct platform_device_id
 in mod_devicetable.h
Message-ID: <202304020408.Lhep2HqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   0d2f2cefba64729a0730ce183ad58cf3e7929b94
commit: eb48cccda09597a309d66331744e1b8edf196a67 [78/82] clk: mediatek: Add MT8188 vppsys0 clock support
config: parisc-randconfig-m041-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020408.Lhep2HqG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=eb48cccda09597a309d66331744e1b8edf196a67
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout eb48cccda09597a309d66331744e1b8edf196a67
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020408.Lhep2HqG-lkp@intel.com/

All errors (new ones prefixed by >>):

   FATAL: modpost: drivers/clk/mediatek/clk-mt8188-venc: sizeof(struct platform_device_id)=24 is not a modulo of the size of section __mod_platform__<identifier>_device_table=392.
>> Fix definition of struct platform_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
