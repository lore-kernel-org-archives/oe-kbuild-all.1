Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74B159562
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993387; cv=none; b=OtXSxqYXbDvhf+ucUrL19qkdR6Bk0ffNTQMXMg2aX3k/xB7bmlNGLTtYyJxBbzK9mvu5h869MzR+C3uS5wCa0NsuZj5Ex6DbVOBSpZ7yhOf+/2cw/rzSRvMUFzFgTK2xH5sfTLv9m20ACgGQPn1my0jOuELeUiAfOBCdwm//+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993387; c=relaxed/simple;
	bh=OGbtwjULhl3w+vcGIL81b+obaLwHCiTbz2FtbPMorDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=J6bLE4o6B/TIhKK0+uDPE/4+rPH8n7Cl44mRlkdbSj6j4IWBL698/kUG4hvUD/hosxGss6lpNz6DyoXd8htwo1h3yw6zu1LpaD8jz8jS47K2js6WckM0rc4WrnIbIcOXXuOciJjNEU1J3bGzvh0BCsZIJ+E/VRnW/EBflaoHg90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xC5ZHyu6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xC5ZHyu6"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-529661f2552so2681471e87.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 07:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993384; x=1717598184; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=onLXeJRqtHiywJfTtQupZmxSe9czseg1ydGlgZn2T04=;
        b=xC5ZHyu6W/jSECXqLNZL/6e6biM03+Ituq4l80AvIKIJFUyJSv0kHqafNnONA5wytb
         mz4kgT0Y44JoBIKxBmWNR7s2NV1kX8GD/pGWQ5KldocSuRvXFgz8OUrinWa6AMkP/odq
         7ta4sOVS0jWwf0GgU4/11gbmIxqh7nt5avzKqFi5znbgbgQNMNKkEJdOLsrPngweaIMp
         xBrGKaWNVyq/fmplp9JwJdbjWu/BLOlhabiMbd6J+jq1bWTCCdxeyyiWXrCUx8KIjLQS
         hlFJ5QrouI0VBEx1ReArEQjSu6rDPcdd4aFSbq8EFVM+lFQGjZvKQnVbWETyDRiVo7gf
         s0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993384; x=1717598184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onLXeJRqtHiywJfTtQupZmxSe9czseg1ydGlgZn2T04=;
        b=S3R56KIVwaRygmPvF9CvavAzQwsEyAmwyLsU2FaD+qFZe2WtWXBjdrxz+mFSEM3l+S
         uqvhO2LKJMupiLO6InzKHteCg5u0CS7t2sXsYFpKx7PuPQzn4ngNk8V5H+G1egQKHZcC
         RPUQxwtXiSDL5wxgcG9/2dT1C5WFIjkQLZjmOPKL0sojAnAyC1WVujdPAaFPw7s8e4UY
         0cE93rv9oFAslTuRAo6TbATHa7WGyAmj/mId+kr0N1NBVaInbwc3febd1MvwzBDlmZWI
         O6QizF0u+FnC4fTbjP4zWwW+bMt1yWV3AH/gizFVAIubWqfWnyh/WqZ1e9ryOaWUtOZ2
         wAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsqmJG+8imFOCYi7grwbFYV/0fiWMKAu68aWyhaxDmu8dyJnXleIbApK9asNIi0ByhsNAg2YpiZ8iatraCK9vL61HU2dZy3S5WS0Lf9w==
X-Gm-Message-State: AOJu0YwteMOpcok9BTBAQqlbBkJ8rED6wuhulTp90hRlaEl+Mn6Eb4ih
	k97XT0LoyDcsqdGWpBq6wu8g8Z/kO7O/ocq+9PLNgplY82mOFn68YkqM6h1XOBE=
X-Google-Smtp-Source: AGHT+IGc7EKt54sm1khoej2woFrmOQu3LLvXiuSZdD1P1QxwpCeqzx3WQs7Wuujc3vbdzMFGi4KfwA==
X-Received: by 2002:a05:6512:3a93:b0:529:b3c9:7261 with SMTP id 2adb3069b0e04-529b3c97397mr6223224e87.5.1716993383771;
        Wed, 29 May 2024 07:36:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc51489sm721025766b.128.2024.05.29.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:36:23 -0700 (PDT)
Date: Wed, 29 May 2024 17:36:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Francesco Dolcini <francesco@dolcini.it>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v1 2/2] iio: adc: ti-ads1119: Add driver
Message-ID: <a3521734-487b-4c17-b910-2b169b26bc64@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527154050.24975-3-francesco@dolcini.it>

Hi Francesco,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/dt-bindings-iio-adc-add-ti-ads1119/20240527-234431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240527154050.24975-3-francesco%40dolcini.it
patch subject: [PATCH v1 2/2] iio: adc: ti-ads1119: Add driver
config: openrisc-randconfig-r071-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291150.r5z8TZYu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405291150.r5z8TZYu-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ti-ads1119.c:653 ads1119_get_configs() warn: passing zero to 'PTR_ERR'

vim +629 drivers/iio/adc/ti-ads1119.c

14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  642  static int ads1119_get_configs(struct ads1119_state *st)
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  643  {
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  644  	struct device *dev = &st->client->dev;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  645  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  646  	st->vref = devm_regulator_get_optional(dev, "vref");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  647  	if (IS_ERR(st->vref))
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  648  		return dev_err_probe(dev, PTR_ERR(st->vref),
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  649  				     "Failed to get vref\n");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  650  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  651  	st->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  652  	if (IS_ERR(st->reset_gpio))
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27 @653  		return dev_err_probe(dev, PTR_ERR(st->vref),
                                                                                                  ^^^^^^^^
st->reset_gpio was intended.

14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  654  				     "Failed to get reset gpio\n");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  655  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  656  	return ads1119_alloc_and_config_channels(st);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  657  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

