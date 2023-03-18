Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5C82108
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679142465; x=1710678465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cl2kE6gh14p8PaJXQQlhqYjl5zl0pxtfMDfCUID6wEY=;
  b=YPk/FDY48xFErys5YblBmQj6jpMvN7jPf1Dzw2L7UfyrO6VSiXVKN6UJ
   bIAnrPP756nYJOqGPGlQxyu0hu6/HajKzlm7hK4aZVIAD4/zzTdhHem/H
   wmQbYd4PLHvHnkEMxBbD88bQOuYAhMZIF5Bz0bV/Efj2kmfKK7REnZJTa
   bF/lsITwDNIexw7XGUSLt8NYUSqLYph8hXz9JSqWwh263+Ns2aKi+5+OR
   z3NY7cqZyUOknDG4UwKUjKV+vamYHFEwIHS9l3rNNDFWz/vVqBdoe3y33
   kQpUNELWKHgelnkzQIzdO0bzbLgxuWVNm3/bJW31UX4NuGk6aW7lKkWNW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="401006415"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="401006415"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 05:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="682964523"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="682964523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2023 05:27:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdVex-000A3W-0F;
	Sat, 18 Mar 2023 12:27:43 +0000
Date: Sat, 18 Mar 2023 20:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [clk:clk-mediatek 5/62] clk-mt8173-apmixedsys.c:undefined reference
 to `mtk_clk_unregister_pllfhs'
Message-ID: <202303182019.n5idhG3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   eddc63094855f411455db85b77eb8439201dc779
commit: 45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425 [5/62] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: riscv-randconfig-r042-20230312 (https://download.01.org/0day-ci/archive/20230318/202303182019.n5idhG3T-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout 45a5cbe05d1f562b24db8ce67bd1bb3a3a9ec425
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303182019.n5idhG3T-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_remove':
>> clk-mt8173-apmixedsys.c:(.text+0x32): undefined reference to `mtk_clk_unregister_pllfhs'
   riscv64-linux-ld: drivers/clk/mediatek/clk-mt8173-apmixedsys.o: in function `clk_mt8173_apmixed_probe':
>> clk-mt8173-apmixedsys.c:(.text+0xa0): undefined reference to `fhctl_parse_dt'
>> riscv64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0xba): undefined reference to `mtk_clk_register_pllfhs'
>> riscv64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x16c): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
