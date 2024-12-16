Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25551C54AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734328446; cv=none; b=Hr/teyqcD3qCjJRsJOTk1+bO55w7kK2DpCEtgt2SwgbpLkBilWF7zXHgHvOP2ejfvtI89omWf7PjdGM39RvOyUYcRIFZQYStU76dAEoTeGkazqA/uLyRMeSHareGq7V2qSISusiAbj4PmM/kYZEHrCCnUouWEFouH4nqFwMO4cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734328446; c=relaxed/simple;
	bh=ZNP0v3/4BomZoAEvLGEv2cgm7ao+GyUKQDkAYpR1azM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=O+tUJEwn/EuuzY/da4rUfucPkQdYhvSKMolcY2goKte0m0N8/+H0LlzCc6qUpEbZ3c1MqVDBRQDkotOfd01jkHeeaY1PZAB7jfRy5B9S13neVGn7YeeaL4apJevlYGbM8H907n4D9yY1N0zXkJf3UwDmcjJuVgJKpcpYhWXMUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4upMwkM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4upMwkM"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa69107179cso700844266b.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 21:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734328443; x=1734933243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+dFO3Ui/sEdU+d4tBQlNTeaAHc3ObDp+PAoFFR+kSQ=;
        b=d4upMwkMbDpQUt6JC7f4+tyvAjsjZZ8q3MMHsscA80AmIxycGpHK2yTiUcD++zhvTF
         fpTk4SZ4JeR0fkIRLTxA6gNz6+FpRKDtx2QB4MycHyTPXsyYN3BrrEX57j9hpmdUFiNw
         SsuSJ7Vd0+SsVO0nACk7iWpyH8a6DB+XYicOesceUvFFriUOPSyoujRvEvFEjUjatn3m
         rXN2YA3BrFc58z2K608mzAFAFfn/IKw9cIx3d6Q3eGVcq8U/2aGzSBqinz5YNQ4rbyHm
         Lml9b7BqzOcHY3rn26gBWqhEAlmWl9rFFTitVCwEBxtU/nkC8k88A6XDPlEt6gnaJMW/
         relQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734328443; x=1734933243;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+dFO3Ui/sEdU+d4tBQlNTeaAHc3ObDp+PAoFFR+kSQ=;
        b=t4NUJ43vOQCTd8FUoBvS623tJ3sn0dBMk2j0JZA1FY3vfebgTtXKjnrFxV+8Ze7Zpm
         HSE0+9k3rcsbRYD4YhXsk7uwk7UIbe/YS+3GIzOuoIZWTU4Pi0S01EVajD8j9zPeRh19
         M7AMd/NAXqeS2F3loEGEkriIZEt/iJfjqOfysG+ovzze3PtRE7KKY4M27FcqQxXx5mHU
         FZH0hMBuDyqOMRgxMvX5Hex3CsWMMC0kEXHCYaZIXQGMWLCXE+cvGCMF8XLwHAOziHP3
         zofd2Hslrj5OJjyHG9XnLGGXNdxH8Aryae2eqMiiqHzRraCgruvfIFUTajJJkfxq8s4Z
         mZXw==
X-Forwarded-Encrypted: i=1; AJvYcCUsmLCTdx6VvOb9hWDjTaxuTvsF0Zallz60tpFVeDerTl+0gGI7m2BKyGrr2mqRyrU0kDD5lSPAZlLygR5l@lists.linux.dev
X-Gm-Message-State: AOJu0YzyLzRFiUS2WSwxv/JLeSHwv+5/X51sExqdbAIenFqkXtQVyzQu
	UFJ8EQPjXRNUsQ321+WxhEc2AzD4O8PBGvvrFLfLElkMkN6LzYQEENcFhGpPjCI=
X-Gm-Gg: ASbGnctU1SfYzVvglVb06VhZ5Oe/wDdR8ImjHyX7QqRXngQjW5Ngekcfcgs9OMxxHcP
	BKgegvIhbA1hYYQxGwO1xpD4x0M2h1ik2rgxOzVJHgYQH35u0HbODbAFRAf6IwG53yKUZJmEzL4
	uUdlTo2WiU0azlxulL2SxwML4+GVXzmKJt9KDzl+yUnZgEL0Tj1L5xZWE77xAnqcuLjLBBMblxN
	6ZNUc8a0oDVjF6PVR5Qzv+qXVQKCfRfjcmh4vHRzga/JgzEuCdtmbmgfovWIA==
X-Google-Smtp-Source: AGHT+IFoSvWSFfIldErFNpAMajYw9cB5vCOVjo6HVzQrtAlbPuyC5xoikuxSZeInpDkydeS20+n9Qg==
X-Received: by 2002:a17:907:7216:b0:aab:76bd:5f8e with SMTP id a640c23a62f3a-aab77ed35d6mr1120600366b.53.1734328443208;
        Sun, 15 Dec 2024 21:54:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96006c2fsm286466466b.9.2024.12.15.21.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 21:54:02 -0800 (PST)
Date: Mon, 16 Dec 2024 08:53:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vitalii Mordan <mordan@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vitalii Mordan <mordan@ispras.ru>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: phy-tahvo: fix call balance for tu->ick handling
 routines
Message-ID: <f60184a1-fe12-4a7f-bbbb-e6191f673df4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209152604.1918882-1-mordan@ispras.ru>

Hi Vitalii,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitalii-Mordan/usb-phy-tahvo-fix-call-balance-for-tu-ick-handling-routines/20241209-232934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241209152604.1918882-1-mordan%40ispras.ru
patch subject: [PATCH] usb: phy-tahvo: fix call balance for tu->ick handling routines
config: alpha-randconfig-r072-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150530.f03D8q1a-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412150530.f03D8q1a-lkp@intel.com/

smatch warnings:
drivers/usb/phy/phy-tahvo.c:347 tahvo_usb_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +347 drivers/usb/phy/phy-tahvo.c

9ba96ae5074c9f Aaro Koskinen   2013-12-06  341  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  342  	mutex_init(&tu->serialize);
9ba96ae5074c9f Aaro Koskinen   2013-12-06  343  
125b175df62ecc Vitalii Mordan  2024-12-09  344  	tu->ick = devm_clk_get_enabled(&pdev->dev, "usb_l4_ick");
125b175df62ecc Vitalii Mordan  2024-12-09  345  	if (!IS_ERR(tu->ick)) {
                                                            ^
This typo breaks the driver.

125b175df62ecc Vitalii Mordan  2024-12-09  346  		dev_err(&pdev->dev, "failed to get and enable clock\n");
125b175df62ecc Vitalii Mordan  2024-12-09 @347  		return PTR_ERR(tu->ick);
125b175df62ecc Vitalii Mordan  2024-12-09  348  	}
9ba96ae5074c9f Aaro Koskinen   2013-12-06  349  
9ba96ae5074c9f Aaro Koskinen   2013-12-06  350  	/*
9ba96ae5074c9f Aaro Koskinen   2013-12-06  351  	 * Set initial state, so that we generate kevents only on state changes.
9ba96ae5074c9f Aaro Koskinen   2013-12-06  352  	 */
9ba96ae5074c9f Aaro Koskinen   2013-12-06  353  	tu->vbus_state = retu_read(rdev, TAHVO_REG_IDSR) & TAHVO_STAT_VBUS;
9ba96ae5074c9f Aaro Koskinen   2013-12-06  354  
860d2686fda7e4 Chanwoo Choi    2015-07-01  355  	tu->extcon = devm_extcon_dev_allocate(&pdev->dev, tahvo_cable);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

