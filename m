Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCD33D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677751335; x=1709287335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wXJoqjlMwyT50ByTps6K1QT9wCiNFa9WZdbp0ek08mI=;
  b=C2kLN9RAnbA8f3+pd104nki31ta/DkcXdo4qo/jpr0HYpLO+t8oqQ+TQ
   g9596PvRjLCmnPenU33oFO53wZ/cwL35xEvSedDpEllTC05NrJEkNNe9U
   BcojChiLLXZg5eZB1sbsZiIO1T3cI7siLxqY3Eh9CuQAt0LwqR9iIQq/t
   0oyIxINOpChqcjyPyAf02yw0VgjKVoCmjR8PsuIPLztnz0ZbsvvOlaOlE
   tf9AHBPihvCxmxTvUH2wnYgsXcFxvrPau6zeWiAK6wVhaGBUmQ6OP7QfK
   Ex/NYpKQZ/tGGCWa7xGrSpP01KPJIa9tsnvkmGpp37ljd0pKLHp3KiQaH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336178070"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="336178070"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 02:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="739005512"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="739005512"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 02:02:10 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXflK-0000OU-02;
	Thu, 02 Mar 2023 10:02:10 +0000
Date: Thu, 2 Mar 2023 18:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
	jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com
Cc: oe-kbuild-all@lists.linux.dev, jian.hu@amlogic.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Message-ID: <202303021725.QbK36cES-lkp@intel.com>
References: <20230301183759.16163-3-ddrokosov@sberdevices.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301183759.16163-3-ddrokosov@sberdevices.ru>

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Rokosov/clk-meson-add-support-for-A1-PLL-clock-ops/20230302-024110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230301183759.16163-3-ddrokosov%40sberdevices.ru
patch subject: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock controller driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021725.QbK36cES-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7f065968cd67b07045e9dda1d9b8fabb06f2100d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Rokosov/clk-meson-add-support-for-A1-PLL-clock-ops/20230302-024110
        git checkout 7f065968cd67b07045e9dda1d9b8fabb06f2100d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021725.QbK36cES-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/a1-pll.c:13:10: fatal error: meson-a1-clkc.h: No such file or directory
      13 | #include "meson-a1-clkc.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/meson/a1-pll.c

  > 13	#include "meson-a1-clkc.h"
    14	#include "a1-pll.h"
    15	#include "clk-regmap.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
