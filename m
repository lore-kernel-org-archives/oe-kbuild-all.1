Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059121B3725
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882017; cv=none; b=kfpEKBLqQOkJ8kjky2GuBavUYdqleDU5WG4N9cdXrXCPUAEi6mw9rgU14xCqDWDhUntd8soyFiu08c6eebM1gQNMVIaajPfAsg4lyrP1+vZ68l5fB88wIWP6JOZ4fZGG2mhNTP3Sk2ZWIk6YClJ+H3xnidLSmSskL0xIrlJ2Ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882017; c=relaxed/simple;
	bh=SPYpBRIb6rXrn9VgF6BgFoB3pRz9hVX/If4hbjI2F1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ls5/MNWB8Cgn83B/1U4TVI34pIzU81LvP2wX+LqvvyxCDa05q4DHQpXiOyNj6nYtlhKE/xYwZJIfhK217Nm2a3cqVDh9DC/mbIjbOx824d7x6UgwxsgBuqlQ+K4fQ8dbzXvdVFQnYwJlNr8nSqk24K5x9EiRsE+f4FK5PYgIwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cReMBloH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cReMBloH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725882015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9CDfCUPWyy8T8eCH3NbbeKvi6CvjR/Ke1Y5gIeSyoU=;
	b=cReMBloHg0RhDofjs+A0wN1bib8ZfGkYHRijoiYLhfX++32t1cgbDSyZ03JBsjb+EPZ2Ed
	CefCIX3pSI5qu2SVITpUQqKR+DP5yX1Px/YeiU4ORQmIl2gtsgXSqUhJWWPDwSuQXFxF3M
	0cNPzucE/qUFnhS7mPeWTQBJzk+Y1bQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-ptye5UrYNq-UkYoFk2bzbg-1; Mon, 09 Sep 2024 07:40:10 -0400
X-MC-Unique: ptye5UrYNq-UkYoFk2bzbg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f75f196ed9so11438741fa.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Sep 2024 04:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882009; x=1726486809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9CDfCUPWyy8T8eCH3NbbeKvi6CvjR/Ke1Y5gIeSyoU=;
        b=eJRLYimwltnZBI+3dpbrMrgObIHi3NOD9Qc3S/cRrjfi+IF5pa2hbhP+ITNVj3yW+u
         IfeyXIPG8XHgVDDRIAZQTVPuCG1pUkYIwRxlgZWp9xP+tWcvmN+eFTTp6uRdobSp6shC
         C1LKTLXX1sTCXMbSsGtMryHthEUCcyt4/uJ6EL2KrrseLle7K0GDoNAuHVxHw2DuKBMn
         +JwjGw0dIOY8fn6xTLreCD0RC+dnsTtxUY8QkuUS6E3Gy8wJ53m6oVSyXooXSORgPGfm
         xHiAsGj3XRt74wnFYAh+IVwZPjDE+RLunrO2IKmA5+Gv8blMXFHApmUyfAVsEwkGlXpk
         xGmA==
X-Forwarded-Encrypted: i=1; AJvYcCWlEh4lcC/NYcR8/tvr4Xgu/tD0E5zZeGICgY33iPhO9JB1jjac55qthDISTR9IaR+6z5mPPRUd9NvGeya0@lists.linux.dev
X-Gm-Message-State: AOJu0YyQtDZpxn+7ZyFX/B0vaVLTg0m3Sbk+LCDtrTBe6wPxNY/fwfq1
	eX0L0VoJehZmUDN3OKzAIbKdZlHNeOQV9LbYUo3LO9exF3qAinOEQM7okMLKl9Bdhz1ERX7INKE
	/uZw02QgmOaTMbwan1haYgTKRyRtGpNpm85NlxUFqU0DPkWBs+bi61HI9HV7HYds=
X-Received: by 2002:a2e:511a:0:b0:2f2:9f26:ce96 with SMTP id 38308e7fff4ca-2f75b94e3famr39536681fa.40.1725882009228;
        Mon, 09 Sep 2024 04:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENg0cqrzz8j0LWpuGJOnSIckBcQeO1OoAKo63WWsuBOQWfprIbu3PvNa7hmLnPYtRbCsLzaA==
X-Received: by 2002:a2e:511a:0:b0:2f2:9f26:ce96 with SMTP id 38308e7fff4ca-2f75b94e3famr39536441fa.40.1725882008637;
        Mon, 09 Sep 2024 04:40:08 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.234.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd46733sm2888959a12.27.2024.09.09.04.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 04:40:08 -0700 (PDT)
Message-ID: <8bd11a7b-d227-4f21-9ba5-5494e22f3761@redhat.com>
Date: Mon, 9 Sep 2024 13:40:06 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: Encapsulate callbacks
 registration in CONFIG_X86_PM_TIMER check
To: Marek Maslanka <mmaslanka@google.com>, lkp@intel.com,
 Arnd Bergmann <arnd@kernel.org>
Cc: daniel.lezcano@linaro.org, linux-mm@kvack.org,
 oe-kbuild-all@lists.linux.dev
References: <202409090259.6vsS5Bni-lkp@intel.com>
 <20240908200127.1848844-1-mmaslanka@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240908200127.1848844-1-mmaslanka@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Marek,

On 9/8/24 10:01 PM, Marek Maslanka wrote:
> Encapsulate the code that registers and unregisters the ACPI PM Timer
> suspend/resume callback to checks that CONFIG_X86_PM_TIMER is enabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409090259.6vsS5Bni-lkp@intel.com/
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>

Thank you for the quick fix.

Arnd has submitted a cleaner fix for this, which looks better so
I think we should go with Arnd's fix:

https://lore.kernel.org/platform-driver-x86/20240909111644.248756-1-arnd@kernel.org/

Regards,

Hans




> ---
>  drivers/platform/x86/intel/pmc/core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 695804ca8de4..0c6392eeacee 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1215,6 +1215,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
>  	return val == 1;
>  }
>  
> +#ifdef CONFIG_X86_PM_TIMER
>  /*
>   * Enable or disable ACPI PM Timer
>   *
> @@ -1247,6 +1248,7 @@ static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
>  
>  	pmcdev->enable_acpi_pm_timer_on_resume = suspend && enabled;
>  }
> +#endif
>  
>  static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
>  {
> @@ -1443,9 +1445,11 @@ static int pmc_core_probe(struct platform_device *pdev)
>  	struct pmc_dev *pmcdev;
>  	const struct x86_cpu_id *cpu_id;
>  	int (*core_init)(struct pmc_dev *pmcdev);
> -	const struct pmc_reg_map *map;
>  	struct pmc *primary_pmc;
>  	int ret;
> +#ifdef CONFIG_X86_PM_TIMER
> +	const struct pmc_reg_map *map;
> +#endif
>  
>  	if (device_initialized)
>  		return -ENODEV;
> @@ -1502,10 +1506,12 @@ static int pmc_core_probe(struct platform_device *pdev)
>  	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
>  			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
>  
> +#ifdef CONFIG_X86_PM_TIMER
>  	map = primary_pmc->map;
>  	if (map->acpi_pm_tmr_ctl_offset)
>  		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
> -							 pmcdev);
> +							    pmcdev);
> +#endif
>  
>  	device_initialized = true;
>  	dev_info(&pdev->dev, " initialized\n");
> @@ -1516,11 +1522,13 @@ static int pmc_core_probe(struct platform_device *pdev)
>  static void pmc_core_remove(struct platform_device *pdev)
>  {
>  	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
> +#ifdef CONFIG_X86_PM_TIMER
>  	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
>  	const struct pmc_reg_map *map = pmc->map;
>  
>  	if (map->acpi_pm_tmr_ctl_offset)
>  		acpi_pmtmr_unregister_suspend_resume_callback();
> +#endif
>  
>  	pmc_core_dbgfs_unregister(pmcdev);
>  	pmc_core_clean_structure(pdev);

