Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0C328B5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053691; cv=none; b=nQwKNLHrf3vlxyuSiZYqIguCz0OjXJhFLdcHmdBSwx2d4MrjroAmoGO7OOek/FV8CaTsG/tH+lZlV5xmIUPmRfe7Qa+nv04ioy+9+MwY1kOq3ac6TlKlNv33nSDXSKRpnxRyMkJ5Mbl7lHgjoA4krxVRSRXygmrpSwv22WV3Ll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053691; c=relaxed/simple;
	bh=IogaALvW2eapq9tqUoRBFaFhYCrL5XWtTmxe0iV3jIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df4hRBhXKjFbRdV0EX1tTfb8Xp8vDRhj/qu2PshQy+SeHRBv+YM/f2vZpyXqjXWjgTWJyelOqUWQfvghhCTxtgSRJouSyjXSyfeTRdQbF/D00NerQOIrjOMuzwOIO4Jcdn3eHaWCR+cMTPK+aID/LEBtCI9J5H3TWQjFweFyoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUY1IYCa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUY1IYCa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42557c5cedcso3188094f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761053686; x=1761658486; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLxkGoPTtImyUtviv/BjShtSOaLBPmerB8f/Nwk2Mno=;
        b=yUY1IYCa5zj5XAaEI5Wm/dBEiLSHXVKmMydkVQep8/lXVdNT5CBrQMDaKv6RITYrDd
         8VD+Am5G0eWqRaqfiXHdWffKIrDW0UQf2z8BrIxs9K+jA6leNcz+zGe6HE4nw6s4NA/Z
         vKZOmMDhl3/QLW/d7X5hOtPmGeQ2ecQXoYhNHsrRF5c38M7hHESysvE1M3qaYwCxCs0T
         O2NK9XQNrZTsBgCnrFhAtKKwWtzzqHOFHmCzU6PSQoRNsRkZv9GwbV8RMOftLZcMteHX
         yxfKUCcUXktds476y5tvtWfYXcadOSAko0gFrONXyEAytTHVGo2t4bGMrKB3Ep+niAxn
         VlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053686; x=1761658486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLxkGoPTtImyUtviv/BjShtSOaLBPmerB8f/Nwk2Mno=;
        b=cPNPpJ+Mm7LmOeCVNmht9Xkz6xO//GykrL06cOPzBclENTrBbuEcdrSX3ow65CDlfJ
         TQl3LINjI/iv752GO6g/9SdKHMFXwDCwK/S91dRnDCHv1beMBTFRjv7DmZA9tfKQfGXZ
         /0shbTrM1hyF6ohc1LbsttgFyNLP8VSDT/NZB7C0bCVTB3SUhR0EY79KwRxnhc5lFYLh
         dUcl/sVVt6B9BkopGw8b/1u3++iXcjC+2P0w4Ox7UPWn4OJmwaelpZQW6tnRvRxMseML
         AHtDXV8DAw79RdJlYU4oby0cjfJ9n1TGKSdvfk4F7v6Fxnl0qo66Gzsn3ybmoTCeNU3G
         ieBw==
X-Gm-Message-State: AOJu0Yx6X7vfIk+KUg5l0DyQPD23uREOQMLchBRrDtmIXkiH9d0VOyO/
	XJKU+Wf06pfqRGTLHOToagJiW2N1LCajMsNi6peM2ybYh6kr+A5Km9DwBuO3SIR6Rbc=
X-Gm-Gg: ASbGncs4dKy5aygsEF3NY1tMBmea1sklbdC17uCCtiuPi6G2B8BnFjTiVW4bCntJ9TF
	q0qHufq/d6nyz6Qf/wqN3xAggpcKZw8Be3qBEXw8CeTs94LrbxVT7i7vaAvvjb91s0gmG+zH14D
	v4w6y/q9tF51FkyKvYn0ayYaBdWVNCz4Qz5Misdk2aRykygNezlrMFEr59dyq9PJ6Yxe0cjv0U4
	P4qT1Ozj9SqCZu6HogB3VSEPvY1MPdAaYdKlry1e+t4I86iki+iaR8cMBrq6xJh4XaWawpoQCbU
	5rMJxjMxIaI9tBQP21fGj6XRuOpSfLmkoSIXIcVv7JxZwq1+eCF3KaxwcUxmbHVUvDGmxZRk+oR
	HLujIbclf/gUt2WCSI4w+GyDMf7Io27kUg4iZbidTki/8i/anLb58RqHX45F0b2Ba01pl+OBs1r
	niW51poKOQzuKLVIaRLGhtYuoDYDrPeA==
X-Google-Smtp-Source: AGHT+IFiua0WeaY0CXnoWCa5iIj/+hmUCra8qzTOrf7rGDpJuMyto7e27u802VaklsnrI8JTAGgp1Q==
X-Received: by 2002:a05:6000:220f:b0:427:630:4106 with SMTP id ffacd0b85a97d-4270630411bmr10787567f8f.34.1761053685669;
        Tue, 21 Oct 2025 06:34:45 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9fdfsm20289824f8f.40.2025.10.21.06.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:34:45 -0700 (PDT)
Message-ID: <741cec39-626e-49d8-972b-9c9dbf038b19@linaro.org>
Date: Tue, 21 Oct 2025 14:34:43 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 2463/3056] arc-linux-ld: clk-acpm.c:undefined
 reference to `devm_acpm_get_by_node'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>
References: <202510211905.RgfWkgss-lkp@intel.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <202510211905.RgfWkgss-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/25 12:13 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> commit: 40498a74205371400a5b0088acb886ac47a523aa [2463/3056] clk: samsung: add Exynos ACPM clock driver
> config: arc-randconfig-r132-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211905.RgfWkgss-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211905.RgfWkgss-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510211905.RgfWkgss-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arc-linux-ld: drivers/clk/samsung/clk-acpm.o: in function `acpm_clk_probe':
>    clk-acpm.c:(.text+0x3e): undefined reference to `devm_acpm_get_by_node'
>>> arc-linux-ld: clk-acpm.c:(.text+0x3e): undefined reference to `devm_acpm_get_by_node'
> 

I should have provided empty methods if we aren't building
EXYNOS_ACPM_PROTOCOL. That will allow to test build the code
with COMPILE_TEST.

Will follow up with a fix.

Thanks,
ta
