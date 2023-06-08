Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385721DCDC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686257864; x=1717793864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2fZlmwq9H8XDyC1nRY5etzjFOdk0RtFlpyww9b70t8=;
  b=i0rooonkW3riiHVfgnoB2u3nuXBry/yO42X4xQCEREFj560OO36cV9lx
   rvSwdyxFIZJQefMDZ77DkjPJ1xTslKUTwRS8NEky3ZqHJulErRJzc4eXU
   uGcJESQE16fmABbIahSz9AlN5hueFNAz5WTz6B1wuNjmh2LQbNXotAawu
   45FFm3LTV5F2K8UyPUg9dl04pjS3t8WcWrrb0LzQr+nHWrv/fikMLhVns
   fIoRRYGxd1XLDxEgrPGuvPtD8aCn9heYCm0FJ38NBfLS25HRok9TrxEX2
   WOx+Hry0YaXICUA62negJlW5MJuTsfmsW+6xMHq2LN1aC8v7rCEnSfxiF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359915021"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="359915021"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 13:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="799952115"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="799952115"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2023 13:57:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7MhO-0008GA-38;
	Thu, 08 Jun 2023 20:57:38 +0000
Date: Fri, 9 Jun 2023 04:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
 19/40] drivers/usb/typec/mux/nb7vpq904m.c:98:45: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202306090404.zLO5xqzJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
head:   72385e7639a7313c61b81683d0b2125389d9fb2f
commit: ef51b147226995fadfbabbd6b81461256d73235e [19/40] usb: typec: add support for the nb7vpq904m Type-C Linear Redriver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306090404.zLO5xqzJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/ef51b147226995fadfbabbd6b81461256d73235e
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
        git checkout ef51b147226995fadfbabbd6b81461256d73235e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090404.zLO5xqzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/mux/nb7vpq904m.c: In function 'nb7vpq904m_set_channel':
>> drivers/usb/typec/mux/nb7vpq904m.c:98:45: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      98 |                            EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
         |                                             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +98 drivers/usb/typec/mux/nb7vpq904m.c

    80	
    81	static void nb7vpq904m_set_channel(struct nb7vpq904m *nb7, unsigned int channel, bool dp)
    82	{
    83		u8 eq, out_comp, flat_gain, loss_match;
    84	
    85		if (dp) {
    86			eq = NB7_IS_CHAN_AD(channel) ? 0x6 : 0x4;
    87			out_comp = 0x3;
    88			flat_gain = NB7_IS_CHAN_AD(channel) ? 0x2 : 0x1;
    89			loss_match = 0x3;
    90		} else {
    91			eq = 0x4;
    92			out_comp = 0x3;
    93			flat_gain = NB7_IS_CHAN_AD(channel) ? 0x3 : 0x1;
    94			loss_match = NB7_IS_CHAN_AD(channel) ? 0x1 : 0x3;
    95		}
    96	
    97		regmap_update_bits(nb7->regmap, EQ_SETTING_REG(channel),
  > 98				   EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
    99		regmap_update_bits(nb7->regmap, OUTPUT_COMPRESSION_AND_POL_REG(channel),
   100				   OUTPUT_COMPRESSION_MASK, FIELD_PREP(OUTPUT_COMPRESSION_MASK, out_comp));
   101		regmap_update_bits(nb7->regmap, FLAT_GAIN_REG(channel),
   102				   FLAT_GAIN_MASK, FIELD_PREP(FLAT_GAIN_MASK, flat_gain));
   103		regmap_update_bits(nb7->regmap, LOSS_MATCH_REG(channel),
   104				   LOSS_MATCH_MASK, FIELD_PREP(LOSS_MATCH_MASK, loss_match));
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
