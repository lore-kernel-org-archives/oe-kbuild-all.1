Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F133214
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682356682; x=1713892682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S/X2H/mlqZImO3F3tj7Tw3KTKqYXWQ1Zao3DMIW39tA=;
  b=XOa8nylBfyprNPj1BsV46459/7QVtXc3A1Cr8Y3r9n35YsNgxZKYJSoO
   g9+fG29k8SMApZPCK+tQc7XVoZnOSylhq7QFBV/0iMdlR+UqmnL8ffnNj
   Mha/4QzhO+9Whzsb37XTJUdyAsNd3T7vSeSfHMzhmjxE4OLg2cdnq/O0x
   yMHHXaZMBuLKZ53HcqHQdTQEqfngrEpj98fndRJRGqQ0/DpfzBxoHK99d
   iQDjJHathub330uBwXACTUItuAa1B/nBq7loqoH1uzsk3RYaZ3vl/EzPI
   tMRWQRpBoM1xW+DK5QJSA0m7Ekq9EIbW6dFhNr/GMJkP31PhsNVsOmQ6y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374458910"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="374458910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 10:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="670574815"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="670574815"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Apr 2023 10:17:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqzp7-000iZu-0S;
	Mon, 24 Apr 2023 17:17:57 +0000
Date: Tue, 25 Apr 2023 01:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 12/43] clk: ep93xx: add DT support for Cirrus EP93xx
Message-ID: <202304250013.c9Px2Npt-lkp@intel.com>
References: <20230424123522.18302-13-nikita.shubin@maquefel.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424123522.18302-13-nikita.shubin@maquefel.me>

Hi Nikita,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.3]
[cannot apply to next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikita-Shubin/gpio-ep93xx-split-device-in-multiple/20230424-183649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230424123522.18302-13-nikita.shubin%40maquefel.me
patch subject: [PATCH 12/43] clk: ep93xx: add DT support for Cirrus EP93xx
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304250013.c9Px2Npt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8621eda93e4a641c57f889ac36d2386482e92157
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nikita-Shubin/gpio-ep93xx-split-device-in-multiple/20230424-183649
        git checkout 8621eda93e4a641c57f889ac36d2386482e92157
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250013.c9Px2Npt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/clk-ep93xx.c: In function 'ep93xx_clk_enable':
>> drivers/clk/clk-ep93xx.c:153:9: error: implicit declaration of function 'ep93xx_syscon_swlocked_write' [-Werror=implicit-function-declaration]
     153 |         ep93xx_syscon_swlocked_write(val, psc->reg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ep93xx_syscon_swlocked_write +153 drivers/clk/clk-ep93xx.c

   140	
   141	static int ep93xx_clk_enable(struct clk_hw *hw)
   142	{
   143		struct clk_psc *psc = to_clk_psc(hw);
   144		unsigned long flags = 0;
   145		u32 val;
   146	
   147		if (psc->lock)
   148			spin_lock_irqsave(psc->lock, flags);
   149	
   150		ep93xx_regmap_read(psc->reg, &val);
   151		val |= BIT(psc->bit_idx);
   152	
 > 153		ep93xx_syscon_swlocked_write(val, psc->reg);
   154	
   155		if (psc->lock)
   156			spin_unlock_irqrestore(psc->lock, flags);
   157	
   158		return 0;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
