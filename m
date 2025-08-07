Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F971D63C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 05:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544808; cv=none; b=M95HsjXmgXg+ERQQ/n9CvT1mtUCjT1niMKKTifXUwXa7NbRCLBpNA3dWzQgql3QWB0YL9E0KNHRdAl+g46RIwD+gofE4rzkV3tNsCOavqstiyUk68BW8WC2wMaiTDdfE8QcEFTgtaV/2r0S7GJGL7ITmyZsdawofD4Qc0RSwFgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544808; c=relaxed/simple;
	bh=05/RP8sfTPZnU1iYzk0VCxWCh97hLnN24iJ46Jw2BAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9FtlhfU9oJpAkHNk5SE3KKJI5Y8qCP6pY+CzM2/QT6lF7E4B+4ILqnQMS5YSKSHhoEqmy7LHv2AZkiYK98c3HhwEf8aHRgUgOKMqAOHyB1TRQd6Ip01r42cXgW3OLw5wb84rtyKQLoPRIZ7RG2+QiMIAwCfRKaafUAx7w6qZz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfQ9JUu8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfQ9JUu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754544807; x=1786080807;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=05/RP8sfTPZnU1iYzk0VCxWCh97hLnN24iJ46Jw2BAc=;
  b=PfQ9JUu85428WARzDEcK6unA6ebNP2XCjouC9m4YuZBp9rJiR8mQcuzD
   TLqFDxDGqhKVyDafg1WpMxre72ud7tL35TwHDYaiJFaOM7MuvOG4JFuN0
   ymgIBX6Kdg/pbuS8DPhf/sDp0TpYPLNKSH2OJ4ulmW4imnN2Cls57I/Bp
   uuTf4mbZPt0ge2+j6qupoSfLWz0bEucUWJFSP9oQU+eq7XJRQiaqgVvrJ
   KxoMH8i2xZ9iO/VmIhKNDpiaIvUFMmM4YhalwZAGX5frqTyGq4/+x3XtE
   gRSr2MKEP63M8KXPT2jyiK7AMwgzS1uEutrWICdwJStbjJYtd2YZEEeJW
   A==;
X-CSE-ConnectionGUID: lfTNTf38TxSWZ1nE4UdQlA==
X-CSE-MsgGUID: YLnpoDYgT8qVtm1yW99GTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74330255"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74330255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:33:24 -0700
X-CSE-ConnectionGUID: B7XY/t5IQZWpiMa1daJdKg==
X-CSE-MsgGUID: 08RYPJvPS3WEusoROtssRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165330730"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2025 22:33:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtFg-0002Q1-34;
	Thu, 07 Aug 2025 05:33:20 +0000
Date: Thu, 7 Aug 2025 13:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [ukleinek:pwm/for-nexxt 53/53] drivers/pwm/pwm-mediatek.c:181:17:
 error: label 'out' used but not defined
Message-ID: <202508071319.IQZYEA4x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-nexxt
head:   5e73ceedbde7088050ebb44995d640c527ff9fb6
commit: 5e73ceedbde7088050ebb44995d640c527ff9fb6 [53/53] pwm: mediatek: Lock and cache clock rate
config: i386-buildonly-randconfig-004-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071319.IQZYEA4x-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071319.IQZYEA4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071319.IQZYEA4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-mediatek.c: In function 'pwm_mediatek_config':
>> drivers/pwm/pwm-mediatek.c:181:17: error: label 'out' used but not defined
     181 |                 goto out;
         |                 ^~~~


vim +/out +181 drivers/pwm/pwm-mediatek.c

704d918341c378 Uwe Kleine-König           2025-07-28  157  
2503781c97fa66 Sam Shih                   2019-09-20  158  static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  159  			       u64 duty_ns, u64 period_ns)
caf065f8fd583b John Crispin               2017-01-23  160  {
2503781c97fa66 Sam Shih                   2019-09-20  161  	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  162  	u32 clkdiv, enable;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  163  	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  164  	u64 cnt_period, cnt_duty;
7ca59947b5fcf9 Josh Poimboeuf             2025-04-01  165  	unsigned long clk_rate;
e7c197ec97c3ac Zhi Mao                    2017-06-30  166  	int ret;
e7c197ec97c3ac Zhi Mao                    2017-06-30  167  
93dc485ed04a4c Uwe Kleine-König           2025-07-25  168  	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
e7c197ec97c3ac Zhi Mao                    2017-06-30  169  	if (ret < 0)
e7c197ec97c3ac Zhi Mao                    2017-06-30  170  		return ret;
caf065f8fd583b John Crispin               2017-01-23  171  
5e73ceedbde708 Uwe Kleine-König           2025-07-25  172  	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
7ca59947b5fcf9 Josh Poimboeuf             2025-04-01  173  
0c0ead76235db0 Fabien Parent              2020-10-19  174  	/* Make sure we use the bus clock and not the 26MHz clock */
d4f1e7a2fe029e AngeloGioacchino Del Regno 2025-06-23  175  	if (pc->soc->pwm_ck_26m_sel_reg)
d4f1e7a2fe029e AngeloGioacchino Del Regno 2025-06-23  176  		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
0c0ead76235db0 Fabien Parent              2020-10-19  177  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  178  	cnt_period = mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC);
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  179  	if (cnt_period == 0) {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  180  		ret = -ERANGE;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25 @181  		goto out;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  182  	}
f21d136caf8171 Uwe Kleine-König           2025-07-28  183  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  184  	if (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD) + 1) {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  185  		if (cnt_period >= ((FIELD_MAX(PWMDWIDTH_PERIOD) + 1) << FIELD_MAX(PWMCON_CLKDIV))) {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  186  			clkdiv = FIELD_MAX(PWMCON_CLKDIV);
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  187  			cnt_period = FIELD_MAX(PWMDWIDTH_PERIOD) + 1;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  188  		} else {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  189  			clkdiv = ilog2(cnt_period) - ilog2(FIELD_MAX(PWMDWIDTH_PERIOD));
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  190  			cnt_period >>= clkdiv;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  191  		}
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  192  	} else {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  193  		clkdiv = 0;
caf065f8fd583b John Crispin               2017-01-23  194  	}
caf065f8fd583b John Crispin               2017-01-23  195  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  196  	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  197  	if (cnt_duty > cnt_period)
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  198  		cnt_duty = cnt_period;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  199  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  200  	if (cnt_duty) {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  201  		cnt_duty -= 1;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  202  		enable = BIT(pwm->hwpwm);
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  203  	} else {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  204  		enable = 0;
8bdb65dc857597 Zhi Mao                    2017-06-30  205  	}
caf065f8fd583b John Crispin               2017-01-23  206  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  207  	cnt_period -= 1;
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  208  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  209  	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CON: %x, PERIOD: %llx, DUTY: %llx\n",
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  210  		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  211  
360cc036563db2 Sean Wang                  2018-03-01  212  	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
360cc036563db2 Sean Wang                  2018-03-01  213  		/*
360cc036563db2 Sean Wang                  2018-03-01  214  		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
360cc036563db2 Sean Wang                  2018-03-01  215  		 * from the other PWMs on MT7623.
360cc036563db2 Sean Wang                  2018-03-01  216  		 */
360cc036563db2 Sean Wang                  2018-03-01  217  		reg_width = PWM45DWIDTH_FIXUP;
360cc036563db2 Sean Wang                  2018-03-01  218  		reg_thres = PWM45THRES_FIXUP;
360cc036563db2 Sean Wang                  2018-03-01  219  	}
360cc036563db2 Sean Wang                  2018-03-01  220  
2503781c97fa66 Sam Shih                   2019-09-20  221  	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  222  	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
f21d136caf8171 Uwe Kleine-König           2025-07-28  223  
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  224  	if (enable) {
ef2c49bf62a699 Uwe Kleine-König           2025-07-25  225  		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
f21d136caf8171 Uwe Kleine-König           2025-07-28  226  		pwm_mediatek_enable(chip, pwm);
f21d136caf8171 Uwe Kleine-König           2025-07-28  227  	} else {
f21d136caf8171 Uwe Kleine-König           2025-07-28  228  		pwm_mediatek_disable(chip, pwm);
f21d136caf8171 Uwe Kleine-König           2025-07-28  229  	}
caf065f8fd583b John Crispin               2017-01-23  230  
93dc485ed04a4c Uwe Kleine-König           2025-07-25  231  	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
e7c197ec97c3ac Zhi Mao                    2017-06-30  232  
505b730ede7f5c Uwe Kleine-König           2025-07-04  233  	return ret;
caf065f8fd583b John Crispin               2017-01-23  234  }
caf065f8fd583b John Crispin               2017-01-23  235  

:::::: The code at line 181 was first introduced by commit
:::::: ef2c49bf62a699ed21e27f4091b9354ada949abb pwm: mediatek: Fix various issues in the .apply() callback

:::::: TO: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
:::::: CC: Uwe Kleine-König <ukleinek@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
