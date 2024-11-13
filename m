Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5AC1F818B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492022; cv=none; b=iKofrxsYUOFWL02Walb1JAnENsaRgxj9trWQb95tDhret9vHqD5TrX0+4jOGHzbQgq1LnJ3sEwh8BXRZ5mDteKINEn2wl/aPrTHFtQ1aSoGYlz5k7S4sGzHQAX86BS77ygmjeTNA70qbTSrDg6Nl00FjB8mFUhi6xevurAVreeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492022; c=relaxed/simple;
	bh=LIvU5tNW+/0oJm+f/9niVMYphLVTnS/SNBk+BVXYH5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQJHUlkeqf8WCwkOcpvLQxEKFhl1Nyla2y1CO0dL+/bGmoPVvUutKrQNHXc2uePVgdeTY99HX6Z4ZArCWWW9A/PugbMhabnSsWLMPS3XWBm9J9VFuCCgMlWU023NyXsJ4x3hw4dPlhhPFyJNDRiPHIqqwiG9Ir6TUOhEKd91k1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=TxG7N2N6; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TxG7N2N6"
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0360A3F2A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1731492011;
	bh=RIlyKAED2/Pebj7hK/t6wh+TVPNcLQ9IVUUg67h97+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TxG7N2N6BpeGEYvhy6t3XkcNXFsgZv4HKfbt9i0ID8rVBW98kBZem7iGEGKZCJkrb
	 VvXi10E09NsxKLt81IZsJiMfbzU93cfQdL5GLdcxJj78Qr4ikBVrqLtnKOIdQplXqU
	 v5MWz6Lw4swtXyhekLuWPxDbbSqFBGLBo7AlQXOP7+Rvio0oeWyuSOoUbJwsXAPvUi
	 zDHQZDUr/eTz/Bo+HtX5x8B9WkVQp5ssIze5OrdyP8aZBPP/4LE6JnTrrehzHOzZrT
	 BnH+2Z4IzpYq/rjCTk8B6nSlwJUR+QQBmtW8ZjWJ752SHarNtbgul/32gfhhZbBhsI
	 21MN1KRvn+qyA==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-295aa269feeso501861fac.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 02:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731492009; x=1732096809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIlyKAED2/Pebj7hK/t6wh+TVPNcLQ9IVUUg67h97+g=;
        b=M3j/XJ0+dapWYFSySQMj6JNizwM14/PtEubwRpZO0ryc9MfY4FTKld220j9WDrDjl7
         czI1FCzq6xwh9uR985AhdZhJOhVUSoB0XvbedqwNC1KgSTGlHuQKg+ydBXqD0HoOWTAv
         0tgEsvnUhlGZcon7kkPFT6m+hC1JMjf3lLRIQUADMMChSWPZsU8zs9cmaraVfxZLc/XO
         CIHTU9qSOvl+FdliEhiAnqx8nhW7u4fytQVMITGvE7ID1yWbeqUvCAoqM9yM1VIo+Dbe
         P6BCJt7gQd2IN9mVx8klzwH3iBEYMY8CH3X5CAMKbmlYIPKgddIRJnvQ+6iq+hCnhuyL
         lWSg==
X-Forwarded-Encrypted: i=1; AJvYcCUpjUB3U6JJoUTHVdB5hl2IwOAWSuv6ED9wtmvaZTnLk/+rXT6ChM/x46tHklfSZLXYMcT+8LWJAwhY4G2r@lists.linux.dev
X-Gm-Message-State: AOJu0YyP6zQcM4GDDA9/fP8b8HpaOsLGz9jFoDENc2gigWijk0lFDEql
	eWzGGekIjUJyuf8+gH45QFCQ/mMkrutkX6k9bOQQPYjloJ/RR8t3xi14IGk6sKphjhvHqAOK9XS
	ZN00GSabaaW7Yv4ltCQgr1xazgGUtxn5rmYnBRy01Q19yc0MQAXbab1g0OB9Al6tYPCMkxAqPxt
	zvya0hhcSTgz0LZWPRDGlPjvuGE8NFQD7k2g8AHmDoQvlcsEFXH+DazQ==
X-Received: by 2002:a05:6871:4199:b0:277:f09f:9eb7 with SMTP id 586e51a60fabf-2955c2ec140mr11205548fac.7.1731492009656;
        Wed, 13 Nov 2024 02:00:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+eV8l3Mk8IGr408gsFD/85N8U4+9HlALrP0EkR9UDE0a5NQnmdl83VSN6FlBvGpYlH5wweeAWU3vf1ksGDsU=
X-Received: by 2002:a05:6871:4199:b0:277:f09f:9eb7 with SMTP id
 586e51a60fabf-2955c2ec140mr11205539fac.7.1731492009382; Wed, 13 Nov 2024
 02:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411131732.BNe0iugn-lkp@intel.com> <CACRpkdaQPqY+H0OxLjzOVDHSNS4TTi4weDDvLGs6OymVpjPNZA@mail.gmail.com>
In-Reply-To: <CACRpkdaQPqY+H0OxLjzOVDHSNS4TTi4weDDvLGs6OymVpjPNZA@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 13 Nov 2024 10:59:43 +0100
Message-ID: <CAJM55Z9N77gkuZdh3gFqhL5-NbOMmEYo8vkZeesmy0iBK1EkDA@mail.gmail.com>
Subject: Re: [esmil:th1520 2/48] drivers/pinctrl/pinctrl-th1520.c:457:9:
 error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99
 and later do not support implicit function declarations
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Drew Fustini <dfustini@tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Nov 2024 at 10:58, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> This randconfig is for Hexagon which is a bit insane to begin with but OK=
.
>
> On Wed, Nov 13, 2024 at 10:28=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
>
> > >> drivers/pinctrl/pinctrl-th1520.c:457:9: error: call to undeclared fu=
nction 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration]
> >      457 |                 ret =3D pinconf_generic_parse_dt_config(chil=
d, pctldev, &configs, &nconfigs);
> >          |                       ^
>
> This is because in this config:
> # CONFIG_OF is not set
>
> But HOW is that even possible? The Kconfig fragment for TH1520 reads:
>
> config PINCTRL_TH1520
>     tristate "Pinctrl driver for the T-Head TH1520 SoC"
>     depends on ARCH_THEAD || COMPILE_TEST
>     depends on OF
>     select GENERIC_PINMUX_FUNCTIONS
>     select GENERIC_PINCONF
>     select PINMUX
>
> depends on OF!

Hi Linus,

Sorry about this. This report is against my personal th1520 branch on
github and I forgot to pull in those fixes from upstream.

/Emil
