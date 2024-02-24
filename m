Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD294D59B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 23:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708817047; cv=none; b=Z8kZdmhDzOBAL1trh6SrcHTlgYkw0hAC9E7ca+KulZBXBDtNW8Knt1GNNBHHj5T7TlW5KPQtuDLD/B5XZlYJFiEhHK1D85tDRowM8b5CrHfrP7+75t7dWP2kLwhcnuOP8GJJQnjdVpWdZJsY/osRPtiZOMc9TG3uy+MYXMSNims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708817047; c=relaxed/simple;
	bh=NExMGPmaO68I7bD5whjX8BMTPNQ+bJb53lVRtGgPTVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnO5YTiwdM4OezcrhD8KYH4EvXdYNKb+S5W+VBsn42vmT60/Rlm804zhmMo6T98PR58tLgmlIhfJXVtNdDK1uAljuNAgfUHR0ySF26Ol0TpTU7krJyhtoy2p2fxKB5ze6OTQ/dpZOuQ0189Qo6LIPLcKpnlFcQiqR8vnFub8BY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e80wAg7/; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e80wAg7/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so2176497a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 15:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708817044; x=1709421844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PywAt5/VDYbc0mnmOeunXfKxpQuRmyI7A4ywjCHlyu0=;
        b=e80wAg7/ido4onOesJHLaR6WYed6CeYgBR1g7fXUTbSUK8zxQBL8goIm64O0AyYUct
         CNk0CbvhiSmL7+Yc+txGWwG/WDwWX4fwEd9M5XViLjzyNUaNgynrjuQTDuZhx8FwPoDG
         EJOrrky0mZCJ6cV3Byg6oowG8cielt/bPaHUY45rfBVccrk7taDuToTZXdSNxBEzpJI0
         cPBKgSjuDo5qLPQA+PzHRyIkdJBo9eDJpIfyL0HO8wnjrE/bJIyFuLik7Fbp1yMo2hVV
         GgD6WV2qrrhV1uO922vHDcks9aVi7bgxHIwj0zfu14hAc5Z3qSrKSFUr57WREbmJCaaO
         5B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708817044; x=1709421844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PywAt5/VDYbc0mnmOeunXfKxpQuRmyI7A4ywjCHlyu0=;
        b=kmNMWqHB3uGKjkdTDfNK/52EkcOAT4CesJtxN7eWcwtcyll+3cKhkbWkDamWmM2FrJ
         mcNguty1JabPpOA4Y9MuKORuek2HMtg1NwgS2O6NXiZ2+RArwzKSF0GSLF/scmHFFaAk
         ftnWG1WeI6YyGNFbciPlRZE8TYAInnn+ukABxd2GECwBRE6RcJ4pS2Q4B4GfvK9U3dLp
         TdsrqgzuQavEggtgCzc0YdktdzhMQhMc0vAjICtxEfsHXHHjYpvce7rACsYKK5JA9Hv4
         /O/+cCeMVJmorO17QyqhNoHU5zI+mx7/fTOmjhlwnCSFGKAK9fijDsnTgTaz1xuvHfV7
         BnuA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ03zp85gX4jdVe6wxUWRM1w0Dx/zAssb8YOxiewtho2p+aVHU0sFDGtAjCSFv+8jn6d3wwauWXRuZE2tfcu3zWR7MK2xkRDXzs3tnTQ==
X-Gm-Message-State: AOJu0YysgUErWbOsPtgaqJtUCXvEffm/jTuEEMtgvih9RRJ+WVGdZVfW
	qWy8yuCjtiZO+tCUd/aBviyZYinOoQzXqDfwyGbl5MQnAFJoAYWQX/4BtqQy7FxEJ5uaTHGT/Cj
	dcGqPb9Yu67Ws3UHz88p4n0ZI5PKnSOU2n42IfQ==
X-Google-Smtp-Source: AGHT+IEmEA39sb90QkCiimxyAbRLSspP4zopuLyW3W/GC8kp1/e2TvZ9fYnRKCcVIBunemt2LzOF1RGguqy1UhDbZvY=
X-Received: by 2002:a17:907:101b:b0:a3f:2c1:9887 with SMTP id
 ox27-20020a170907101b00b00a3f02c19887mr2276998ejb.21.1708817043466; Sat, 24
 Feb 2024 15:24:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
In-Reply-To: <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 25 Feb 2024 01:23:26 +0200
Message-ID: <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Sat, Feb 24, 2024 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.gi=
t gpio/for-next
> > > head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
> > > commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: =
Support 64-bit BE access
> > > config: um-allyesconfig (https://download.01.org/0day-ci/archive/2024=
0223/202402232058.4eDf4GRs-lkp@intel.com/config)
> >
> > UM Linux now again.
> >
> > gpio-mmio depends on HAS_IOMEM
> > and UM Linux has set HAS_IOMEM, but
> > also claims to support 64bit without providing the necessary 64bit
> > io-accessors.
> >
> > Maybe UM Linux need to be fixed?
>
> Nah, there were other reports for the same issues, at least for x86
> and alpha. I hope Andy will have some time to look into it early this
> week, otherwise we'll have to revert the offending patch.

So, the problem is that those architectures do define GENERIC_IOMAP
which does NOT have implementations of ioread64*()/iowrite64*(). And
we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the part
related to 64-bit IO accessors), which nobody tried.

Arnd, maybe you can shed a light on why it is so?

P.S. The workaround is to open code using readq()/writeq() [with
swab64() for BE].

--=20
With Best Regards,
Andy Shevchenko
