Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267C33F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674932275; x=1706468275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C/Fj/U8MY72zX0xzMfuMhE7ROEG03cf3gcA25/GnMq4=;
  b=EV5CGLQ6qUOwY/iG52PT8XmU2E/mw8IJpVzgWEh78d8Krh/uEzboKpn1
   3Bll3+atQj/KZh17ICwlqI4HxqPzv68RvMB+ErTM6BDz9xDXKccE1EXeE
   3jSvrQPGNFrqHUS4H/Z9n4PCKsT27UNhiyanOVGfQIAsYiLngZ6NOYPXZ
   c0Ktj4UNU6Y1CcUoBU0qjqd5lpAEiglrzBe1oSkRMvJKutAhXl5frdRZz
   FBCP7/Tq0vxg2ZYXzjtsskBZF2QZxQU5K1h1jexnhLvNXPtz12XZdpEpW
   81ETMJRB1VPGtaddrD8w++GzcbpFQ81GGoHAJMn46Mi11QU1cEoAesgnU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325015349"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325015349"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="771960911"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="771960911"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 10:57:47 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLqOY-000109-2z;
	Sat, 28 Jan 2023 18:57:46 +0000
Date: Sun, 29 Jan 2023 02:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mac.shen@mediatek.com, linux-phy@lists.infradead.org,
	Guillaume Ranquet <granquet@baylibre.com>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	stuart.lee@mediatek.com
Subject: Re: [PATCH v5 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Message-ID: <202301290245.KWRXz5OS-lkp@intel.com>
References: <20220919-v5-3-cfb0e5ad29b2@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v5-3-cfb0e5ad29b2@baylibre.com>

Hi Guillaume,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230128-160522
base:   e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
patch link:    https://lore.kernel.org/r/20220919-v5-3-cfb0e5ad29b2%40baylibre.com
patch subject: [PATCH v5 3/3] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: arm-buildonly-randconfig-r005-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290245.KWRXz5OS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2cc45518a7fd551117426c770070d93acb31166e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guillaume-Ranquet/dt-bindings-phy-mediatek-hdmi-phy-Add-mt8195-compatible/20230128-160522
        git checkout 2cc45518a7fd551117426c770070d93acb31166e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
