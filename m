Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3567E2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 03:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675221006; x=1706757006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hG0Cqd9tAcf9bnbBhEdpsPgvTCJitgXKwvwPCaj9CO8=;
  b=FJkmNiAkfVYK5AAu0KpyUKGrZQbMNPgsfc8TVdvjqHAFC9KgDQa31Dvq
   1NI+cUy1S40StCLaka3yO+FAnqGcGgN8eBi3N2Llaoz8ajfXTysCzAVAr
   5rvRGsDGrL25fqKBzD9Ssgpj/DJoONwQOdHPfyrKNIcsm+bxlHYm8YN4I
   5/vWL1Inf/qOnPclt+zMeD1T1IwUVU1k4KeAxEopsysS37OBY/xYLBmRI
   sMEObANSJlwuQvbg1eVOffUg0o1RhhuguDUB5BqRm8IIjBV9HfXX+4kCR
   z+MN3rNhLxT4kJm6wtH9ItFX5mf25SQefjq24++HyUEnb/U58EYGoMh/X
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414233286"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="414233286"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 19:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="695185072"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="695185072"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Jan 2023 19:09:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN3VE-0004ys-1B;
	Wed, 01 Feb 2023 03:09:40 +0000
Date: Wed, 1 Feb 2023 11:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Message-ID: <202302011058.17Vvc1pN-lkp@intel.com>
References: <20230131153816.21709-1-bchihi@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131153816.21709-1-bchihi@baylibre.com>

Hi Balsam,

Thank you for the patch! Yet something to improve:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
base:   the 4th patch of https://lore.kernel.org/r/20230124131717.128660-5-bchihi%40baylibre.com
patch link:    https://lore.kernel.org/r/20230131153816.21709-1-bchihi%40baylibre.com
patch subject: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage Thermal Sensor driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302011058.17Vvc1pN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5646ebf6f10ff0fc60c04d8c57523f7c44526b41
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
        git checkout 5646ebf6f10ff0fc60c04d8c57523f7c44526b41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/thermal/mediatek/lvts_thermal.c:20:10: fatal error: dt-bindings/thermal/mediatek,lvts-thermal.h: No such file or directory
      20 | #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/thermal/mediatek/lvts_thermal.c

  > 20	#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
