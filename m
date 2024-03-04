Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E796C3984B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550525; cv=none; b=Pb9urIEpQmH4ap/GwJU7RTAH73g6CWGm4NSgp+Ru0zk4fQPcdYQs7Sdh3xT4Q8oeG17fjw2Z2eXk24DnRGJzMTSznLmLlUg2AA5p/JkXmpcxZQoxcdqPvpj/ihuGrXoXpEZcmExbgP1G4l6Q3n0vQeIb3prF7DcsDf4qsuNO2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550525; c=relaxed/simple;
	bh=5Ni75zB70Cek0dgrqjXliuHLqs7oGNsHeKAy6oeSjnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3YbRjy+l4Pj98hcuOOuXRuiHtLVELW2nbyXQd9W6bRdh0XznGpXqC1HxML6todOUaKIu86E4m8VbP6RDIPBYT4s6YveoeOvV2+yFPEaAE14TgAnZga9Vmfmh+MSJlLabM2x4ZVIUa84bOB9ZWjtPo4Y3/lS8zNZHbhVt7XIMXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejpj6Y5s; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejpj6Y5s"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a4417fa396fso544684966b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Mar 2024 03:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709550522; x=1710155322; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4XakkF38dSoSGWZfunmCZBJpqQT1gByMvmkek2DU0s=;
        b=ejpj6Y5st0KnyAmrh4Le45+4Yra5q6No3IMHActEXr6YYQzOoxA3KUc+zjIlzrynU6
         Zdh+qy2qYOLf8zJk31irJY0gIxg1RFmAVHnFzMjsdg3v+XPhFWVL5PXJHmpAYKRoGQQ4
         KW3rXqjQ3pIdRxT9s9LSX9csfAtHDwsdWQVwMmmcNa3QcuL9e1J1SD0YdpDQjjjDpyUU
         +qNepWlg5VZqapiy4FQE6qiS4ju39aVfsbWS89mC3zRRqwt5MGmhbcQtPnvnqNUh9jHb
         VB++d34fqhDkOW8bKHN7dvB28DZGM0QpJ56JNZVh6TaezdPlTkGmd74+sWXQFdkPN16i
         VstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550522; x=1710155322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4XakkF38dSoSGWZfunmCZBJpqQT1gByMvmkek2DU0s=;
        b=q/gMMAgZEiqg6FTf8QX1t3+O6jqQHD1wL57MFnT4ifRkXN7u3a9HL8x/cEwnkyyuWB
         u8ZJ7hdkMskBPs0ZxD3eEfRBsd8PGJ2r6bDQhHQZ26PXmH5uYPUzdM0OOJlJkh/6Q+IG
         /luMXwbw2qTSFAXDtz7Iq4vjh2OoxZxEXuGupK2LhNpv+v5eyv9QJVnp/x7kWO1wIosu
         weFSyqCNlMaycyrwrirLL1I99SgWThE/FIekDoOoufUQz1aiVZs/0JvKftwPJFnfJ4RV
         Q/48symgj3ql0flp22JW3Qn9/DNV0denIwfp6HJUQ+QGm28P/e/4tzG5DnITSdkVDMPC
         xVUA==
X-Forwarded-Encrypted: i=1; AJvYcCXa9Y/TEi2xCvIBOmKE942vz+9+iFPlrsPN0ZcWKQBkQeRTEai9nsSKWbVvU6iZz/KGFhuvJUggukAwwyB7WfHVMCd0zYFvW58tByeXsw==
X-Gm-Message-State: AOJu0YwDvNVdtMCNQahz6mQ50JPZ6q31MpHeI1KjCcYKK1dra5Ccr9wg
	lnn7o43+BW22J7yJM/PjoBx14rmQYTIKgMfaQ7FJQr6V8z4GuyuI
X-Google-Smtp-Source: AGHT+IH/7THfo50sl3BYdWjiPzvNk/Rwlr18dSqq65BxX0RwEFp45p1+R7aS6+NKhxNxe0Bvf/OM4A==
X-Received: by 2002:a17:906:1385:b0:a44:f9a9:a016 with SMTP id f5-20020a170906138500b00a44f9a9a016mr3106691ejc.45.1709550522099;
        Mon, 04 Mar 2024 03:08:42 -0800 (PST)
Received: from gmail.com (1F2EF13F.nat.pool.telekom.hu. [31.46.241.63])
        by smtp.gmail.com with ESMTPSA id i23-20020a170906265700b00a44dca5f9c1sm2513288ejc.100.2024.03.04.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:08:41 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Mon, 4 Mar 2024 12:08:24 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Uros Bizjak <ubizjak@gmail.com>, linux-sparse@vger.kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [patch 0/9] x86: Cure tons of sparse warnings (mostly __percpu)
Message-ID: <ZeWrqNcbSFJrQddR@gmail.com>
References: <20240303235029.555787150@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303235029.555787150@linutronix.de>


* Thomas Gleixner <tglx@linutronix.de> wrote:

> A recent 0-day report about new __percpu related sparse warnings made me
> look deeper into it after I dismissed the report as bogus initially.
> 
> It turned out that sparse is actually right and all of these warnings (not
> only the most recent ones) are valid and got ignored. Some of them for many
> years.
> 
> The worst offender is an UP build because that maps the per CPU cpu_info to
> boot_cpu_data, which is regular data.
> 
> As a consequence all per CPU accessors which look like legit code and are
> legit code in the SMP build are causing sparse to emit warnings.
> 
> This series addresses this by:
> 
>      - Adding the missing __percpu annotations all over the place
> 
>      - Curing the UP madness by exposing a proper per CPU cpu_info for the
>        price of wasting 320 byte of memory.
> 
>        Even if the size police will hate me for that, this cures most of
>        the madness in one go and avoids to add more hideous macro mess
>        similar to the completely bogus cpu_data() one which should have
>        never been there in the first place.

The market of UP-only systems running an upstream Linux kernel is shrinking 
fast, so I doubt this is a real concern.

>        I know that there are people who think that size matters, but the
>        only things which really matter in software are correctness and
>        maintainability. The latter simply forbids to add more hideous macro
>        mess just to avoid wasting 320 bytes of memory for something which
>        is mostly a reminiscence of the good old days...
>        
>      - Fixing a few obvious non __percpu related warnings which stood out
>        prominently.
> 
> That reduces the sparse warnings in arch/x86 significantly.

Great - there's also the side benefit of reduction in <asm/processor.h> 
complexity via patch #2, which is great for ongoing work to reduce header 
depdency hell ...

I've applied your Sparse fixes to tip:x86/cleanups straight away, so they 
have a chance to make it into v6.9.

Thanks,

	Ingo
