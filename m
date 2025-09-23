Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE830E0F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 05:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758605468; cv=none; b=Chb/TwdSm39zOx/TtOUs6iflucsHKEgfljKrPVnbuZT+abodmL5gC52hLcMzCqZnMA20gg20ShjjwMgNOqglJ71begu2GAaF2T6eoyZKVm0xYV5rpMVop4EMxOjjd2KzBrDrm+AuNbLs5e2aGSgZ3cTj3RmvMCW13zuARqmrDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758605468; c=relaxed/simple;
	bh=UlEmTEBxCQKvli5sclXOy+aXQ3rK6Vt3k+Kr6iD12k0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uGNQ0kT7Hw11CU1tBYP1m7oOYn2d8XYqz0mI6+Gmhy70REpb2ILtcniJJqnttM+YwcL2HnNmsMMFXHpDqEMm0yWx7kuiRurBPvoBfPQmwGUoVIToYoGfnYSkNslvt3PwfMeo2PlPQ51N4BkXq/OqUqcGXacxLdifXNnyJX8KSfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BH0ve1Fi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BH0ve1Fi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso5197936f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 22:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758605465; x=1759210265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWNVfdZNe2vnmg1ugAUULGSoetsURECd1is6oN3vOGo=;
        b=BH0ve1FitedCWhr4Ms37As/xuQJxeYu1HkCTMZllcTGnsXHUEJfmLHHcj406ezLiGP
         xalt64wKI7ooktM+76h0Pz7S0Bu+4uX7wKkmdjYMCjtAkJUdjtAtejY+beiZ27RdrLwT
         meWjUBbpJxKd+dxjCHjAzCgWa0oSh1CeWJMs9cH22OAGv1Y1LjCVkjei6HOKvnnEP6DW
         uo9F4Xvd7V428r/xboPSOnRyuBq/h7v54og+OGJUdnV3BG2MP/TC7JSo3wOuiZiMP0pY
         /aIpccvMbN3kk9LGLwr2tcG8Ki13lPOdY8VXp+erUaeYNgnBY7GSxylhSIBRwhoGAaL2
         dgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758605465; x=1759210265;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWNVfdZNe2vnmg1ugAUULGSoetsURECd1is6oN3vOGo=;
        b=GX2Qpxd6Q68TR5MjBoao7rvhh229TQiD0XGvXJXZUQJir2adVxB7IOFeMa4qyuptWo
         siKZ4WaT7UDvsPzU9hN5KImy2doLrBP73vpRlzMFdBXaCvfq+B2rw+0DnXOEw98VqxlF
         2S/KQITZGIryZJRO79kyrQ8mUDbMDrzh2JJtWZUZmXcugwS9+5cJn53olrFh59TC9ggQ
         wONV+JnbnCKyCdeSfJWOm4kBnllEQqKx8obKtFroQ/6ZLlT/4uAC9+TMN2PF4Mcb+pNu
         m/wWd2m/z5tqYL/5Hw6HB7MYNtdWFeSc++C8hD+ENdWG/SuH0rEAPtD7hH0enxWYV2LG
         oDBw==
X-Forwarded-Encrypted: i=1; AJvYcCUQPSbH+RP/B1ERwGs2cvuwGC3lw+rxGjBAqZmRzz3r31WxYNhLPjLkzDThZZDcPEPLQ88hEQZ299dPssFq@lists.linux.dev
X-Gm-Message-State: AOJu0YwfHoBf+KQiz9qX44OgCLPjxC9hY+PaM/X111Ji/eHo1Y2R3rEN
	B0w1CHxx8lR7X1qQRGC0dxXtz54b9zWMK5bjP1ZCZJaV1Bc5Y+kmIwU6UpMVL41dxkk=
X-Gm-Gg: ASbGncsPT//Vn3aysk26UPxMfK38IuRBnl1JVGeQbGSQu/d++hEwcgPPnZ23bzEnjpu
	oOJrI77EHuOyTT2Sn4GBBO1tdtm4PeMcQBv6TomnS5swS9k4EAR+qlsrIzia49JLv81PV6T8HTc
	pGr162w2uxEMfNcZwFcxQp+5OwetLGPkJ7dyPhnaNszNjtma41wP9HH6XbMdPTbCjENcQtUHo3d
	+CMKxLsJahb6QobqbACN8v7NY7f05da4u1eqlMRGZvLg9MDIkPtj7G2O95gk/qlZcNUAl3MQ7J8
	WD3ByoVqrCkNtNiI2cl/pnOwKIxufxYZup7HzqSLkr5pmIieUoUKjCs5KQM3vzp2wiAZC9m+wEU
	nuRehmKXgauP8tWEMxNWkGXn8w/Xm
X-Google-Smtp-Source: AGHT+IH9N4ZKtf2QZGrRBXmYOhVuZlTRd+48ApBr4A1D93zo1NkZQS0UX41zNNwFEY5f/LBcpzC0tw==
X-Received: by 2002:a05:6000:2282:b0:3ec:6259:5095 with SMTP id ffacd0b85a97d-405c49a2556mr826539f8f.12.1758605464888;
        Mon, 22 Sep 2025 22:31:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbfedd6sm22741022f8f.60.2025.09.22.22.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 22:31:04 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:31:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marius Cristea <marius.cristea@microchip.com>
Subject: Re: [PATCH 2/2] iio: temperature: add support for EMC1812
Message-ID: <202509231015.K3B5TN1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-iio-emc1812-v1-2-0b1f74cea7ab@microchip.com>

Hi Marius,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marius-Cristea/dt-bindings-iio-temperature-add-support-for-EMC1812/20250917-202833
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250917-iio-emc1812-v1-2-0b1f74cea7ab%40microchip.com
patch subject: [PATCH 2/2] iio: temperature: add support for EMC1812
config: powerpc64-randconfig-r071-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231015.K3B5TN1Q-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509231015.K3B5TN1Q-lkp@intel.com/

smatch warnings:
drivers/iio/temperature/emc1812.c:645 emc1812_parse_fw_config() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +645 drivers/iio/temperature/emc1812.c

56c661fffa897b2 Marius Cristea 2025-09-17  611  static int emc1812_parse_fw_config(struct emc1812_priv *priv, struct device *dev,
56c661fffa897b2 Marius Cristea 2025-09-17  612  				   int device_nr_channels)
56c661fffa897b2 Marius Cristea 2025-09-17  613  {
56c661fffa897b2 Marius Cristea 2025-09-17  614  	unsigned int reg_nr, iio_idx, tmp;
56c661fffa897b2 Marius Cristea 2025-09-17  615  	int ret;
56c661fffa897b2 Marius Cristea 2025-09-17  616  
56c661fffa897b2 Marius Cristea 2025-09-17  617  	priv->apdd_en = device_property_read_bool(dev, "microchip,enable-anti-parallel");
56c661fffa897b2 Marius Cristea 2025-09-17  618  	priv->recd12_en = device_property_read_bool(dev, "microchip,parasitic-res-on-channel1-2");
56c661fffa897b2 Marius Cristea 2025-09-17  619  	priv->recd34_en = device_property_read_bool(dev, "microchip,parasitic-res-on-channel3-4");
56c661fffa897b2 Marius Cristea 2025-09-17  620  
56c661fffa897b2 Marius Cristea 2025-09-17  621  	memset32(priv->beta_values, 16, ARRAY_SIZE(priv->beta_values));
56c661fffa897b2 Marius Cristea 2025-09-17  622  	device_property_read_u32(dev, "microchip,beta1", &priv->beta_values[0]);
56c661fffa897b2 Marius Cristea 2025-09-17  623  	device_property_read_u32(dev, "microchip,beta2", &priv->beta_values[1]);
56c661fffa897b2 Marius Cristea 2025-09-17  624  	if (priv->beta_values[0] > 16 || priv->beta_values[1] > 16)
56c661fffa897b2 Marius Cristea 2025-09-17  625  		return dev_err_probe(dev, -EINVAL, "Invalid beta value\n");
56c661fffa897b2 Marius Cristea 2025-09-17  626  
56c661fffa897b2 Marius Cristea 2025-09-17  627  	priv->num_channels = device_get_child_node_count(dev) + 1;
56c661fffa897b2 Marius Cristea 2025-09-17  628  
56c661fffa897b2 Marius Cristea 2025-09-17  629  	if (priv->num_channels > priv->chip->phys_channels)
56c661fffa897b2 Marius Cristea 2025-09-17  630  		return dev_err_probe(dev, -E2BIG, "More channels than the chip supports\n");
56c661fffa897b2 Marius Cristea 2025-09-17  631  
56c661fffa897b2 Marius Cristea 2025-09-17  632  	priv->iio_chan[0] = EMC1812_CHAN(0, 0, EMC1812_CH_ADDR(0));
56c661fffa897b2 Marius Cristea 2025-09-17  633  
56c661fffa897b2 Marius Cristea 2025-09-17  634  	priv->labels[0] = "internal_diode";
56c661fffa897b2 Marius Cristea 2025-09-17  635  	iio_idx = 1;
56c661fffa897b2 Marius Cristea 2025-09-17  636  	device_for_each_child_node_scoped(dev, child) {
56c661fffa897b2 Marius Cristea 2025-09-17  637  		ret = fwnode_property_read_u32(child, "reg", &reg_nr);
56c661fffa897b2 Marius Cristea 2025-09-17  638  		if (ret || reg_nr >= priv->chip->phys_channels)
56c661fffa897b2 Marius Cristea 2025-09-17  639  			return dev_err_probe(dev, -EINVAL,
56c661fffa897b2 Marius Cristea 2025-09-17  640  				     "The index of the channels does not match the chip\n");
56c661fffa897b2 Marius Cristea 2025-09-17  641  
56c661fffa897b2 Marius Cristea 2025-09-17  642  		ret = fwnode_property_read_u32(child, "microchip,ideality-factor", &tmp);
56c661fffa897b2 Marius Cristea 2025-09-17  643  		if (ret == 0) {
56c661fffa897b2 Marius Cristea 2025-09-17  644  			if (tmp < 8  || tmp > 63)
56c661fffa897b2 Marius Cristea 2025-09-17 @645  				return dev_err_probe(dev, ret, "Invalid ideality value\n");

Change ret to -EINVAL.

56c661fffa897b2 Marius Cristea 2025-09-17  646  			priv->ideality_value[reg_nr - 1] = tmp;
56c661fffa897b2 Marius Cristea 2025-09-17  647  		} else {
56c661fffa897b2 Marius Cristea 2025-09-17  648  			priv->ideality_value[reg_nr - 1] = 18;
56c661fffa897b2 Marius Cristea 2025-09-17  649  		}
56c661fffa897b2 Marius Cristea 2025-09-17  650  
56c661fffa897b2 Marius Cristea 2025-09-17  651  		fwnode_property_read_string(child, "label", &priv->labels[reg_nr]);
56c661fffa897b2 Marius Cristea 2025-09-17  652  
56c661fffa897b2 Marius Cristea 2025-09-17  653  		priv->iio_chan[iio_idx++] = EMC1812_CHAN(reg_nr, reg_nr, EMC1812_CH_ADDR(reg_nr));
56c661fffa897b2 Marius Cristea 2025-09-17  654  	}
56c661fffa897b2 Marius Cristea 2025-09-17  655  
56c661fffa897b2 Marius Cristea 2025-09-17  656  	return 0;
56c661fffa897b2 Marius Cristea 2025-09-17  657  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

