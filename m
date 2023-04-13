Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182BABA4E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 23:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681430175; x=1712966175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TofPAdTImotCpwdQOwbr9GpUqnrKLaBSBx07tJg4QRY=;
  b=cRPtTgrpMypD6JlG29iv04+kJOqEVC5LpJhocEftyLdagBJpvNBAZfcJ
   t6gU9yTxp6sfCmFbUTPqisRV4r9KGriKHPm4JwUL5+pWw2y9eg0Gu138q
   JLk2+2yiaJp/MQfVJDzHO18e6AmRh51Z/7GAsGKF9qhy7F0NkDBAKLFZM
   a/V546zZdaVH3Dmy3bK2OvczN6nYOSr0m32JJOAK1qIXBd5NZG466pDBw
   fGrpZMPQTkGC5ipwVHsX30LnJZYEt8v4jVZtavn74ugPX6q7VzsCMJN73
   /l42DLEFOSxD31uPENo63RvjPeNW3u7eSrXV8/eqApEpDo75bVTAfjDYr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323965095"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="323965095"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 16:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689581258"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="689581258"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 16:56:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn6nO-000Z2p-2V;
	Thu, 13 Apr 2023 23:56:06 +0000
Date: Fri, 14 Apr 2023 07:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 10810/11447]
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240: undefined reference to
 `__floatundidf'
Message-ID: <202304140732.NZcq7RdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
commit: 45810d486bb44bd60213d5f09a713df81b987972 [10810/11447] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: loongarch-randconfig-r016-20230410 (https://download.01.org/0day-ci/archive/20230414/202304140732.NZcq7RdC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=45810d486bb44bd60213d5f09a713df81b987972
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 45810d486bb44bd60213d5f09a713df81b987972
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140732.NZcq7RdC-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_pll_calc':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240: undefined reference to `__floatundidf'
>> loongarch64-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240: undefined reference to `__ltdf2'
>> loongarch64-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:242: undefined reference to `__gedf2'
   loongarch64-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:242: undefined reference to `__ltdf2'
   loongarch64-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:244: undefined reference to `__gedf2'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +240 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

   208	
   209	static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
   210				     unsigned long rate, unsigned long parent_rate)
   211	{
   212		u8 digital_div, txprediv, txposdiv, fbkdiv_high, posdiv1, posdiv2;
   213		u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
   214		u8 txpredivs[4] = { 2, 4, 6, 12 };
   215		u32 fbkdiv_low;
   216		int i, ret;
   217	
   218		pixel_clk = rate;
   219		tmds_clk = pixel_clk;
   220	
   221		if (tmds_clk < 25 * MEGA || tmds_clk > 594 * MEGA)
   222			return -EINVAL;
   223	
   224		if (tmds_clk >= 340 * MEGA)
   225			hdmi_phy->tmds_over_340M = true;
   226		else
   227			hdmi_phy->tmds_over_340M = false;
   228	
   229		/* in Hz */
   230		da_hdmitx21_ref_ck = 26 * MEGA;
   231	
   232		/*  TXPOSDIV stage treatment:
   233		 *	0M  <  TMDS clk  < 54M		  /8
   234		 *	54M <= TMDS clk  < 148.35M    /4
   235		 *	148.35M <=TMDS clk < 296.7M   /2
   236		 *	296.7 <=TMDS clk <= 594M	  /1
   237		 */
   238		if (tmds_clk < 54 * MEGA)
   239			txposdiv = 8;
 > 240		else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
   241			txposdiv = 4;
 > 242		else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
   243			txposdiv = 2;
   244		else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
   245			txposdiv = 1;
   246		else
   247			return -EINVAL;
   248	
   249		/* calculate txprediv: can be 2, 4, 6, 12
   250		 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
   251		 * ICO clk constraint: 5G =< ICO clk <= 12G
   252		 */
   253		for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
   254			ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
   255			if (ns_hdmipll_ck >= 5 * GIGA &&
   256			    ns_hdmipll_ck <= 1 * GIGA)
   257				break;
   258		}
   259		if (i == (ARRAY_SIZE(txpredivs) - 1) &&
   260		    (ns_hdmipll_ck < 5 * GIGA || ns_hdmipll_ck > 12 * GIGA)) {
   261			return -EINVAL;
   262		}
   263		if (i == ARRAY_SIZE(txpredivs))
   264			return -EINVAL;
   265	
   266		txprediv = txpredivs[i];
   267	
   268		/* PCW calculation: FBKDIV
   269		 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
   270		 * RG_HDMITXPLL_FBKDIV[32:0]:
   271		 * [32,24] 9bit integer, [23,0]:24bit fraction
   272		 */
   273		pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
   274			      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
   275	
   276		if (pcw > GENMASK_ULL(32, 0))
   277			return -EINVAL;
   278	
   279		fbkdiv_high = FIELD_GET(GENMASK_ULL(63, 32), pcw);
   280		fbkdiv_low = FIELD_GET(GENMASK(31, 0), pcw);
   281	
   282		/* posdiv1:
   283		 * posdiv1 stage treatment according to color_depth:
   284		 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
   285		 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
   286		 */
   287		posdiv1 = 10;
   288		posdiv2 = 1;
   289	
   290		/* Digital clk divider, max /32 */
   291		digital_div = div_u64((u64)ns_hdmipll_ck, posdiv1 / posdiv2 / pixel_clk);
   292		if (!(digital_div <= 32 && digital_div >= 1))
   293			return -EINVAL;
   294	
   295		mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
   296				    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
   297				    txposdiv, digital_div);
   298		if (ret)
   299			return -EINVAL;
   300	
   301		return 0;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
