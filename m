Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E431A156F45
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847015; cv=none; b=JLom435uL/No1JhJbc6SdoILLwdUNXQ4up9rk4XxPO9z51TwkK34xMuO1v+yaB33yd0pGLKClx2C+GUn67qv3uvBv7IW1VllryWBYifnvAV1JBjDVfX3UjqOFNoCfYmx9+IE8whI77EuJJWhZQcMG62GZvJJxeObigIauHvQCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847015; c=relaxed/simple;
	bh=USY+Knj3Gn6M4UyCoMEuT925F5VZ0aIxGsAN793hFfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d4H6sERiTuSt5Y3NhCmWC3/Kx4MIuEuMbrxnaCdE1IbTX6A6+qbwbOmkogYWzCkghKCQP+czIjRIgUllwxMvihDDHI+Cy14+e0zabNS431OI3JN3STS9VAGMCaGXECd1Hn5lK4fGm6CE7W0HBbo/5qA/eCZYeviAyhol1QwN1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyimShzm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyimShzm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a36748920cso4620193f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Jun 2025 23:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748847012; x=1749451812; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SK0IyySBRZW3kx89rtPTvWUvyucit05wnIbR/YG6Fpo=;
        b=zyimShzmOV4KR1v0qwGcXoqH5F1c3mDk2m0a+t/L9bWBy6TQvSj2XLPcmZW9vFnshi
         2oXYKx4Pvf/0EfMgjzE1pwfi+W9wON5tfdO24W1n0J1qeCKTju1jTbMD8HxUw2j9yk6h
         lvXOrWdBM/pEDaklVVyV/JoFjf2zlPfZRapsBJInnEKg8aVAfJ9YsMkFIxCFdRP+Btto
         QVhNaot3PBYji4O4ssGJodIPs08VAaUJ+slyuoXFz9d5CQYy+Z0WQ8jkyXMfjxpRCIql
         AQC0IE/0WfuebDEZRG/IFKjh2FRgrz1A6Bnnj/zby7+v/MwwYh03mqAS6wsDA5xoyhs4
         pULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748847012; x=1749451812;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK0IyySBRZW3kx89rtPTvWUvyucit05wnIbR/YG6Fpo=;
        b=WXUcD79I/MAgkfPe81zYvJTEA1UE1bzGr/dd/+2dwB6WKa0wUQBQEn9mVb/ESCB/T7
         xSMM/IDoOzN+TY7LCwUnFEd/6GhlMmIEUp75uMc8luYkV5n5vBlx9ZEGdWrpuPTpu9lo
         eMEmf+6k2PTusurNrgwu1aXMeK+ZkqwapDy93NDsSY4H/CHTBZjeXE+fJwmwxZR+A937
         5cE0snUw46M+VuhMYm/srBI50csvAFDONK1V6TmIqjIxMZy9MOonkoFcTb0lQ6wbQatv
         P9EgFYLEU1JFmqJPp71vUrdsV8BkwPVVdf2+g+0BvGHbHDe3nW6pQX3kFM2A0TKnrhYZ
         W+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4DiHXBwtLWXFHVHP8bqT9YCg9EQUQNZPsWkfhJR7wDIqMmvu1QQO33wWgsJbJJ4kwht4bUGbtZWYiDqcL@lists.linux.dev
X-Gm-Message-State: AOJu0YwwoSlAsu3j6XPkWgIim0cjPPTBVf5ZFP9WcQm3CJLV39/YWxNQ
	aXEsI9QQbknagW13Qb7FRzU759JwcAz46dcSSjkOAWTuZoBPR7WaiqJ/flRGFl28CDM=
X-Gm-Gg: ASbGnctaNAyBwyRL4tVu9W8vd6ZuFuh/ZZIPRK4Fa0bILf3kakUw0e0NXFkx1lgmTni
	j+5KU/aWpHt/RE1sPd+CiF9xzUuY7f3EcSJAtYEipppKYNL5UFloWrh4WapVDfs8xtgeQ9a8auG
	p70k+SI2ZulO6LAOHqBpjknp5CRBF39fmC5xn8MwIeAZdgR/bUk+39AxCqN0kZpM9OEHbrwld64
	rBx6gXQp5i/qZJZBL5J1yDcV0kQpsCXUAs+wcq6Ka3DPp1vRpwUrBVeTs8Xtr+BFuhjhzrGtR0g
	2MTxx2kC9yBtssCqvYYtz7y2rqkNObDH3s4JZFeaMGKBNECNVbb/3ys=
X-Google-Smtp-Source: AGHT+IEZR8tQifVwfY35OyZRO4tFwJdgXpdkuSPBQCXC2PRdUrJ5MhzKClOt7HCXAkUO8ONJz6PuGg==
X-Received: by 2002:a05:6000:2888:b0:3a3:760c:81b7 with SMTP id ffacd0b85a97d-3a4f89df572mr8120211f8f.57.1748847012124;
        Sun, 01 Jun 2025 23:50:12 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f009ff11sm13526519f8f.86.2025.06.01.23.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:50:11 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:50:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Harsh Jain <h.jain@amd.com>,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	mounika.botcha@amd.com, sarat.chand.savitala@amd.com,
	mohan.dhanawade@amd.com, michal.simek@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Harsh Jain <h.jain@amd.com>
Subject: Re: [PATCH 3/3] crypto: drbg: Export CTR DRBG DF functions
Message-ID: <202505311325.22fIOcCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529113116.669667-4-h.jain@amd.com>

Hi Harsh,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harsh-Jain/dt-bindings-crypto-Add-node-for-True-Random-Number-Generator/20250529-193255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250529113116.669667-4-h.jain%40amd.com
patch subject: [PATCH 3/3] crypto: drbg: Export CTR DRBG DF functions
config: s390-randconfig-r073-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311325.22fIOcCt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505311325.22fIOcCt-lkp@intel.com/

smatch warnings:
drivers/crypto/xilinx/xilinx-trng.c:368 xtrng_probe() warn: missing unwind goto?

vim +368 drivers/crypto/xilinx/xilinx-trng.c

940a39f34689c6 Harsh Jain 2025-05-29  334  static int xtrng_probe(struct platform_device *pdev)
940a39f34689c6 Harsh Jain 2025-05-29  335  {
940a39f34689c6 Harsh Jain 2025-05-29  336  	struct xilinx_rng *rng;
bf8ac5fe42abd6 Harsh Jain 2025-05-29  337  	size_t sb_size;
940a39f34689c6 Harsh Jain 2025-05-29  338  	int ret;
940a39f34689c6 Harsh Jain 2025-05-29  339  
940a39f34689c6 Harsh Jain 2025-05-29  340  	rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
940a39f34689c6 Harsh Jain 2025-05-29  341  	if (!rng)
940a39f34689c6 Harsh Jain 2025-05-29  342  		return -ENOMEM;
940a39f34689c6 Harsh Jain 2025-05-29  343  
940a39f34689c6 Harsh Jain 2025-05-29  344  	rng->dev = &pdev->dev;
940a39f34689c6 Harsh Jain 2025-05-29  345  	rng->rng_base = devm_platform_ioremap_resource(pdev, 0);
940a39f34689c6 Harsh Jain 2025-05-29  346  	if (IS_ERR(rng->rng_base)) {
940a39f34689c6 Harsh Jain 2025-05-29  347  		dev_err(&pdev->dev, "Failed to map resource %ld\n", PTR_ERR(rng->rng_base));
940a39f34689c6 Harsh Jain 2025-05-29  348  		return PTR_ERR(rng->rng_base);
940a39f34689c6 Harsh Jain 2025-05-29  349  	}
940a39f34689c6 Harsh Jain 2025-05-29  350  
bf8ac5fe42abd6 Harsh Jain 2025-05-29  351  	rng->tfm = crypto_alloc_cipher("aes", 0, 0);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  352  	if (IS_ERR(rng->tfm)) {
bf8ac5fe42abd6 Harsh Jain 2025-05-29  353  		pr_info("DRBG: could not allocate cipher TFM handle:\n");
bf8ac5fe42abd6 Harsh Jain 2025-05-29  354  		return PTR_ERR(rng->tfm);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  355  	}
bf8ac5fe42abd6 Harsh Jain 2025-05-29  356  
bf8ac5fe42abd6 Harsh Jain 2025-05-29  357  	sb_size = crypto_drbg_ctr_df_datalen(TRNG_SEED_LEN_BYTES, AES_BLOCK_SIZE);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  358  	rng->scratchpadbuf = devm_kzalloc(&pdev->dev, sb_size, GFP_KERNEL);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  359  	if (!rng->scratchpadbuf) {
bf8ac5fe42abd6 Harsh Jain 2025-05-29  360  		ret = -ENOMEM;
bf8ac5fe42abd6 Harsh Jain 2025-05-29  361  		goto cipher_cleanup;
bf8ac5fe42abd6 Harsh Jain 2025-05-29  362  	}
bf8ac5fe42abd6 Harsh Jain 2025-05-29  363  
940a39f34689c6 Harsh Jain 2025-05-29  364  	xtrng_trng_reset(rng->rng_base);
940a39f34689c6 Harsh Jain 2025-05-29  365  	ret = xtrng_reseed_internal(rng);
940a39f34689c6 Harsh Jain 2025-05-29  366  	if (ret) {
940a39f34689c6 Harsh Jain 2025-05-29  367  		dev_err(&pdev->dev, "TRNG Seed fail\n");
940a39f34689c6 Harsh Jain 2025-05-29 @368  		return ret;

goto cipher_cleanup;

940a39f34689c6 Harsh Jain 2025-05-29  369  	}
940a39f34689c6 Harsh Jain 2025-05-29  370  
940a39f34689c6 Harsh Jain 2025-05-29  371  	xilinx_rng_dev = rng;
940a39f34689c6 Harsh Jain 2025-05-29  372  	mutex_init(&rng->lock);
940a39f34689c6 Harsh Jain 2025-05-29  373  	ret = crypto_register_rng(&xtrng_trng_alg);
940a39f34689c6 Harsh Jain 2025-05-29  374  	if (ret) {
940a39f34689c6 Harsh Jain 2025-05-29  375  		dev_err(&pdev->dev, "Crypto Random device registration failed: %d\n", ret);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  376  		goto cipher_cleanup;
940a39f34689c6 Harsh Jain 2025-05-29  377  	}
bf8ac5fe42abd6 Harsh Jain 2025-05-29  378  
940a39f34689c6 Harsh Jain 2025-05-29  379  	ret = xtrng_hwrng_register(&rng->trng);
940a39f34689c6 Harsh Jain 2025-05-29  380  	if (ret) {
940a39f34689c6 Harsh Jain 2025-05-29  381  		dev_err(&pdev->dev, "HWRNG device registration failed: %d\n", ret);
940a39f34689c6 Harsh Jain 2025-05-29  382  		goto crypto_rng_free;
940a39f34689c6 Harsh Jain 2025-05-29  383  	}
940a39f34689c6 Harsh Jain 2025-05-29  384  	platform_set_drvdata(pdev, rng);
940a39f34689c6 Harsh Jain 2025-05-29  385  
940a39f34689c6 Harsh Jain 2025-05-29  386  	return 0;
940a39f34689c6 Harsh Jain 2025-05-29  387  
940a39f34689c6 Harsh Jain 2025-05-29  388  crypto_rng_free:
940a39f34689c6 Harsh Jain 2025-05-29  389  	crypto_unregister_rng(&xtrng_trng_alg);
940a39f34689c6 Harsh Jain 2025-05-29  390  
bf8ac5fe42abd6 Harsh Jain 2025-05-29  391  cipher_cleanup:
bf8ac5fe42abd6 Harsh Jain 2025-05-29  392  	crypto_free_cipher(rng->tfm);
bf8ac5fe42abd6 Harsh Jain 2025-05-29  393  
940a39f34689c6 Harsh Jain 2025-05-29  394  	return ret;
940a39f34689c6 Harsh Jain 2025-05-29  395  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

