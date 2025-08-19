Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3945265CC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584095; cv=none; b=DOEqxa2c3SGpuJJ/WG0XjhEk9wCPv29BQYOF7DNZunXVRpt8KjlTJzdQghfmCV4TBr+fRhcIgyNkfkJhE8+T+5Ul6RinTt+P9VaE+4HjdTgV6x0OF1Swuvp9ySyXGIiezfNpE6c23x+V78me4Mn4X1eqHi4+QMGEp+PmwHTZ8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584095; c=relaxed/simple;
	bh=2YJR7pEFPy7xq1orNpVNhiTcdNQif4qFtdmH0fu7uU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SpnavGWBtbFJGbsUWx5FJSz6PHq4D3b1WVtPDNf8e3r4GlPLJDgojrRq3hNKWx/9F69wa/SUtkXKLbVucT5T374E26JOzjlyyNoYE/wNMNG9YeomlE2QiBlu015D+IhGlOnFnXyNY2sSe1O6ELR6LjWrlExannjENDwgBeaPLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IW+W6aet; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IW+W6aet"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so2375126f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755584092; x=1756188892; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfC6tmyznTQhu0WfGzgV8ZZbOGfzSI/Lw/Z1TOmfLRk=;
        b=IW+W6aetxQKFWd3I/w8RWc0IOxp39pGqIzGGW6tIW1b984UhI/8yMUq6EFdgQyYErJ
         P8EAlosTCE71FxJ+GKT3ldNpz0OXHoEObzrY3cTBuw8MO92PoGU5TerkGwhIK3cBldeu
         Jpb9n8wvg9WYOXUJxar53wuervFMjJJroCh8tlk9mTO+QNHv+xdZgPnWB0y5dRhMZQrC
         XZ6NVsdiBeps9TvfpSdUtaBtA7sgMxhnIFZkjdKPhZdR6An63vhAQFD6mEXZFb0TF9Rm
         X2Q/yPf8bbbw11LlbYH4lVv21x+sk12TwbaAQTv79/7jjZx9QXuHlfhXoQu/+6eq81Zz
         959g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755584092; x=1756188892;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfC6tmyznTQhu0WfGzgV8ZZbOGfzSI/Lw/Z1TOmfLRk=;
        b=l0Hd98cfHfPl5J/0Yb8zegr2DbdA9SUealbnNEcE+oqPcyxfDBSVzwwA3LCEWMCXby
         9RZ1+72CQzC+MMAApeZPpJxFlwmeTsx7iwitdeaXLepDNSFT5kEaPkh8jol46W1jLplO
         X7heH+yai2oUM5UYyXT3sa/ATUqA+WeLYT+6c7rv1raVaxDtOTfI0iaW1zFpE9PVVBuG
         L6mc+798wtQWBUbZ2XdL0kEqVvX4CHbTt26dlb8MDQvHmBTRTr7JrYhdlbpblrSEjo/r
         Gcl+0PwYMLVBvOP3n1aaNd9XSKOmf804eKLlosyOGQTEc9tg3pMNdBr+IuAjaE9J8xwa
         QzYw==
X-Forwarded-Encrypted: i=1; AJvYcCUHmJLhgCezEfAMVo8TejpB9XkZEmAHPXusopeL6ttYN8M+OkUISM6yl3uBYFZbISSS1T31vziNQOV9zChF@lists.linux.dev
X-Gm-Message-State: AOJu0YyNNlukHEW1eogdrfwXSr5wl6HtvrfKtO+IzgI3gRxLhkXdWj5H
	A1TDa9YY+ci+34kNKGt5BdwobnNJfXBY4XkkuYzInzDp3VwEMjX/o7upl0VXpmWUGyk=
X-Gm-Gg: ASbGnctZ1AjCKsj/OMkhf1XLwrfXznImmKbMCCILlp/nonaoucYUbqFHLxFjDY6ikmv
	B+Sgl/2/WmfuswdR4KuURbVlUsCQnTU9Z2l9EWK9EhIqhqBdNIlUdxhW1SGgBV5mvU3eD4XvvTS
	N448dIbX4OxOib+5lBRNg3Rir7WYAqHSbBWiffBK/v8uvacXPBpEsPCzDW1/JA7Rdus2bHisea6
	ccLOcNsjqf5C1ldirCt9sgG+Top4rX3rnwe4MLRERhiUbgST5yWtZMaPXx9vr1isuAUt4VfJrjz
	PCi7CVTaLfbyN22I32iFN8daa+ls0TqcubSh6QkBOMlzjV7A4PXHF6cclJ57JAqj9paxBVzMWk8
	2UM/e821EjGXZjV0BNUf5cuxMqb5uaEmBVCTtqw==
X-Google-Smtp-Source: AGHT+IGGFEZgyeEaX2pBRfjbPpLg1ixzuD1sw99+W5A5gTT8EacRooGmmANMREXLdZz4noMb1+AVvg==
X-Received: by 2002:a05:6000:4014:b0:3b9:148b:e66 with SMTP id ffacd0b85a97d-3c0ed2e8f63mr910658f8f.54.1755584091917;
        Mon, 18 Aug 2025 23:14:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0754f3b7esm2146290f8f.30.2025.08.18.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:14:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:14:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 2/2] power: supply: Add bd718(15/28/78) charger driver
Message-ID: <202508191303.UzPStkjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816-bd71828-charger-v1-2-71b11bde5c73@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/mfd-bd71828-bd71815-prepare-for-power-supply-support/20250817-032146
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250816-bd71828-charger-v1-2-71b11bde5c73%40kemnade.info
patch subject: [PATCH 2/2] power: supply: Add bd718(15/28/78) charger driver
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508191303.UzPStkjj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508191303.UzPStkjj-lkp@intel.com/

smatch warnings:
drivers/power/supply/bd71828-power.c:298 bd71828_get_temp() error: uninitialized symbol 't'.
drivers/power/supply/bd71828-power.c:559 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.

vim +/t +298 drivers/power/supply/bd71828-power.c

c57d31029550a0 Andreas Kemnade 2025-08-16  286  static int bd71828_get_temp(struct bd71828_power *pwr, int *temp)
c57d31029550a0 Andreas Kemnade 2025-08-16  287  {
c57d31029550a0 Andreas Kemnade 2025-08-16  288  	uint16_t t;
c57d31029550a0 Andreas Kemnade 2025-08-16  289  	int ret;
c57d31029550a0 Andreas Kemnade 2025-08-16  290  	int tmp = 200 * 10000;
c57d31029550a0 Andreas Kemnade 2025-08-16  291  
c57d31029550a0 Andreas Kemnade 2025-08-16  292  	ret = bd7182x_read16_himask(pwr, pwr->regs->btemp_vth,
c57d31029550a0 Andreas Kemnade 2025-08-16  293  				    BD71828_MASK_VM_BTMP_U, &t);
c57d31029550a0 Andreas Kemnade 2025-08-16  294  	if (ret || t > 3200)
c57d31029550a0 Andreas Kemnade 2025-08-16  295  		dev_err(pwr->dev,
c57d31029550a0 Andreas Kemnade 2025-08-16  296  			"Failed to read system min average voltage\n");

We should return the error here.

c57d31029550a0 Andreas Kemnade 2025-08-16  297  
c57d31029550a0 Andreas Kemnade 2025-08-16 @298  	tmp -= 625ULL * (unsigned int)t;

If bd7182x_read16_himask() fails then t is uninitialized or invalid.

c57d31029550a0 Andreas Kemnade 2025-08-16  299  	*temp = tmp / 1000;
c57d31029550a0 Andreas Kemnade 2025-08-16  300  
c57d31029550a0 Andreas Kemnade 2025-08-16  301  	return ret;
c57d31029550a0 Andreas Kemnade 2025-08-16  302  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

