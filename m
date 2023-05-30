Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD012B79
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685436558; x=1716972558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6a6pofTMOk46CmIRac4736ZHlqF2iItIF+bOve0uJcA=;
  b=hiKD7GnAchDueJAv2Ts6+88WyusJKaquO9k1yeUjwTiKSXFAtp2ybtbS
   NHyzidlJRCKZuYP6r5vO632mtOfgaW8h+4nXUjgo7nfYytrjTg7NvjIHE
   eAnx72/c/GaqYlW0RhCZ0xAsKJpSk0X+s3540JQKOxO6iWJfYac3JYr31
   9JTcwr485CYunm40BngyOzHitqpZ8zRbiHZXg0gjxLMZk4mntjUqeUuV2
   CL0tv92r9rctVbGqJO2tOaKYoIKfTDLYwgu4CEPRK/l1He7LzDGQnE7xE
   DUzAvzl1pIsmWJZa82SIX1ebe0so+ZQ56i6k5olDMTwB3N5ned4UUoCAW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="383112224"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="383112224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 01:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="771450670"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="771450670"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 May 2023 01:49:16 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3v2Z-0000EG-2W;
	Tue, 30 May 2023 08:49:15 +0000
Date: Tue, 30 May 2023 16:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used
 uninitialized
Message-ID: <202305301627.fLT3Bkds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b817fded42d8fe3a0eb47b1149d907851a3c942
commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
date:   7 months ago
config: arc-randconfig-r004-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301627.fLT3Bkds-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=80a21da360516fa602f3a50eb9792f9dfbfb5fdb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 80a21da360516fa602f3a50eb9792f9dfbfb5fdb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301627.fLT3Bkds-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/tc358746.c: In function 'tc358746_find_pll_settings':
>> drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized [-Wuninitialized]
     817 |         u16 p_best, p;
         |             ^~~~~~
>> drivers/media/i2c/tc358746.c:816:13: warning: 'm_best' is used uninitialized [-Wuninitialized]
     816 |         u16 m_best, mul;
         |             ^~~~~~


vim +/p_best +817 drivers/media/i2c/tc358746.c

   805	
   806	static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
   807							unsigned long refclk,
   808							unsigned long fout)
   809	
   810	{
   811		struct device *dev = tc358746->sd.dev;
   812		unsigned long best_freq = 0;
   813		u32 min_delta = 0xffffffff;
   814		u16 prediv_max = 17;
   815		u16 prediv_min = 1;
 > 816		u16 m_best, mul;
 > 817		u16 p_best, p;
   818		u8 postdiv;
   819	
   820		if (fout > 1000 * HZ_PER_MHZ) {
   821			dev_err(dev, "HS-Clock above 1 Ghz are not supported\n");
   822			return 0;
   823		}
   824	
   825		if (fout >= 500 * HZ_PER_MHZ)
   826			postdiv = 1;
   827		else if (fout >= 250 * HZ_PER_MHZ)
   828			postdiv = 2;
   829		else if (fout >= 125 * HZ_PER_MHZ)
   830			postdiv = 4;
   831		else
   832			postdiv = 8;
   833	
   834		for (p = prediv_min; p <= prediv_max; p++) {
   835			unsigned long delta, fin;
   836			u64 tmp;
   837	
   838			fin = DIV_ROUND_CLOSEST(refclk, p);
   839			if (fin < 4 * HZ_PER_MHZ || fin > 40 * HZ_PER_MHZ)
   840				continue;
   841	
   842			tmp = fout * p * postdiv;
   843			do_div(tmp, fin);
   844			mul = tmp;
   845			if (mul > 511)
   846				continue;
   847	
   848			tmp = mul * fin;
   849			do_div(tmp, p * postdiv);
   850	
   851			delta = abs(fout - tmp);
   852			if (delta < min_delta) {
   853				p_best = p;
   854				m_best = mul;
   855				min_delta = delta;
   856				best_freq = tmp;
   857			};
   858	
   859			if (delta == 0)
   860				break;
   861		};
   862	
   863		if (!best_freq) {
   864			dev_err(dev, "Failed find PLL frequency\n");
   865			return 0;
   866		}
   867	
   868		tc358746->pll_post_div = postdiv;
   869		tc358746->pll_pre_div = p_best;
   870		tc358746->pll_mul = m_best;
   871	
   872		if (best_freq != fout)
   873			dev_warn(dev, "Request PLL freq:%lu, found PLL freq:%lu\n",
   874				 fout, best_freq);
   875	
   876		dev_dbg(dev, "Found PLL settings: freq:%lu prediv:%u multi:%u postdiv:%u\n",
   877			best_freq, p_best, m_best, postdiv);
   878	
   879		return best_freq;
   880	}
   881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
