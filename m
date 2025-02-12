Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462A1E47CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355421; cv=none; b=PzYYVlTLSS6YO7si6hSvrUUGKIp4098OLKl5jZcm9C1WjZetSosqsSEOozL2nfnAaXHX7Pqpt4J+ee5rAFi7oUDcDXmGKJUimSSsN0WMmHq1E5LakY0vxVZwX+lvZjkzBVOUUgaU+zof0CcgqQQ5HGFGKlZ0fyIR6FV0dRNAj/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355421; c=relaxed/simple;
	bh=aDiJ7MzcZuOp59joBAKOXPnxH/9tlAB04GJhUTcCYwI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IczKvCSr3rcG6xQcEGjbpKjqdGjWSNQ/KPirtrbKjL2f/Wa0yFgxC5mPewyR9RbTKr6Quthe4laAC6enjVXn9meyLPtCiyZecNu2EKKzulCL8umxrWfpueOb0fX0u60SlQszL3ngQ/350ZwoyCeXVsVtQf5EQ7kS7JhBFENvbss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Emf/1qZy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Emf/1qZy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439585a067eso6500215e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739355418; x=1739960218; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCOjIl9TK1N5GOFcZIiD312EURItMH5pxsfAsuejYZk=;
        b=Emf/1qZyfAiKQzEKOls0u+sTduqgaVFDBxicmiAiCh8jlmEO6mGk1AqUoEcvpmDe2I
         Nxdq6l43+yH2wkC4KJmPcXivM4ydHpIqaP5gPIFXgw5OxJAsmE32Xxiq8ivtHJ+WTgUW
         O5Spa8vLWIowZiY+HP02qJ4H3WLZJq7sHeRCBzbYVcIz0f+ooX6tjmq06eIq9nsvw06w
         NAaBIto1nK8QcWuTk5vmDGVlDFlUrgt5k/T7QOor4w+Z6vgwir+LajlCfzguALdr+fCb
         oh/K014SR6ek/9LV0Q1EzbF/D0FULPSF1Mq32U9fQm43lwawwS1FbKi5wmeAKRpWav2c
         sbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739355418; x=1739960218;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCOjIl9TK1N5GOFcZIiD312EURItMH5pxsfAsuejYZk=;
        b=Ki0Y8iw2Z9H1VAw5e01Bv2tAEAMIqmQvKBImd638JX5QRSlt+T3EkmQtDqzuOUVYkf
         4NooOaPEJNipsdIf396ty1HFtkbAnBqo9rTAPOavvKil4FPRY//h1MQfjV8o7brE0UeW
         lDpDRyQzVkzdQzSHx6A4if/OXOopYz1d5Cn2fvP662Aul/wa1GnNCndIqM7ojG47/o7f
         U2H+taUPErje/IhlOYeGA7swiZDNTRqIM+9zqMB18iZjgXTIM6ppDOuikBCYYsI1a9P0
         qjntKQjVI1BT33gRT+epjGCt+FqQRzN3hpYHs9HXCJ164V0eTgYX/HCGLbgG46dlZMrB
         Tw2w==
X-Forwarded-Encrypted: i=1; AJvYcCXLoRevrqQfC3riuX/BcC1A0V2YHXv4zFxkCHW8qNkSUL6ZofbaRERHSv7sVOIH27mOyvdSL7ZVnvidXliI@lists.linux.dev
X-Gm-Message-State: AOJu0YyuXu5E0i+hcpooLrtdAiBIaHD0tS3PlkmwH9tGCJcMDiQkKblV
	Si7zxNt0ToKtoROm9Q9LV5IlcO4A2kxw1X/phUhIRqoIaBl/qDXJMTkog3rk5rc=
X-Gm-Gg: ASbGncvARqekWKivFrLLG/ZFDvEIgqArieeLJcEMe5atS8ymruYR1npu/DHDGIeUcp2
	5bjJFV9ISPmdUVuW2j6sGJWgs3CTbB3db2Te4AYM7ROQ8GF8mAELl7DeifIBVE8nkeywKKE2bcT
	3jqApKF26qBoutGmscl/w6RAeQi8Z9/cSqYOvCXIVg8zzfDZa9WHgnzn2/iVKJq5etSKIkwJ97j
	oxDheUkyoabsd55S08UCLRR6lFnHWs0sEq3Rf0XD+y3ow8rfziI059gPtsgyW2FbaiV3jalzgT/
	yxG52dJuRO055w==
X-Google-Smtp-Source: AGHT+IHbLFUK64oZDaRhyUljmKTni82bcsfQUnjFGMVlOka7cHXg7qh7zuixm+Pnf373SApmvVszgQ==
X-Received: by 2002:a05:600c:35ce:b0:436:ed38:5c7f with SMTP id 5b1f17b1804b1-43958176904mr27619615e9.12.1739355417891;
        Wed, 12 Feb 2025 02:16:57 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:65bb:e6ee:3141:374])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a053fb3sm15318055e9.16.2025.02.12.02.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 02:16:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Dave Ertman <david.m.ertman@intel.com>,
  Ira Weiny <ira.weiny@intel.com>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd Bergmann
 <arnd@arndb.de>,  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
In-Reply-To: <7bb0b7ea-8ca4-4ea1-a7ec-d56646240e59@stanley.mountain> (Dan
	Carpenter's message of "Wed, 12 Feb 2025 10:26:50 +0300")
References: <7bb0b7ea-8ca4-4ea1-a7ec-d56646240e59@stanley.mountain>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 12 Feb 2025 11:16:56 +0100
Message-ID: <1jldub1n8n.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 12 Feb 2025 at 10:26, Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hi Jerome,
>
> kernel test robot noticed the following build warnings:
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/driver-core-auxiliary-bus-add-device-creation-helper/20250207-023433
> base:   2014c95afecee3e76ca4a56956a936e23283f05b
> patch link:    https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-6-fa6a0f326527%40baylibre.com
> patch subject: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
> config: xtensa-randconfig-r071-20250208
> (https://download.01.org/0day-ci/archive/20250208/202502081655.FlCrxpYN-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502081655.FlCrxpYN-lkp@intel.com/
>
> smatch warnings:
> drivers/clk/imx/clk-imx8mp-audiomix.c:241
> clk_imx8mp_audiomix_reset_controller_register() warn: passing zero to
> 'PTR_ERR'
>
> vim +/PTR_ERR +241 drivers/clk/imx/clk-imx8mp-audiomix.c
>
> c350f4c434316c Jerome Brunet 2025-02-06 231 static int
> clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  232  {
> c350f4c434316c Jerome Brunet 2025-02-06  233  	struct auxiliary_device *adev;
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  234  
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  235  	if (!of_property_present(dev->of_node, "#reset-cells"))
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  236  		return 0;
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  237  
> c350f4c434316c Jerome Brunet 2025-02-06  238  	adev = devm_auxiliary_device_create(dev, KBUILD_MODNAME,
> c350f4c434316c Jerome Brunet 2025-02-06  239  					    "reset", NULL, 0);
> c350f4c434316c Jerome Brunet 2025-02-06  240  	if (IS_ERR_OR_NULL(adev))
> c350f4c434316c Jerome Brunet 2025-02-06 @241  		return PTR_ERR(adev);
>
> If devm_auxiliary_device_create() could return NULL then that would count
> as success.  But devm_auxiliary_device_create() can't return NULL.  It
> only makes sense to return NULL if the auxiliary device is optional.

Hi Dan,

It should have been IS_ERR() there. It is something I've noticed and
fixed in the other changes before submitting the v2 but, somehow, this
one slipped through. Thanks for catching this. This is obviously still
present in the v3 I've sent yesterday but will be fixed on the next
version. I'm waiting for feedback on the core part before making another
one.

Cheers

>
> https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
>
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  242  
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  243  	return 0;
> 6f0e817175c5b2 Shengjiu Wang 2024-06-14  244  }

-- 
Jerome
