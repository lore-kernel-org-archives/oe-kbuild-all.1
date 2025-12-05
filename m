Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855733043CF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764926648; cv=none; b=BSM+UTkSAxU9xrEXjoi7i1Z3JIQEufla0YSBZiGusGnDaA+ikXGEv/DY5OSgLsoQgZbaSvEzq8pGGu/jOmSrydm9MJIrkQp7ZSz44rR1drHD0CnZ6LyJ+B/QmIJH71Dg9R5y12Gzj5WiXmIDAd9rglySdQvOBkxtRopxJaGIKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764926648; c=relaxed/simple;
	bh=Agnrt+zlXfqAyBkX1umXQhxb4bDtHR8MlYVZIicHX50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aop0nDC6V49XEa2Jdubhmc5S69L2CXcFOWAVAS09P29eIQgrDxQUMzMcIR7G/zvmuZDg4pxI1EVZhJDBny9DXVMls2juNc119kymm+9lIizDhTkccB4SgDWFBa8vEinN1IgSknDV8GyVBuBADaqAduCvBONWYUnEJpGSj/uklMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=feaLzurC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="feaLzurC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso1364916a91.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Dec 2025 01:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764926635; x=1765531435; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Agnrt+zlXfqAyBkX1umXQhxb4bDtHR8MlYVZIicHX50=;
        b=feaLzurCHIWMq4Em7DHmZjl6c83OjVyaJcnaNOqZYNDus3/L3Bg0jqQrMDCJs0hI5p
         7+LChbB1ARkITfJsx75hFKGsGWUdASk6qn55hgx00xelyhGNaS904QqOMoknojtYfPuf
         PzeTny6amv7j7J44MUhu1SXscDVlTI28LeEp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764926635; x=1765531435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Agnrt+zlXfqAyBkX1umXQhxb4bDtHR8MlYVZIicHX50=;
        b=XuCt00shyc4z70jgZS2Tzwu0OM482kWjHh2jLePEnmNzaBnGyjbGqcfxGaAV45OAAz
         7Pe2czTJKrB1rFGDN8T8ivFbuX+2lK+sSwoTSWTrzlje63oboPkTrB5TYyS7Wa96QB3C
         TiPaF8zhtUTClIB74Tl/K1sWOH418JxfzLkHk80I8BOkL/6LtrR3GInTzfab0O3Tw7JE
         fxTzv6YzQ8i2OecZOuDu+IvQEPAQATtNvDsLiRiiUYZkgOmOuMhFAWo69aOXudZs8ULz
         wI9oYWJ62+K1BXOUhJJqHkhWK3ooPLThUbWwS+D8rTzYtRbHvkr/b1jPOavLatj/w8Sp
         OvZA==
X-Forwarded-Encrypted: i=1; AJvYcCUMJYeJtagC+dc676guaRdHQYRuFqxzH1M2nK71sLPgMIR1QFEeOtlfjZwtnaPKrcX/W+s3DygX1rU2hlsP@lists.linux.dev
X-Gm-Message-State: AOJu0YzuDgHXvHgRc42+/ZFZaTdRMxCY26v83BLHegH5MAmJ3C0kLJvT
	dqagK4PiLjd24FgR5BAQddwhseiN93x/LyiU7S8o4PhJfrNOrSi5N1hZKGZFN9IPk/2W//K9M+k
	d/aV2hfJbLLAicDZUeADc3jXFBHFJ5XLclSvrw1OyOg==
X-Gm-Gg: ASbGnct0oneWq15KCJY+4ce24362+VjxMh7ZUhPljbVIo0zz945VODmrrIXBSn27ZuF
	etaupjSV3ZMSVRYYjXt0l/NqiuVMejXaAMT2Sezq3phnyDI+tTxhWzQulqCxqCeicpVutbd2mDP
	ikfs1FDgotaz196/FqUhcZHYakw/OogL/xktG14+iRSrHkiGLkjt0/ErZDeq87oN74rRp5sO6ro
	POWtrXTpPCaGrClDactGL5puxobuMArlf/CK7X019NtG3bko+Cq1CxqSrm4VV8e8TftVlvy
X-Google-Smtp-Source: AGHT+IEOw548MdKMTZftyNVZPELqp1JrFaodVAmVB/fkgKWTaXcotXK1RdiGGFYAXIcc8rN7D2IA8hJ4dWve1WZENI0=
X-Received: by 2002:a17:90b:17c9:b0:33b:ba50:fccc with SMTP id
 98e67ed59e1d1-349126c8597mr9590835a91.18.1764926635516; Fri, 05 Dec 2025
 01:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
 <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
 <CAFr9PXm_8Lyk5rPMWw+mAzu97RRfjLj8NLqz5K0Po4p9PM6FOw@mail.gmail.com> <aTFbI1RKsbEdR2Ph@yoseli-yocto.yoseli.org>
In-Reply-To: <aTFbI1RKsbEdR2Ph@yoseli-yocto.yoseli.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 5 Dec 2025 18:23:42 +0900
X-Gm-Features: AWmQ_bm95y55GKRm-h806Gi4jrC-4zbAV_U9EVI2cghncO4ejB7hseaz_ZWKUyk
Message-ID: <CAFr9PXksr=JaO+0gXRoD2zBH4YCGwm=sDqaVb9v0_b7u9=+2eA@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	kas@kernel.org, mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Thu, 4 Dec 2025 at 18:57, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> It would be great to have vDSO at least for sys_get_thread_area() ! I
> implemented something, but if you already have it, please, submit a RFC
> I will test on coldfire !

I will try to clean it up and send it. A very untidy version along
with other stuff I'm messing with is on github[0].
You will also need a patch for your libc to use it. So far I have
worked out how to get glibc[1] and uclibng[2] to work but I haven't
managed to get musl to work yet[3].
Note that I have no idea if it's safe to do what it's doing. ;)

0 - https://github.com/fifteenhex/linux/tree/m68kvdso-20251201
1 - https://github.com/fifteenhex/glibc/tree/m68kgetthreadarea-20251203
2 - https://github.com/fifteenhex/uclibc-ng/tree/m68k-vdsogetthreadarea
3 - https://github.com/fifteenhex/musl/tree/m68kgetthreadarea-20251203

Cheers,

Daniel
