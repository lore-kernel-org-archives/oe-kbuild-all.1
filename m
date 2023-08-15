Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59443207
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H28hml7z5F/UjxZny5Crc+sSPpNpw1JdyVssEELIsmI=;
  b=d7poiYt2W3bHh7lgTWb12Gx4+8Od1FxULxAE+bScUoeYJ9+79MEjCZec
   UWbwA/m21U70AF3pscbJYpzRqxU7QoX0cD/NktEeTOoDgbqzuHqII1piY
   RoOyWkTIZwEoycgwvj4my2qxwUZ6ebmvIFt7kAs/m6N87jDe/cgRu+9xj
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,174,1684792800"; 
   d="scan'208";a="63502211"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:09:06 +0200
Date: Tue, 15 Aug 2023 08:09:05 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joel Stanley <joel@jms.id.au>
cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.5 63/93] drivers/clk/clk-npcm8xx.c:70:1-7: WARNING:
 do_div() does a 64-by-32 division, please consider using div64_ul instead.
 (fwd)
Message-ID: <alpine.DEB.2.22.394.2308150808390.3106@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Tue, 15 Aug 2023 04:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [shenki:dev-6.5 63/93] drivers/clk/clk-npcm8xx.c:70:1-7: WARNING:
    do_div() does a 64-by-32 division, please consider using div64_ul instead.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux dev-6.5
head:   e874a83263bd783e23411cf6ab12622ac36362f5
commit: 3ee0ccee782341bcffbaf9afbe476e2bc8ad0cfb [63/93] clk: npcm8xx: add clock controller
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r053-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150409.rbhBIGlr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150409.rbhBIGlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308150409.rbhBIGlr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-npcm8xx.c:70:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +70 drivers/clk/clk-npcm8xx.c

3ee0ccee782341 Tomer Maimon 2022-10-02  48
3ee0ccee782341 Tomer Maimon 2022-10-02  49  static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
3ee0ccee782341 Tomer Maimon 2022-10-02  50  						 unsigned long parent_rate)
3ee0ccee782341 Tomer Maimon 2022-10-02  51  {
3ee0ccee782341 Tomer Maimon 2022-10-02  52  	struct npcm8xx_clk_pll *pll = to_npcm8xx_clk_pll(hw);
3ee0ccee782341 Tomer Maimon 2022-10-02  53  	unsigned long fbdv, indv, otdv1, otdv2;
3ee0ccee782341 Tomer Maimon 2022-10-02  54  	unsigned int val;
3ee0ccee782341 Tomer Maimon 2022-10-02  55  	u64 ret;
3ee0ccee782341 Tomer Maimon 2022-10-02  56
3ee0ccee782341 Tomer Maimon 2022-10-02  57  	if (parent_rate == 0) {
3ee0ccee782341 Tomer Maimon 2022-10-02  58  		pr_debug("%s: parent rate is zero\n", __func__);
3ee0ccee782341 Tomer Maimon 2022-10-02  59  		return 0;
3ee0ccee782341 Tomer Maimon 2022-10-02  60  	}
3ee0ccee782341 Tomer Maimon 2022-10-02  61
3ee0ccee782341 Tomer Maimon 2022-10-02  62  	val = readl_relaxed(pll->pllcon + pll->pll.reg);
3ee0ccee782341 Tomer Maimon 2022-10-02  63
3ee0ccee782341 Tomer Maimon 2022-10-02  64  	indv = FIELD_GET(PLLCON_INDV, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  65  	fbdv = FIELD_GET(PLLCON_FBDV, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  66  	otdv1 = FIELD_GET(PLLCON_OTDV1, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  67  	otdv2 = FIELD_GET(PLLCON_OTDV2, val);
3ee0ccee782341 Tomer Maimon 2022-10-02  68
3ee0ccee782341 Tomer Maimon 2022-10-02  69  	ret = (u64)parent_rate * fbdv;
3ee0ccee782341 Tomer Maimon 2022-10-02 @70  	do_div(ret, indv * otdv1 * otdv2);
3ee0ccee782341 Tomer Maimon 2022-10-02  71
3ee0ccee782341 Tomer Maimon 2022-10-02  72  	return ret;
3ee0ccee782341 Tomer Maimon 2022-10-02  73  }
3ee0ccee782341 Tomer Maimon 2022-10-02  74

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
