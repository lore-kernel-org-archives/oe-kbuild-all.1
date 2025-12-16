Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B53434E244
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892603; cv=none; b=HL9ElNaLBq1Lpkb6apkTAfvGoKr8drfxsvfALlpAJ0F5PzoIbvzh4Za3pBezrcMW7D+R/410Rm5Hu+omhWKITs6cIzje+qdUT165jWeDfd/5U07RIZfmFmKvpd8RIe0vCz4jDgZVSQ64/Dry1ynsPPN3XNY5Ygxs4P2Bg98bJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892603; c=relaxed/simple;
	bh=tR+5COm7Aajr+rhTyJR6KwpBfk87Pud1IWaOcJU8NXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhXgbNuT0+pJENJzB9j7l5XyPod2+bxpvyis2GZTqgJk2y/0rwNP6xBEr7VOa9idlqpQpehIxJb2KtMuLqZaa4D2V1DqGIxjVCVE+M0PkZH4VgnSHB2+ROzUyzZMtD7kNcgUZ1ptnkwTyT8KWoz21/xsOfpd9mchU89/0LtXrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bR0JdTuR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bR0JdTuR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so3043954f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 05:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765892597; x=1766497397; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUlPjK/WuIqN2nCcCkf3I8wavxJP1d7TYelnQJd0+CY=;
        b=bR0JdTuRqnvvEQNDJ3fUIN6Pf+0yBlnx0jY/VBhIldVfojf3eivrQRtBQJbfrip8KS
         RbvJHf831IcrbC+SrSaw7r8kVDrPfq/+vvYQBPYP4vXBvWorwvAV1vXgHNl4cRTNYlp9
         qJ7wTiKbeRS1gnaZ8Zs6DOE5ilBatRpV4gJmcQmfHeE1K2hT97FxhddZBcTFXOCctrjD
         4j5rx4YwWJ6/r3Uxb7ebrZa2gu3hRRmFZQYLE266hE30KjZUUP7N/5csa7fPZabaeamm
         gREsjJad8gkuLfZT/h7XTCWE2bQk+rBE+PJzxjJV9SV+lq79RghQK2XdPBfz/qc9/3V8
         z1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892597; x=1766497397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUlPjK/WuIqN2nCcCkf3I8wavxJP1d7TYelnQJd0+CY=;
        b=NAnHMQTN78AB6klYJ/GeKSxIlj76CdnnP0hukVZNVveN9OEaGkPvckVpuPU+YPb7WE
         qFa0gXEDy0bVQFTJa03sb9x0qie7g6MQQuDAGpAaqdA598yHCrIxNL2Re1jt5dWtadhD
         GGemZUZAQrJ3W6NZbQkjXgdjkRPyGaeZM3j39zDWNCHxrzCfac/N4Q0Ns3DMTi/Ra0GO
         /nOiRodYAtP54WFTocE3iTI0lJvR7FquPEKjLg2eBiJ9f9cfcFG1e3m4w0P/vgRzrwa1
         Z6zawuepewkNYuF2JQyxWtVpODgSwaHxKcd0DNGE9lPBZiMCY+UOqkK40CIq0sS+HMvF
         eeww==
X-Forwarded-Encrypted: i=1; AJvYcCVdJzdM2XvCzqCnnFHD30ohZDDzKmpzkocwsvQ1ZBUl08JJV3KpiGuRJMjTFWYbIumY1J/CJzVIyppiB6Ji@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl4X3AbDoOAdI7iiwvubHLvRkp7dxsUPjgYrYNtZU3Hv+TXPh3
	PgGkmthRPTjmSpyDBRDyL7dn5J5BNL+88NH2HSQLGfJclLPzKg57zFSFT8ocTe+JTVA=
X-Gm-Gg: AY/fxX6cUjxci3IXOohZa/WiyZVTjxIM4XuRO3J0HrEiIZPO8aPO+OnQpwOnGKBfKx3
	JJNfu/ObIAh8SC1Xibl5EZxw1SLOPND9yfUkL8BT3f0EM7ue2Je33GawAoqdhzpGbXguxNzp9xG
	l6lpIQz5bYcigzEIs2tbrimP83uA4FkE/O1MpNbqD1wdC5d1ivOj8enJ4sWzm4+sDssOjDOSaDD
	zAthNsc9S8F1lkkUGushu+WX4t/yDeww3oePRi6N+XtwvEk91LK/PCULtYtLja5wZxwLDKK42Bx
	6vzvHDCh7SfzyPWc6phXQh4q7r9CN0rPoUHXKFc/Yhf+Wurw6JpEhEtrCbof9ZprQYUZL7Q9VZK
	nEy5IoIpOv3+Lj8Ht6f6F48Tqo9uJdU1L9g7MAc6SkjpdCuqy+NhqU4LbV98DORu+t2jnsf8n89
	7EGGesupbY7d0o7uwV
X-Google-Smtp-Source: AGHT+IHuvJ59Z1jzIkZ6nejGnOwd19Br4R1Mgp+JiGBQm8dkLJ8TPIA85El0Ts/AzaUTzTNPgPcHrQ==
X-Received: by 2002:a05:6000:2909:b0:42f:a025:92b3 with SMTP id ffacd0b85a97d-42fb44d4395mr13448992f8f.2.1765892596798;
        Tue, 16 Dec 2025 05:43:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f38d01d6sm20782702f8f.8.2025.12.16.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:43:16 -0800 (PST)
Date: Tue, 16 Dec 2025 16:43:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Kemnade <andreas@kemnade.info>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: drivers/power/supply/bd71828-power.c:469
 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.
Message-ID: <202512161012.YCn72zq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 5bff79dad20a51fed3ff6d78f6b60321cd145a99 power: supply: Add bd718(15/28/78) charger driver
config: openrisc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251216/202512161012.YCn72zq9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512161012.YCn72zq9-lkp@intel.com/

smatch warnings:
drivers/power/supply/bd71828-power.c:469 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.

vim +/tmp +469 drivers/power/supply/bd71828-power.c

5bff79dad20a51 Andreas Kemnade 2025-09-18  437  static int bd71828_battery_get_property(struct power_supply *psy,
5bff79dad20a51 Andreas Kemnade 2025-09-18  438  					enum power_supply_property psp,
5bff79dad20a51 Andreas Kemnade 2025-09-18  439  					union power_supply_propval *val)
5bff79dad20a51 Andreas Kemnade 2025-09-18  440  {
5bff79dad20a51 Andreas Kemnade 2025-09-18  441  	struct bd71828_power *pwr = dev_get_drvdata(psy->dev.parent);
5bff79dad20a51 Andreas Kemnade 2025-09-18  442  	int ret = 0;
5bff79dad20a51 Andreas Kemnade 2025-09-18  443  	int status, health, tmp, curr, curr_avg, chg_en;
5bff79dad20a51 Andreas Kemnade 2025-09-18  444  
5bff79dad20a51 Andreas Kemnade 2025-09-18  445  	if (psp == POWER_SUPPLY_PROP_STATUS ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  446  	    psp == POWER_SUPPLY_PROP_HEALTH ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  447  	    psp == POWER_SUPPLY_PROP_CHARGE_TYPE)
5bff79dad20a51 Andreas Kemnade 2025-09-18  448  		ret = bd71828_charge_status(pwr, &status, &health);
5bff79dad20a51 Andreas Kemnade 2025-09-18  449  	else if (psp == POWER_SUPPLY_PROP_CURRENT_AVG ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  450  		 psp == POWER_SUPPLY_PROP_CURRENT_NOW)
5bff79dad20a51 Andreas Kemnade 2025-09-18  451  		ret = bd71828_get_current_ds_adc(pwr, &curr, &curr_avg);
5bff79dad20a51 Andreas Kemnade 2025-09-18  452  	if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  453  		return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  454  
5bff79dad20a51 Andreas Kemnade 2025-09-18  455  	switch (psp) {
5bff79dad20a51 Andreas Kemnade 2025-09-18  456  	case POWER_SUPPLY_PROP_STATUS:
5bff79dad20a51 Andreas Kemnade 2025-09-18  457  		val->intval = status;
5bff79dad20a51 Andreas Kemnade 2025-09-18  458  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  459  	case POWER_SUPPLY_PROP_HEALTH:
5bff79dad20a51 Andreas Kemnade 2025-09-18  460  		val->intval = health;
5bff79dad20a51 Andreas Kemnade 2025-09-18  461  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  462  	case POWER_SUPPLY_PROP_PRESENT:
5bff79dad20a51 Andreas Kemnade 2025-09-18  463  		ret = get_bat_online(pwr, &tmp);
5bff79dad20a51 Andreas Kemnade 2025-09-18  464  		if (!ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  465  			val->intval = tmp;
5bff79dad20a51 Andreas Kemnade 2025-09-18  466  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  467  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
5bff79dad20a51 Andreas Kemnade 2025-09-18  468  		ret = bd71828_get_vbat(pwr, &tmp);
5bff79dad20a51 Andreas Kemnade 2025-09-18 @469  		val->intval = tmp;

Smatch complains that we don't check until ret after we assign the
uninitialized variable.

5bff79dad20a51 Andreas Kemnade 2025-09-18  470  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  471  	case POWER_SUPPLY_PROP_TECHNOLOGY:
5bff79dad20a51 Andreas Kemnade 2025-09-18  472  		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
5bff79dad20a51 Andreas Kemnade 2025-09-18  473  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  474  	case POWER_SUPPLY_PROP_CURRENT_AVG:
5bff79dad20a51 Andreas Kemnade 2025-09-18  475  		val->intval = curr_avg;
5bff79dad20a51 Andreas Kemnade 2025-09-18  476  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  477  	case POWER_SUPPLY_PROP_CURRENT_NOW:
5bff79dad20a51 Andreas Kemnade 2025-09-18  478  		val->intval = curr;
5bff79dad20a51 Andreas Kemnade 2025-09-18  479  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  480  	case POWER_SUPPLY_PROP_CURRENT_MAX:
5bff79dad20a51 Andreas Kemnade 2025-09-18  481  		val->intval = MAX_CURRENT_DEFAULT;
5bff79dad20a51 Andreas Kemnade 2025-09-18  482  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  483  	case POWER_SUPPLY_PROP_TEMP:
5bff79dad20a51 Andreas Kemnade 2025-09-18  484  		ret = pwr->get_temp(pwr, &val->intval);
5bff79dad20a51 Andreas Kemnade 2025-09-18  485  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  486  	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
5bff79dad20a51 Andreas Kemnade 2025-09-18  487  		ret = regmap_read(pwr->regmap, pwr->regs->chg_en, &chg_en);
5bff79dad20a51 Andreas Kemnade 2025-09-18  488  		if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  489  			return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  490  
5bff79dad20a51 Andreas Kemnade 2025-09-18  491  		val->intval = (chg_en & BD7182x_MASK_CHG_EN) ?
5bff79dad20a51 Andreas Kemnade 2025-09-18  492  			POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO :
5bff79dad20a51 Andreas Kemnade 2025-09-18  493  			POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
5bff79dad20a51 Andreas Kemnade 2025-09-18  494  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  495  	default:
5bff79dad20a51 Andreas Kemnade 2025-09-18  496  		ret = -EINVAL;
5bff79dad20a51 Andreas Kemnade 2025-09-18  497  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  498  	}
5bff79dad20a51 Andreas Kemnade 2025-09-18  499  
5bff79dad20a51 Andreas Kemnade 2025-09-18  500  	return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  501  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

