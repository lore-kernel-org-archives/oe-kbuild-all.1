Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A612690F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157088; cv=none; b=bgEP6BX5mi0hUzqcAfgxzZaflTp3rDeP5bYs2xJfmLShd10+Zz7uogOC6sr5Xgmw6ggLb+Cxd0qdShsEOIjTnWYNNmwdaadgoxdmBop8UkIQudsGw4b5YArmRYIogqfgQvJkHATrtwI3YkvjmqKAvuXp8YKn9kjZcXswi8rUQxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157088; c=relaxed/simple;
	bh=eHEaaFhWxmpGZ6BsDeM96GhyH+Ja0jrZRAEmjTePpyM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djBuUbGrEquLO/nbRu7p+6vTC6h3J2piXF/QQHBjn0JuIqQSNDY2G+3mHRlxWEsAUdV4rd/gQAQGB3C8R3dsro+iTRtc9WsA/N8gRnDFd2nskkgTRtYkMaUNIZCVvdO5VBW5diWF5l3abK25bxAAR1OPeww0lZE4t3XEun4cNWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v/9cVAWm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v/9cVAWm"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce509127bso495215e87.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755157085; x=1755761885; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Lxf11oo0rXpVqVkWAC0Lw3oNWPIq9I531Yo7XQFWo=;
        b=v/9cVAWmU1dGfBU9iF6LOxgz4vyzpXB/sIO0wW7PIvnaPg8ukZuqPlF1ZbK+8VaOJa
         Iw+vPdsBXbJAjqbEbUPT8TPGRacVHubi96qqHo31B5g6lYoD4kSleIgb3IwcgZjYZQ9z
         r9PlKf+Oc1w6s0XjvkryM+HhYiR9ZtsDjprzeQxv0EQ9jwcKJDZMHo8QiKRODfU2C2Dj
         Bw+7/Htm27lyvLefZttPGg4klnVmygUir9/sj9jGUM3sS/0d+n1REb3swBfnlv/vnqRx
         S35TwbhaFhZS63AXzqDFJTk/vz4DtouRuv/gAsUaoSvBqNpc57M4iWBhidNBUxCwc9rC
         E6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157085; x=1755761885;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Lxf11oo0rXpVqVkWAC0Lw3oNWPIq9I531Yo7XQFWo=;
        b=ZszL8NBvaCstZM512YUuwMxx7KDrO5Pwk6y+yYkXg5GI6thrAKoxxMyEH4vAVKEJKR
         vyGo0SxhfLBPUePv+NU4TfuZk7XSPkOGjyxQRzrvF668QL25tzyXPpBzIS0WmiV/EqMT
         0OZ/+yDGVsqVRLiF2YYFTyIjAc1UFKwYpk22togDCw72XgMh6f8dEK2scJn+p4p7Qi2F
         JTnM0sjakHNkqTfcYMQbjEa74C1eI7mkmNQbe1KQjvWd/nm2j3rp6uUhWpokKu910lqk
         k0n3euw3Jr/iztDGdfoS9zaYE850Xllox+jd2LxjuiIprkKIwkM9jg7spcD/PEDbAgAs
         glRA==
X-Forwarded-Encrypted: i=1; AJvYcCVvJAAaKpJo2PQMLcU6byO/JSfEoq3w/IX8WMtUbMHNj9c/6HvdZG78YUAuAfQMf6mTltF2X6QqTcrdKpdj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Fgkkx3UbbP8mKsIYB29SNfPZChnrDdDVTp3qsa8o/A0X4EFx
	46BRzRED0JmMYPToyPSDlm3ynURv+3NAxlR3MJqD0FTXfQkUPymIoVFeK38fpzpZEI7Ic0woGZy
	r9SJOGNctfo0NqQ7nw9wO9lIIptCQeKf+KUFFPv+YgA==
X-Gm-Gg: ASbGncvFzg6oA6cL1L8GewhqIhPTuMQQmkpLDmGoXOOCRYZcQWefzX6rBLJyJm60FWy
	JGr3C/7L2T+ZOxHBRepvV3gzTUaJgtdA4xcA7lcaZeHbLuSIXG57fNQly2AnxnVklBwuEYzRlKe
	dwuWiN9cGm7maMFHPOivPAEP3H13HAkQW2fodJdg9O6kaf5oTIfBhxtxqmzg/tzz3taCOxwZiOj
	lRc8VmXVgYQHzTkos7avD+jy4yrnwlrYCh+Zv4=
X-Google-Smtp-Source: AGHT+IG9Sl+u2grYbtl9VyHR7FB/EIlQJH9069FCUB+rot4YASaNIAY4/eCkV0SN9BOXHpsLTMBv/3IhK6/GlJjDcdg=
X-Received: by 2002:a05:6512:1443:20b0:553:2dce:3aad with SMTP id
 2adb3069b0e04-55ce5032e9dmr473870e87.7.1755157085087; Thu, 14 Aug 2025
 00:38:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:38:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:38:04 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <202508132044.XYcvSpm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508132044.XYcvSpm4-lkp@intel.com>
Date: Thu, 14 Aug 2025 03:38:04 -0400
X-Gm-Features: Ac12FXwIeOZwq8h4NYacnkD7oHaEb0grLTUUlutgQw1Q4iS255cFgjytfxzGOEg
Message-ID: <CAMRc=Me+5CSzH0bO=DvMvzdm9eAGHJpz=9NK=O8_E1gVXRvnUg@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, oe-kbuild@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 16:17:12 +0200, Dan Carpenter
<dan.carpenter@linaro.org> said:
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/devres-provide-devm_kmemdup_const/20250812-170336
> base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
> patch link:    https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64%40linaro.org
> patch subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as requestable GPIOs
> config: um-randconfig-r072-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132044.XYcvSpm4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508132044.XYcvSpm4-lkp@intel.com/
>
> smatch warnings:
> drivers/pinctrl/pinmux.c:96 pinmux_can_be_used_for_gpio() warn: variable dereferenced before check 'desc' (see line 92)
>
> vim +/desc +96 drivers/pinctrl/pinmux.c
>
> 7cc4e6b0e4ddf6 Andy Shevchenko     2023-11-29   88  bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
> 472a61e777fe78 Stefan Wahren       2019-08-14   89  {
> 472a61e777fe78 Stefan Wahren       2019-08-14   90  	struct pin_desc *desc = pin_desc_get(pctldev, pin);
> 472a61e777fe78 Stefan Wahren       2019-08-14   91  	const struct pinmux_ops *ops = pctldev->desc->pmxops;
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  @92  	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
>                                                                                                         ^^^^^^^^^^^^^^^^^
> Patch adds a new dereference.
>
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12   93  	bool func_is_gpio = false;
> 472a61e777fe78 Stefan Wahren       2019-08-14   94
> 472a61e777fe78 Stefan Wahren       2019-08-14   95  	/* Can't inspect pin, assume it can be used */
> 6ba2fd391ac58c Alexandre Torgue    2019-12-04  @96  	if (!desc || !ops)
>                                                             ^^^^^
> The old code assumed desc could be NULL.
>
> 472a61e777fe78 Stefan Wahren       2019-08-14   97  		return true;
> 472a61e777fe78 Stefan Wahren       2019-08-14   98
> 5a3e85c3c397c7 Mukesh Ojha         2024-10-15   99  	guard(mutex)(&desc->mux_lock);
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  100  	if (mux_setting && ops->function_is_gpio)
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  101  		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  102
> 6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  103  	if (ops->strict && desc->mux_usecount && !func_is_gpio)
> 472a61e777fe78 Stefan Wahren       2019-08-14  104  		return false;
> 472a61e777fe78 Stefan Wahren       2019-08-14  105
> 472a61e777fe78 Stefan Wahren       2019-08-14  106  	return !(ops->strict && !!desc->gpio_owner);
> 472a61e777fe78 Stefan Wahren       2019-08-14  107  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

Thanks for the heads-up, I'll fix it in v5.

Bartosz
