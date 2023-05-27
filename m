Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43914A91
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685220135; x=1716756135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Io7uZbUChNtL4nb7kQxxbu34lljmGj6GjYoP8h0qqkA=;
  b=g8FZb51oyBuHvXIzZutQgJRouuFwBSQObs/EiHYiMjseAR7x1k7fb2P0
   Gm/fdwg4rQ47l5677KHmtErNwXx9TQ28ylb6VS0sZ/fP9ww/d1t707eXy
   0UrUF97xlFYK/o8MGzo7WI2HqHp0rjmJe4UXn0FtbXwY7m8ypBeu3UgxD
   IhGRfJVBT9u5EPfjd74jihnTWjPcpi/oZ4kDCsMQinIurxGDzs+xrtvLy
   pEyzrjl4ieyTgNdmpmfBZbI7NhN8ngmIBxA0/GA2d2R61CjvSaOfSWaSV
   I6P4sWeZbllDFNk/ESVJ/pfGRBjmqjX0dDMmRuR5xRA5gU2VpeQcJr/OI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="354456218"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="354456218"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 13:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="1035720224"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="1035720224"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2023 13:42:14 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q30jt-000KBC-1v;
	Sat, 27 May 2023 20:42:13 +0000
Date: Sun, 28 May 2023 04:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] clk: sunxi-ng: Implement precalculated NKM rate
 selection
Message-ID: <202305280405.bUAMrEtn-lkp@intel.com>
References: <20230527132747.83196-3-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527132747.83196-3-frank@oltmanns.dev>

Hi Frank,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on clk/clk-next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Oltmanns/clk-sunxi-ng-nkm-Minimize-difference-when-finding-rate/20230527-212953
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20230527132747.83196-3-frank%40oltmanns.dev
patch subject: [RFC PATCH 2/3] clk: sunxi-ng: Implement precalculated NKM rate selection
config: arc-randconfig-r043-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280405.bUAMrEtn-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e38de690865af6ad020b5a1d9f94501df69b0e70
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frank-Oltmanns/clk-sunxi-ng-nkm-Minimize-difference-when-finding-rate/20230527-212953
        git checkout e38de690865af6ad020b5a1d9f94501df69b0e70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/clk/sunxi-ng/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280405.bUAMrEtn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/sunxi-ng/ccu_nkm.c: In function 'ccu_nkm_set_rate':
>> drivers/clk/sunxi-ng/ccu_nkm.c:209:50: error: invalid type argument of unary '*' (have 'long unsigned int')
     209 |                 rate = ccu_nkm_find_best_precalc(*parent_rate, rate, &_nkm,
         |                                                  ^~~~~~~~~~~~


vim +209 drivers/clk/sunxi-ng/ccu_nkm.c

   196	
   197	static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,
   198				   unsigned long parent_rate)
   199	{
   200		struct ccu_nkm *nkm = hw_to_ccu_nkm(hw);
   201		struct _ccu_nkm _nkm;
   202		unsigned long flags;
   203		u32 reg;
   204	
   205		if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
   206			rate *= nkm->fixed_post_div;
   207	
   208		if (nkm->table.num)
 > 209			rate = ccu_nkm_find_best_precalc(*parent_rate, rate, &_nkm,
   210							 &nkm->table);
   211		else {
   212			_nkm.min_n = nkm->n.min ?: 1;
   213			_nkm.max_n = nkm->n.max ?: 1 << nkm->n.width;
   214			_nkm.min_k = nkm->k.min ?: 1;
   215			_nkm.max_k = nkm->k.max ?: 1 << nkm->k.width;
   216			_nkm.min_m = 1;
   217			_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
   218			ccu_nkm_find_best(parent_rate, rate, &_nkm);
   219		}
   220	
   221		spin_lock_irqsave(nkm->common.lock, flags);
   222	
   223		reg = readl(nkm->common.base + nkm->common.reg);
   224		reg &= ~GENMASK(nkm->n.width + nkm->n.shift - 1, nkm->n.shift);
   225		reg &= ~GENMASK(nkm->k.width + nkm->k.shift - 1, nkm->k.shift);
   226		reg &= ~GENMASK(nkm->m.width + nkm->m.shift - 1, nkm->m.shift);
   227	
   228		reg |= (_nkm.n - nkm->n.offset) << nkm->n.shift;
   229		reg |= (_nkm.k - nkm->k.offset) << nkm->k.shift;
   230		reg |= (_nkm.m - nkm->m.offset) << nkm->m.shift;
   231		writel(reg, nkm->common.base + nkm->common.reg);
   232	
   233		spin_unlock_irqrestore(nkm->common.lock, flags);
   234	
   235		ccu_helper_wait_for_lock(&nkm->common, nkm->lock);
   236	
   237		return 0;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
