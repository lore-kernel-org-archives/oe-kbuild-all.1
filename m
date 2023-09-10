Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89D1872
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 05:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694324850; x=1725860850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZrRpzMcvGIHVZgnx67UkdqKEIc5uNcNBZah3WQyopCU=;
  b=YvOtLp6p3dc/cUeV1FWFzD6DSaQWCOM/j8v82K8jOKOXbWMNE4BeUGG+
   CclNXORUcg1Sa39wVJXvTWhXBZG2LLqb79zLdqPw3xU/oC+9HEc2xNscD
   JB5Wz1lVdvMFYb+SGly3L9+0NSOjUy1Hex6A8qMAjR4EOIQzEke48gkmZ
   9FPl0xrkl16WYnahSv8RpEF0MPP4mqwJiCU1KsX4728N/XClr7OXzC8qy
   CI/Q+J2z9KfpBHOu3KtNJpAl/T090hsIlt3myJXbOtW2qMd2jrRx61ih2
   1X5nm1qGiqfHLEzG2piF/ZETyVphRQ6mkqu0mTN8Wvyo+ivP1+AA6O4G/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362917976"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="362917976"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 22:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="746035681"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="746035681"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Sep 2023 22:47:26 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfDI3-0004TK-35;
	Sun, 10 Sep 2023 05:47:23 +0000
Date: Sun, 10 Sep 2023 13:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: drivers/clk/renesas/r9a06g032-clocks.c:119: warning: Function
 parameter or member 'dual' not described in 'r9a06g032_clkdesc'
Message-ID: <202309101314.kTRoxND5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   535a265d7f0dd50d8c3a4f8b4f3a452d56bd160f
commit: 5a5ca2c758c200663fdf5c04f71796a8f300151a clk: renesas: r9a06g032: Document structs
date:   6 months ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230910/202309101314.kTRoxND5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101314.kTRoxND5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101314.kTRoxND5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/r9a06g032-clocks.c:119: warning: Function parameter or member 'dual' not described in 'r9a06g032_clkdesc'


vim +119 drivers/clk/renesas/r9a06g032-clocks.c

a1aae0a6b122300 Ralph Siemsen      2023-03-01   66  
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   67  /**
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   68   * struct r9a06g032_clkdesc - describe a single clock
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   69   * @name:      string describing this clock
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   70   * @managed:   boolean indicating if this clock should be
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   71   *             started/stopped as part of power management
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   72   * @type:      see enum @gate_type
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   73   * @index:     the ID of this clock element
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   74   * @source:    the ID+1 of the parent clock element.
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   75   *             Root clock uses ID of ~0 (PARENT_ID);
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   76   * @gate:      clock enable/disable
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   77   * @div_min:   smallest permitted clock divider
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   78   * @div_max:   largest permitted clock divider
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   79   * @reg:       clock divider register offset, in 32-bit words
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   80   * @div_table: optional list of fixed clock divider values;
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   81   *             must be in ascending order, zero for unused
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   82   * @div:       divisor for fixed-factor clock
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   83   * @mul:       multiplier for fixed-factor clock
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   84   * @group:     UART group, 0=UART0/1/2, 1=UART3/4/5/6/7
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   85   * @sel:       select either g1/r1 or g2/r2 as clock source
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   86   * @g1:        1st source gate (clock enable/disable)
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   87   * @r1:        1st source reset (module reset)
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   88   * @g2:        2nd source gate (clock enable/disable)
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   89   * @r2:        2nd source reset (module reset)
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   90   *
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   91   * Describes a single element in the clock tree hierarchy.
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   92   * As there are quite a large number of clock elements, this
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   93   * structure is packed tightly to conserve space.
5a5ca2c758c2006 Ralph Siemsen      2023-03-01   94   */
4c3d88526eba214 Michel Pollet      2018-06-14   95  struct r9a06g032_clkdesc {
4c3d88526eba214 Michel Pollet      2018-06-14   96  	const char *name;
aad03a66f902e18 Gareth Williams    2019-05-28   97  	uint32_t managed:1;
a1aae0a6b122300 Ralph Siemsen      2023-03-01   98  	enum gate_type type:3;
4c3d88526eba214 Michel Pollet      2018-06-14   99  	uint32_t index:8;
4c3d88526eba214 Michel Pollet      2018-06-14  100  	uint32_t source:8; /* source index + 1 (0 == none) */
4c3d88526eba214 Michel Pollet      2018-06-14  101  	union {
a1aae0a6b122300 Ralph Siemsen      2023-03-01  102  		/* type = K_GATE */
4c3d88526eba214 Michel Pollet      2018-06-14  103  		struct r9a06g032_gate gate;
a1aae0a6b122300 Ralph Siemsen      2023-03-01  104  		/* type = K_DIV  */
4c3d88526eba214 Michel Pollet      2018-06-14  105  		struct {
4c3d88526eba214 Michel Pollet      2018-06-14  106  			unsigned int div_min:10, div_max:10, reg:10;
4c3d88526eba214 Michel Pollet      2018-06-14  107  			u16 div_table[4];
4c3d88526eba214 Michel Pollet      2018-06-14  108  		};
a1aae0a6b122300 Ralph Siemsen      2023-03-01  109  		/* type = K_FFC */
4c3d88526eba214 Michel Pollet      2018-06-14  110  		struct {
4c3d88526eba214 Michel Pollet      2018-06-14  111  			u16 div, mul;
4c3d88526eba214 Michel Pollet      2018-06-14  112  		};
a1aae0a6b122300 Ralph Siemsen      2023-03-01  113  		/* type = K_DUALGATE */
4c3d88526eba214 Michel Pollet      2018-06-14  114  		struct {
f46efcc4746f5c1 Ralph Siemsen      2022-05-18  115  			uint16_t group:1;
4c3d88526eba214 Michel Pollet      2018-06-14  116  			u16 sel, g1, r1, g2, r2;
4c3d88526eba214 Michel Pollet      2018-06-14  117  		} dual;
4c3d88526eba214 Michel Pollet      2018-06-14  118  	};
ceabbf94c317c61 Geert Uytterhoeven 2020-11-30 @119  };
4c3d88526eba214 Michel Pollet      2018-06-14  120  

:::::: The code at line 119 was first introduced by commit
:::::: ceabbf94c317c6175dee6e91805fca4a6353745a clk: renesas: r9a06g032: Drop __packed for portability

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
