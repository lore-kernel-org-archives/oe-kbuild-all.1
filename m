Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4371E22FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066092; cv=none; b=eMzz7u7ApK/ZOlAgiJKkSqhYSaW9s1Wa+sr+5z+YLIqaj5cq4u9wHmsRaTTYCrDo8ZBpeeRVBxa0rmBe2vGDgDOTqh2654eLTrMotS05X3YYyofakKE97/ZvsseKZ2SM8vekkQxnrEpoKgyIfmSdvMr9Tvnytf01qf5ntxdj/78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066092; c=relaxed/simple;
	bh=uY/iMbf3Vk3sXbHtDhy0LKeHEHnsP2OiGaIvmYFRXgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWmkGTSP4XE4Ls3ecqfnBo0gvtghcndo8F5FCcIGVkGXyqHpGBtAyR+Ib0X4rDQ9jTVn3JDK47BKcNEnyBbb2oG058rq/cghNKqKFgLkHgPOsVntbXXsFTOXkbtdlo4yHWc+x5tMDdnU2mDUQ8RIuJB9SaFDy3Ddhr1649qQKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxu4vtpj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxu4vtpj"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb3110b964so17730031fa.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Nov 2024 03:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731066088; x=1731670888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXSvbTMRrcj6fCxF0ufHCuWCloLz1hIjGxoKK8AG/+o=;
        b=dxu4vtpjhmA4FCQ4ve/1Y53/UsWxfiC3GtAq9Rb1kRDeYXqFDBkuj9bqK5KgibRvXZ
         6GTe3FdicNGRo1Iy2PU1losqW8DHAzNsRtQBhyx7dab39rPTKQrp5/gwWRSAijyx0aWx
         hCjOL3orXHWwaT7zg35jeRhGGlubYFERTkMFz2x220ZfYtgGvewEWGkaEXFH2HTGmtog
         WactoeiEzHKEBAQhpBBnobyjKjtPKwWZ+HaqUWpCkN0aDrlAUO0TS759pSa4i5rEyAPh
         iJVPqyZHASX1zZCP6auwr7fK7VWxtP3+kk57M1nNBbftf1CZW1wR8Iqj3/1/uR1QWs9c
         i+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731066088; x=1731670888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXSvbTMRrcj6fCxF0ufHCuWCloLz1hIjGxoKK8AG/+o=;
        b=WFYCZZiayTSpp7Yu83ib756CbkCwdXJZi41Fe1htEPZSf3y4o36yJk1j13hPySOvDw
         0po2xeX2cHJ6IXR0bDuoZdr2iRt8LJThyU/TFzP1LU4CfUAEFm1k29yR/gMWXvVw0kOX
         2GH6bDg15n+ODYwLFVWn2bsPccNLMJBUJv4OtLj3U+/8mysZ3mW9OB7+Drsk1YZcz6V2
         Yym+1/kS7qg6Jkn0XJy/QvPtuwEq6d99Aswkg41lO8VFtMjN43sMo5uo4Ijp5NBK8abO
         qRffX00pgpc+l6xK3vdvWw+9uzz/uToqio4spGPXSemnSUtQOrBtAQd1gtCUMgzCebb/
         eAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrzjOfCpBbyURJ+PGTuM6oL2Radd+1jvq6D+4Kxg9czy2WygsrEBwhuaPGnEEWOtV2M3O+sDwdE8b/6snq@lists.linux.dev
X-Gm-Message-State: AOJu0YzSTfdUnlMxG9UwdHLFZhgvQFyJdGB8oMdNnHs7Ab+PlJwSoD4O
	3I2j2Q1SbjCcJUKOKLNWCDFDIa1c5BhcxPzVPrbmc4Dh3hVbT/Dm7GUb7kVLTHFYiEY/VkXBsOG
	wgKNSdxGnHP014+M+guGAXvzlAzPWdFEVXABa1Q==
X-Google-Smtp-Source: AGHT+IG6dsbVHDy06kTkj5zAs70A2/MyWRJqE/mKAm1qvOYLwYQg1hL1cr+88CsDKtRlIRo2uCMtTHRVmKF8kaDiYQk=
X-Received: by 2002:a05:651c:1515:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2ff20185abfmr11928261fa.10.1731066088370; Fri, 08 Nov 2024
 03:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410301531.7Vr9UkCn-lkp@intel.com> <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
 <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
In-Reply-To: <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 12:41:17 +0100
Message-ID: <CACRpkdYQ6Pfn_Y7FJh7MV2Mb8etDXFCJEUrgq=c3JDxkSPOndA@mail.gmail.com>
Subject: Re: drivers/net/ethernet/freescale/ucc_geth.c:2454:64: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: kernel test robot <lkp@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, netdev <netdev@vger.kernel.org>, 
	Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 11:30=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:


> The problem is the __be16 in the function prototype.
>
>         set_mac_addr(&p_82xx_addr_filt->taddr.h, p_enet_addr);
>
> p_82xx_addr_filt->taddr.h is a u16
> and out_be16() expects a u16*
>
> So the following fixes the above warnings:

Ah you are right of course, thanks! :)

Let's wait to the big rework you mentioned to land and I will try
to remember to revisit this in the v6.13 kernel cycle.

Yours,
Linus Walleij
