Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23201591ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993144; cv=none; b=qUQN4VvORQ1JElyK+WS0XH/LhwOpZalRcdO6Bf/MWcn0unSzgTBLv2iCtrXGU0OakGWMZZx9cRyGm2Udppu8TGf8mjB4jiKAwtvH024bYQLJrE4xhJ/Ut7uVDby/ktQN3UlmydlXXGH3ivIRHSYcVgMSOs/Xu5Te00kSBKsaVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993144; c=relaxed/simple;
	bh=kXs3QsURM2zcPPJpgkgPQdLMqzTx/MGlb/EnXgJ0xMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PHSdu0UDIllVqz/OqTPYJrpIVmvZ2QNOmUo9LXrK6S40BzVUwVE6Yfo97McIQNP0mvna+2AREZVMtwV5tcSsavpAP9VpDABz2DFcO9RcW9kv8CAQL3OkSOyqfUrzZE4MvoHc7n2Q2/jp5ZA8tCKnPrb3iixxDj/nRQamLstX6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AEMytiVI; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AEMytiVI"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57863a8f4b2so2318182a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993141; x=1717597941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo88FTZD/E59x8F405UuK0CB4Sb3uR967SF1+FjoNhY=;
        b=AEMytiVIuGLOdIh5ukZG29wqGnIVzI9m+Wv1+nvwFzlOK7bwLj+W70egC8EPRDX495
         ZU38nkqmT/3geEIvLXjLjUcSa7mY/IuI/JB5SufUZjYhehclLdbVl2OTamB9n1jZKKPz
         TNSOMv9cBemBrSxxY1U2yPqEhy38mKYurgcTB+iLIDkodA57umXm48bt4TiqZam71aNx
         cVS4PT29LgRK/XCOv5PNbZEpb/OCiy4hDrgcwgYWWIob4sz+7dONib64MpLWNeywgNzQ
         PTIBQNu4A1UCAHWB1pKOj+ZI9S/H8duWrrLDDSZkhWLbdG89xlti8evqLMfo9bRpbJru
         GWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993141; x=1717597941;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo88FTZD/E59x8F405UuK0CB4Sb3uR967SF1+FjoNhY=;
        b=m5Tpjk32hnXL0+tE4YoOrYWyTp8FHwd/vW4kyk+NYSLhgLr3PZEyzLU6ESP7CBrWta
         92agm5DSLLpz1aVhf0O93Is6e2EavFkgiq5npp0FybsfFevc/vVoUSc1PcT3uidf4mqM
         CVuuFMWVy8lROUYg16XsLpyuhm9NieIow0aYf+DK2yhmYVUiFJQ8MRdUwbBD2orWdgj2
         hKnay+e7hyL2Su43uLq9ZCZ6JtyHI3RzV8NHDzOhL/Z3808xkPLptmA++KBw+8R83VE0
         tw612gds6vf1IME8B+TfLNmD3uVq8mDO69bPlq2/CvelpqDEILbFLsrRWRQXjn+tdCJy
         sk/w==
X-Forwarded-Encrypted: i=1; AJvYcCVSVo09Z2/nFwvwiLoA9xkQGJsZRsHMRTHEc+Dthmh0/GFR4J2cx5MK59ccVPbN2BsYkjk/Spu3HhLUv9FrgnweftclY8TWiIistHTlsQ==
X-Gm-Message-State: AOJu0YwPEbKYFhVMmlO0E4o3R5n701e/l92fR2LwKasgmeBgK4zLHfYy
	Sf/5zsxnnYZAGg8p7JtlNDCc31CpCfhZNliBDkzZmnDTAtUGUrkTJY9aVY1QMxg=
X-Google-Smtp-Source: AGHT+IE7Ire7AcSf7DwSdDRd2wsD87NIfwOXMT5C6rLL+pinwrrV1xj3IIIM9Ua5rWHq6lcOdLYN1A==
X-Received: by 2002:a17:906:1c12:b0:a63:359b:e5bf with SMTP id a640c23a62f3a-a63359be69cmr333031166b.42.1716993140788;
        Wed, 29 May 2024 07:32:20 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8b9aasm718951466b.155.2024.05.29.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:32:20 -0700 (PDT)
Date: Wed, 29 May 2024 17:32:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v3 3/3] leds: leds-lp5569: Add support for Texas
 Instruments LP5569
Message-ID: <1f970609-42fa-4e6d-95d3-7ccdf52d3fee@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527094737.13354-3-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-Add-new-ti-lp5569-compatible/20240527-174959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20240527094737.13354-3-ansuelsmth%40gmail.com
patch subject: [PATCH v3 3/3] leds: leds-lp5569: Add support for Texas Instruments LP5569
config: sparc-randconfig-r071-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280611.QUICzlRj-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405280611.QUICzlRj-lkp@intel.com/

New smatch warnings:
drivers/leds/leds-lp5569.c:378 lp5569_update_program_memory() error: buffer overflow 'pattern' 128 <= 223

vim +/pattern +378 drivers/leds/leds-lp5569.c

ed7ae4f43e228c Christian Marangi 2024-05-27  340  static int lp5569_update_program_memory(struct lp55xx_chip *chip,
ed7ae4f43e228c Christian Marangi 2024-05-27  341  					const u8 *data, size_t size)
ed7ae4f43e228c Christian Marangi 2024-05-27  342  {
ed7ae4f43e228c Christian Marangi 2024-05-27  343  	enum lp55xx_engine_index idx = chip->engine_idx;
ed7ae4f43e228c Christian Marangi 2024-05-27  344  	u8 pattern[LP5569_PROGRAM_LENGTH] = {0};
ed7ae4f43e228c Christian Marangi 2024-05-27  345  	unsigned int cmd;
ed7ae4f43e228c Christian Marangi 2024-05-27  346  	char c[3];
ed7ae4f43e228c Christian Marangi 2024-05-27  347  	int nrchars;
ed7ae4f43e228c Christian Marangi 2024-05-27  348  	int ret;
ed7ae4f43e228c Christian Marangi 2024-05-27  349  	int offset = 0;
ed7ae4f43e228c Christian Marangi 2024-05-27  350  	int page, i = 0;
ed7ae4f43e228c Christian Marangi 2024-05-27  351  
ed7ae4f43e228c Christian Marangi 2024-05-27  352  	while ((offset < size - 1) && (i < LP5569_PROGRAM_LENGTH)) {
ed7ae4f43e228c Christian Marangi 2024-05-27  353  		/* separate sscanfs because length is working only for %s */
ed7ae4f43e228c Christian Marangi 2024-05-27  354  		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
ed7ae4f43e228c Christian Marangi 2024-05-27  355  		if (ret != 1)
ed7ae4f43e228c Christian Marangi 2024-05-27  356  			goto err;
ed7ae4f43e228c Christian Marangi 2024-05-27  357  
ed7ae4f43e228c Christian Marangi 2024-05-27  358  		ret = sscanf(c, "%2x", &cmd);
ed7ae4f43e228c Christian Marangi 2024-05-27  359  		if (ret != 1)
ed7ae4f43e228c Christian Marangi 2024-05-27  360  			goto err;
ed7ae4f43e228c Christian Marangi 2024-05-27  361  
ed7ae4f43e228c Christian Marangi 2024-05-27  362  		pattern[i] = (u8)cmd;
ed7ae4f43e228c Christian Marangi 2024-05-27  363  		offset += nrchars;
ed7ae4f43e228c Christian Marangi 2024-05-27  364  		i++;
ed7ae4f43e228c Christian Marangi 2024-05-27  365  	}
ed7ae4f43e228c Christian Marangi 2024-05-27  366  
ed7ae4f43e228c Christian Marangi 2024-05-27  367  	/* Each instruction is 16bit long. Check that length is even */
ed7ae4f43e228c Christian Marangi 2024-05-27  368  	if (i % 2)
ed7ae4f43e228c Christian Marangi 2024-05-27  369  		goto err;
ed7ae4f43e228c Christian Marangi 2024-05-27  370  
ed7ae4f43e228c Christian Marangi 2024-05-27  371  	for (page = 0; page < LP5569_PROGRAM_LENGTH / LP5569_BYTES_PER_PAGE; page++) {
ed7ae4f43e228c Christian Marangi 2024-05-27  372  		/* Write to the next page each 32 bytes */
ed7ae4f43e228c Christian Marangi 2024-05-27  373  		lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL,
ed7ae4f43e228c Christian Marangi 2024-05-27  374  			     LP5569_PAGE_ENG(idx) + page);
ed7ae4f43e228c Christian Marangi 2024-05-27  375  
ed7ae4f43e228c Christian Marangi 2024-05-27  376  		for (i = 0; i < LP5569_PROGRAM_LENGTH; i++) {
ed7ae4f43e228c Christian Marangi 2024-05-27  377  			ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + i,
ed7ae4f43e228c Christian Marangi 2024-05-27 @378  					   pattern[i + (page * LP5569_BYTES_PER_PAGE)]);
                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
i can co up to LP5569_PROGRAM_LENGTH and "page * LP5569_BYTES_PER_PAGE"
can also go up to LP5569_PROGRAM_LENGTH.  So we're 2x beyond the end of
the array.

ed7ae4f43e228c Christian Marangi 2024-05-27  379  			if (ret)
ed7ae4f43e228c Christian Marangi 2024-05-27  380  				return -EINVAL;
ed7ae4f43e228c Christian Marangi 2024-05-27  381  		}
ed7ae4f43e228c Christian Marangi 2024-05-27  382  	}
ed7ae4f43e228c Christian Marangi 2024-05-27  383  
ed7ae4f43e228c Christian Marangi 2024-05-27  384  
ed7ae4f43e228c Christian Marangi 2024-05-27  385  	return size;
ed7ae4f43e228c Christian Marangi 2024-05-27  386  
ed7ae4f43e228c Christian Marangi 2024-05-27  387  err:
ed7ae4f43e228c Christian Marangi 2024-05-27  388  	dev_err(&chip->cl->dev, "wrong pattern format\n");
ed7ae4f43e228c Christian Marangi 2024-05-27  389  	return -EINVAL;
ed7ae4f43e228c Christian Marangi 2024-05-27  390  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

