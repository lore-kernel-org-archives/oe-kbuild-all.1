Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7728BABF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Apr 2025 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726576; cv=none; b=lJZFSNdDuLZ0CpceRf1lHtGXezr2MJ4j/INBTJWWAkRsqXUPhwG0RdXGUb2V39kY4WSsoGRDamlld/8MkvjkdgfAFxv47a/60zaI9RtrvtyyxUN/fiobvnZV9d3zFlY5ZKGlwXqn3jJLbuu4qv4z9FpQITQ54JgHoOW5bRnY+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726576; c=relaxed/simple;
	bh=55c1BCzE1AQ7sEh4FIgxaOC6Xq1kJXHlu6KRSem1KfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QC3F8Idk8rfT4DZBF8dC8v5sHj0xUe6gT8Dfk4UIqcd6KjUQVD+nbafDqFqwZIIskqQE5BhKu0GEPDoIO90Mk8iGvOSXhrufl/oUX8IVQauBtQfh7tNKhyLzBl79aaKgHB0KhI0i6Rpr6qaCdquC1QINQQA+ToKWtfCOobIe1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tLg/BHCT; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tLg/BHCT"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c2504fa876so1539698fac.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Apr 2025 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744726572; x=1745331372; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/dnlOe6Oc7JcFH/QtYuBJBbwz0k+7Vdu3edEoJdrwNc=;
        b=tLg/BHCT9g5cPjfe7VJuj6b/dq3kI3A0gUK9/jgEufv7nFKfDPayQyul691AGHIEjA
         4WOX3ZQrqjWK+sNZxrZx8aZhaU2ZNoAJM/bUHfUuhNkDhOP+RfNn6U9EUbdMIDURdd4v
         qyKaW3yQfaBk+K/vsARoJWgWP52+dAlSirpSpWdeGkKUa9Qf6PfusKGCOBXU9QpS3yhU
         Ofp/9qYNnMgOgQTVg9uyQmc4A7/EIc+TlEoQnC1XbJJ/w46V+t+K+tak4oEqZaIEf+ZL
         7TyRgzqFOTvWtX2rv2tp+WFzXM729otbL7JtyenbF9QLf73POpjDXVamomrvp4b4vTBi
         RgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726572; x=1745331372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dnlOe6Oc7JcFH/QtYuBJBbwz0k+7Vdu3edEoJdrwNc=;
        b=lTZ2lzn1GM43IH8ygEZlGJ1sjQoBrEC3C9rj8APMf+9w8tW4HoLDZLTowRm6OUU4VU
         fhaAZ1cpI1mD06ZHa7xwZP6yygB2EiMEizPdM0aODLQ6zEFr9+PxSTEetEG+thQmUOCr
         3v9BIRnK036jS6fwI+sR9URo/iGFbmzaSKiwU9uywFceRVbQlx45jeDEHjRmdWGEEGc7
         ex0wviTcKqBAEQO/+gH3rQjoWtbbdYR0J/TS/cPH2swPUoxyythsCO1XXTBbh5Bc0ssc
         YI06WrSZA8nkJWtkrBZ9/GId0lTVkcLFhSnxGAXWD0azJZ+QgLuwCEzML4RBCBRbhbX2
         IxBw==
X-Forwarded-Encrypted: i=1; AJvYcCXZrOCroG5UswFYdsYvOvv301d/Uav1n2+84Zq2fnNDqbqPrmTMWsV0pILfksMWnh8/WL6qvzgApZY5nAqS@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd77hInrBAGFEf87thXg/+u/i1IMmh1N5QR4Pa8ZHaLnBpTHZI
	xONhy2WpF7TfAuLJeAMtZfpUSQZIGxtgLsIvqY/POoGWVCW8gvaRZQuJziUq2mY=
X-Gm-Gg: ASbGncvx5IBhjh5P8jMNnjdsLn9T3IWrhIOHGdjvJZ1MtdLBuBnEvnkBSnUxYLX56/u
	xCdD2V2UMqusvqQxxohANZWllkjVrHXCQ/w1UWhSauziBBy1kdd6Nc20nXzb8qc4/Xef2fMSTBT
	efjSdKoHSmKWbDOhcEcX0ZBOschn17Vyiok9meeKdTeV/PqoD9S4HD5R/qfeVCq3eMlyfTyp1Tc
	o7/WoRgfDkfTPzGWvUc0kR9aPQFfC2oavLNqNq43Npqez4sJSw3tvvnZoMRf3Wy0cBJTnWmzoCv
	T/ffyco1CUsGbTV9a1fELSpn0M2gHaeP/b0LEEYbdSbM7IB5dTRkqwEgyUAmmAm5TvKCEOFPrX3
	hy6U1
X-Google-Smtp-Source: AGHT+IGWcsjgmt0E+fTK8Od9d6OdD0JgkjkX0vCfZo3ir/YIyNrBbWM7HSvsT1FMKdU5anq1LIC8Bg==
X-Received: by 2002:a05:6871:489:b0:2c2:5c26:2d8e with SMTP id 586e51a60fabf-2d0d5ca5835mr9699340fac.16.1744726571744;
        Tue, 15 Apr 2025 07:16:11 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2eaeesm3188527173.126.2025.04.15.07.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:16:11 -0700 (PDT)
Message-ID: <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
Date: Tue, 15 Apr 2025 09:16:10 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
To: kernel test robot <lkp@intel.com>, Haylen Chu <heylenay@4d2.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>
References: <202504152107.7ekGPIrF-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202504152107.7ekGPIrF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 8:44 AM, kernel test robot wrote:
> tree:   https://github.com/spacemit-com/linux for-next
> head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
> commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

If I'm interpreting this right, this seems to be a problem on
a S390 build (under COMPILE_TEST), because there is no constant
version of the __ffs() for that architecture.  This might be the
case on other architectures as well.

On RISC-V, this is fine.

Any recommendations on how to address this?

					-Alex



> 
>>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
>       241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
>        33 |         .num_shift      = __ffs(_num_mask),                                     \
>           |                           ^~~~~~~~~~~~~~~~
>     drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
>       242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
>        33 |         .num_shift      = __ffs(_num_mask),                                     \
>           |                           ^~~~~~~~~~~~~~~~
>     2 errors generated.
> 
> 
> vim +241 drivers/clk/spacemit/ccu-k1.c
> 
>     239	
>     240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
>   > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
>     242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
>     243	
> 

