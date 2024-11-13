Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A041F9ABF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491888; cv=none; b=BWc5Dmb7sOepJbnTkPCmMDigVMq1IDVo0UlbpvgAkBC3TkHmeympulEE6SuFmy35HJ4S9QeTaQthQdX3w5lEPpKm5bTT/4Jc9A+acaAiUtzfZZT+o/PBiSLYsSyZutF+OzRZUCwWmDsMduP5UXjh/v+CzlINDSAGSYHXJWnzQ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491888; c=relaxed/simple;
	bh=zCFLEZy5aTA+4J3FIVz2N6opIz30miSPIvxPL8D5Y9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNw4PcUnZkUgKDqb+vNslUo6cmGLuHmgGoEcldpBIlS57WpuR9ryuex9CkiB5rHfYhbp60YsnOxKFC6RTJ/F61fVNPjY8s/ri/JuITFWt/54JEQc6dT2LSxpm2uMWXUScA5RIAPlyWgOwmh9C/cwaaaK+/tMbQr8W3X0fPFvbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5HY/n0P; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5HY/n0P"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so5426031fa.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731491884; x=1732096684; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fom8AqvF+q2A1nOBLnUjkUl0XPsEoa1C+RL1OWNsSr4=;
        b=W5HY/n0PAWjou0WNApKqH6XUhdYwFCNMpd39o5j8gdqdY36jDmcaHo4sTSxng9du+V
         mK0g6xUqOTz73kn/rW2YUuZjlt+Sqd1eKWMHJ+ia6gCCAGHgNoxdvjFxoF6MPynVjMyW
         ow/DYqWcnny2dbS5c9T5iudaudCafTMo4T6HyaS5i7BnB+ExOvkRCXHEW6ihQT+d4Zb6
         bztMrlYRGW+eRdH8p6ntRZE3qpr4+iXTIL4TlmjE5ilCNJKpN+1X3sFk7o2RrnwW7C7e
         X7Ql0u31q2apNFqzRajJjny/1E9NWQDHcv7peT5rhuUdQi3kfeagyY9DiCvdtsQaPoMW
         rslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491884; x=1732096684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fom8AqvF+q2A1nOBLnUjkUl0XPsEoa1C+RL1OWNsSr4=;
        b=R9hvdGfK9OICP6u3ZVQNhOmqn24Qw6Vza/G3xehAsPXCBXU02EFXjjW7IFWbA/I8Yv
         n3sxIB7LA50v8SHx9QCSpdQzMe18uwHUc5UMrkHzFu8jZzF8L+4K9VfskO7aDUnTvyg8
         hqavbb2uVlZF6MS6nSUrXFO9YAeGEUUvRNJyWlMcMeNkBffKWrU1TctC5si2uXaYowkC
         5eFPwvgnYg36uUZATyApsFwtLS4zWWp549xSJ1t+fjkoV/TgSQ9GEjTzTwmJU6LKRWwO
         RSbQhIjgJ7JzOsHqLNazBHocM+W4jOwRZ1C2AuD4hnImPgMa6bLWLZHvn0aB4TX9bx37
         js9g==
X-Forwarded-Encrypted: i=1; AJvYcCXCBM62FxnetwWuNHi1/JZa+O6AQdbTTelnHhou3N5tnehcYRFIKbBo4eQzxvKmntk603rNMGVyatUqCPmq@lists.linux.dev
X-Gm-Message-State: AOJu0YxL1bdNXYyIMrXx8CJXn3z6pHTwDeDQB4FM4+0aY4gUIbNOeQ6K
	7bcQLG1KsUHgIA+givBZT3QPb2PN1Orq1hERguHWVfm9UQyNgDJ0jA3TgTxhmjtXmGVIwBdIhqP
	m9pm/4C0nCgS0cRewNN9qhc25uct0P1rYv6C9pQ==
X-Google-Smtp-Source: AGHT+IFlkHCzFh0mS9soQneXfx9T2NE04g3UcKAj9g+gyGyGGy4VU8E216X14iovLQ7up0pQVAOI+qXIM5/G1dFksNA=
X-Received: by 2002:a05:651c:554:b0:2fb:49d7:8009 with SMTP id
 38308e7fff4ca-2ff1f4188b3mr66440781fa.3.1731491884375; Wed, 13 Nov 2024
 01:58:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411131732.BNe0iugn-lkp@intel.com>
In-Reply-To: <202411131732.BNe0iugn-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 10:57:53 +0100
Message-ID: <CACRpkdaQPqY+H0OxLjzOVDHSNS4TTi4weDDvLGs6OymVpjPNZA@mail.gmail.com>
Subject: Re: [esmil:th1520 2/48] drivers/pinctrl/pinctrl-th1520.c:457:9:
 error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99
 and later do not support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, oe-kbuild-all@lists.linux.dev, 
	Drew Fustini <dfustini@tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This randconfig is for Hexagon which is a bit insane to begin with but OK.

On Wed, Nov 13, 2024 at 10:28=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:

> >> drivers/pinctrl/pinctrl-th1520.c:457:9: error: call to undeclared func=
tion 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
>      457 |                 ret =3D pinconf_generic_parse_dt_config(child,=
 pctldev, &configs, &nconfigs);
>          |                       ^

This is because in this config:
# CONFIG_OF is not set

But HOW is that even possible? The Kconfig fragment for TH1520 reads:

config PINCTRL_TH1520
    tristate "Pinctrl driver for the T-Head TH1520 SoC"
    depends on ARCH_THEAD || COMPILE_TEST
    depends on OF
    select GENERIC_PINMUX_FUNCTIONS
    select GENERIC_PINCONF
    select PINMUX

depends on OF!

Yours,
Linus Walleij
