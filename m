Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4823D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 04:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676348700; x=1707884700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qS9r1+DDeebaYhT1Tf6BMORix1uHV7srDyqZtYE5TnQ=;
  b=TwHtx0l2YDkNwjohDqx9kDJ0WOsmGbDwnu6Ekuo5ATrVhinGG6G3tBKN
   +YeFErwJVstBKUlyP0guQ9RjAOESBPCh0Y0IXQ7uIpEC39GfUfhOlwwnR
   8NVjHjCmmscVqU1OBFycRoB54SWWsxU52TxMDvTxyE6JsmOeJZpYPeDxO
   xxbm6mH1ucPM0SJyt9bztxoReL3ZsHRKTxz00jtH/9ZXSiPak0mtpKvLm
   Do+V9QxStdJXI/eWN5ouaEHXW04Di+uN7zAuPrhJ8zkH/rELeSHKr0eet
   a4DMKYim2xUmrBEbhTu8hVHTig5KGJm+z+iBwnAeMITP6seTufpgEp0vd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393475390"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393475390"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 20:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701522522"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="701522522"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 20:24:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRmsA-0008DA-0U;
	Tue, 14 Feb 2023 04:24:54 +0000
Date: Tue, 14 Feb 2023 12:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mac.shen@mediatek.com, stuart.lee@mediatek.com,
	Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v7 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Message-ID: <202302141253.tAssz6h3-lkp@intel.com>
References: <20220919-v7-3-b5b58c5ccc07@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v7-3-b5b58c5ccc07@baylibre.com>

Hi Guillaume,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 09e41676e35ab06e4bce8870ea3bf1f191c3cb90]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230213-193958
base:   09e41676e35ab06e4bce8870ea3bf1f191c3cb90
patch link:    https://lore.kernel.org/r/20220919-v7-3-b5b58c5ccc07%40baylibre.com
patch subject: [PATCH v7 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230214/202302141253.tAssz6h3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/94dbdd48a9476284394fe686b9d3f8d9277281db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230213-193958
        git checkout 94dbdd48a9476284394fe686b9d3f8d9277281db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141253.tAssz6h3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
