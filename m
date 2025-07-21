Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE012BE026
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100388; cv=none; b=VYm+AvUWEuEtWX6x5Hn/s/iIlMKIXDBYvTYIF1U7Kfi0MaBlsKPG3Ps77hhdfFLA1UMhJQE9SC+VwG4PWwFMy+RwbKNrDTyJMwi1ndKsJyZi8e7kl5RpQU3g3T9qRGmFRKuUo2yOANDoIIBgErfPsP3Ts1n2VQs7Piv8baOnU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100388; c=relaxed/simple;
	bh=4Tg6S1gbNn4iU5ffLnBGtp/itNnaULtAVifmRTO/A4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cITHORpv2tRu8QCxq0rNmRkeoZlJMe0/FotUTiMWHTkKZL/W75V/6adGvKB7tGJhW2Bgb627cRNygOxhF8bm6iOjy+BO+X3aRD3IIIH40wKhXFgL8IoMBvt1y+ww5Y2nXSdte1Z9xWaoujAfVmVRnDM3oQlE9Jh7+ABN0BUN99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TpBQcqJb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TpBQcqJb"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5551a770828so4686890e87.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753100385; x=1753705185; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPXvt9hrsYdYbsiffa8p7r+hAwlHZBgXCs1SgWjmAZE=;
        b=TpBQcqJbDVdeg5pcVoeTwi1igowg0uBBUKETRb3/boMytK77jlwla62Iciy3SCZV9+
         oS/bYi6NVP9Q3tcKWnOAJBKznAclipqbc5P8RVveM/PXeddMGjc6hBeg4J845uHjDK+c
         CSeKhJpa22NyOWPBeR/WNfVSanPx83vkypvqVtXk798nlqZs/DFXZecZkU1u1PrCWDcV
         Ti2oPGnAcC3fjb5DdCLRQPe7rMFbI4HxggLhsFA7Gx7MdOxTp+B4Yq/TLLafHMSyOSq3
         atTe+WnWfyFlQVRVKpWRRNC6opgFKJyqfoML8vQIcrZAMVGsQz62RRDfHkLDbhyYQQFq
         adTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753100385; x=1753705185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPXvt9hrsYdYbsiffa8p7r+hAwlHZBgXCs1SgWjmAZE=;
        b=i77qN0Rvwk3///txJc/MzLuPM3BLqQgxrmD+7piH9p1y/yidfLw7ujsgOxS8h6e+S5
         HlkvppSPI5BzV4DiSmRRjRFW5fVa1+jSbEhhSAd5yG2G8PnehQlql3gaqyZVPSufd1k8
         d/tpjNKiMUuSlPMQjhCROYr5B3it2YcLCDSuSj+1Fxjy8s/Kh2LHA6wcsyTriWf5j2EN
         M6BXfEJRK/qhX2oEHB2UF5zIOXlC5MpU452v5rTH+CgmriqBqChkAhRMlEc9KQD4s8YD
         UW+ghBxlX+22aSFg1FOj9a27YtyxDC8rq+mu7zuNmJeT55gb56u/ELFhpDvy4+oA3TjA
         IOLA==
X-Forwarded-Encrypted: i=1; AJvYcCX28e/9QXNEYCeo/p8fT70d7M7YtFOyGmJbotHacjv8gRP0fjoa4JWJiucxZGmBtKaKJI28vsDao/+ST8rj@lists.linux.dev
X-Gm-Message-State: AOJu0YyRo9IHpE1z0Own16e3KcWxfk0HQCPXyQ+UOuFWOXB9cJ/AUSkw
	MY+qy7v/PzGPZr/DbfO8JYgL41m8K5CPDlOI2vsAEOagwhQKOyB660QXWhUX1G/3xEXdYUZRVcC
	ItfoTzpws+z1chD8wxFqcIyQysIIFop04NQAUxKelOw==
X-Gm-Gg: ASbGncsF/bjePCuWo4bKvDDnd7jXLUBqlcUxuahN1YdtTyrkqry/WV+y2onMivME9xI
	UW3POp9A87gO+HzR7YuQPJI5JK2QFFluZhNoVdFwLRnfVLpkqaJ+JNekAuxsTcwpZTwUizXl+5m
	CwubVytVsyg5yXxlr+f12c5UQMjO/5N5KvuXZZiDqbyoN9U6lTp2ET78DAwuiw22REkfoJTnnCO
	HOkk4MsTnRKftcKNjVEUfJEnH0pjaRt6lowPak=
X-Google-Smtp-Source: AGHT+IEE/YZ2zMZ0vr6S2C2OhYyeLkVzmSPU6ogeh25Hewpf3NQhf4AQpUbeYiLf9h9C3sU9JoVuozrhWDIjQWQEcUg=
X-Received: by 2002:a05:6512:3d02:b0:553:510d:f470 with SMTP id
 2adb3069b0e04-55a23300e4amr6462467e87.4.1753100384455; Mon, 21 Jul 2025
 05:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507211919.5Oks2bl4-lkp@intel.com>
In-Reply-To: <202507211919.5Oks2bl4-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Jul 2025 14:19:32 +0200
X-Gm-Features: Ac12FXxKsu7G5xjjOmgs_ZYx1_cBAbVtrOccUBqrgxwtIS9FNzB6NoS1MGqEf7Y
Message-ID: <CAMRc=MePztExq__G4DiCzkUZknSrrA9x3795VRvZ5hAPNDkxTA@mail.gmail.com>
Subject: Re: [brgl:gpio/devel /3] drivers/soc/fsl/qe/gpio.c:322:19: error:
 'struct gpio_chip' has no member named 'set_rv'
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 2:02=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/devel
> head:   ab43c98c938b0a53d7a5220d9e42e7db30961a47
> commit: a905b526122df26d14f16b245cc0d5bd6a073e5f [/3] treewide: rename GP=
IO callbacks
> config: powerpc-randconfig-001-20250721 (https://download.01.org/0day-ci/=
archive/20250721/202507211919.5Oks2bl4-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250721/202507211919.5Oks2bl4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507211919.5Oks2bl4-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/soc/fsl/qe/gpio.c: In function 'qe_add_gpiochips':
> >> drivers/soc/fsl/qe/gpio.c:322:19: error: 'struct gpio_chip' has no mem=
ber named 'set_rv'
>      322 |                 gc->set_rv =3D qe_gpio_set;
>          |                   ^~
> >> drivers/soc/fsl/qe/gpio.c:323:34: error: assignment to 'int (*)(struct=
 gpio_chip *, long unsigned int *, long unsigned int *)' from incompatible =
pointer type 'void (*)(struct gpio_chip *, long unsigned int *, long unsign=
ed int *)' [-Werror=3Dincompatible-pointer-types]
>      323 |                 gc->set_multiple =3D qe_gpio_set_multiple;
>          |                                  ^
>    cc1: some warnings being treated as errors
>

Ah, dang it... I missed the set_multiple() here. I will send a patch,
hopefully Arnd can pick it up on top of the recent PR directly into
his tree.

Bartosz
