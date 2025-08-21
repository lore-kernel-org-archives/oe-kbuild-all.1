Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B222E8B83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760678; cv=none; b=rIAbQ3Kb27Kss98wunwICS6mcv7U8WHebf1qIb0PVMQltzLWZJhTqMtZfJcZdsvy2xwJgJJpzREdC5wF5ASSkeVDr2KcDP1YiS+1FT7TE5xnn19oQkYgmCQn3YCYVW6f/aLGaCA5k6PG/P34cyxJsyQgayvrhcH9JciPnHJCuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760678; c=relaxed/simple;
	bh=JvEAmy7Jlkc5V+Vnd1agyO6c2e8/ldDsDOAnzIwmDSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=X4fIx8v5Jgd7js7E7aHorAva7EqV9iA+4tvIDM5CHWDg9bxzyg70oWMDhBTEqr03HvdqNdpPynNCfIImK0Mo+oB+BIHy6Hw6PUpgBtaptER8AEJnMjHfX05ZOiSlFP5RAeZfrjtrAkyKJnhBDhLO4/6AfLoKECF74h/zGpUY4iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lud6hz/g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lud6hz/g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c4e9efb88aso102770f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755760674; x=1756365474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3tAtOi04xs7pQD42uV+iRrcb/K5gV7/3jestZ8bCUo=;
        b=Lud6hz/g782nx7xcdpld64iXpomaEN05vz4LuzB45RTti9ZtSGjztEvYHtttyMsFVC
         aArSDmMXCTOreqA7G356tSsU0SzUuMBgoyZbv03vhuB3WN953egPmc+Q/M3V+ZZRl0Og
         xh2GpeIIl2vsAd01BzKzU1oO0RGmG0GT2zGcx0QM0dj+Ml4MgGdqcx1z0b1m+q26pGHk
         6tmJlXBWKx93GYozFjmteaWhFnZT1PKr31YZP/5iobKtk0wfcFrl8gqajcRjZvojUMe2
         Z9xtZLp+SFEZBF9ggWrxYK8Nyynp9vAk3k1JNFE/HsR2JvjTvAuT5poo+XN6jRetQxB0
         6imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760674; x=1756365474;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3tAtOi04xs7pQD42uV+iRrcb/K5gV7/3jestZ8bCUo=;
        b=lq59vp/nRlz8JAk3GrcFtjE1SlGZSBZZzT29DGj7SwOY0l3JX8DICEIP69vrl3TTRC
         Uad5Y/d5t/knJpRLqamIq2hiyPrex+QPcLcOs2mbxdfdRKGePLhDTqKwxAMDU9rm3nA1
         y+wnJmnWALEym7orHfPmXDD758VydsZ84PazR8oVcEWN07yi0XOtUQnKBWQHrgoqokI2
         WfcibwHad96Un95lc+xtoe564wsa4e/k9k4ubBXbkwOlH1lqFwPsCiHl7leS3SbfYayk
         WFvGyxxefUGXmL8oXOHKj4cb/Au2vFFARfIKhpoAH/gOnvQ9SDORSZEVbpwAkjhSJs3A
         PsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZAsYwnXb4kizzcZfJLa3ACWcWe+991Yf+1kxRqlKttz4NebF1kd/BSUC+VRLAlbt7mnLVD4Mnf3chHkjd@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt25TudypAol/G9nh7CjFagoPyOIJFjUhMITTxwxgHRESx2+iM
	LVNsZojWmIbvh0egVtzUi4Fu21GV8CXMMeaI/OLHdnUD+3PmOq2EJS/aVW1fRBNeYLg=
X-Gm-Gg: ASbGncuRgR+h9YaTmx92R+rwrZEtkBzjVKmKfudYCt4YRefDaVC0MslqzrNsK4IYtLD
	w5cWZEiGO1494nS7IxXMG+gwrwlG1hu9cjN7OBEuIv/+FoKsTkgWVIsRmfeD9U0QB5f6IBpi+Lu
	ZEDz2KEtLU3OFmPhsO0Mk513GZUkUC1fIPBdiTJYj6RA3faJCVpAQkB++ygEy3Vo0y/ymD1VgBl
	EcEDujgNvXG6Jat4Rwy3AFV091Iq1zrlw0hlsEEwMFHCXZYyNLKkaVMrtcB5LsGh8wJtB9SnabW
	/477WfbBhSyFM6jWXjqT5chMs5eTjhaCR9YzEvXauPMLkabQNQA/wpNfQx6ABarkaWGkfRj1MFI
	uKnBectlM9Cxj8//t4iaYHZNqh0A=
X-Google-Smtp-Source: AGHT+IG63iMqN7wTtRiIXVZbSCze5rPWQlrS04IFAuyrUFZ9haZV4BHRyggzdxUPlHVMATR9Za+YDA==
X-Received: by 2002:a05:6000:2411:b0:3b7:8146:4640 with SMTP id ffacd0b85a97d-3c4977414d6mr1081489f8f.56.1755760674518;
        Thu, 21 Aug 2025 00:17:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4db29878sm15276145e9.6.2025.08.21.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:17:53 -0700 (PDT)
Date: Thu, 21 Aug 2025 10:17:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	lgirdwood@gmail.com, sre@kernel.org, heiko@sntech.de,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V6 4/5] regulator: bq257xx: Add bq257xx boost regulator
 driver
Message-ID: <202508210308.Lw2Klipk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812214300.123129-5-macroalpha82@gmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250813-054704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250812214300.123129-5-macroalpha82%40gmail.com
patch subject: [PATCH V6 4/5] regulator: bq257xx: Add bq257xx boost regulator driver
config: xtensa-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250821/202508210308.Lw2Klipk-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508210308.Lw2Klipk-lkp@intel.com/

smatch warnings:
drivers/regulator/bq257xx-regulator.c:132 bq257xx_reg_dt_parse_gpio() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +132 drivers/regulator/bq257xx-regulator.c

d6db7dce7cd965 Chris Morgan 2025-08-12  107  static void bq257xx_reg_dt_parse_gpio(struct platform_device *pdev)
d6db7dce7cd965 Chris Morgan 2025-08-12  108  {
d6db7dce7cd965 Chris Morgan 2025-08-12  109  	struct device_node *child, *subchild;
d6db7dce7cd965 Chris Morgan 2025-08-12  110  	struct bq257xx_reg_data *pdata = platform_get_drvdata(pdev);
d6db7dce7cd965 Chris Morgan 2025-08-12  111  
d6db7dce7cd965 Chris Morgan 2025-08-12  112  	child = of_get_child_by_name(pdev->dev.of_node,
d6db7dce7cd965 Chris Morgan 2025-08-12  113  				     pdata->desc.regulators_node);
d6db7dce7cd965 Chris Morgan 2025-08-12  114  	if (!child)
d6db7dce7cd965 Chris Morgan 2025-08-12  115  		return;
d6db7dce7cd965 Chris Morgan 2025-08-12  116  
d6db7dce7cd965 Chris Morgan 2025-08-12  117  	subchild = of_get_child_by_name(child, pdata->desc.of_match);
d6db7dce7cd965 Chris Morgan 2025-08-12  118  	if (!subchild)
d6db7dce7cd965 Chris Morgan 2025-08-12  119  		return;
d6db7dce7cd965 Chris Morgan 2025-08-12  120  
d6db7dce7cd965 Chris Morgan 2025-08-12  121  	of_node_put(child);
d6db7dce7cd965 Chris Morgan 2025-08-12  122  
d6db7dce7cd965 Chris Morgan 2025-08-12  123  	pdata->otg_en_gpio = devm_fwnode_gpiod_get_index(&pdev->dev,
d6db7dce7cd965 Chris Morgan 2025-08-12  124  							 of_fwnode_handle(subchild),
d6db7dce7cd965 Chris Morgan 2025-08-12  125  							 "enable", 0,
d6db7dce7cd965 Chris Morgan 2025-08-12  126  							 GPIOD_OUT_LOW,
d6db7dce7cd965 Chris Morgan 2025-08-12  127  							 pdata->desc.of_match);
d6db7dce7cd965 Chris Morgan 2025-08-12  128  
d6db7dce7cd965 Chris Morgan 2025-08-12  129  	of_node_put(subchild);
d6db7dce7cd965 Chris Morgan 2025-08-12  130  
d6db7dce7cd965 Chris Morgan 2025-08-12  131  	if (IS_ERR_OR_NULL(pdata->otg_en_gpio)) {

This should just be an IS_ERR() check.  When a function returns a mix of
error pointers and NULL, then the NULL is not an error and shouldn't
result in an error message.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

Here devm_fwnode_gpiod_get_index() can't actually return NULL so it
doesn't matter, I suppose.

d6db7dce7cd965 Chris Morgan 2025-08-12 @132  		dev_err(&pdev->dev, "Error getting enable gpio: %ld\n",
d6db7dce7cd965 Chris Morgan 2025-08-12  133  			PTR_ERR(pdata->otg_en_gpio));
d6db7dce7cd965 Chris Morgan 2025-08-12  134  		return;
d6db7dce7cd965 Chris Morgan 2025-08-12  135  	}
d6db7dce7cd965 Chris Morgan 2025-08-12  136  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

