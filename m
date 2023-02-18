Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D5229AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 23:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676764162; x=1708300162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/iVyOt06XBWxdirJHKBrOYoQAHczQkdp8LVc/A0T++Y=;
  b=VLPcAAiwhnbQhJLus92BMu7FZ2e3BCRkFCey4x/SePk2Ui899lhR9atD
   d9gsexyH19sJVHDdQUM2F9LgQcA14xJtTkEU2z3iIRkB2CZqrn6Hw0yLl
   kCnj7kSHN2nDtRpblLvdKmbQE06uMoxO4/VzLS5laJbiIUjVHar2HfvoH
   mcOKjT0o6i7hOaiGxaBRT9cz5QUSNpuBOzyv5r+mNmK9sahl9Y3/kYnZQ
   cxHPeSMqJpXYlErCTDUJ5gWGQ7CLgyGZCLrwIFR/diLTTnmLHJ/+u/Jyw
   hq0plHRc0C0ErcTWsOgebvCMnO4ItDH2twsrKiuZudwrXTO3IustmuIA8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="320323918"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="320323918"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 15:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="734718802"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="734718802"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2023 15:49:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTWxC-000Crh-29;
	Sat, 18 Feb 2023 23:49:18 +0000
Date: Sun, 19 Feb 2023 07:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sam Ravnborg <sam@ravnborg.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 4770/9999]
 ingenic-drm-drv.c:(.text.ingenic_drm_remove+0x10): undefined reference to
 `clk_get_parent'
Message-ID: <202302190724.njQnQDOC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   707c48210a5384a72c82655a37895b7e822755f2
commit: 032f8c67fe95608cf51cbf72163f7fa02f8913b3 [4770/9999] drm/ingenic: Reset pixclock rate when parent clock rate changes
config: mips-randconfig-c032-20230217 (https://download.01.org/0day-ci/archive/20230219/202302190724.njQnQDOC-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=032f8c67fe95608cf51cbf72163f7fa02f8913b3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 032f8c67fe95608cf51cbf72163f7fa02f8913b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190724.njQnQDOC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function `ingenic_drm_remove':
>> ingenic-drm-drv.c:(.text.ingenic_drm_remove+0x10): undefined reference to `clk_get_parent'
   mipsel-linux-ld: drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function `ingenic_drm_bind.constprop.0':
   ingenic-drm-drv.c:(.text.ingenic_drm_bind.constprop.0+0x400): undefined reference to `clk_get_parent'
>> mipsel-linux-ld: ingenic-drm-drv.c:(.text.ingenic_drm_bind.constprop.0+0x4f4): undefined reference to `clk_get_parent'
   mipsel-linux-ld: drivers/mmc/host/mtk-sd.o: in function `msdc_set_mclk':
   mtk-sd.c:(.text.msdc_set_mclk+0x31c): undefined reference to `clk_get_parent'
   mipsel-linux-ld: mtk-sd.c:(.text.msdc_set_mclk+0x33c): undefined reference to `clk_get_parent'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
