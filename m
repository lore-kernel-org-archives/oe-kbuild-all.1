Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DFA2F42
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617741; cv=none; b=FjN0OQvgYkQThXXmcDXq0O7c48vgjp9dfvJR4nodhe1uV/JV643UdiLNgMlR930sxdHuw+KOpW0mSgCsv56OyB+xiL8ws8ZCCdBMS7OnbCVcB9vKT4GgJG7YNTeHjfUZtaNVeBIjzp1wC2Nm10jPMIV+VoV5gsFTRTY+59R1ihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617741; c=relaxed/simple;
	bh=nQWgyIyZchPpBMUd27Ybx+nG+4p+KDvUmQLpNEiaWkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAItc1P8ZM78O9F7JrFMhDcUv7UiZtZZBoCnuGzi4EdCEMqUzgY6cjpggDcid5qtRpkSCpMBoDuye9KkHtRogzenIR+9zXK5tHNqE5rzUkUh12HeF8KzgpM4Nsq6zapd88lDqxKq34oTgR+NvhDv3xObHpz5M1REOAoM60A57I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuasWpy6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuasWpy6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2114308f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744617738; x=1745222538; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7w/s+hccjNe4bB/Dyc37dVWQh9Lnz1WZC1fXPq+WmKg=;
        b=KuasWpy6DuuotBQerQMrLER3N16eQBwaaDxjGiDmrLa07bdcmJ6RbndBX0CvjFPCMy
         YKbSCSY7xQVnwk+y/Ef/BHOPJYBZOXBrkaD5+Fr9eVyUtGTB1VS41fO8+MdHbJVVl30l
         +sYphw4I4CYT9sDr4yzvjCOtuu+bH2GcKU/lPiL2BtinsuX3u0MgbaAarv45h2JK7B9B
         PEE+2IE5eiVsJURONL8WY01+aZWnFmtzoB8xF5RHw+ZNpP0j5phaTYRXe1V8xZ80bc4S
         AQ4RaTle7nPi5bvQ1fxeMW+GbAu6AhGPYASQdv06UuQaSKjgaytLOV/vV6asyzeHVsTv
         OkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617738; x=1745222538;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7w/s+hccjNe4bB/Dyc37dVWQh9Lnz1WZC1fXPq+WmKg=;
        b=D41VuzfLei14xW/dHxTODDAe1Xfz9Hmkc0xKQZQWm5xtOTQCkW2eld6c/bW7HF+fI9
         qM6qI5dPZevevcQoqzKaYJ6rLgXVHRHchTMkjqrZgW4kZ6pKVo7dvXEw9E2Vg7tDJJ/Y
         JbvMtXEEJw8Kr5X2wzgiMt4cb7k4o6euKHDoPycCbADYMtcj+axw7pFOQ2SoQ37lLNq8
         KSMC2AeOoXqGNJGIBBuRFqkuF/hcfC1N7kfkwa24pAXh9khIA3JlugjtLLGcHjXgrKdh
         70ftXa0Ct4Qv4fMKM96E1+WuS+qmN0f0PvdteOx+ejR54OXLzaJ72zyq1WUM9sOCM5P9
         jCsA==
X-Forwarded-Encrypted: i=1; AJvYcCXgksgFIVz+mG50gHDzwKkMFUI0fMK9/R9Unju/6raZcQfu1YknqQrWXSLgjNySOVS1467qC0TxCENqbnn+@lists.linux.dev
X-Gm-Message-State: AOJu0YyKn9XcB8o19C2dc+4ERpiI4nQQrEXTVS6qDVYFLKplCGSVg/0U
	sXaRJB/YCoA1RPlWn3Z0FnzlF/4GUSswbboT3Ap2VwLmTAGb4WCpxFdGNA9roQE=
X-Gm-Gg: ASbGncszMpvD1B2QCpzxpL+A0h3GHuho5uSA6XCoy/J3/ldwjp7wALoljlJlv4JfI07
	GpjRQzgkiGaIvA7x2OiLokVlQ+qsW4GT3B5gurI6ouT7JdWg/bHcH1mFqqrvCghVzo9DYhvwFll
	9v4JjqmMkV5Hnb+RWjJv0k4DE3qVT5MZawRvUwFLfis85lRkYdXzGAfLOHERrSn92UbJ5Jti1k2
	sAlMwY4Jw8kQTS+t2Q2VnYz2K9ddLmKOaJrv1z/UrsRp/gdMXghi2TUedyCAcO3dLvEb9KkMxlR
	VXWyOWwQHdjiwlj4p1gvVs+DHrTKZ2elxy9TVrahlvNk8A==
X-Google-Smtp-Source: AGHT+IH3Rxtz2FdCZzj4cm7At+o5gn8JLnMOQwwzZgYbuyAdsDYzHnfnvKOJWt4MTJ8SQFcjBrSYzQ==
X-Received: by 2002:a05:6000:420f:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-39eaaed2cd7mr9019382f8f.51.1744617738045;
        Mon, 14 Apr 2025 01:02:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae963c15sm10438528f8f.13.2025.04.14.01.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:02:17 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:02:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Angelo Dureghello <adureghello@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 145/170] drivers/iio/adc/ad7606_spi.c:321
 ad7606_spi_offload_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <202504131808.qk2lrRY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   251fedd7b6dc495c433b959e31c29a867c079872
commit: b9c731a0e9a582b17128cb335a816163ac21734d [145/170] iio: adc: ad7606: add SPI offload support
config: i386-randconfig-141-20250413 (https://download.01.org/0day-ci/archive/20250413/202504131808.qk2lrRY4-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504131808.qk2lrRY4-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606_spi.c:321 ad7606_spi_offload_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +321 drivers/iio/adc/ad7606_spi.c

b9c731a0e9a582 Angelo Dureghello 2025-04-03  311  	/* TODO: PWM setup should be ok, done for the backend. PWM mutex ? */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  312  	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  313  							     bus_data->offload);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  314  	if (IS_ERR(rx_dma))
b9c731a0e9a582 Angelo Dureghello 2025-04-03  315  		return dev_err_probe(dev, PTR_ERR(rx_dma),
b9c731a0e9a582 Angelo Dureghello 2025-04-03  316  				     "failed to get offload RX DMA\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  317  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  318  	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev,
b9c731a0e9a582 Angelo Dureghello 2025-04-03  319  		rx_dma, IIO_BUFFER_DIRECTION_IN);
b9c731a0e9a582 Angelo Dureghello 2025-04-03  320  	if (ret)
b9c731a0e9a582 Angelo Dureghello 2025-04-03 @321  		return dev_err_probe(dev, PTR_ERR(rx_dma),

s/PTR_ERR(rx_dma)/ret/

b9c731a0e9a582 Angelo Dureghello 2025-04-03  322  				     "failed to setup offload RX DMA\n");
b9c731a0e9a582 Angelo Dureghello 2025-04-03  323  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  324  	/* Use offload ops. */
b9c731a0e9a582 Angelo Dureghello 2025-04-03  325  	indio_dev->setup_ops = &ad7606_offload_buffer_setup_ops;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  326  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  327  	st->offload_en = true;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  328  
b9c731a0e9a582 Angelo Dureghello 2025-04-03  329  	return 0;
b9c731a0e9a582 Angelo Dureghello 2025-04-03  330  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

