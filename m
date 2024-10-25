Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFA0165EF8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870795; cv=none; b=gnXYoUpIT2CeZaXvlgzs8hqpyZ0fR8gtYvJQ4DDV4NRy9AETXsKprN6XwykLhbGPpDsMtyCLUciHRTAfbMGQ0/Tt9hvdzZkZItJscOL7uZ8gqyH4fg14bXo8I2XrKCzru7WSDwvuEa+WXsjWgLRIny6Vaik5q9tI7+uO6AS+yiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870795; c=relaxed/simple;
	bh=rQlrpJeMlo0ujThTpOYvcpe79KLo/FclwrwMw4u04eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0PG9Q+nsxiEc6iMGgzM5dXmI7C0NRWj5KelHn7elCUuwTvSItSPWItBrH6IDG/NoRuu03Lp0JDFZq0vQ6lqIdlDGEX98pYCW1ZXza5JNNGj6sTQcVhQISlUOvN6I3MkHAprtKWzIdtZLPcqPrQTl7v3lh5UbHwSburAepKNtxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bbfgFVv2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bbfgFVv2"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso34628081fa.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729870791; x=1730475591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xW4PWRSrVVHGdUnyVYJbesCr/e/f0yYNSHSjjDEYDZ0=;
        b=bbfgFVv2BT8zF+x+sdhloBBBw+WGIXwvaUxZvZRz0VLQlJV0tH5XNn30gcs0yUTdRv
         2CnKQ3DJxGfwTd/wzkg6Ojzgu+HEilPhTu+/gtDI6/ZTjzVllZadf0vl4WVPcHgEFJ/h
         CjO804BWT34SZ1F77YCy9O7ApGmrL018lM0HhXrXgJWzSL2tCuAf13pWNtpJ6M66T7Xj
         pFqk3YMCNfaCU1nE689MbFvqji8fCN5sr5RlFKS+0zsQq4iygGd75vKzKQRlZMgEAeFS
         Ujz5AQU3K9t+X9YuYx7JKaT+UAinMJ5VpScB8+8lDWNtyzsGJq1I/6aXnG5aqA1kJbCA
         6xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870791; x=1730475591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xW4PWRSrVVHGdUnyVYJbesCr/e/f0yYNSHSjjDEYDZ0=;
        b=n1Yz/CHNPIv1RBXpo2VZ5aa3rmmpMkV0Hc8ES438nviNT0GFqc3mzfwCMqXZA4v8XN
         OSiR/yXgsu1isNPQUfQ51MItyozIwOvPWlpiUONCJ2XdrbKoh06Wq65LMYHDZjiL5IpG
         MS6tHvI3OGbzT1+udAfOSl+04aWa67EwB9EJym+Io3rXbbExTbA+cQJM9mZPoz+tTiGs
         81pLcC02b1Weu3zH8Q6NRratD2EYJmgqoaZ76kLYKk5HWQ/BKx/Ypud/tq7DQjZMogZk
         aies5a+FjpdyQ8NKWax2gXPCJBPXerN5Jc7MzWYPNvC6tpR+se0kgFfjXDPZY6cDE22f
         bV0w==
X-Forwarded-Encrypted: i=1; AJvYcCWhju8cbLmX1zXWzZfKf/h6y176Z9+4Zc2Lk2qZMJAqhUFsfxVAE7a+CVXgrdUYLDzPWuSqU5Jfj15B128I@lists.linux.dev
X-Gm-Message-State: AOJu0YxGJCh8g6d9Vyi3i2l8UzY4dQhBpqztczyczqMSLpb+30UXX4Cp
	zB37ipwjMUOnjg36fvoXI/q3A62hNir4lzlLwmCEA4WAbE0HEBQrcWQ88E03z5edUc9RT7P4wjP
	KHYCiAz0SQs65T6W4XRyFZp3l+x1ShTc0PFBhtA==
X-Google-Smtp-Source: AGHT+IEVPJcpNaS8Dh7KXg2L847e2aERI9aZUfHLpTDrx377enJsjmc2WbeZ9cZnIv6gDlcIhu81wtKqRimneYbSjao=
X-Received: by 2002:a2e:b2c7:0:b0:2fb:36df:3b4 with SMTP id
 38308e7fff4ca-2fc9d37ff0emr67856561fa.34.1729870790725; Fri, 25 Oct 2024
 08:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241024192758.91748-1-brgl@bgdev.pl> <202410252227.4k7pn2o5-lkp@intel.com>
In-Reply-To: <202410252227.4k7pn2o5-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 17:39:39 +0200
Message-ID: <CAMRc=MfDKzKOT0Q2zGv2AnnoRDoTQhrDXKqyj1vqWx0jABa41g@mail.gmail.com>
Subject: Re: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Gazzillo <paul@pgazz.com>, 
	Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 5:08=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on brgl/gpio/for-next]
> [also build test WARNING on linus/master v6.12-rc4 next-20241025]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpio-relax-the-Kconfig-dependency-on-OF_GPIO-in-drivers/20241025-032925
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> patch link:    https://lore.kernel.org/r/20241024192758.91748-1-brgl%40bg=
dev.pl
> patch subject: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in d=
rivers
> config: i386-kismet-CONFIG_GPIO_SYSCON-CONFIG_GPIO_SAMA5D2_PIOBU-0-0 (htt=
ps://download.01.org/0day-ci/archive/20241025/202410252227.4k7pn2o5-lkp@int=
el.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20241025/202410252227=
.4k7pn2o5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410252227.4k7pn2o5-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for GPIO_SYSCON wh=
en selected by GPIO_SAMA5D2_PIOBU
>    WARNING: unmet direct dependencies detected for GPIO_SYSCON
>      Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=
=3Dy] && OF [=3Dn]
>      Selected by [y]:
>      - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] &&=
 MFD_SYSCON [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Eh, OF_GPIO pulls in the OF and HAS_IOMEM dependency so his must be
done on a driver-by-driver basis.

Let's drop this for now.

Bartosz
