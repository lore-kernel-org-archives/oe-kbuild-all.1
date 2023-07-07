Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F27E171C5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688756953; x=1720292953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OLO57wVxdEQy4soa+ud5JkYyjjn1pmRPaIZj8Z4CoA=;
  b=dV+GHGvS/EbWRQL5xHGQJRqzWVlM1ue0UrMN8+AfcIVHVDpxJf039f0t
   LkinefwuUpwKsKZBCayK1yCUEYws35qvbRkwJQTmZ9tqJwHcSuoFx+wrp
   08gXoMEU7D7zDooOeqSyCAc5kmpWz1btD2eumcT3F6Pma8xIsPZGhx4gP
   r5C5yOwbgUFoU9AjU+E3zx22WY6O9ZFYsYsIOw8thKjVmLmXIs8dJjGD2
   Km+OEFVY8+aTcNmLL32VVIv7gVjm0DkmQ/eqqE+V5BxX3NFLqUUEGc1en
   q9mvfWImQzlPPtaGr+zTwb1xiEC1PTZyrwS0daX0/JQwY+qqEVXSJxY7e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366548549"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="366548549"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864658382"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="864658382"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 12:09:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHqpH-0002DQ-1G;
	Fri, 07 Jul 2023 19:09:07 +0000
Date: Sat, 8 Jul 2023 03:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used
 uninitialized
Message-ID: <202307080250.28r3inuE-lkp@intel.com>
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
head:   4f6b6c2b2f86b7878a770736bf478d8a263ff0bc
commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
date:   8 months ago
config: arc-randconfig-r035-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080250.28r3inuE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080250.28r3inuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080250.28r3inuE-lkp@intel.com/

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
