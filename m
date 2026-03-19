Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC63E8C48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935609; cv=none; b=j3df5Rg7ItbgYSpS2f7U9wn86O8DE8xLae0rcuumzQQVwwLtWd8s6/hMHeL2BjL3uGSQIWAcBkfEUIuIJXoApzH6K0WFZSI1fsnzWyknnT10RZ1e12swCPSpjSyA2tViDGhbmEnCOgtRjEZdjruRU5KcQwtPILKYnFE62pCpZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935609; c=relaxed/simple;
	bh=5bYAbTkUVnEEFoCcR512hDmK7U1WNVjiltP2U7iH2cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l4kh3IhrY6T+MNfhHsoT8WaOUDo0sTJHKhphzQ5x4i+CibdssvCwzxXVtPc79XUWKa6mV6zg1FnlEPvFxyetoUwfhS1tNoeoLrCsr9mkmc4VdPLMEQZT76/7lYw1bELGhOt8kGXhc4xOv/2S5KOEZL4ac79y6v0DWUaca2Q3gik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+RuPBxA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+RuPBxA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb14227cso9500065e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935606; x=1774540406; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIWRiNAZ2M6LL+C7o8xZgnQ+3xY+inOKefwQYaGNdVk=;
        b=S+RuPBxAob3XSKxLlsRWSjaS0pv1gQyu2X/iYGU2lywQot+GX7er5k4atXj0QTJW4t
         FSoKeHQRNCtHy+NkNuyozHerDFdJyaqq/4nU0kgDTNX7XMToLgwLlru1tLzXIYLKQnRD
         f0Mnnl9APVzhDZCUR2UcpdcG16DxOzi/wxxoVKGDBF5WD0grggFO4MgDGmyx773S6hhv
         NrUHW3XUinWLbjgz0zw/07CG9sjfXqwFX9I/nsOuR8laVsSQ6tjk6o7a4vdnyTNdquuj
         F46r2MgDfrdSmo7vIkm2cClXw01IamKpdS9x9vEsSs4zADMIHSldEMrwf9bzbZIxw4Wa
         BgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935606; x=1774540406;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIWRiNAZ2M6LL+C7o8xZgnQ+3xY+inOKefwQYaGNdVk=;
        b=RofKSDF1hAH9PqGlzyy7tpaGkT0orP2fWzPMr159C6D7s3mcY8sXeKBs2P4fNNKapx
         gv4aTrruv/H5NQTszN8B4MgXEnNPYLa3Z+5NGPAuqWcHdeIkG5lv0/vvfa81CzCDogdz
         VKt4RTo2CLRlbDtG0zS81b/9iRCE2iKmVKjDgdycBGVmxfZ7rRIO3/dCGm6bPNGJjg86
         SUXnndwd0e60SFxqfZqlrc7szbxzJBbNuRZKTfjLOfk0+twvDO2ckItdwzyd/tj0MUfS
         jZY1Vvyme2xXscR8EJncpmTiFdTvs1QDtZBN11kzG0QvsN1sdbz5NhHm2+Hf5fdz4cO7
         Uu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWelWK1qg9iEWntN9OM7qHcnOe/IrUIbh7en/wnoGIOZmuiVe9XhiAJ8ILf5FUloRejP0llqy10FCYREYpP@lists.linux.dev
X-Gm-Message-State: AOJu0YwWU61AS9yYztl+dZLtI9oLweNDVDaqMAH4ErSkSfd8lFce9rAR
	iRtNB1r7ybCwEAmPLERAWATK2evwUdCiLMA5PA8QPW1++xJj/EdBw7XhrFyu+9FLjQk=
X-Gm-Gg: ATEYQzyYw+WMjVJEM0/rMgwDiXFDUp65egpolwttxYAnRVgkPBHNjj2SEDyPKJQSTfx
	Htoylwv48w6T8cJ2eMRVDUqo1ra9U9pNw1mU4uHYWM79Yf7pRCHPh7AhxEa6u9F1d4rekjFti7o
	EULsxm8m7INpNM0rPY7atCGAt0vAsifvT48sv9UozYljH53cPDfAP5hEsMb30vzLx7BE+B1g5PS
	/PGkhgRGutBJ5wdVBzOfeiZDKpBKAZM1wrgz2i2nrP2RDC7UKpDz0LaPiNdwTjl5jb+aQIAQ8M8
	EQksQFvq9pRdjR4u8l6YfNogWhIf/Sa0bMOtVZwvUXF0IgefFNGy1XiziJeeo70CcHGRz67pdXQ
	fwI4jMOvj297QsANXdOECsxVqWtl5Mlq5Up/ioDZaKB6Vdma55UgcKBrr3+wkg/FOCL6X9k9JHf
	PtJcGV3Rilm+wq1VLv1tNH5taEd8tm
X-Received: by 2002:a05:600c:3b28:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486f441bc51mr130418635e9.7.1773935605472;
        Thu, 19 Mar 2026 08:53:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm128484205e9.9.2026.03.19.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:53:24 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:53:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Jan Carlo Roleda <jancarlo.roleda@analog.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: Re: [PATCH 2/3] leds: ltc3208: add driver
Message-ID: <202603192312.QLMHYKWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-upstream-ltc3208-v1-2-015f1f1e9065@analog.com>

Hi Jan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Carlo-Roleda/Add-Maintainers-to-LTC3208-LED-Driver/20260319-005902
base:   e68f95a51d1a8c1594b536c4d495cbea38d47561
patch link:    https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-2-015f1f1e9065%40analog.com
patch subject: [PATCH 2/3] leds: ltc3208: add driver
config: s390-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192312.QLMHYKWa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603192312.QLMHYKWa-lkp@intel.com/

New smatch warnings:
drivers/leds/leds-ltc3208.c:222 ltc3208_probe() error: buffer overflow 'ltc3208_dt_aux_channels' 4 <= 4
drivers/leds/leds-ltc3208.c:227 ltc3208_probe() error: buffer overflow 'aux_channels' 4 <= 4

Old smatch warnings:
drivers/leds/leds-ltc3208.c:229 ltc3208_probe() error: buffer overflow 'aux_channels' 4 <= 4

vim +/ltc3208_dt_aux_channels +222 drivers/leds/leds-ltc3208.c

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  176  static int ltc3208_probe(struct i2c_client *client)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  177  {
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  178  	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  179  	struct ltc3208_dev *data;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  180  	struct ltc3208_led *leds;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  181  	struct regmap *map;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  182  	int ret, i;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  183  	u32 val;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  184  	bool dropdis_rgb_aux4;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  185  	bool dis_camhl;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  186  	bool en_rgbs;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  187  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  188  	map = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  189  	if (IS_ERR(map))
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  190  		return dev_err_probe(&client->dev, PTR_ERR(map),
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  191  				     "Failed to initialize regmap\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  192  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  193  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  194  	if (!data)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  195  		return -ENOMEM;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  196  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  197  	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  198  			    sizeof(struct ltc3208_led), GFP_KERNEL);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  199  	if (!leds)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  200  		return -ENOMEM;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  201  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  202  	data->client = client;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  203  	data->map = map;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  204  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  205  	/* initialize options from devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  206  	dis_camhl = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  207  					      "adi,disable-camhl-pin");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  208  	en_rgbs = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  209  					    "adi,cfg-enrgbs-pin");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  210  	dropdis_rgb_aux4 = device_property_read_bool(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  211  						     "adi,disable-rgb-aux4-dropout");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  212  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  213  	ret = ltc3208_update_options(data, en_rgbs, dis_camhl,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  214  				     dropdis_rgb_aux4);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  215  	if (ret)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  216  		return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  217  				     "error writing to options register\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  218  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  219  	/* initialize aux channel configurations from devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  220  	for (i = 0; i <= LTC3208_NUM_AUX_LEDS; i++) {
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
Should this be < LTC3208_NUM_AUX_LEDS instead of <=?

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  221  		ret = device_property_match_property_string(&client->dev,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18 @222  							    ltc3208_dt_aux_channels[i],
                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
Out of bounds.

76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  223  							    ltc3208_aux_opt,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  224  							    LTC3208_NUM_AUX_OPT);
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  225  		/* use default value if absent in devicetree */
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  226  		if (ret == -EINVAL)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18 @227  			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  228  		else if (ret >= 0)
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  229  			aux_channels[i] = ret;
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  230  		else
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  231  			return dev_err_probe(&client->dev, ret,
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  232  					     "Failed getting aux-channel.\n");
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  233  	}
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  234  
76a4ad1dec9ab2b Jan Carlo Roleda 2026-03-18  235  	ret = ltc3208_update_aux_dac(data, aux_channels[0], aux_channels[1],

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

