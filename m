Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED22AEF5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267819; cv=none; b=hu6/DjHIqXWerlQ1DYh2tBYI7JKyLJ/Wy9FfiuqEMKjzwBetUb8tmdAMFj5bzn6Bh6RVQ522QndWbOqQAXkLprRKbT+iZWZnV399uRQgyRCzfvWWbWZKq2DAOUHaHY9RoaXStxwDgVl3j+Kg5WlYqBlWeEFUGJBwSBgu8I4s9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267819; c=relaxed/simple;
	bh=7gniuGys6H7+WxWWXaMfm1YwOTO7kOhCA9PYKfonc2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBfHX3+mgi2kPi0vN3Gbzyf4IAR1DIGVSOAAm4c+Uk+B9GVu+5H74M9+CyrgKX2PpxNWOBkPTQNixtJQYgUzt1LPSRBYcRnWwBj/6V/6SrMY25V4bT6j7zfSTmkKJ7DHD8LEhmvHydj0EbroeEvxoOjcgGCrNNR5CBdMRiW6GT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2nw8VB1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2nw8VB1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so63666875e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Dec 2025 00:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765267816; x=1765872616; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spRySZyV+VOtRcH5DjORY7pppljB96Ce+Il4WCp5AM8=;
        b=B2nw8VB1GvchFbELTC956t+AndqznMeeK8sUWVXqwphvoqd03FVDS2DqUdBMEQKD9+
         FicsbuyZIgufHXwH9rFqmpd6HTxiL5lyOYJUoWypB8NUdcqmwJ3OcMv7FfgvMrBIPwAO
         rxaE97x3pw8GdUkQ2uqC0Gdu7umLodA8ZS9MM9k0VfRSXb+QDfqn8VwvwuYNgmgABjL0
         /x9APjf/7aLHhRy18sFG3CXhwQP3C3a+ql5BWKiEaVU4byoLHklmoVkun3iFDOuEPuRE
         zbd4jZZUNFmmdLqpm6ay6kMZdRsUsiKhrg6+p7aTpFW3nWZWRmJxvbKVgOMOwziacwMw
         RMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267816; x=1765872616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spRySZyV+VOtRcH5DjORY7pppljB96Ce+Il4WCp5AM8=;
        b=BTi3IeWEC0+HtaZem0XpvIlO2YIZjStnVF0mPwMXzTQL6g9sZ+0xtqvcAQk+AnQphS
         7fsoGdlfE77uffo6lNB0s4xcOPZW/SBV4EH/dFxSaqu+egADwXHmam3+08C4N5UPQ9QM
         n4SG7hCDfjC1OmLfPuhUdSfzczUDURlC0z+R27vyunTNj3RdlxG1i8LCXufy5MiLknpw
         ZvRbls0PijxIhHuDUIYDi4klT6SspV5dwJ+ySP/eIeDo1SSdiL2Z4/QMV5AjwNNiITH4
         5swQjWgqmpZODfrV0xSFbWkFjX6um9qIbXUx4ScU/+7GMjCFOZDwjlaqvFttQiAgZqg2
         jAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjeFbtcD6dfHjNhKYTFwhwoiU6VtOa+HvyTofLpxtfO7ApdYcCOojZnYV42KmQa539Ehu1KUA6LqsepKUv@lists.linux.dev
X-Gm-Message-State: AOJu0YwDrnCzrevimjPj+TFKniyyQo1yusEoNMVjfs9Qjqc1qflGS5ii
	pGNlzeSr8XGARQKVkfKZuNYv0G2I4tWWZp5XeX8XP875tSj8IBwENN+UDCV6gQC39Yc=
X-Gm-Gg: ASbGncvWLeaB1xGfdcRb0/6JxRI1XIJSGo2PR78/GYoKj8X0cN0/VOvlJokIA/fpWDA
	+hiYlK33sCbjJsMuVH/8oDgOrB+us9C78hGcPylL1lwwuRuTU5eeV5WjuholvVF3P0JpKQGITrL
	6mMsfNW14UtgOLSoE13ahzP5Hvs/+W/UQaXALJx+9aWkpIBZEq/fquDvWj8AEZ3jjq6Hk4y/Te/
	z8e7NzCA36z6EGxlbLW5M7hUyVE2p2sMmUqk1hHaQuzC1Y2F+rDamiktc7k/mBBTg2NS1csOxr0
	JU0cvISmwNQAI0FEQimYr/0DHixR3s7J6KSZUSOlxCuBf9ijjiGJI18EBmGq0I6mp19qMIdBoaA
	EpTdapUG6kv6DEEa8En3dwIOw3fP1CNQ4ngxH/8OnXwxJnvlcHGzmyWUZdJ087rHs5phOuENKIz
	+O8nbqA3FwplkB18XU
X-Google-Smtp-Source: AGHT+IFDA3qG7tfHKOUMmoIHKf4R4Il2Eu0O9T+v7vLC242anRcuYF8kcvLH3Eyq2rSRJwwYxrLuCQ==
X-Received: by 2002:a05:600c:354d:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-47939e49338mr102941665e9.34.1765267815724;
        Tue, 09 Dec 2025 00:10:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da1dff5sm10650055e9.15.2025.12.09.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:10:15 -0800 (PST)
Date: Tue, 9 Dec 2025 11:10:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202512082235.2rH8XoPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2f2b01b74be8b40a2173372bcd770723f87e7b2
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251208/202512082235.2rH8XoPX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512082235.2rH8XoPX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)

vim +/pdev +503 drivers/gpu/drm/msm/adreno/a2xx_gpu.c

491fadb2b818e1 Akhil P Oommen 2025-11-18  493  static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
21af872cd8c695 Jonathan Marek 2018-11-21  494  {
21af872cd8c695 Jonathan Marek 2018-11-21  495  	struct a2xx_gpu *a2xx_gpu = NULL;
21af872cd8c695 Jonathan Marek 2018-11-21  496  	struct adreno_gpu *adreno_gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  497  	struct msm_gpu *gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  498  	struct msm_drm_private *priv = dev->dev_private;
21af872cd8c695 Jonathan Marek 2018-11-21  499  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @500  	struct adreno_platform_config *config = pdev->dev.platform_data;
                                                                                        ^^^^^^^^^
Patch adds a dereference.

21af872cd8c695 Jonathan Marek 2018-11-21  501  	int ret;
21af872cd8c695 Jonathan Marek 2018-11-21  502  
21af872cd8c695 Jonathan Marek 2018-11-21 @503  	if (!pdev) {

but the old code checked for NULL.  Probably this NULL check can be
removed?

21af872cd8c695 Jonathan Marek 2018-11-21  504  		dev_err(dev->dev, "no a2xx device\n");
21af872cd8c695 Jonathan Marek 2018-11-21  505  		ret = -ENXIO;
21af872cd8c695 Jonathan Marek 2018-11-21  506  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  507  	}
21af872cd8c695 Jonathan Marek 2018-11-21  508  
21af872cd8c695 Jonathan Marek 2018-11-21  509  	a2xx_gpu = kzalloc(sizeof(*a2xx_gpu), GFP_KERNEL);
21af872cd8c695 Jonathan Marek 2018-11-21  510  	if (!a2xx_gpu) {
21af872cd8c695 Jonathan Marek 2018-11-21  511  		ret = -ENOMEM;
21af872cd8c695 Jonathan Marek 2018-11-21  512  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  513  	}
21af872cd8c695 Jonathan Marek 2018-11-21  514  
21af872cd8c695 Jonathan Marek 2018-11-21  515  	adreno_gpu = &a2xx_gpu->base;
21af872cd8c695 Jonathan Marek 2018-11-21  516  	gpu = &adreno_gpu->base;
21af872cd8c695 Jonathan Marek 2018-11-21  517  
21af872cd8c695 Jonathan Marek 2018-11-21  518  	gpu->perfcntrs = perfcntrs;
21af872cd8c695 Jonathan Marek 2018-11-21  519  	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
21af872cd8c695 Jonathan Marek 2018-11-21  520  
491fadb2b818e1 Akhil P Oommen 2025-11-18  521  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
db07ce5da8b26b Fabio Estevam  2023-06-20  522  	if (ret)
db07ce5da8b26b Fabio Estevam  2023-06-20  523  		goto fail;
db07ce5da8b26b Fabio Estevam  2023-06-20  524  
21af872cd8c695 Jonathan Marek 2018-11-21  525  	if (adreno_is_a20x(adreno_gpu))
21af872cd8c695 Jonathan Marek 2018-11-21  526  		adreno_gpu->registers = a200_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  527  	else if (adreno_is_a225(adreno_gpu))
21af872cd8c695 Jonathan Marek 2018-11-21  528  		adreno_gpu->registers = a225_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  529  	else
21af872cd8c695 Jonathan Marek 2018-11-21  530  		adreno_gpu->registers = a220_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  531  
21af872cd8c695 Jonathan Marek 2018-11-21  532  	return gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  533  
21af872cd8c695 Jonathan Marek 2018-11-21  534  fail:
21af872cd8c695 Jonathan Marek 2018-11-21  535  	if (a2xx_gpu)
21af872cd8c695 Jonathan Marek 2018-11-21  536  		a2xx_destroy(&a2xx_gpu->base.base);
21af872cd8c695 Jonathan Marek 2018-11-21  537  
21af872cd8c695 Jonathan Marek 2018-11-21  538  	return ERR_PTR(ret);
21af872cd8c695 Jonathan Marek 2018-11-21  539  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

