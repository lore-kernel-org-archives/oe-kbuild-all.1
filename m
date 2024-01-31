Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F977AE72
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691776; cv=none; b=tUmzfgzaIMKRjCds9fbQRq0IRdAGCfOAxWAy74/nlMey2CY47h8VYr/H/XkgaZIK9Ebvc3aX3AQ0niA0FWOnhMJj/vkqwZLG3ToBFelmiXVWc3WMGYDn2ujMfo7Wgh4ErRSByUALj7weDrdcc34qmjIt90A7VEqH8nPB2ith+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691776; c=relaxed/simple;
	bh=4ube494DxN77EoNRTkC5bj/EFomeKNhiGAdr5fHNlZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+4uc8g86NsRGrgjy52r81Vdqm7mOomDDEb+E6JD1ch1pxVi92Y1QyizGeyTcUVv8YnsfzRWUf1BXdILSvFFXeDV5Lbv7hR+git/maxs24zCD5UuaUCVpXph9gJxyBNrDbLZCiwU00lLzGYIkT/SHE5jOe27uQVrjM5cYYS/I18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qiF4ck1u; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qiF4ck1u"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-46b24280725so402130137.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 01:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706691772; x=1707296572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHIn5iEEeJ3rw/RfxswFaDoxGXKGctXGF45XOL5dY2I=;
        b=qiF4ck1uk2d0N1AzXxE5L9nx9aMyf5gMwU8YCYHFfB7XXgIG/O+i4sZkhMw2sqBh7J
         bnuWlv7DWTqjxF2K98dEV0a41Ly3dEhGCf2jSXBcfhfNSNoOovqLJNnTAnNdMlcSPn1S
         kVJf1rlXVSU8YSx7TUIEu0A8UZvOYaWzniYZSOfVkz8DsPEfehTdf9vEWD/RktYncy3v
         lZfBz+YRTIVo41tFA4JaGKdRdzEkUjdp+//dWZeXBzMB65FrT6p7ect+BD9IE5Wab/Z7
         WFPLrvAwRLLZdfpv3cw1FjAquozjk9E5dKluTTDqD4vapOf6sLPaNYP8U4i8jLmHYp5d
         d5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706691772; x=1707296572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHIn5iEEeJ3rw/RfxswFaDoxGXKGctXGF45XOL5dY2I=;
        b=AoIzZahfBW0W2rnjCWw99El0qfOPzIRPxOX9StPQrk/N6ZYxdD5zI5HaQ3A0p5tUlg
         6w6a4+qGcsuhf4tfpvX8tV3INw+3ZzcYtPXsvz0cxE/AdIVeexMwpjsm//DPw1DSZ4Ri
         V1CNN99FU2kYor/uMnu4Gutz4htuXYlEVEHKCGhembAhfQfD2MfO1EYyRNqpyeZk5MnT
         ED/o4AuX36MzBadp8VwC55m8hn4hAW8nLvzZon1v8lXN6K2rCa33sSThLjLwQE8VGsDd
         2wILqpMXqKtHFVjarATZOD1PVcPfdnQY45t8j+avLC25NAy0KHr3vOoVfvZxs6/RhEnb
         h10g==
X-Gm-Message-State: AOJu0Yxm/KZDGLUFkJC1W07+Nun9rBf9Y0PX52d1azln+KxTey+9GT9C
	DdYjFT8YM0//t+dLw9pLVC7zCJNoYENeR2kOtUXypZ8idw6Y26XVDSoMDiwXlnd+tMqQTdhVk3+
	abX3hEaDR7o6OtiRoD3Mnm+Upmjer0PPr1mTxRg==
X-Google-Smtp-Source: AGHT+IHwfAAjqdqROm25j35JKJFRD2vF9Pt57pirLSUCe4FZ2jlrKokE/urkjVy/LFDj01VwH0GsmB66CaZJuy1zsg0=
X-Received: by 2002:a05:6102:3b91:b0:46b:6936:bdcf with SMTP id
 z17-20020a0561023b9100b0046b6936bdcfmr1780735vsu.28.1706691772117; Wed, 31
 Jan 2024 01:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130124828.14678-21-brgl@bgdev.pl> <202401311050.YNdm98Hv-lkp@intel.com>
In-Reply-To: <202401311050.YNdm98Hv-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 10:02:40 +0100
Message-ID: <CAMRc=Me0y-P4zTu_nCPpdF8hX_7rqri1AG1zCU6sO9tbJXbneQ@mail.gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 3:21=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on brgl/gpio/for-next]
> [also build test WARNING on linus/master v6.8-rc2 next-20240130]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpio-protect-the-list-of-GPIO-devices-with-SRCU/20240130-205537
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> patch link:    https://lore.kernel.org/r/20240130124828.14678-21-brgl%40b=
gdev.pl
> patch subject: [PATCH 20/22] gpio: protect the pointer to gpio_chip in gp=
io_device with SRCU
> config: x86_64-randconfig-122-20240131 (https://download.01.org/0day-ci/a=
rchive/20240131/202401311050.YNdm98Hv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240131/202401311050.YNdm98Hv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401311050.YNdm98Hv-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/gpio/gpiolib.c:444:22: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:444:22: sparse:    struct gpio_chip [noderef] _=
_rcu *
>    drivers/gpio/gpiolib.c:444:22: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:1103:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:1103:9: sparse:    struct gpio_chip [noderef] _=
_rcu *
>    drivers/gpio/gpiolib.c:1103:9: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:1182:22: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:1182:22: sparse:    struct gpio_chip [noderef] =
__rcu *
>    drivers/gpio/gpiolib.c:1182:22: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:2970:14: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:2970:14: sparse:    struct gpio_chip [noderef] =
__rcu *
>    drivers/gpio/gpiolib.c:2970:14: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:3004:22: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:3004:22: sparse:    struct gpio_chip [noderef] =
__rcu *
>    drivers/gpio/gpiolib.c:3004:22: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:3585:14: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:3585:14: sparse:    struct gpio_chip [noderef] =
__rcu *
>    drivers/gpio/gpiolib.c:3585:14: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:4772:14: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:4772:14: sparse:    struct gpio_chip [noderef] =
__rcu *
>    drivers/gpio/gpiolib.c:4772:14: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c:4846:14: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
>    drivers/gpio/gpiolib.c:4846:14: sparse:    struct gpio_chip [noderef] =
__rcu *
>    drivers/gpio/gpiolib.c:4846:14: sparse:    struct gpio_chip *
>    drivers/gpio/gpiolib.c: note: in included file:
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noderef] __=
rcu *
>    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
>
> vim +444 drivers/gpio/gpiolib.c
>
>    422
>    423  /*
>    424   * Convert a GPIO name to its descriptor
>    425   * Note that there is no guarantee that GPIO names are globally u=
nique!
>    426   * Hence this function will return, if it exists, a reference to =
the first GPIO
>    427   * line found that matches the given name.
>    428   */
>    429  static struct gpio_desc *gpio_name_to_desc(const char * const nam=
e)
>    430  {
>    431          struct gpio_device *gdev;
>    432          struct gpio_desc *desc;
>    433          struct gpio_chip *gc;
>    434
>    435          if (!name)
>    436                  return NULL;
>    437
>    438          guard(srcu)(&gpio_devices_srcu);
>    439
>    440          list_for_each_entry_srcu(gdev, &gpio_devices, list,
>    441                                   srcu_read_lock_held(&gpio_device=
s_srcu)) {
>    442                  guard(srcu)(&gdev->srcu);
>    443
>  > 444                  gc =3D rcu_dereference(gdev->chip);
>    445                  if (!gc)
>    446                          continue;
>    447
>    448                  for_each_gpio_desc(gc, desc) {
>    449                          if (desc->name && !strcmp(desc->name, nam=
e))
>    450                                  return desc;
>    451                  }
>    452          }
>    453
>    454          return NULL;
>    455  }
>    456
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Paul,

Should I care about these warnings? They seem to be emitted for a lot
of RCU code already upstream. I'm not even sure how I'd go about
addressing them honestly.

Bart
