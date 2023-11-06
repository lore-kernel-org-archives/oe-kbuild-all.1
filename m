Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271B2030D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4dsZfM3"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so3744021276.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Nov 2023 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699276784; x=1699881584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiUiGTDw2L16fzzzRKog25kYUOwp+f3RU1IqM1t1EJw=;
        b=U4dsZfM3cK5sC22+yOAdVIYon6lU/Kzb05usV0IkTawlhVHM5u0laFGSbICrxFhN1Y
         4TTZW8PYppgbUnciGr2INsKgiyH046z1+ssfYOsYwR/ocZ8R9mYmWVAsmiCOy5LmCSRO
         lZhyqt3w1XtnW2v4T1pjn0QD3dWoKJUndsHhFQxEwbZVDK1zzn9ECZbR0+ef0sPnJ1kO
         8LJKBtkD3gO2Z764kH9ePn9qaKTAKmSAXl904mLPXXrzTly8nq1Nw64u2TAcdVOucy7i
         wNwdBRDuD+7De8kpXQzLM03X+kzJIuBBNvuCm1swjff3Z9eMvqL1VVtkhrHsqYFk39wK
         HOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276784; x=1699881584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiUiGTDw2L16fzzzRKog25kYUOwp+f3RU1IqM1t1EJw=;
        b=km5AV+C3BLQ/inSRlw8mGZXTDe9S+v0ZrBrSLRL4kZfkuycwKX4g04fKtG5S1VYBdV
         xJc/GHWXyxy7vFJkl4hPL5bvBIRReGNvEAqKH+Yn3XcOJczIYaYHvPmwybhohPDR7sS2
         EZtUjHnxr3jif97X1xTiB8uNaApV4NGBI9E1huDFpPm+SxJvCvyl9CPfv9GLNropMCpd
         SkHi5TRKsGisgpNWumnUPQOLEYpU4c14uONGZ08wCpmt9hGQaCfqSedb6llb/Uoums62
         3EHFxXfXIxI961Yc70Jidznk7lLlNAdCftB0eS3RqkVeXQcE3NZbHBV1vL4bLkXsyIKs
         gPbA==
X-Gm-Message-State: AOJu0YyApgRqsbqBuIwyOYPpF4CqNFIAYxyE2yfCfuDBk85cVA7UlfHx
	RPU0boKsJu0uUxsMtTDGkqTj08Z4pqOajUG+/Zr76g==
X-Google-Smtp-Source: AGHT+IHgA9z2qIVT+0Ljt/yzsoxDF3rhQPeogx4ZqKR8ZqhwKwcPAyMLEL/eX7bIE/fWwhyKs/gIAgtXgSK5W+gTASQ=
X-Received: by 2002:a25:874a:0:b0:da0:48e0:ca with SMTP id e10-20020a25874a000000b00da048e000camr23268258ybn.29.1699276784527;
 Mon, 06 Nov 2023 05:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310182007.8ziiRe0j-lkp@intel.com>
In-Reply-To: <202310182007.8ziiRe0j-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Nov 2023 14:19:33 +0100
Message-ID: <CACRpkdaB390mn2s3vrVAhaY9Portxdzc8bVkM5F3DtVy-k-r2Q@mail.gmail.com>
Subject: Re: arch/arm/kernel/hibernate.c:29:40: warning: array subscript -1 is
 outside array bounds of 'const void[2147483647]'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

On Wed, Oct 18, 2023 at 2:17=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

>    arch/arm/kernel/hibernate.c: In function 'pfn_is_nosave':
> >> arch/arm/kernel/hibernate.c:29:40: warning: array subscript -1 is outs=
ide array bounds of 'const void[2147483647]' [-Warray-bounds=3D]
>       29 |         unsigned long nosave_end_pfn =3D virt_to_pfn(&__nosave=
_end - 1);
>          |                                        ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~

So the concern is that &__nosave_end  could be 0 and the -1 would make
it wrap around?

It still has nothing to do with arrays, I don't get it.

Yours,
Linus Walleij
