Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8E3E8C49
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935467; cv=none; b=nb10csgkMYP7K7PYlVoVVWC77MQ3PptnQcV4HPtNKcti++sxGqm6C/05IvUNZEH9EyWPU9+PbZrJFrJq+1gXfuAhP7DEONJZjkvYs9jMtoEIYH+RDeE22bV9+/N/3R7ZrMqArNW9OAdoqmTLENP1+WbnlOAYWSHXU0S1B2LBKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935467; c=relaxed/simple;
	bh=htbKaCcPsqzgp0/d0xa0hAnmfuRE6MBP7rNT/fVsEJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=r5+HX3unA0dP5YYIrtXGWQoHkyM4Naj9dM5Z3ieIfpDzOfaAqWFn72/9QV/QMJUWPNsE6gu9dYSGfmelTwgCnkwlLa4vYeD95KBGCI3WBK2xLAeex3Qm6w68+n4ep6snjcMreDr6TPxU2IY1j4eCqDKLAEgsHOVD7SigtPsNGJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yh7oEPez; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yh7oEPez"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-667cc4ec065so1454333a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935465; x=1774540265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xF1PTk3vkRprEYqnuXa/M55cUPdQPeSRT5BOEVfLuaM=;
        b=yh7oEPezld7hTUEGKkIGBXattSUufqR3kpjORYHGysCo/MQiF4zk2sfq1w5Q0C3Kgu
         wDNObZ3Z84UxtCPDpYxxoEW50AL8UtRz1F26GXEwmJVnwfZ/pbJ28N2UZ17t+JKfGvhF
         poPmNznZRBqnho2vcqhCL2em64Oi+/b8pkmv5FVmBA8rDfzL3jCIuQnyKKqi1TcpmAlw
         M+379QPrG+86P52rDmwWHMqL4I4pETh1BVtKWNLT5FIj3VI5jRSrUXmU49EXV2Lb+3CI
         04sxG+UoQHkpV3Akeo7xoTMFD3+f3lfzcu7CuRXtOkcDgglXcAmgWPoIoKM6ywG945xw
         UJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935465; x=1774540265;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF1PTk3vkRprEYqnuXa/M55cUPdQPeSRT5BOEVfLuaM=;
        b=l3g2M3R/eH2/74xC3iZDdAgpsRf/1y0pvXL4WIxBlI+Xspi3uMmjTdKFIQRkWyhTy8
         pBIL9FQFcgR+9iQ+mB59wDqxRWmJWrtuy+7w/JdbbYP/syw3bbosACdDLYFd2YrFfQKA
         bAWK17fEXPcCR5ZK7Rlr62jC4npzkCKE8O2ux9blVx2pjj3JQ9FvJjL/dIrR7OoNiC8G
         J5hRj3CtJCdrTfGwPQAAQuYAP6h4LhK3MAYjahlj1er4lkRY7ef8ct2KSDZOMXxwsIvP
         9nlCZepbKcyRAMW2yc0m6aEzNDgPbwZz6KT57MNMn0+YrudJH/o+4jGEkcn0BsDAVeZk
         wD1w==
X-Forwarded-Encrypted: i=1; AJvYcCXvNjrGQ4AlsRfetJwBbglkHxcB8UISh/Av5drleqNKv/Lrds7xC+tP1gnsM3XNBO9NUq6aZJ1INh6U7+Gs@lists.linux.dev
X-Gm-Message-State: AOJu0YyLTd4GNTG3cJdzFNsrCwlkkcg0hadsIxsWF7DuyXG82Wv2BHGi
	4NGp6qC1+3pww//at/3snKj7pbZlVvLgc5thnFwHUT+HtK9Z7uKtDM6CxxM6/F5VsCQ=
X-Gm-Gg: ATEYQzwGOYTU/b2N9WDSLtcqxeO2bHV7IBC/ff1aDKJvLPFFRb0UZSBYfyh9AH58QEm
	H1ey1b1nY/aiVTKgo0VDQsoJ77XbSxIMR1tthC19eI0hGV05z0TRQH/ktF3cBUs37gef+Qm0gxs
	jyUjfDnOcQ8mxEgqDETGKNLSuLKaVxKW+cnoNqfVgz31ZwAuBjylnlhnHG0H4f247Lm/7FzVGBC
	2fcR4WYbFtGGEnr9EW/lucrrjUcLQK7K7k4pU/fjmhcfwkgayFiRkJXOciwNofwAV1IbHgyhY9r
	tbSOKYHvmgavruf+k+1ysRH3avqvcZo30x+HyppY4VlMo94qryBoZRHztPaB4e3xC/pC3LolibV
	ybD13BVyf7KeOZ15z7loCNKRAC2WtXf4+mp1kSFo+ZcpeojcaqDvuhApdaU+e6dJ16nhUZBSDTS
	vCT4/o+fWMcYm+uEaf3zqRWIN7JFy8
X-Received: by 2002:a05:6402:51c8:b0:662:ac7e:aac9 with SMTP id 4fb4d7f45d1cf-667b30fa581mr4994027a12.20.1773935464564;
        Thu, 19 Mar 2026 08:51:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668621dde0esm1353353a12.24.2026.03.19.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:51:03 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:50:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>,
	shenyang39@huawei.com, broonie@kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH] spi: hisi-kunpeng: prevent infinite while() loop in
 hisi_spi_flush_fifo
Message-ID: <202603192159.S0PIjhlg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01@kylinos.cn>

Hi Pei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-hisi-kunpeng-prevent-infinite-while-loop-in-hisi_spi_flush_fifo/20260318-211321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01%40kylinos.cn
patch subject: [PATCH] spi: hisi-kunpeng: prevent infinite while() loop in hisi_spi_flush_fifo
config: s390-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192159.S0PIjhlg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603192159.S0PIjhlg-lkp@intel.com/

smatch warnings:
drivers/spi/spi-hisi-kunpeng.c:206 hisi_spi_flush_fifo() warn: should this be 'inner_limit == -1'

vim +206 drivers/spi/spi-hisi-kunpeng.c

c770d8631e1810 Jay Fang 2021-03-27  193  
c770d8631e1810 Jay Fang 2021-03-27  194  static void hisi_spi_flush_fifo(struct hisi_spi *hs)
c770d8631e1810 Jay Fang 2021-03-27  195  {
c770d8631e1810 Jay Fang 2021-03-27  196  	unsigned long limit = loops_per_jiffy << 1;
c770d8631e1810 Jay Fang 2021-03-27  197  
c770d8631e1810 Jay Fang 2021-03-27  198  	do {
e8821f559fed86 Pei Xiao 2026-03-18  199  		unsigned long inner_limit = loops_per_jiffy;
e8821f559fed86 Pei Xiao 2026-03-18  200  
e8821f559fed86 Pei Xiao 2026-03-18  201  		while (hisi_spi_rx_not_empty(hs) && inner_limit--) {
c770d8631e1810 Jay Fang 2021-03-27  202  			readl(hs->regs + HISI_SPI_DOUT);
e8821f559fed86 Pei Xiao 2026-03-18  203  			cpu_relax();
e8821f559fed86 Pei Xiao 2026-03-18  204  		}
e8821f559fed86 Pei Xiao 2026-03-18  205  
e8821f559fed86 Pei Xiao 2026-03-18 @206  		if (!inner_limit) {

This test is wrong.  Maybe change inner_limit-- to
--inner_limit.

e8821f559fed86 Pei Xiao 2026-03-18  207  			dev_warn_ratelimited(hs->dev, "RX FIFO flush timeout\n");
e8821f559fed86 Pei Xiao 2026-03-18  208  			break;
e8821f559fed86 Pei Xiao 2026-03-18  209  		}
e8821f559fed86 Pei Xiao 2026-03-18  210  
c770d8631e1810 Jay Fang 2021-03-27  211  	} while (hisi_spi_busy(hs) && limit--);
e8821f559fed86 Pei Xiao 2026-03-18  212  
e8821f559fed86 Pei Xiao 2026-03-18  213  	if (!limit)
e8821f559fed86 Pei Xiao 2026-03-18  214  		dev_warn_ratelimited(hs->dev, "SPI busy timeout\n");
c770d8631e1810 Jay Fang 2021-03-27  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

