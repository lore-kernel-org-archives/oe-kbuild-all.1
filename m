Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37221CEE89
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443804; cv=none; b=i5Z11uEcnxMaSluCixCSi/zE0muQVbLH/kYxt7TUfa2XTEnvAzcI5Tj3kbNv9ltNEbIfVUlqQD47caq2F0U7nhQyb9rtQhEUUJzlt8lm1Nuj1dSpjX0ng8mzlcGg2Q22KBf3rCnbVhdYVqub6rShcLJjXOCnQM/pTKpPgRBfx3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443804; c=relaxed/simple;
	bh=tCuk2mV1y4PiVJvxpU2GLPmf58V5xXMb8LK0IYQ95Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2xhc5bUGB4KqBidztjOA1IccyWDLjtpox3ZODeicZskUuvmNilI+IwFGNl5NRJNehW3Ljb0Q2DEMVYYTaoWyCPLGev/OcZMCiX34rZK9gMBWDZC5oeqvVgKSpYvlay+1OTNZIFC6C8IUWGcv2R5cc0+29qF4DblVfOrn5yOE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cdYJKsYc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdYJKsYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725443801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMDEvCKdCk4WIymhHfyU1DYt7Mm9yUFTwXqHIwpMZWg=;
	b=cdYJKsYcNva0kpCsjCteVnvUD5wG+Bo5DyLfWDnS5yGXrFc5lDRAH52wNFnu9gzOGuC550
	goPJnSWAhlBsawL1HgXLDfj/hN2E3Rq9jnvli96pUKjyCxUCIzuU0UWPN8v+HrgAD+T1QX
	0a14Xg3nhysckyWu0V85z8W5LdGm3n8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-wghsKUrdOOCpYJ6xidrpQA-1; Wed, 04 Sep 2024 05:56:40 -0400
X-MC-Unique: wghsKUrdOOCpYJ6xidrpQA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5a16fae2ba7so397072a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Sep 2024 02:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443799; x=1726048599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMDEvCKdCk4WIymhHfyU1DYt7Mm9yUFTwXqHIwpMZWg=;
        b=GNiFtaFAyCQOppmeta5VSAIRnsRtr/puzuhEAJr8mS3gqnVrcz5UNIx/u6jxgtOJvL
         7j9jcCZWLp3iH3q5hYNTcO4keWQ71JW1gh9vP8YndF7mh/sei4Q5HgWuZIYZgRhNVADi
         kV8cypw6W5Us36ocPzCaFDTKFnnUtEuKpaDEo50oshwU324XPbFVy24qZ6BXkRKdjXPo
         cnEMCSNhcc5ehL0/SuyWPtZ2LW82mQ8d19Cs1Eax/kEgVAfuT4rYzcFlFT7qtjFPUP6C
         7rhgWSRZa+X7a6aWRSwJQEvsZfydgLz7Yzghe6Un6FAsBjYX+48hV5VFLdy1WcikNS4/
         aNZw==
X-Forwarded-Encrypted: i=1; AJvYcCXkLxoM2wVmH+Y6i+8Gg0XFoGtHYCMHKsC+1ylSzlSy1oF8SwuiZetkXL++4Kzqz1qA9vbLuBZxN2P6qDLv@lists.linux.dev
X-Gm-Message-State: AOJu0YzXRODd+XgO4L4Vd3gz6HJM729Lfpivvy2abXWfxLZuoW4FA8m3
	KnD54RW0cGK6ckO3ROb+N0XVCL8HF+SwSclATRnko8WBYPl7tsIAQ/yP8Dh7hZJi9tSNaG6rcA5
	Wvi3PuwSA1BU0DSofas8G6HSPjBrq8R3yeHlnAQ1Ddx+4wsHRc3wXCQiZrCMQ0N90c9YDvBo=
X-Received: by 2002:a05:6402:42cd:b0:5b8:d362:3f46 with SMTP id 4fb4d7f45d1cf-5c2caf33337mr1558405a12.35.1725443799061;
        Wed, 04 Sep 2024 02:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlnycoV76oDP9U5UM2YYaIAmUl0Ei3c0MAuEAupv04gX5cU6djy/efboDKaYePfle0+YiXGQ==
X-Received: by 2002:a05:6402:42cd:b0:5b8:d362:3f46 with SMTP id 4fb4d7f45d1cf-5c2caf33337mr1558377a12.35.1725443798497;
        Wed, 04 Sep 2024 02:56:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c73042sm7846700a12.33.2024.09.04.02.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:56:38 -0700 (PDT)
Message-ID: <8ed458fc-7a3c-4b1e-838b-0bc020e91308@redhat.com>
Date: Wed, 4 Sep 2024 11:56:37 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: Fix comment for the
 pmc_core_acpi_pm_timer_suspend_resume function
To: Marek Maslanka <mmaslanka@google.com>, daniel.lezcano@linaro.org
Cc: linux-doc@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
 <20240904094753.1615549-1-mmaslanka@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240904094753.1615549-1-mmaslanka@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/24 11:47 AM, Marek Maslanka wrote:
> Change incorrect kernel-doc comment to regular comment for the
> pmc_core_acpi_pm_timer_suspend_resume function.
> 
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/

Looks good, thank you.

Daniel can you add this to the timers/drivers/next branch please?

Regards,

Hans



> ---
>  drivers/platform/x86/intel/pmc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index c91c753b120e..e2b4c74ce7f6 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1209,7 +1209,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
>  	return val == 1;
>  }
>  
> -/**
> +/*
>   * Enable or disable ACPI PM Timer
>   *
>   * This function is intended to be a callback for ACPI PM suspend/resume event.

