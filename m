Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D919F19ADBB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727774244; cv=none; b=PAQQNGEVPWPZEeE10hj9OqwDdyv8emRr9JQADaCxCbS2c8J9a/w87rsUOUMlz36dNIh5HaRu3mZqqbV/7W1xU84mKYGIQf8aMRYWurxVSrW5PDg7NndH1H/lFKh+i4OVpwARAxCmOTvFPDwnaPbnWdUF5KWHr8h1ySsjb8loDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727774244; c=relaxed/simple;
	bh=aC2RZcT9lHrXUU9dIlBlGptabT2MAuKp0sLJYRKM2to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IG9Vwer8BirLx1qjvjRWaSX5Rt8TMQglwUWoJIQQLIt2NyOck2X5/I6asw4ZGsECOw8b5Y6PaVTQymHkOhRf3gryfldR7cAERSxrUXaJlpTw0WzJK9iJ2s7MQHIjufaD5kaGsT6ulalnncYpailIaEu66CznfIQq0Eunsp4d014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kQjJuU5G; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kQjJuU5G"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so4178686a91.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727774242; x=1728379042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us9teco+BOfBOtKeZA4Z07H/40ek9mhAq6A6YSt9qwY=;
        b=kQjJuU5GAw6OND7TvIvtDg8IyKnDhNPwj3OC4+muZ7EXxnRaOFNFJqPQiiXro6gjlc
         GSBSBHNS4Gj9oAjjf4eVoe2Ew4Xaqkhf3JAJRCHGzNtdx+mdf0QS86RcAWvwkx4I8hoD
         2j+Amcsmzh/wbnPJu3bvW2x5S1Daj8U2Xwn8Irz8Pb5LgTW4b7J5aFkzzoe+mPhjeKNJ
         jMhViMVnQS4IHaHtsAURzODeJwvleFhUlJ6c1E5qEmH9OeQAGE0taO6ccH8A+uvbaoSB
         d6Tu1+GZ62oeg0D/5Es7zXi+y2bgcnsXAhOMXa3+zCWxvHik7jpAdtpzSC9qsq/Bvop/
         r+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727774242; x=1728379042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us9teco+BOfBOtKeZA4Z07H/40ek9mhAq6A6YSt9qwY=;
        b=iKyd3xn7ZFsWhMZhyiKgO5bdREzhGddbGjsAfckJS+s1SI9k5ZoDj4wYZ2wrGsJphM
         2ORxXqwquYPAXlVwYD71V7cIkwJaMYms35XGYn8XbeYsSMj9v32NpeB19r954qoZz9HV
         zFcMN3V5IgP3/ctfdwOii+9891HGi7Ky55q//o8eO0PEtQ53Y6Fe6PH8dSOZHpGTaRx2
         YRNR8X56zvDJurVtihLmhA4HoRRAMr8BzXJ+08VqLZ9Ucb7YjXm4qq7kOBS3S3BJMRCe
         ClL+3Vit4t7c3rv1Xy/7Vtj7ZfNbe0PsKLT7LdY8eoM0+Ei2Z4RXP7GN9CtC5d9bYqWq
         yJww==
X-Forwarded-Encrypted: i=1; AJvYcCVjDfpper5+Yb+H+Z4vH0K6oeE9reJoHApeAI1U8OLSz8rGByh+X7Rv37ezJ4yy6dYXw5hq6W3bYfdngyKW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwli1HNKo7tOcPx+NUPC5ImK+ik4FQaqo6wP7QYpD8grR5lZu9
	KYOQuatx+m0ND5yNGX4CaNS4QvSvo3VNCTf3+o+udkrOQxi2+V0BFqO7537ZYHUxL4d/UQkygl9
	sv3m0BxLWtHHGi3edWwaf9FfWGhIzk6y/lY62yg==
X-Google-Smtp-Source: AGHT+IHYkAg4UVKRyo4StwzqLZV2DXAq21p9Gnn5Bj77LYfFpKaPnaCsICz4KGajnf7wmJq3yUvb2lm9cbLTWxBNDgQ=
X-Received: by 2002:a17:90a:b396:b0:2d3:bfc3:3ef3 with SMTP id
 98e67ed59e1d1-2e0b89de3a8mr16356647a91.12.1727774242256; Tue, 01 Oct 2024
 02:17:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930115116.54626-1-brgl@bgdev.pl> <202410011000.hRJ0JPdV-lkp@intel.com>
In-Reply-To: <202410011000.hRJ0JPdV-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Oct 2024 11:17:09 +0200
Message-ID: <CAMRc=MeY_+ZvEgiNegxD012i1NaFN04=8LTzwyUWod_9TRXb-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: davinci: allow building the module with COMPILE_TEST=y
To: kernel test robot <lkp@intel.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 4:35=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on brgl/gpio/for-next]
> [also build test WARNING on linus/master v6.12-rc1 next-20240930]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpio-davinci-use-generic-device-properties/20240930-195251
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> patch link:    https://lore.kernel.org/r/20240930115116.54626-1-brgl%40bg=
dev.pl
> patch subject: [PATCH 1/2] gpio: davinci: allow building the module with =
COMPILE_TEST=3Dy
> config: sh-randconfig-002-20241001 (https://download.01.org/0day-ci/archi=
ve/20241001/202410011000.hRJ0JPdV-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241001/202410011000.hRJ0JPdV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410011000.hRJ0JPdV-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpio/gpio-davinci.c:652:34: warning: 'davinci_gpio_ids' define=
d but not used [-Wunused-const-variable=3D]
>      652 | static const struct of_device_id davinci_gpio_ids[] =3D {
>          |                                  ^~~~~~~~~~~~~~~~
>

Weird, this doesn't happen on x86 defconfig with OF disabled and W=3D1...

Bart

>
> vim +/davinci_gpio_ids +652 drivers/gpio/gpio-davinci.c
>
> 0651a730924b17 Devarsh Thakkar   2022-06-13  648
> 8507f35447e6e5 Min-Hua Chen      2023-06-09  649  static DEFINE_SIMPLE_DE=
V_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
> 0651a730924b17 Devarsh Thakkar   2022-06-13  650                         =
davinci_gpio_resume);
> 0651a730924b17 Devarsh Thakkar   2022-06-13  651
> c770844c3e30be KV Sujith         2013-11-21 @652  static const struct of_=
device_id davinci_gpio_ids[] =3D {
> 0c6feb0796ea64 Grygorii Strashko 2014-02-13  653        { .compatible =3D=
 "ti,keystone-gpio", keystone_gpio_get_irq_chip},
> 6a4d8b6bd27932 Keerthy           2019-06-05  654        { .compatible =3D=
 "ti,am654-gpio", keystone_gpio_get_irq_chip},
> 0c6feb0796ea64 Grygorii Strashko 2014-02-13  655        { .compatible =3D=
 "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
> c770844c3e30be KV Sujith         2013-11-21  656        { /* sentinel */ =
},
> c770844c3e30be KV Sujith         2013-11-21  657  };
> c770844c3e30be KV Sujith         2013-11-21  658  MODULE_DEVICE_TABLE(of,=
 davinci_gpio_ids);
> c770844c3e30be KV Sujith         2013-11-21  659
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
