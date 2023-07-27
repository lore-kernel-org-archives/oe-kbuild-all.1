Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF820F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLI2PQVlmlLqnQBOZiBkXszrEUz4jrdKbRuQPFPU8R0=;
  b=H2Agv8u4lZn0DppXh8Bst+Gn4LYkQv7sjj+ba/zzrLCvnAG72gNNscq+
   8ByUIPXO4emYtwlocZNTwY9ba/j0DvvYTDxAmDItFv/lJTgE9FoypCdzB
   mvBfT1p9MqwU+OCZFRs9psVAZ+B1BjbL5Gd//bmya+y1U2rHcUOWfZkVd
   8=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,233,1684792800"; 
   d="scan'208";a="62436284"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 07:10:32 +0200
Date: Thu, 27 Jul 2023 07:10:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Biju Das <biju.das.jz@bp.renesas.com>
cc: Linux Memory Management List <linux-mm@kvack.org>, 
    Stephen Boyd <sboyd@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2742/4710] drivers/clk/clk-versaclock3.c:404:2-8:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_ul
 instead. (fwd)
Message-ID: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 27 Jul 2023 08:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2742/4710] drivers/clk/clk-versaclock3.c:404:2-8:
    WARNING: do_div() does a 64-by-32 division,
    please consider using div64_ul instead.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ba5d07205771c50789fd9063950aa75e7f1183f
commit: 6e9aff555db7b6816076121ac3feebc3006de9ad [2742/4710] clk: Add support for versa3 clock driver
:::::: branch date: 19 hours ago
:::::: commit date: 7 days ago
config: sparc64-randconfig-r061-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270841.yr5HxYIl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270841.yr5HxYIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307270841.yr5HxYIl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +404 drivers/clk/clk-versaclock3.c

6e9aff555db7b6 Biju Das 2023-07-05  382
6e9aff555db7b6 Biju Das 2023-07-05  383  static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
6e9aff555db7b6 Biju Das 2023-07-05  384  			       unsigned long *parent_rate)
6e9aff555db7b6 Biju Das 2023-07-05  385  {
6e9aff555db7b6 Biju Das 2023-07-05  386  	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
6e9aff555db7b6 Biju Das 2023-07-05  387  	const struct vc3_pll_data *pll = vc3->data;
6e9aff555db7b6 Biju Das 2023-07-05  388  	u64 div_frc;
6e9aff555db7b6 Biju Das 2023-07-05  389
6e9aff555db7b6 Biju Das 2023-07-05  390  	if (rate < pll->vco_min)
6e9aff555db7b6 Biju Das 2023-07-05  391  		rate = pll->vco_min;
6e9aff555db7b6 Biju Das 2023-07-05  392  	if (rate > pll->vco_max)
6e9aff555db7b6 Biju Das 2023-07-05  393  		rate = pll->vco_max;
6e9aff555db7b6 Biju Das 2023-07-05  394
6e9aff555db7b6 Biju Das 2023-07-05  395  	vc3->div_int = rate / *parent_rate;
6e9aff555db7b6 Biju Das 2023-07-05  396
6e9aff555db7b6 Biju Das 2023-07-05  397  	if (pll->num == VC3_PLL2) {
6e9aff555db7b6 Biju Das 2023-07-05  398  		if (vc3->div_int > 0x7ff)
6e9aff555db7b6 Biju Das 2023-07-05  399  			rate = *parent_rate * 0x7ff;
6e9aff555db7b6 Biju Das 2023-07-05  400
6e9aff555db7b6 Biju Das 2023-07-05  401  		/* Determine best fractional part, which is 16 bit wide */
6e9aff555db7b6 Biju Das 2023-07-05  402  		div_frc = rate % *parent_rate;
6e9aff555db7b6 Biju Das 2023-07-05  403  		div_frc *= BIT(16) - 1;
6e9aff555db7b6 Biju Das 2023-07-05 @404  		do_div(div_frc, *parent_rate);
6e9aff555db7b6 Biju Das 2023-07-05  405
6e9aff555db7b6 Biju Das 2023-07-05  406  		vc3->div_frc = (u32)div_frc;
6e9aff555db7b6 Biju Das 2023-07-05  407  		rate = (*parent_rate *
6e9aff555db7b6 Biju Das 2023-07-05  408  			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
6e9aff555db7b6 Biju Das 2023-07-05  409  	} else {
6e9aff555db7b6 Biju Das 2023-07-05  410  		rate = *parent_rate * vc3->div_int;
6e9aff555db7b6 Biju Das 2023-07-05  411  	}
6e9aff555db7b6 Biju Das 2023-07-05  412
6e9aff555db7b6 Biju Das 2023-07-05  413  	return rate;
6e9aff555db7b6 Biju Das 2023-07-05  414  }
6e9aff555db7b6 Biju Das 2023-07-05  415

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
