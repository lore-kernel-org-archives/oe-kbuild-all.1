Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4A7B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675701849; x=1707237849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2++oyGuH9P+b0x5albN7pQyNMNnT/4CSX17EwiEmgo=;
  b=dZL/aLEptUzxmWGRgX3oWzOTAHpRnRY9bGBqiz0Wv4zREeD95y/6RstV
   vNUX+goNPOVxDgX9XFHNmpHlY8j8R6Y/x/PNVOk8oWM1H2czm4oAjn5LR
   qsEKqZ7ZPbV054YNPWXyY6fLnShgo2R2qG2KXeoGZqQDtDCdMADxMcr5L
   LpIDdhRGfiEYAwnSTxWKTJqBbOC6vgzEHiHPuHpmGt/bR/ASBPT3Av/YF
   8kZvUvjUFi5/NdrlWPOhOlwSkQW68YVb+a0US5ZT8s/UbR4Pi5lJBSjo8
   c2stVydmryUhybkEaGncnfHlBMy+PJWLUU4TkVL1/ohaKb80jf80CJjdn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="393850412"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393850412"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 08:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="735196096"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="735196096"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 08:44:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP4b8-0002gS-0R;
	Mon, 06 Feb 2023 16:44:06 +0000
Date: Tue, 7 Feb 2023 00:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: arinc9.unal@gmail.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Willem-Jan de Hoog <wdehoog@exalondelft.nl>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	erkin.bozoglu@xeront.com
Subject: Re: [PATCH v2 2/2] nvmem: brcm_nvram: use bcm47xx buffered data
Message-ID: <202302070008.J1xnBnSn-lkp@intel.com>
References: <20230206101642.22720-3-wdehoog@exalondelft.nl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206101642.22720-3-wdehoog@exalondelft.nl>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc7 next-20230206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/arinc9-unal-gmail-com/firmware-bcm47xx_nvram-allow-to-read-from-buffered-nvram-data/20230206-181817
patch link:    https://lore.kernel.org/r/20230206101642.22720-3-wdehoog%40exalondelft.nl
patch subject: [PATCH v2 2/2] nvmem: brcm_nvram: use bcm47xx buffered data
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230207/202302070008.J1xnBnSn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/33f35258e56cfe526d23f263596e9c76ea2d5925
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review arinc9-unal-gmail-com/firmware-bcm47xx_nvram-allow-to-read-from-buffered-nvram-data/20230206-181817
        git checkout 33f35258e56cfe526d23f263596e9c76ea2d5925
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bcm47xx_nvram_read" [drivers/nvmem/nvmem_brcm_nvram.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
