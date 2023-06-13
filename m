Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB49522B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686660540; x=1718196540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4DIaRf5rR2wt24OZUbm+fHnDkQb9/kC9L8KgnQRTvrM=;
  b=YIQ8Fdp8AsaIR3Ihsop8GNjIJdVmKS1jLPWMrBWccR40W1/ZynhAvcyM
   cj9AY3J+NA3TZO0lBNoc96h3r7wmRrymdCiDpmRPAIKcOz7Yr1Gue0fsJ
   SXKfioDmpEBiiFEJxiOsNjHX6Uu4JANck2iDa8tf8v7ik2WGx9dtzJcy4
   KEgxgTE19NJFEaB7VUjXa2Yefs03OzSxlu+bAeBzGYvbNyrB3kRglnf3L
   DPTHciDk0RMBrh90QEuIt/VgRdP52JgLqPwrbxdun75v9ardDQRsPpTkZ
   KE15jCjnpsXqeYrUOsMnNIm+3wRATP5OIOxbobZp9SN7kqZqVorXE2T07
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358316916"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="358316916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 05:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="714785617"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="714785617"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2023 05:48:56 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q93SB-0001M8-1M;
	Tue, 13 Jun 2023 12:48:55 +0000
Date: Tue, 13 Jun 2023 20:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Oltmanns <frank@oltmanns.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Frank Oltmanns <frank@oltmanns.dev>,
	"A.s. Dong" <aisheng.dong@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: tests: Add tests for fractional divisor
 approximation
Message-ID: <202306132038.nUB6hmCv-lkp@intel.com>
References: <20230613083626.227476-3-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613083626.227476-3-frank@oltmanns.dev>

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.4-rc6]
[also build test ERROR on linus/master]
[cannot apply to clk/clk-next next-20230613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Oltmanns/clk-fractional-divider-Improve-approximation-when-zero-based/20230613-163903
base:   v6.4-rc6
patch link:    https://lore.kernel.org/r/20230613083626.227476-3-frank%40oltmanns.dev
patch subject: [PATCH v2 2/2] clk: tests: Add tests for fractional divisor approximation
config: csky-randconfig-r011-20230612 (https://download.01.org/0day-ci/archive/20230613/202306132038.nUB6hmCv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout v6.4-rc6
        b4 shazam https://lore.kernel.org/r/20230613083626.227476-3-frank@oltmanns.dev
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132038.nUB6hmCv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_fractional_divider_general_approximation" [drivers/clk/clk_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
