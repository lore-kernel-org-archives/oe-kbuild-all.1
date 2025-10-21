Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8E2F5A30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053009; cv=none; b=i1DVi7Dtzyi91kBZJcm0HX781230hmWIJiVFL+vc/IcZVV1uu6Zn2usSLhL6fA9Pd1uyx2tateHnh+YqX503arziYcaoXho7Exun8WLXHmOw4uJxQOra7Vse1p5ZQgNy3P7fOqq5fudxvcipr8n9b2unodmsBddESPJ6d7UXfu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053009; c=relaxed/simple;
	bh=toIUqLwZmZCeEPECiVK0Wft2nR4FGOf4cwcze/4k3QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=We9InYvQsQZs6yb36lJqS8Toq7Mo8uFrdYw5dXqBjhc9mWsfxAvVkPQlrhaTIAeS1CzCDD0wivWrsKe8AbvZ0pPhlZ82SMQ3nE7OWINH81Xf8vwrhy+va4SBD6ca69mlJtcKd1IVtk/p5mGx+x6aQF7nndDWNGXnDOyL/g46t14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xzSYNCF1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xzSYNCF1"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5818de29d15so6594171e87.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761053006; x=1761657806; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=910slYD1qTlLwbdq4G7OKDCvXpMS39lt//h4Hrqd+P8=;
        b=xzSYNCF1iK05BSbnPMKouULCjdzQE8S9pPgwxqt537B7IP426l0Sdl5tIQG6BeDpGs
         0yBtmjsRhY4Wqqn/r1hiSS3cWgqGQwKPP4vjPZ0lOjLtnIafw8+LjMIeoJeeI6y0tzWj
         ftEHeSBldMyCQFGMDbqtTvLFJT4EBFo2lIgFW6fF5SpC8LRcBhFr0L2UkmVv0sbP4YER
         Rt1VpMH+wcJt2Fv2Zh3oSSTZ9WF12Ycs3sTqVs1mqmCA7PFs7x8WiIYNevsP0NgnUeL3
         kptk2NoUA45wdKz4vKfhBQyRn2g5raiBdSHcJSwGPgTlLKQSyK8HI5u0ccXnAvJzwtoj
         vXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053006; x=1761657806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=910slYD1qTlLwbdq4G7OKDCvXpMS39lt//h4Hrqd+P8=;
        b=rqSDHZaeO6C8HVxJac/OcEHQbLxJF2bpeMt4rMxOPugCHN/dKGMdD+g6QwF8QxHoU7
         ygLTnxApK45t1RqbHzpVCWx0Os+wyLtUA+CpYEd3iSMrX4tNUaRU28g5zCrTzbmlRuP9
         nOC7Wu/2PLSNLIPxprAgttIBxdz6Snmxl+kRUaUFlyotuT98NT+gsinpXHrismp8SoQ0
         gZcW5MuSXkmhd1EJaLie9Vmiwpmg2bCXFLhh7QwuuhwlWmPvom36QLMaabadoI+3qjMG
         UPJqLs/YGDWjnpRIrT3KQhj4FiP/uBsaNT5EavlW3nS5KIMlBN8Mj9dmBXuA1Jw38COC
         C2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM4SnUJat4bn3jNyHUKqZWYMe608q/++iyWEENgd/HvUhFNb2yCgLQC2mQfQWgxLO5MPe8CvkOncpmN/Di@lists.linux.dev
X-Gm-Message-State: AOJu0YwDFqg8UqOhm+0U70foVeBU5emHO+fPlbKTepnd8EQ4z5cOy3WE
	4R8zPeaewYZ2VFPHgS2HjbMU2ZiFpP4Yv0ou8urUe8ng8naSaoOyA93ICFRUElgoPBBYOtdMUc/
	wpwOAJnytPD/2iEcXZY5tz083hSA4PtcKN/HzPsN0kg==
X-Gm-Gg: ASbGncthlysxUHfg0ioMe5cnj6EaT5BuUjLS4dYGiUvCAkfEI2xQr5lxqbcHDHYOpKV
	tXTwl8MnkapuZK3RGrK6ODyEjgAzTYZoSGlJgA8li1YgxKKcxt78FCG4oS5b6V/IkeSzAj3laJo
	qrtqZ0h6d/QHOLR8yydX42CADjMg+GAQibtzl4NhUYxxGSzAEQ0J0H0jpcu8eJiqPPPKpkdtNr2
	pc8kDf4hQys2vSzZpqr9nJ4wpLaOfMBZ/+VmxXR3k9lfeirr6B3t7acj5fG6eK9U39HT4t46eKy
	IXClCdh2UDxnALZkS2ktF/8LGnE=
X-Google-Smtp-Source: AGHT+IGYI3DqQ4zbbJwUL/CeEWraJs+dfp7z45elyhO+pIXAXZSVk+3PCJXiABvpRNO60LJmHCSehwXQMvZ1P8MMqAs=
X-Received: by 2002:a05:6512:3e27:b0:591:c2f8:9a5d with SMTP id
 2adb3069b0e04-591d8550757mr4491922e87.20.1761053005758; Tue, 21 Oct 2025
 06:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510212126.mVDMC2iC-lkp@intel.com>
In-Reply-To: <202510212126.mVDMC2iC-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 15:23:12 +0200
X-Gm-Features: AS18NWDgfASnhaZdFuEsT7SP1bRkacfbmrjWAZrTy9QrbqvoKCtL0cgU_vFcp7s
Message-ID: <CAMRc=MdTffE6Oh_n0AYBEdyccN6-5FffxDZp6u037Yz9Khj-bg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-current 3/3] drivers/gpio/gpio-idio-16.c:170:20:
 error: 'struct gpio_regmap_config' has no member named 'fixed_direction_output'
To: kernel test robot <lkp@intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:17=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-current
> head:   0d3f95740ced3acb6171cdec8c5bef336b0cabdb
> commit: 0d3f95740ced3acb6171cdec8c5bef336b0cabdb [3/3] gpio: idio-16: Def=
ine fixed direction of the GPIO lines
> config: x86_64-buildonly-randconfig-005-20251021 (https://download.01.org=
/0day-ci/archive/20251021/202510212126.mVDMC2iC-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251021/202510212126.mVDMC2iC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510212126.mVDMC2iC-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpio/gpio-idio-16.c: In function 'devm_idio_16_regmap_register=
':
> >> drivers/gpio/gpio-idio-16.c:170:20: error: 'struct gpio_regmap_config'=
 has no member named 'fixed_direction_output'
>      170 |         gpio_config.fixed_direction_output =3D fixed_direction=
_output;
>          |                    ^
>
>
> vim +170 drivers/gpio/gpio-idio-16.c
>

I removed the offending commit from my queue.

Bartosz
