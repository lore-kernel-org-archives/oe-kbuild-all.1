Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3190A21CA1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739525064; cv=none; b=oNvN13EuBgFEAl3gelRD9wyQXlbsO6fV47V7cGNY2CtlWI9LXbtm9AEa7gngZvzbNzMMsD/fYmVhjnQNU84xy+wgLmjMRTxtA974DnT+w6YVkj0vEeGu5/rFIhaRJlIkefwvvdEIILHpcVwM6W1qb3wqWvGLVQRsIZoBKW6ABDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739525064; c=relaxed/simple;
	bh=Um93XztfaI6rR8E74QvPDKkoVEt+jJqd9tygLchRrMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lY+RfpAI8ipXAO5H1b/uKanukKYfTagAXoYUJfUgmZ0SYcs/fc/KRuMcEUym5DnTdShIsf6s4W4ZSSLk5NmI8j7PvarZv94jeBGvGLnonfKgj8KgPgCvAOpKnwl/FCkw+6DzG9ox7TQbWSGGYFl9k1umiaXyi/ZMY1Zm+Bcc/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CLTq/jjN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CLTq/jjN"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-545054d78edso1865478e87.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739525060; x=1740129860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGkb7GkJNMEwB0Lc39gVzJe4c0GiPWxr9xdqsANunoc=;
        b=CLTq/jjNeLh1daJcf6chDPXkDTVBbIH+4pggqo90My9rVMNQUP1Lf1gnVJ1Zkn2Md6
         LWpckIOCwQ0UXxMc38n1/rMU7R5Et1x1yu8mt0z7Qd+ZdWcIUeeJyM6Aw1Yn+iaAx5vL
         mPTFC7rZBdl/KjxLdm7Mmutsdl15h2dE8T0Ixyzpr/2QCWeMy6gMnqKSAzbIThZr28KM
         zqfd+VJgznBZjhYZVUQ1rSCZKoFbU38GbWaMCOzZfJvDkJqc+2BJOWieLp0mWj+1jBZ+
         1Kcz08EGYvUtg1lIUVciTGfbF3GlLeW3gTEXlA5cxcad9AWaHxN89XQM6s/D+jTGFXAu
         bzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525060; x=1740129860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGkb7GkJNMEwB0Lc39gVzJe4c0GiPWxr9xdqsANunoc=;
        b=kbXPIvcowRjKzYBpXk7SwDt2n8wURIvDtp/ttM0XG2vtYFt4wRv87+Y7V5MIxKhqkB
         r75BE9AKdOzqx1aq0o/2xr3x8y0PFXGXQXtFQO7+NK4zRqTz9xWGdH2IeRUwa+dnAfbo
         QnXVNn9hBG3zjc0Rq0P6XMkA8cEtVHQNLbWr+WVzwTn9SYObeGnKqYOTf+eZeshqr1R9
         b0MBnRalJeMKct1ExNtj/2TNgH509m/jjpYhaZ2OGrhoy0oLvdsGazvGZvH61MU1SBOR
         U29w9/nNhFDblcv1Qp8q/sQEv6HVob4diDQqxVRWU94GLaI64nOGZAPTukm2IISv7R/G
         zqNw==
X-Forwarded-Encrypted: i=1; AJvYcCWrsHZbFjw1eIu/5tfuz/4kTQ0Zy62RAm0J7PFWU9Cy9qeXI9xVFdJkwiNtOqbMsgPnkV6KP/NZAzyxTQ62@lists.linux.dev
X-Gm-Message-State: AOJu0YwVccA0CeVJeZRYHF7IopV1qjoW/P+cnFygX6PPfedXyVUwG29V
	O/Tmn2rjp5WfuYgjLWhOnngOA6gMiQaDyM/ysSV3UYysKMG9jH0ACIssbcDSaSgg11xxh47/Knc
	X3FE7dRM9XHb6woV2xxF/PmvvD86sC6YiILOOfqv0Rm006VTMB9xJ7g==
X-Gm-Gg: ASbGncvHhYsTfXbyIbVE4vzufVqvpXRbnn7xvVFwUeuz21j6oZugjYnJWmMAEftNX8I
	3jpKJxiPqnpU2whthqMqh7gxwTjvlg0IwD1lrvakLqYdkebj2M76W7zwtW8E/nYDB3SgBBmvuwg
	jviwBpq7ooZndi6Z3XL7bXJdyYCHE=
X-Google-Smtp-Source: AGHT+IGUDt91AX/gfqA+esgbGZHA/UWH5PuCIt9Li3OAP+swstK0dr06ncsL7+shSHuIIQvDB3Ev8Az3rrKZfbsR34E=
X-Received: by 2002:a05:6512:234f:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-54523356662mr1123966e87.50.1739525059992; Fri, 14 Feb 2025
 01:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211-gpio-set-retval-v1-1-52d3d613d7d3@linaro.org> <202502122100.xnayNYRg-lkp@intel.com>
In-Reply-To: <202502122100.xnayNYRg-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Feb 2025 10:24:04 +0100
X-Gm-Features: AWEUYZnytm-QCDvAabJim0UZlwAP-rQOF8SM5edVp_VVYpTnUbDflnVYBXLdH74
Message-ID: <CAMRc=Md8ZYB7o_2bEctdaNsHfaVX0YANGWoQ_-6eZi7AfD6KDw@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpiolib: make value setters have return values
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 2:58=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on df5d6180169ae06a2eac57e33b077ad6f6252440]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpiolib-make-value-setters-have-return-values/20250211-201426
> base:   df5d6180169ae06a2eac57e33b077ad6f6252440
> patch link:    https://lore.kernel.org/r/20250211-gpio-set-retval-v1-1-52=
d3d613d7d3%40linaro.org
> patch subject: [PATCH 01/14] gpiolib: make value setters have return valu=
es
> config: sparc-randconfig-002-20250212 (https://download.01.org/0day-ci/ar=
chive/20250212/202502122100.xnayNYRg-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250212/202502122100.xnayNYRg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502122100.xnayNYRg-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/leds/leds-aw200xx.c: In function 'aw200xx_disable':
> >> drivers/leds/leds-aw200xx.c:382:16: error: 'return' with a value, in f=
unction returning void [-Wreturn-mismatch]
>      382 |         return gpiod_set_value_cansleep(chip->hwen, 0);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/leds/leds-aw200xx.c:380:13: note: declared here
>      380 | static void aw200xx_disable(const struct aw200xx *const chip)
>          |             ^~~~~~~~~~~~~~~
>
>
> vim +/return +382 drivers/leds/leds-aw200xx.c
>
> d882762f7950c3d Dmitry Rokosov 2023-11-25  379
> d882762f7950c3d Dmitry Rokosov 2023-11-25  380  static void aw200xx_disab=
le(const struct aw200xx *const chip)
> d882762f7950c3d Dmitry Rokosov 2023-11-25  381  {
> d882762f7950c3d Dmitry Rokosov 2023-11-25 @382          return gpiod_set_=
value_cansleep(chip->hwen, 0);
> d882762f7950c3d Dmitry Rokosov 2023-11-25  383  }
> d882762f7950c3d Dmitry Rokosov 2023-11-25  384
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

These issues will be fixed once
https://lore.kernel.org/lkml/20250212085918.6902-1-brgl@bgdev.pl/ is
in tree.

Bart
