Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADF21147D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997449; cv=none; b=gOlMM8yl4s2T4tMa9iWi1cGNDUSNelUZFBbxKNF/lTbPCtWNK9dEPl6Lezn2gpDSfP5kmEdcEw549qJExCcMafb6h0jJKODizBCD6m72N0xLArpCSaAJuK0L/R8GDlLHnosA2TRSxFLmI0N3pWaqnLJf4z+GCUX5Rj7XtFMOHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997449; c=relaxed/simple;
	bh=+Ovv9iXJza3OTBX3gWhcy4hNHS4qJssRYkZXZbtZFvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcRfRc6C9R9N/dyLbJPj9PM6zACxj3FR9zQrjTHlKE6b5sgG4a3B3V97KGA/uR9nXoN2LAB+RdXm94AXOHtYVkIXQDR1SITXDu7G0ehR4AX/I8bEODZO68hwSJK/51t3t46x4qbGFKpwutti6FyS0W0LrH2y3IBUc6/hal5JgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtBbS/YU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtBbS/YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733997448; x=1765533448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Ovv9iXJza3OTBX3gWhcy4hNHS4qJssRYkZXZbtZFvw=;
  b=QtBbS/YUlvsHNMuHN1Q1CgvsetKQDkVGOR3qjC2ufhAJEvS7GKeP6Uhx
   6iwGEG9UAGhf987Z30T2l2fCPS1jLC+jMEiAsXtn1SjFmYPMKUlSSpyse
   nMdqDH7odHAzzygW0vYxFnsFiYaVFIFJ7vsDGKm6+BXU4IJD5bsWVThAX
   ObUjReIgsR+Eu6GibXV7o5gSpBDQUS7akmP44maluMmermCd90onrQWTi
   rFcSv74VqaANtjjauB4NFIIeYKkfM2HN3QTMl0BuPU8kP/7W6AZgITt9n
   giLsFQca22HaqNwxkkOC+vU4U+VwrVk6RNLMieHFyFTL2PYX9t56wmjER
   A==;
X-CSE-ConnectionGUID: 9RIc446YQ3G2X6hjH6zhwQ==
X-CSE-MsgGUID: GvIxH813Qqim4NZoG39QqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34542760"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34542760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:57:27 -0800
X-CSE-ConnectionGUID: 0BwRva3GRgGBE94YfRpJ4Q==
X-CSE-MsgGUID: /fz78FLZQ7ewuC4Nc7ceRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96638101"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 01:57:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfwh-0007hA-18;
	Thu, 12 Dec 2024 09:57:23 +0000
Date: Thu, 12 Dec 2024 17:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 10880/30000]
 drivers/pwm/pwm-stm32-lp.c:63:41: warning: format '%u' expects argument of
 type 'unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned
 int'}
Message-ID: <202412121739.XkcReCaa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fenglin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: d892c9f3571faa2e691fc3a9eb6ea4f4da1d7eab [10880/30000] ANDROID: GKI: pwm: core: Add option to config PWM duty/period with u64 data length
config: arm-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121739.XkcReCaa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121739.XkcReCaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121739.XkcReCaa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/platform_device.h:14,
                    from drivers/pwm/pwm-stm32-lp.c:16:
   drivers/pwm/pwm-stm32-lp.c: In function 'stm32_pwm_lp_apply':
>> drivers/pwm/pwm-stm32-lp.c:63:41: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
      63 |                 dev_dbg(priv->chip.dev, "Can't reach %u ns\n",  state->period);
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1426:22: note: in definition of macro 'dev_fmt'
    1426 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/pwm/pwm-stm32-lp.c:63:17: note: in expansion of macro 'dev_dbg'
      63 |                 dev_dbg(priv->chip.dev, "Can't reach %u ns\n",  state->period);
         |                 ^~~~~~~
   drivers/pwm/pwm-stm32-lp.c:63:55: note: format string is defined here
      63 |                 dev_dbg(priv->chip.dev, "Can't reach %u ns\n",  state->period);
         |                                                      ~^
         |                                                       |
         |                                                       unsigned int
         |                                                      %llu


vim +63 drivers/pwm/pwm-stm32-lp.c

e70a540b4e02304 Fabrice Gasnier 2017-08-28   32  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   33  static int stm32_pwm_lp_apply(struct pwm_chip *chip, struct pwm_device *pwm,
e70a540b4e02304 Fabrice Gasnier 2017-08-28   34  			      struct pwm_state *state)
e70a540b4e02304 Fabrice Gasnier 2017-08-28   35  {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   36  	struct stm32_pwm_lp *priv = to_stm32_pwm_lp(chip);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   37  	unsigned long long prd, div, dty;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   38  	struct pwm_state cstate;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   39  	u32 val, mask, cfgr, presc = 0;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   40  	bool reenable;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   41  	int ret;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   42  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   43  	pwm_get_state(pwm, &cstate);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   44  	reenable = !cstate.enabled;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   45  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   46  	if (!state->enabled) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   47  		if (cstate.enabled) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   48  			/* Disable LP timer */
e70a540b4e02304 Fabrice Gasnier 2017-08-28   49  			ret = regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   50  			if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28   51  				return ret;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   52  			/* disable clock to PWM counter */
e70a540b4e02304 Fabrice Gasnier 2017-08-28   53  			clk_disable(priv->clk);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   54  		}
e70a540b4e02304 Fabrice Gasnier 2017-08-28   55  		return 0;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   56  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28   57  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   58  	/* Calculate the period and prescaler value */
e70a540b4e02304 Fabrice Gasnier 2017-08-28   59  	div = (unsigned long long)clk_get_rate(priv->clk) * state->period;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   60  	do_div(div, NSEC_PER_SEC);
65348659535d23e Fabrice Gasnier 2019-09-18   61  	if (!div) {
65348659535d23e Fabrice Gasnier 2019-09-18   62  		/* Clock is too slow to achieve requested period. */
65348659535d23e Fabrice Gasnier 2019-09-18  @63  		dev_dbg(priv->chip.dev, "Can't reach %u ns\n",	state->period);
65348659535d23e Fabrice Gasnier 2019-09-18   64  		return -EINVAL;
65348659535d23e Fabrice Gasnier 2019-09-18   65  	}
65348659535d23e Fabrice Gasnier 2019-09-18   66  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   67  	prd = div;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   68  	while (div > STM32_LPTIM_MAX_ARR) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   69  		presc++;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   70  		if ((1 << presc) > STM32_LPTIM_MAX_PRESCALER) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   71  			dev_err(priv->chip.dev, "max prescaler exceeded\n");
e70a540b4e02304 Fabrice Gasnier 2017-08-28   72  			return -EINVAL;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   73  		}
e70a540b4e02304 Fabrice Gasnier 2017-08-28   74  		div = prd >> presc;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   75  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28   76  	prd = div;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   77  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   78  	/* Calculate the duty cycle */
e70a540b4e02304 Fabrice Gasnier 2017-08-28   79  	dty = prd * state->duty_cycle;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   80  	do_div(dty, state->period);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   81  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   82  	if (!cstate.enabled) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   83  		/* enable clock to drive PWM counter */
e70a540b4e02304 Fabrice Gasnier 2017-08-28   84  		ret = clk_enable(priv->clk);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   85  		if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28   86  			return ret;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   87  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28   88  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   89  	ret = regmap_read(priv->regmap, STM32_LPTIM_CFGR, &cfgr);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   90  	if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28   91  		goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   92  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   93  	if ((FIELD_GET(STM32_LPTIM_PRESC, cfgr) != presc) ||
e70a540b4e02304 Fabrice Gasnier 2017-08-28   94  	    (FIELD_GET(STM32_LPTIM_WAVPOL, cfgr) != state->polarity)) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28   95  		val = FIELD_PREP(STM32_LPTIM_PRESC, presc);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   96  		val |= FIELD_PREP(STM32_LPTIM_WAVPOL, state->polarity);
e70a540b4e02304 Fabrice Gasnier 2017-08-28   97  		mask = STM32_LPTIM_PRESC | STM32_LPTIM_WAVPOL;
e70a540b4e02304 Fabrice Gasnier 2017-08-28   98  
e70a540b4e02304 Fabrice Gasnier 2017-08-28   99  		/* Must disable LP timer to modify CFGR */
e70a540b4e02304 Fabrice Gasnier 2017-08-28  100  		reenable = true;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  101  		ret = regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  102  		if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  103  			goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  104  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  105  		ret = regmap_update_bits(priv->regmap, STM32_LPTIM_CFGR, mask,
e70a540b4e02304 Fabrice Gasnier 2017-08-28  106  					 val);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  107  		if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  108  			goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  109  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28  110  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  111  	if (reenable) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28  112  		/* Must (re)enable LP timer to modify CMP & ARR */
e70a540b4e02304 Fabrice Gasnier 2017-08-28  113  		ret = regmap_write(priv->regmap, STM32_LPTIM_CR,
e70a540b4e02304 Fabrice Gasnier 2017-08-28  114  				   STM32_LPTIM_ENABLE);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  115  		if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  116  			goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  117  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28  118  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  119  	ret = regmap_write(priv->regmap, STM32_LPTIM_ARR, prd - 1);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  120  	if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  121  		goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  122  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  123  	ret = regmap_write(priv->regmap, STM32_LPTIM_CMP, prd - (1 + dty));
e70a540b4e02304 Fabrice Gasnier 2017-08-28  124  	if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  125  		goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  126  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  127  	/* ensure CMP & ARR registers are properly written */
e70a540b4e02304 Fabrice Gasnier 2017-08-28  128  	ret = regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
e70a540b4e02304 Fabrice Gasnier 2017-08-28  129  				       (val & STM32_LPTIM_CMPOK_ARROK),
e70a540b4e02304 Fabrice Gasnier 2017-08-28  130  				       100, 1000);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  131  	if (ret) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28  132  		dev_err(priv->chip.dev, "ARR/CMP registers write issue\n");
e70a540b4e02304 Fabrice Gasnier 2017-08-28  133  		goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  134  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28  135  	ret = regmap_write(priv->regmap, STM32_LPTIM_ICR,
e70a540b4e02304 Fabrice Gasnier 2017-08-28  136  			   STM32_LPTIM_CMPOKCF_ARROKCF);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  137  	if (ret)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  138  		goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  139  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  140  	if (reenable) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28  141  		/* Start LP timer in continuous mode */
e70a540b4e02304 Fabrice Gasnier 2017-08-28  142  		ret = regmap_update_bits(priv->regmap, STM32_LPTIM_CR,
e70a540b4e02304 Fabrice Gasnier 2017-08-28  143  					 STM32_LPTIM_CNTSTRT,
e70a540b4e02304 Fabrice Gasnier 2017-08-28  144  					 STM32_LPTIM_CNTSTRT);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  145  		if (ret) {
e70a540b4e02304 Fabrice Gasnier 2017-08-28  146  			regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  147  			goto err;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  148  		}
e70a540b4e02304 Fabrice Gasnier 2017-08-28  149  	}
e70a540b4e02304 Fabrice Gasnier 2017-08-28  150  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  151  	return 0;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  152  err:
e70a540b4e02304 Fabrice Gasnier 2017-08-28  153  	if (!cstate.enabled)
e70a540b4e02304 Fabrice Gasnier 2017-08-28  154  		clk_disable(priv->clk);
e70a540b4e02304 Fabrice Gasnier 2017-08-28  155  
e70a540b4e02304 Fabrice Gasnier 2017-08-28  156  	return ret;
e70a540b4e02304 Fabrice Gasnier 2017-08-28  157  }
e70a540b4e02304 Fabrice Gasnier 2017-08-28  158  

:::::: The code at line 63 was first introduced by commit
:::::: 65348659535d23e6fb7a79aa9d54332479cf980e pwm: stm32-lp: Add check in case requested period cannot be achieved

:::::: TO: Fabrice Gasnier <fabrice.gasnier@st.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
