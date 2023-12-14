Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D56C6C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgyp6YqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702595731; x=1734131731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rHfF5auCX7fFjki9EA0u3DvhPUf4ft3F1/Hp8Ti887E=;
  b=kgyp6YqRJsohydDt/leo7Sef2vv/WnyqLEaSx4esgOmMB9A42vv72Hz/
   5oSOUdGNlu2D142d2dwRQwrTK9odN9X8UVQzlpxR2qJmeRyjNDmniQ7Oe
   Z/wxNL3U9M2YOIpctJiU69mNHqTx9FUdiD/hbITObBCVYtaFI3dO2Wmee
   9lrnMY5/BER5ixapi3yuGq4lMwZ65xMW/OdkL78n5Pk37PzrTsKasT2dp
   nfOX6y71lrnp7yfITPAbHuuM8opmsqYAZcplOj2rbNq6VcYawbIUAB0p3
   OiX6ZnMpc7GtV2Q7Aorpn2C1J3L8PttywX0oBftH2GFRbEsSjyvHTzOq6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394074843"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="394074843"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 15:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021729375"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="1021729375"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2023 15:15:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDuvO-000MhW-2z;
	Thu, 14 Dec 2023 23:15:26 +0000
Date: Fri, 15 Dec 2023 07:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13446/30000]
 drivers/pwm/pwm-stm32-lp.c:63:41: warning: format '%u' expects argument of
 type 'unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned
 int'}
Message-ID: <202312150734.VZoVlBCV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   cf192765644ad5c02b878bbd303fc8b30f6398b4
commit: d892c9f3571faa2e691fc3a9eb6ea4f4da1d7eab [13446/30000] ANDROID: GKI: pwm: core: Add option to config PWM duty/period with u64 data length
config: x86_64-buildonly-randconfig-001-20230926 (https://download.01.org/0day-ci/archive/20231215/202312150734.VZoVlBCV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150734.VZoVlBCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150734.VZoVlBCV-lkp@intel.com/

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
   drivers/pwm/.tmp_pwm-stm32-lp.o: warning: objtool: missing symbol for section .init.text


vim +63 drivers/pwm/pwm-stm32-lp.c

e70a540b4e0230 Fabrice Gasnier 2017-08-28   32  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   33  static int stm32_pwm_lp_apply(struct pwm_chip *chip, struct pwm_device *pwm,
e70a540b4e0230 Fabrice Gasnier 2017-08-28   34  			      struct pwm_state *state)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   35  {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   36  	struct stm32_pwm_lp *priv = to_stm32_pwm_lp(chip);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   37  	unsigned long long prd, div, dty;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   38  	struct pwm_state cstate;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   39  	u32 val, mask, cfgr, presc = 0;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   40  	bool reenable;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   41  	int ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   42  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   43  	pwm_get_state(pwm, &cstate);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   44  	reenable = !cstate.enabled;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   45  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   46  	if (!state->enabled) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   47  		if (cstate.enabled) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   48  			/* Disable LP timer */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   49  			ret = regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   50  			if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   51  				return ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   52  			/* disable clock to PWM counter */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   53  			clk_disable(priv->clk);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   54  		}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   55  		return 0;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   56  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   57  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   58  	/* Calculate the period and prescaler value */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   59  	div = (unsigned long long)clk_get_rate(priv->clk) * state->period;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   60  	do_div(div, NSEC_PER_SEC);
65348659535d23 Fabrice Gasnier 2019-09-18   61  	if (!div) {
65348659535d23 Fabrice Gasnier 2019-09-18   62  		/* Clock is too slow to achieve requested period. */
65348659535d23 Fabrice Gasnier 2019-09-18  @63  		dev_dbg(priv->chip.dev, "Can't reach %u ns\n",	state->period);
65348659535d23 Fabrice Gasnier 2019-09-18   64  		return -EINVAL;
65348659535d23 Fabrice Gasnier 2019-09-18   65  	}
65348659535d23 Fabrice Gasnier 2019-09-18   66  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   67  	prd = div;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   68  	while (div > STM32_LPTIM_MAX_ARR) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   69  		presc++;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   70  		if ((1 << presc) > STM32_LPTIM_MAX_PRESCALER) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   71  			dev_err(priv->chip.dev, "max prescaler exceeded\n");
e70a540b4e0230 Fabrice Gasnier 2017-08-28   72  			return -EINVAL;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   73  		}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   74  		div = prd >> presc;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   75  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   76  	prd = div;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   77  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   78  	/* Calculate the duty cycle */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   79  	dty = prd * state->duty_cycle;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   80  	do_div(dty, state->period);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   81  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   82  	if (!cstate.enabled) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   83  		/* enable clock to drive PWM counter */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   84  		ret = clk_enable(priv->clk);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   85  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   86  			return ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   87  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   88  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   89  	ret = regmap_read(priv->regmap, STM32_LPTIM_CFGR, &cfgr);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   90  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   91  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   92  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   93  	if ((FIELD_GET(STM32_LPTIM_PRESC, cfgr) != presc) ||
e70a540b4e0230 Fabrice Gasnier 2017-08-28   94  	    (FIELD_GET(STM32_LPTIM_WAVPOL, cfgr) != state->polarity)) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   95  		val = FIELD_PREP(STM32_LPTIM_PRESC, presc);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   96  		val |= FIELD_PREP(STM32_LPTIM_WAVPOL, state->polarity);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   97  		mask = STM32_LPTIM_PRESC | STM32_LPTIM_WAVPOL;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   98  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   99  		/* Must disable LP timer to modify CFGR */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  100  		reenable = true;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  101  		ret = regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  102  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  103  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  104  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  105  		ret = regmap_update_bits(priv->regmap, STM32_LPTIM_CFGR, mask,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  106  					 val);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  107  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  108  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  109  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  110  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  111  	if (reenable) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  112  		/* Must (re)enable LP timer to modify CMP & ARR */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  113  		ret = regmap_write(priv->regmap, STM32_LPTIM_CR,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  114  				   STM32_LPTIM_ENABLE);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  115  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  116  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  117  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  118  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  119  	ret = regmap_write(priv->regmap, STM32_LPTIM_ARR, prd - 1);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  120  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  121  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  122  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  123  	ret = regmap_write(priv->regmap, STM32_LPTIM_CMP, prd - (1 + dty));
e70a540b4e0230 Fabrice Gasnier 2017-08-28  124  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  125  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  126  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  127  	/* ensure CMP & ARR registers are properly written */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  128  	ret = regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  129  				       (val & STM32_LPTIM_CMPOK_ARROK),
e70a540b4e0230 Fabrice Gasnier 2017-08-28  130  				       100, 1000);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  131  	if (ret) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  132  		dev_err(priv->chip.dev, "ARR/CMP registers write issue\n");
e70a540b4e0230 Fabrice Gasnier 2017-08-28  133  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  134  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  135  	ret = regmap_write(priv->regmap, STM32_LPTIM_ICR,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  136  			   STM32_LPTIM_CMPOKCF_ARROKCF);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  137  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  138  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  139  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  140  	if (reenable) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  141  		/* Start LP timer in continuous mode */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  142  		ret = regmap_update_bits(priv->regmap, STM32_LPTIM_CR,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  143  					 STM32_LPTIM_CNTSTRT,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  144  					 STM32_LPTIM_CNTSTRT);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  145  		if (ret) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  146  			regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  147  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  148  		}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  149  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  150  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  151  	return 0;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  152  err:
e70a540b4e0230 Fabrice Gasnier 2017-08-28  153  	if (!cstate.enabled)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  154  		clk_disable(priv->clk);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  155  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  156  	return ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  157  }
e70a540b4e0230 Fabrice Gasnier 2017-08-28  158  

:::::: The code at line 63 was first introduced by commit
:::::: 65348659535d23e6fb7a79aa9d54332479cf980e pwm: stm32-lp: Add check in case requested period cannot be achieved

:::::: TO: Fabrice Gasnier <fabrice.gasnier@st.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
