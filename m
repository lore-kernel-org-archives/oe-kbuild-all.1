Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38579275B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689792936; x=1721328936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VgOUC4K9fx66jXJxsabJ6cjLbIddps+gucTz9RAEk7M=;
  b=RypHC5ZCOrrJZNswrSZRI9WXmPpEZ16oo40ad/0samBRnn2ODn9YAS3H
   StRdKZ/bXu4uzkiKxTaJ590Kho8Wqd/m1V8xkqNh17KrKqgJM9qFkJtbC
   6HGXa17v2S6JzuwjGbrxwt2mh+Wo9vgKq2TKDlAS9p79NLw+9x81aMbNO
   bKkuo8ecUzYXbudYeG+Fxm2DeLWx/OQFYas8Ad/iiVG9llVV8YndlEoIR
   AMSW+RgEHBM139ANboo8A4X8mB5oAtag2M6ki5/CwIm8Wwp0fOgEBMxwd
   dkq/76za/DgVDIoAemh7s1n6uMiAqQclkm+iRl9MT/42sdWid4Sq03Gaw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366586885"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366586885"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 11:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848148918"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848148918"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 11:55:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMCKf-0005OE-0T;
	Wed, 19 Jul 2023 18:55:29 +0000
Date: Thu, 20 Jul 2023 02:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Zink <j.zink@pengutronix.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	patchwork-jzi@pengutronix.de,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH] net: stmmac: correct MAC propagation delay
Message-ID: <202307200225.B8rmKQPN-lkp@intel.com>
References: <20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334@pengutronix.de>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 36395b2efe905650cd179d67411ffee3b770268b]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Zink/net-stmmac-correct-MAC-propagation-delay/20230719-221258
base:   36395b2efe905650cd179d67411ffee3b770268b
patch link:    https://lore.kernel.org/r/20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334%40pengutronix.de
patch subject: [PATCH] net: stmmac: correct MAC propagation delay
config: i386-randconfig-i002-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200225.B8rmKQPN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200225.B8rmKQPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200225.B8rmKQPN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.o: in function `correct_latency':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c:83: undefined reference to `__udivdi3'


vim +83 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c

    62	
    63	static void correct_latency(struct stmmac_priv *priv)
    64	{
    65		void __iomem *ioaddr = priv->ptpaddr;
    66		u32 reg_tsic, reg_tsicsns;
    67		u32 reg_tsec, reg_tsecsns;
    68		u64 scaled_ns;
    69		u32 val;
    70	
    71		/* MAC-internal ingress latency */
    72		scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
    73	
    74		/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
    75		 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
    76		 */
    77		val = readl(ioaddr + PTP_TCR);
    78		if (val & PTP_TCR_TSCTRLSSR)
    79			/* nanoseconds field is in decimal format with granularity of 1ns/bit */
    80			scaled_ns = (NSEC_PER_SEC << 16) - scaled_ns;
    81		else
    82			/* nanoseconds field is in binary format with granularity of ~0.466ns/bit */
  > 83			scaled_ns = ((1ULL << 31) << 16) - scaled_ns * PSEC_PER_NSEC / 466;
    84	
    85		reg_tsic = scaled_ns >> 16;
    86		reg_tsicsns = scaled_ns & 0xff00;
    87	
    88		/* set bit 31 for 2's compliment */
    89		reg_tsic |= BIT(31);
    90	
    91		writel(reg_tsic, ioaddr + PTP_TS_INGR_CORR_NS);
    92		writel(reg_tsicsns, ioaddr + PTP_TS_INGR_CORR_SNS);
    93	
    94		/* MAC-internal egress latency */
    95		scaled_ns = readl(ioaddr + PTP_TS_EGR_LAT);
    96	
    97		reg_tsec = scaled_ns >> 16;
    98		reg_tsecsns = scaled_ns & 0xff00;
    99	
   100		writel(reg_tsec, ioaddr + PTP_TS_EGR_CORR_NS);
   101		writel(reg_tsecsns, ioaddr + PTP_TS_EGR_CORR_SNS);
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
