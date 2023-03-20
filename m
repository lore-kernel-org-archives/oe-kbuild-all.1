Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A1882D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 23:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679355084; x=1710891084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqD7WwgMejhgiKwyPeH150XA2eQT7Ip9WmXL+xfaiBo=;
  b=UCsSrRfHOdHPso4P2jW3FgeX/qv0SJYXJ7LTHFMkzhz1q+dVGBVpfigh
   qB44k3/NcsrY1zct++uEM2Fno9PP4MIOij8AAYwvTf91e0eZoqu3zQ6EB
   arIw6PWHfyfaKPu3jfiSAJuAJUtAH4K8FWSb4IA5G3dOdSjP5bXYOLM1K
   iFYbA1Bf04M9/N6bvqhfG6wcNXmE4oElBHkvhhoQm9T6pkR0KDc7oO+TG
   EwbdKZf8+hIz5vQu8vbC4a3YdLOItKvMcviSQJ9s/YGfR+jGx/tub3zJd
   +FBFk35iQS0UWozHW5P0p8pCYCeDCDeCWNLirof3yimR7NnHKHCamPWeG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337518230"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="337518230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 16:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824683447"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="824683447"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2023 16:31:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peOxw-000BPD-38;
	Mon, 20 Mar 2023 23:31:00 +0000
Date: Tue, 21 Mar 2023 07:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.3-rc3 74/148] ERROR: modpost:
 "gdsc_sync_state" [drivers/clk/qcom/dispcc-sc8280xp.ko] undefined!
Message-ID: <202303210712.xTRTbmNV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.3-rc3
head:   8c3f4a6584c6471c1c961af61e765702189faf11
commit: 348e04f8a197ea0fc58c6086e0557f15e9982eb4 [74/148] clk: qcom: Add sync state callback to all SC8280XP providers
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230321/202303210712.xTRTbmNV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/348e04f8a197ea0fc58c6086e0557f15e9982eb4
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.3-rc3
        git checkout 348e04f8a197ea0fc58c6086e0557f15e9982eb4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210712.xTRTbmNV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "gdsc_sync_state" [drivers/clk/qcom/dispcc-sc8280xp.ko] undefined!
>> ERROR: modpost: "gdsc_sync_state" [drivers/clk/qcom/gcc-sc8280xp.ko] undefined!
>> ERROR: modpost: "gdsc_sync_state" [drivers/clk/qcom/gpucc-sc8280xp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
