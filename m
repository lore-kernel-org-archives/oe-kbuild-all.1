Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C621FB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677137518; x=1708673518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dq9ZM6uONo0tIMpiu9/xccUFLsK/L/fEIRiovbTblBo=;
  b=E1Kp4/kD6lJJfUCR+cKZafBvhYOP1Tfyi1+RCU8wRI5utd0Fn8vaXK99
   yDe03d8kXbkBfHg918VgHMfjj+aBMGLQYI/LfGRfbUxeJ2AbCFpnQMrbo
   ZuiTw+/tp97Y0HUvaGGm/7cuDP7LgI6b3hopIE7BocChli7/yaeladfgN
   ytXUO7RgULo2LHQT0ySwOCjbFHNRnzjDiL6XEfP07ibwYqCB5lXfLWwnR
   Z6Yy34m40F31UAMFd+AH/7lY05E7HzVxM1lEbnwWty5hvPbDzFRCR24LA
   +BO07vH/dZHEC+NTTe6xR1U3kD28BcV+Lj9mMeUu2Via21LCEA+p1Fnr7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="419363779"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="419363779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 23:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="702694422"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="702694422"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Feb 2023 23:31:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV651-00019B-2u;
	Thu, 23 Feb 2023 07:31:51 +0000
Date: Thu, 23 Feb 2023 15:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Martyn Welch <martyn.welch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add sound card
Message-ID: <202302231533.yOY5yoeD-lkp@intel.com>
References: <20230222172552.1545519-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222172552.1545519-1-luca.ceresoli@bootlin.com>

Hi Luca,

I love your patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on krzk/for-next krzk-dt/for-next linus/master v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/arm64-dts-imx8mp-msc-sm2s-Add-sound-card/20230223-012837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230222172552.1545519-1-luca.ceresoli%40bootlin.com
patch subject: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add sound card
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230223/202302231533.yOY5yoeD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a5c4ed6f9f95285c0ec312f5293250a83ccfc5ce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luca-Ceresoli/arm64-dts-imx8mp-msc-sm2s-Add-sound-card/20230223-012837
        git checkout a5c4ed6f9f95285c0ec312f5293250a83ccfc5ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231533.yOY5yoeD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts:58.1-6 Label or path sai2 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
