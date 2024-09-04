Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3591CF5D3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443810; cv=none; b=KpMHETsFN9RlbCYM8DlmHGch+EeAI/lf+rTNHcE/dEN7R7RszuY3OQsK/J7TBadkm+rRk8lwLzREtRQvwaVfDJGtA9e2isEKqWNvwZEdFTmMIsRGNg38t/yNGOXadxwgn+XfLCZT7c8u6RmwNnRfQghF6U/iR519JDX/d+Vyo9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443810; c=relaxed/simple;
	bh=aCDidHUhuCuDHfNZLIqA/sxxjHTRtbuYO3SM1pB/9EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUMkjfpPJTH3GjNKwzPXu2gsFCi3O2lQvl/mKCE9wNcVhkJ2AplLGjtRo1I1+dO5Va0+ZamMWax7wIePdoKvXOxTdGAzKjggZXFjrl/3z/YE0DWx8/plyQCKrbDxmiid89lvMilgVJZtEKg988A0cZvVVim3+JA7k3pGqtbB62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9iU9r2N; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9iU9r2N"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bb8cf8a5bso5047245e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Sep 2024 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443807; x=1726048607; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/W78Be/eQHD22S5iu13BDeYflw4dGDs26BDBayFTqk=;
        b=y9iU9r2N5zmw1IsFNrPju1/j14ZhLjWvbpj/Qkey4jG+3NIjjtRWdHgYTiApdAf0FS
         qCGi73EGcbb+BFZWSIax6gYkPEP50AKvfFfNdhhAltAQzJBLxHE0h4Zd9diqXkwdtpGL
         RmDFjfqfE6iuUEkbKaw6x2NXXnG7Lw3L8EiZ2535vQrV+TKrwKeHWGq4Wps9rXfXTlmq
         yVuRQgFIsGzCSMtDSisioacrZNopwniyAxR4kk4aUXAJlNj9Bi+ezOgxHuqMRuzgPWGs
         bXy8J9t5QGqfBpjsRvGps31N5YZWCAOgBgUQ7FSCm2BcMAZmBjJcM6xIbDmItwJUY2l6
         G9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443807; x=1726048607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/W78Be/eQHD22S5iu13BDeYflw4dGDs26BDBayFTqk=;
        b=TMABSuFDQDTlX5rMSTu2Su3F+MywZQYRQDXomjX8nrWpquCxWBHKqx/J0v9stVOSmY
         qqUJ+POmCTG0YBbrRxYLIZYhO8XqNOXc+nhe8++nUOWXQ+/7dP6vLZ12F2zfruOTDYgN
         vF5zja9f8TmDAJpMR7dDhQUYJtE0ihieGHEQoCJNmyAF7fN0LnuLEnL95bJuZrz3hJIR
         iOM9Kk3qBMBa+5r+JaCv1S62tAuG58bub4Mkbkgl5J8vWYkdjY+Mhsq5QY6xV6g3VGkg
         2FLtJSeiDIDuyc+JVwOSTw5hWcuftVzDaSupwDFJDZ+xuN9Y2Do2A81sYNxBqul3iZpP
         WHqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZW3ApQ0tKlPFcXFTWWQpvp83+GOzfVmrz76IYNzGSD+X6WYh6x+eVKHnld2sBdwx0wmSvasR+bNBj3uuf@lists.linux.dev
X-Gm-Message-State: AOJu0YzCwzy4c+rI30gYf9VGnnQRSQh86Xlynlx6Nv5YgOz4UELfaoSj
	kQMIsenNXDw4rOmBgVpHXvASN+wcEoGAY+U8BwpUpGBx8IzuP1eLg3ZZdKzFbNU=
X-Google-Smtp-Source: AGHT+IFlA/9+wXJR00TBKlcv7t++BLgC83AND2/h5r1U9gBA4bpgaKPOAUnFNgxosCfz41BlVAzrEQ==
X-Received: by 2002:a05:600c:1ca4:b0:427:dac4:d36 with SMTP id 5b1f17b1804b1-42c9542506fmr12927985e9.7.1725443806315;
        Wed, 04 Sep 2024 02:56:46 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42bb6e274b6sm199624165e9.33.2024.09.04.02.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:56:45 -0700 (PDT)
Message-ID: <53f963f1-7e0a-4add-848f-efcce3681609@linaro.org>
Date: Wed, 4 Sep 2024 11:56:45 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: Fix comment for the
 pmc_core_acpi_pm_timer_suspend_resume function
To: Marek Maslanka <mmaslanka@google.com>, hdegoede@redhat.com
Cc: linux-doc@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
 <20240904094753.1615549-1-mmaslanka@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240904094753.1615549-1-mmaslanka@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/09/2024 11:47, Marek Maslanka wrote:
> Change incorrect kernel-doc comment to regular comment for the
> pmc_core_acpi_pm_timer_suspend_resume function.
> 
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/
> ---
>   drivers/platform/x86/intel/pmc/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index c91c753b120e..e2b4c74ce7f6 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1209,7 +1209,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
>   	return val == 1;
>   }
>   
> -/**
> +/*
>    * Enable or disable ACPI PM Timer
>    *
>    * This function is intended to be a callback for ACPI PM suspend/resume event.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
