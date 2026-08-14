Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D42370AD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 02:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673877; cv=none; b=TerGn0VHcvaMJJR5FR7jikitu2JhDwdGSuwfrUUcpeZSJh54LEIgl+oylCw8M0Xenru4GnUHYbzA1jaT56MTmYvmyyIt/FdDkhIab1MnV5QzChBkj9XYYDFZxCvYSi228w/fU/tqnyXOuAdmOIkQxo6iadFAiGqjmi4GrEuD1Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673877; c=relaxed/simple;
	bh=OsOwnpiMUCZEcksiE7IwnCN3lReGCXsqjKsxfsNMyK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5azQPVvyjMbm8lhbcA8Lx43mkQrS7QvneI79y3joeIl4Y2qMi0hYfHkRo5PiADAirgESIQz1TyvWuDkfLBUj4N676yyFmCUQLj84R6gN/Wl08T7VyJvJ8jtv/sRf0HD3Me2vMeFljOdZ2C/cZRh4ueIvDnX68EE9KOEH9CAHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i46elHgy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i46elHgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786673875; x=1818209875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OsOwnpiMUCZEcksiE7IwnCN3lReGCXsqjKsxfsNMyK8=;
  b=i46elHgykjPQou1fcSpN6QUqVlAElKMVjFxvEAw6L//2UoYl7qRTnL4T
   e/cufqTPUn13BteDdiZILObt/y0dULt0o1McrZ5TOFMrUSZpDwkwzE6y+
   DQTFOGA2mJmv3wKK4s/h6oyTq2y7xsdhQIB/LfrClaMPnaKxDgyY5OAeP
   soHV6QGR5+eZWHvv/fyeSnN1JUb+vq94P+ddMQhQzoHkE7ViJO6fqQm9D
   ZRhzToXlDZalMAHc/tk46MUwYrndMv0mSg7duEocX6QSm7RlQg+a/dCje
   Pqj4NULFAGhNtSaS+RwD3t1AcFj/ninOdWXp0K9I6mjiBkdj38c8aTawL
   Q==;
X-CSE-ConnectionGUID: wwAcN7T7R0+f494OjWpdPg==
X-CSE-MsgGUID: 0p0pRQowR6OjYCee13/n/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87117588"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87117588"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 19:17:54 -0700
X-CSE-ConnectionGUID: C5p0TDTvSryXKB1Te8vdPA==
X-CSE-MsgGUID: tws4xVtuQZuGPhCX2ImC3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="257880413"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2026 19:17:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuhUU-00000000XPm-1xgI;
	Fri, 14 Aug 2026 02:17:50 +0000
Date: Fri, 14 Aug 2026 10:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] media: dib0090: enable L/S-band tuning table rows
Message-ID: <202608141000.dTHnE217-lkp@intel.com>
References: <20260625060850.11250-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625060850.11250-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master kees/for-next/pstore kees/for-next/kspp v7.2-rc7 next-20260812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/media-dib0090-enable-L-S-band-tuning-table-rows/20260814-060516
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260625060850.11250-1-pengpeng%40iscas.ac.cn
patch subject: [RFC PATCH] media: dib0090: enable L/S-band tuning table rows
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608141000.dTHnE217-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141000.dTHnE217-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141000.dTHnE217-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/dvb-frontends/dib0090.c: In function 'dib0090_gain_control':
>> drivers/media/dvb-frontends/dib0090.c:1168:51: error: 'rf_ramp_sband' undeclared (first use in this function); did you mean 'rf_ramp_pwm_cband'?
    1168 |                         dib0090_set_rframp(state, rf_ramp_sband);
         |                                                   ^~~~~~~~~~~~~
         |                                                   rf_ramp_pwm_cband
   drivers/media/dvb-frontends/dib0090.c:1168:51: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/dvb-frontends/dib0090.c:1169:51: error: 'bb_ramp_boost' undeclared (first use in this function)
    1169 |                         dib0090_set_bbramp(state, bb_ramp_boost);
         |                                                   ^~~~~~~~~~~~~


vim +1168 drivers/media/dvb-frontends/dib0090.c

28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1151  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1152  int dib0090_gain_control(struct dvb_frontend *fe)
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1153  {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1154  	struct dib0090_state *state = fe->tuner_priv;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1155  	enum frontend_tune_state *tune_state = &state->tune_state;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1156  	int ret = 10;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1157  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1158  	u16 wbd_val = 0;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1159  	u8 apply_gain_immediatly = 1;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1160  	s16 wbd_error = 0, adc_error = 0;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1161  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1162  	if (*tune_state == CT_AGC_START) {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1163  		state->agc_freeze = 0;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1164  		dib0090_write_reg(state, 0x04, 0x0);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1165  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1166  #ifdef CONFIG_BAND_SBAND
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1167  		if (state->current_band == BAND_SBAND) {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04 @1168  			dib0090_set_rframp(state, rf_ramp_sband);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04 @1169  			dib0090_set_bbramp(state, bb_ramp_boost);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1170  		} else
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1171  #endif
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1172  #ifdef CONFIG_BAND_VHF
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1173  		if (state->current_band == BAND_VHF && !state->identity.p1g) {
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1174  			dib0090_set_rframp(state, rf_ramp_pwm_vhf);
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1175  			dib0090_set_bbramp(state, bb_ramp_pwm_normal);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1176  		} else
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1177  #endif
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1178  #ifdef CONFIG_BAND_CBAND
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1179  		if (state->current_band == BAND_CBAND && !state->identity.p1g) {
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1180  			dib0090_set_rframp(state, rf_ramp_pwm_cband);
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1181  			dib0090_set_bbramp(state, bb_ramp_pwm_normal);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1182  		} else
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1183  #endif
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1184  		if ((state->current_band == BAND_CBAND || state->current_band == BAND_VHF) && state->identity.p1g) {
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1185  			dib0090_set_rframp(state, rf_ramp_pwm_cband_7090p);
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1186  			dib0090_set_bbramp(state, bb_ramp_pwm_normal_socs);
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1187  		} else {
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1188  			dib0090_set_rframp(state, rf_ramp_pwm_uhf);
aedabf7a5402cd4 drivers/media/dvb-frontends/dib0090.c Olivier Grenie 2012-12-31  1189  			dib0090_set_bbramp(state, bb_ramp_pwm_normal);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1190  		}
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1191  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1192  		dib0090_write_reg(state, 0x32, 0);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1193  		dib0090_write_reg(state, 0x39, 0);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1194  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1195  		dib0090_wbd_target(state, state->current_rf);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1196  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1197  		state->rf_gain_limit = state->rf_ramp[0] << WBD_ALPHA;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1198  		state->current_gain = ((state->rf_ramp[0] + state->bb_ramp[0]) / 2) << GAIN_ALPHA;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1199  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1200  		*tune_state = CT_AGC_STEP_0;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1201  	} else if (!state->agc_freeze) {
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1202  		s16 wbd = 0, i, cnt;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1203  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1204  		int adc;
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1205  		wbd_val = dib0090_get_slow_adc_val(state);
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1206  
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1207  		if (*tune_state == CT_AGC_STEP_0)
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1208  			cnt = 5;
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1209  		else
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1210  			cnt = 1;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1211  
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1212  		for (i = 0; i < cnt; i++) {
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1213  			wbd_val = dib0090_get_slow_adc_val(state);
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1214  			wbd += dib0090_wbd_to_db(state, wbd_val);
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1215  		}
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1216  		wbd /= cnt;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1217  		wbd_error = state->wbd_target - wbd;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1218  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1219  		if (*tune_state == CT_AGC_STEP_0) {
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1220  			if (wbd_error < 0 && state->rf_gain_limit > 0 && !state->identity.p1g) {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1221  #ifdef CONFIG_BAND_CBAND
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1222  				/* in case of CBAND tune reduce first the lt_gain2 before adjusting the RF gain */
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1223  				u8 ltg2 = (state->rf_lt_def >> 10) & 0x7;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1224  				if (state->current_band == BAND_CBAND && ltg2) {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1225  					ltg2 >>= 1;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1226  					state->rf_lt_def &= ltg2 << 10;	/* reduce in 3 steps from 7 to 0 */
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1227  				}
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1228  #endif
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1229  			} else {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1230  				state->agc_step = 0;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1231  				*tune_state = CT_AGC_STEP_1;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1232  			}
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1233  		} else {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1234  			/* calc the adc power */
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1235  			adc = state->config->get_adc_power(fe);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1236  			adc = (adc * ((s32) 355774) + (((s32) 1) << 20)) >> 21;	/* included in [0:-700] */
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1237  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1238  			adc_error = (s16) (((s32) ADC_TARGET) - adc);
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1239  #ifdef CONFIG_STANDARD_DAB
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1240  			if (state->fe->dtv_property_cache.delivery_system == STANDARD_DAB)
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1241  				adc_error -= 10;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1242  #endif
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1243  #ifdef CONFIG_STANDARD_DVBT
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1244  			if (state->fe->dtv_property_cache.delivery_system == STANDARD_DVBT &&
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1245  					(state->fe->dtv_property_cache.modulation == QAM_64 || state->fe->dtv_property_cache.modulation == QAM_16))
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1246  				adc_error += 60;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1247  #endif
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1248  #ifdef CONFIG_SYS_ISDBT
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1249  			if ((state->fe->dtv_property_cache.delivery_system == SYS_ISDBT) && (((state->fe->dtv_property_cache.layer[0].segment_count >
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1250  								0)
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1251  							&&
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1252  							((state->fe->dtv_property_cache.layer[0].modulation ==
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1253  							  QAM_64)
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1254  							 || (state->fe->dtv_property_cache.
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1255  								 layer[0].modulation == QAM_16)))
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1256  						||
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1257  						((state->fe->dtv_property_cache.layer[1].segment_count >
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1258  						  0)
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1259  						 &&
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1260  						 ((state->fe->dtv_property_cache.layer[1].modulation ==
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1261  						   QAM_64)
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1262  						  || (state->fe->dtv_property_cache.
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1263  							  layer[1].modulation == QAM_16)))
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1264  						||
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1265  						((state->fe->dtv_property_cache.layer[2].segment_count >
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1266  						  0)
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1267  						 &&
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1268  						 ((state->fe->dtv_property_cache.layer[2].modulation ==
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1269  						   QAM_64)
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1270  						  || (state->fe->dtv_property_cache.
28fafca78797be7 drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2011-01-04  1271  							  layer[2].modulation == QAM_16)))
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1272  						)
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1273  				)
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1274  				adc_error += 60;
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1275  #endif
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1276  
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1277  			if (*tune_state == CT_AGC_STEP_1) {	/* quickly go to the correct range of the ADC power */
7aa92c4229fefff drivers/media/dvb-frontends/dib0090.c Dan Gopstein   2017-12-25  1278  				if (abs(adc_error) < 50 || state->agc_step++ > 5) {
03245a5ee69a5fa drivers/media/dvb/frontends/dib0090.c Olivier Grenie 2009-12-04  1279  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
