Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579617C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682652082; x=1714188082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4R43bx9gM2wJSRgR+/lm2js0NqBwBMtOMTj3g9bM1to=;
  b=AmH/MgOx9Om12d0QL2+10O6eSr+l1Wo3XHGC3d6JcwM3qkcnKoKz6iBh
   51mbZCCVtzyEWqjAcjDs4lLT3fNsXX3S58kfRU13CMaGmk/dNyWED6MRG
   L6we3D3EX7NbPZTmca3ahVs7SWjuEKrquNY0+r2BfapnfTwEOPm6Y7oLM
   7Res6ZTZg92z96Ls2xE4UM8jhL+JlCHrtqqOULdzFRScIJJx56yjtStiG
   YeC2+X2kWUv4BjgW2t+XVnC3izJCP/jRKxUyom9f67P9zPejQSI8XDJ3e
   UdCEtBVDJMEl6WSESZGSLXbvOP8YYFokorwU5nfAspraLVGjE+c1ihMu0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346394249"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="346394249"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806215105"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="806215105"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 20:21:15 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEfc-00004D-0l;
	Fri, 28 Apr 2023 03:21:16 +0000
Date: Fri, 28 Apr 2023 11:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, michael@amarulasolutions.com,
	Amarula patchwork <linux-amarula@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 5/5] ARM: dts: stm32: add CAN support on stm32f746
Message-ID: <202304281111.wSsZVm5t-lkp@intel.com>
References: <20230427204540.3126234-6-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427204540.3126234-6-dario.binacchi@amarulasolutions.com>

Hi Dario,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkl-can-next/testing]
[also build test ERROR on net-next/main net/main linus/master next-20230427]
[cannot apply to atorgue-stm32/stm32-next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-net-can-add-st-can-secondary-property/20230428-044723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
patch link:    https://lore.kernel.org/r/20230427204540.3126234-6-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v2 5/5] ARM: dts: stm32: add CAN support on stm32f746
config: arm-randconfig-r011-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281111.wSsZVm5t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/efdb48d32dc845ff8f52bfe8c7345b61c9671940
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dario-Binacchi/dt-bindings-net-can-add-st-can-secondary-property/20230428-044723
        git checkout efdb48d32dc845ff8f52bfe8c7345b61c9671940
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281111.wSsZVm5t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
