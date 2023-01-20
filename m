Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C747C17D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674200035; x=1705736035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sLL9QoGxqkEaaB47NwJbqBPEl2IkXtitMSibR3HLLjw=;
  b=icRqwdHLXTUdqQpNJX9pBbcMlcA+5/aCOwGxDJishCcp1ww09sCzn7PC
   p8VbPuOOSanJJDu1MkzM1m4cAtm1kTdgSdc+AKhlbGomZ7c92d3TWR7Bj
   IWMg4GVfe7cm6fiQEyicjI453gkSII+8yYxeulrVZhxH1frrjWtRhgC+f
   nQXnArY+Qd4Pki+6u7PDfWOJ+F3gdJ5TGK5yw+U80EnefjXTiaQf9dhjU
   QG65VRAufnZavx/739kV2adr6qxIjDzQ58kNgCWiKLaCmJzXi3EnC5ffL
   RCXkYXPOj8Fw/Sp7MFSwqrpORlncOyiJa+bjps2sAPZb5za1yW8dX8Tv0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326802312"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="326802312"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690960207"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="690960207"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 23:33:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIluE-0002Ka-3D;
	Fri, 20 Jan 2023 07:33:46 +0000
Date: Fri, 20 Jan 2023 15:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <202301201538.zNlqgE4L-lkp@intel.com>
References: <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119052642.1112171-2-Mr.Bossman075@gmail.com>

Hi Jesse,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/riscv-Kconfig-Allow-RV32-to-build-with-no-MMU/20230119-132822
patch link:    https://lore.kernel.org/r/20230119052642.1112171-2-Mr.Bossman075%40gmail.com
patch subject: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
config: riscv-randconfig-c003-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201538.zNlqgE4L-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c6876d890ddeab1fb2cb42889027c6d1dbdd02f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jesse-Taube/riscv-Kconfig-Allow-RV32-to-build-with-no-MMU/20230119-132822
        git checkout 4c6876d890ddeab1fb2cb42889027c6d1dbdd02f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/clk/clk-k210.o: in function `k210_pll_get_rate':
>> drivers/clk/clk-k210.c:498: undefined reference to `__udivdi3'


vim +498 drivers/clk/clk-k210.c

c6ca7616f7d5c2 Damien Le Moal 2021-02-10  480  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  481  static unsigned long k210_pll_get_rate(struct clk_hw *hw,
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  482  				       unsigned long parent_rate)
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  483  {
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  484  	struct k210_pll *pll = to_k210_pll(hw);
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  485  	u32 reg = readl(pll->reg);
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  486  	u32 r, f, od;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  487  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  488  	if (reg & K210_PLL_BYPASS)
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  489  		return parent_rate;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  490  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  491  	if (!(reg & K210_PLL_PWRD))
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  492  		return 0;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  493  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  494  	r = FIELD_GET(K210_PLL_CLKR, reg) + 1;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  495  	f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  496  	od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  497  
c6ca7616f7d5c2 Damien Le Moal 2021-02-10 @498  	return (u64)parent_rate * f / (r * od);
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  499  }
c6ca7616f7d5c2 Damien Le Moal 2021-02-10  500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
