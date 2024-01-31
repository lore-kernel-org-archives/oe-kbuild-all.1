Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5067E66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706694133; cv=none; b=B4fu5xMqQGhV3Ke4Wi7e75SriE3u38VMk05plnvkfokJm9z/9J5NmVIlTDkzEDppU87CgrKNOCJYwN5PeobJ0M5z6s11MSo4uvCB7BpTLNR/tQkah9SCAUyxaESzDdoU7/Ql2pBf9caNnloRSFft6Nux0DUCrrXeUqAMrfdEufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706694133; c=relaxed/simple;
	bh=I8IaDo2LXl3hMdoey8DJH0y0stzvFygGBC2QIAYoM/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+FRvovCWTSQB5tC6oWj8seGDsYYeO0LImsrkO4Fx9UjeGXxBpqv4H7Imclj+qPr8zQa+Jbvc1BoCaXkp+XFOkNKlpTH8i2oJgGev+Zqo9bGu+1w4QrxIncnHGxfIDzgRmXWLtrJvp4+2LvxWVG9cq39O4cySTTsOcVGwsLJovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N1AoDIJ4; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N1AoDIJ4"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-46b1f6c0aecso1271457137.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 01:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706694130; x=1707298930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcYDDjKdeNIzAwHVtZYc2BaL1Bb2VQ1RKHVOMiHOhfs=;
        b=N1AoDIJ4XEGfx1EB+zRiTrUI+DKjFicjOf+3DYYeXh2cKzjaRhrYdkAM46gI7xs4Co
         ohkOz3MPQP+IRj2xBRmyWiHyWXuQEcyWLlAQtryFIQvWh5dIw2BfUVV7GTtQbWA80Qby
         H8sFzd6QCuiUmM2SSbMp1Co/gSaBDDyWsy70W+F1/jR42/3gLn7reh2Z5vajtjUHmo3p
         Wrws6WM5KQDeIMVtTpEJuegg/jw+XUgqCsmY+ONfzoTkM8ORR3BOnxUUdkvYSrTXompR
         kBlotTBS6iIj7IGt1Onq3ZjANnIC5CDLm5uu1AyoiMo9nxH4wu79JXyhmzPdHYTuWY9w
         ykhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694130; x=1707298930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcYDDjKdeNIzAwHVtZYc2BaL1Bb2VQ1RKHVOMiHOhfs=;
        b=rhTjhIeact/PdeHPHhxsdb3IOR8Ysw/xlYCwthVbupGtecoLaRNa8LYO0GEfZdz9XG
         z+iHznEGZnki389TYjlSi978q4TELM4ibqn9ltZ5FOB+YvjDRqTiei+1hU4GdzGgmK2b
         qwI8fBg7hM0j8BqRiEYw0PHXOQSsgnXxcSBGuKqYE0cadzzQnmQpRJz9Eb3wpBW6NrCv
         Dz5xgAnr5BnwW4xseRsdd4ayV+n9lsbVw+TqT/U0J+OSKIFwfTex5pWsRtvyhsQOFIzo
         /iLaYk67h4/1tqiciYnFc305zgYdbg4I88BoqmRYs5pTv2XbLcqCBt/iMMzfIPiy32D5
         d67Q==
X-Gm-Message-State: AOJu0Yx9Uv1YVW/ZHuV8I3wt7xXf2NSfZi2aKLJ0MCdPpk/h15i1FA3e
	BAImJDWoiJynoAIIJxypJ2VbsccZiHyh2RldUEem8Fo5O2qy8QkKrhHl1FVSGONkiUu2gzhtdlu
	9+H0MCDSXKsSZc/lYqmF2qGEfYYWM1jxLj35Kqg==
X-Google-Smtp-Source: AGHT+IEDws9RVoC8SIOwXfcSXOboZscD/FAMr0ug5hT5QaJ46r/yJ7wnc1mJhwMr7wOx07es/BgsK4kOhjaRQkV0uwg=
X-Received: by 2002:a05:6102:2858:b0:46b:14e2:1ead with SMTP id
 az24-20020a056102285800b0046b14e21eadmr825057vsb.22.1706694130118; Wed, 31
 Jan 2024 01:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130124828.14678-21-brgl@bgdev.pl> <202401311050.YNdm98Hv-lkp@intel.com>
 <CAMRc=Me0y-P4zTu_nCPpdF8hX_7rqri1AG1zCU6sO9tbJXbneQ@mail.gmail.com>
 <fa273f23-320a-465d-a403-523424d98e3d@paulmck-laptop> <CAMRc=MdoG1Ku-hbBWt7Jc+d4=ANfshPWwW3C_G-e2GdyggqG1w@mail.gmail.com>
In-Reply-To: <CAMRc=MdoG1Ku-hbBWt7Jc+d4=ANfshPWwW3C_G-e2GdyggqG1w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 10:41:59 +0100
Message-ID: <CAMRc=Mc3AzqobxJAPpHoO0Gi2peuvVs66qsSAxFkcD5UzNguYg@mail.gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: paulmck@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 10:28=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Wed, Jan 31, 2024 at 10:24=E2=80=AFAM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> >
> > On Wed, Jan 31, 2024 at 10:02:40AM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Jan 31, 2024 at 3:21=E2=80=AFAM kernel test robot <lkp@intel.=
com> wrote:
> > > >
> > > > Hi Bartosz,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on brgl/gpio/for-next]
> > > > [also build test WARNING on linus/master v6.8-rc2 next-20240130]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Gola=
szewski/gpio-protect-the-list-of-GPIO-devices-with-SRCU/20240130-205537
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.=
git gpio/for-next
> > > > patch link:    https://lore.kernel.org/r/20240130124828.14678-21-br=
gl%40bgdev.pl
> > > > patch subject: [PATCH 20/22] gpio: protect the pointer to gpio_chip=
 in gpio_device with SRCU
> > > > config: x86_64-randconfig-122-20240131 (https://download.01.org/0da=
y-ci/archive/20240131/202401311050.YNdm98Hv-lkp@intel.com/config)
> > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20240131/202401311050.YNdm98Hv-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401311050.YNdm98=
Hv-lkp@intel.com/
> > > >
> > > > sparse warnings: (new ones prefixed by >>)
> > > > >> drivers/gpio/gpiolib.c:444:22: sparse: sparse: incompatible type=
s in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:444:22: sparse:    struct gpio_chip [node=
ref] __rcu *
> > > >    drivers/gpio/gpiolib.c:444:22: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:1103:9: sparse: sparse: incompatible type=
s in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:1103:9: sparse:    struct gpio_chip [node=
ref] __rcu *
> > > >    drivers/gpio/gpiolib.c:1103:9: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:1182:22: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:1182:22: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:1182:22: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:2970:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:2970:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:2970:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:3004:22: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:3004:22: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:3004:22: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:3585:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:3585:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:3585:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:4772:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:4772:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:4772:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:4846:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:4846:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:4846:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c: note: in included file:
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > >
> > > > vim +444 drivers/gpio/gpiolib.c
> > > >
> > > >    422
> > > >    423  /*
> > > >    424   * Convert a GPIO name to its descriptor
> > > >    425   * Note that there is no guarantee that GPIO names are glob=
ally unique!
> > > >    426   * Hence this function will return, if it exists, a referen=
ce to the first GPIO
> > > >    427   * line found that matches the given name.
> > > >    428   */
> > > >    429  static struct gpio_desc *gpio_name_to_desc(const char * con=
st name)
> > > >    430  {
> > > >    431          struct gpio_device *gdev;
> > > >    432          struct gpio_desc *desc;
> > > >    433          struct gpio_chip *gc;
> > > >    434
> > > >    435          if (!name)
> > > >    436                  return NULL;
> > > >    437
> > > >    438          guard(srcu)(&gpio_devices_srcu);
> > > >    439
> > > >    440          list_for_each_entry_srcu(gdev, &gpio_devices, list,
> > > >    441                                   srcu_read_lock_held(&gpio_=
devices_srcu)) {
> > > >    442                  guard(srcu)(&gdev->srcu);
> > > >    443
> > > >  > 444                  gc =3D rcu_dereference(gdev->chip);
> > > >    445                  if (!gc)
> > > >    446                          continue;
> > > >    447
> > > >    448                  for_each_gpio_desc(gc, desc) {
> > > >    449                          if (desc->name && !strcmp(desc->nam=
e, name))
> > > >    450                                  return desc;
> > > >    451                  }
> > > >    452          }
> > > >    453
> > > >    454          return NULL;
> > > >    455  }
> > > >    456
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
> > >
> > > Paul,
> > >
> > > Should I care about these warnings? They seem to be emitted for a lot
> > > of RCU code already upstream. I'm not even sure how I'd go about
> > > addressing them honestly.
> >
> > This is maintainer's choice.
> >
> > The fix would be to apply __rcu to the definition of ->chip.  The benef=
it
> > is that it finds bugs where rcu-protected pointers are used without RCU
> > primitives and vice versa.
> >
> >                                                         Thanx, Paul
>
> Ah, good point. I marked the other RCU-protected fields like
> descriptor label but forgot this one.
>
> It also seems like I need to use __rcu for all function arguments
> taking an RCU-protected pointer as argument?
>
> Bart

We have a deprecated, legacy function that returns the address of the
- now RCU-protected chip. This is of course dangerous but we have old
code using it. Can I somehow silence that warning as I don't want this
function to show that the returned pointer is marked with __rcu?

Bart
