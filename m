Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96E6AA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678277869; x=1709813869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vgbsx8r3QuxIB3RjFJxSxX9wWfwdsEyw2KJep8+k8dw=;
  b=eq30Qtn7xM9ItsQG1nPbzo0yNHkrt/wLwlkkh65eJw6YUdvn9KwKOXgw
   yxCwbenrAtK9i59rkM5tRd41Wo4bJYVqnGgpafSZYd5a6RTeQ9BUqAgqF
   Y5NhNt3iYP1XDXcONigqlUPoWDrC9/1r6QnxrwR2QMXJobP8pvYF1ytHk
   BWveGjOoizukX2Xgaf3olFizp+tpGSirlUL+3FQ+KL3HidzaBocWuzOXU
   5F88yv5WV0zB5f8VDbDlK397uNfwlNufOjaCQxTIhybWUueq36mavWl7L
   tVjBsP9EWcXWBDbPjq1ua3QqvpdT/xHKXGXqF8by6tUQbZLZ1BYKDg5u7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398717355"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="398717355"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 04:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="851063973"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="851063973"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 04:17:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZsjo-00027f-1Q;
	Wed, 08 Mar 2023 12:17:44 +0000
Date: Wed, 8 Mar 2023 20:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
	Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
	loongson-kernel@lists.loongnix.cn, Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: Re: [PATCH v13 2/2] clk: clk-loongson2: add clock controller driver
 support
Message-ID: <202303082037.QPfBP64A-lkp@intel.com>
References: <20230307115022.12846-2-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307115022.12846-2-zhuyinbo@loongson.cn>

Hi Yinbo,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next linus/master v6.3-rc1 next-20230308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/clk-clk-loongson2-add-clock-controller-driver-support/20230307-195252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230307115022.12846-2-zhuyinbo%40loongson.cn
patch subject: [PATCH v13 2/2] clk: clk-loongson2: add clock controller driver support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303082037.QPfBP64A-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/391d6fc63ac65f5456e4755c9dd85232a6296285
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yinbo-Zhu/clk-clk-loongson2-add-clock-controller-driver-support/20230307-195252
        git checkout 391d6fc63ac65f5456e4755c9dd85232a6296285
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082037.QPfBP64A-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/clk-loongson2.c: In function 'loongson2_calc_pll_rate':
>> drivers/clk/clk-loongson2.c:79:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
      79 |         val = readq(loongson2_pll_base + offset);
         |               ^~~~~
         |               readl
   cc1: some warnings being treated as errors


vim +79 drivers/clk/clk-loongson2.c

    73	
    74	static unsigned long loongson2_calc_pll_rate(int offset, unsigned long rate)
    75	{
    76		u64 val;
    77		u32 mult = 1, div = 1;
    78	
  > 79		val = readq(loongson2_pll_base + offset);
    80	
    81		mult = (val >> LOONGSON2_PLL_MULT_SHIFT) &
    82				clk_div_mask(LOONGSON2_PLL_MULT_WIDTH);
    83		div = (val >> LOONGSON2_PLL_DIV_SHIFT) &
    84				clk_div_mask(LOONGSON2_PLL_DIV_WIDTH);
    85	
    86		return div_u64((u64)rate * mult, div);
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
