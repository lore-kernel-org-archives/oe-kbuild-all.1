Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF133EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913909; cv=none; b=JqhqM1ODOeC2o4FeGROAyMDCpXU6yMUuqc4AZNbTe3OqJcARXp65IPuozGYzNqwC/qJLYSVLE1EvOfML80sUNbbgKUCoUN5qc3HqF8wMr3UThgC8PWs7ZXF4kZcT+wC1VbGVqGLT4Cd28i3yEn8Jvvwvlp2nYCqPSN6/ze0q0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913909; c=relaxed/simple;
	bh=i2mPfz5hhKBgIesGtEKAqVUGi6/Ok6931Pv0c7OEASk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCSSo5O4D5FOHr/355HKUtYkwtIxTR/jQEMWjqRbdn0JNFoSrGATSHV3dSoSssXXGDl3ebsyV1/IYa+CLXE4Td00i6mqivUF6GK69XAc/eV18qbmWtiV6UTC6SFZT1vSieRtKmeWPgRxZguN0LpY+eFlV6kf2D2D1icPBCF3fyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6p0/QJe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6p0/QJe"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso262109666b.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 18:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708913906; x=1709518706; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2mPfz5hhKBgIesGtEKAqVUGi6/Ok6931Pv0c7OEASk=;
        b=c6p0/QJe1dBY+jDhepOHtlo0O6yUBsxOBHJPaJ9owJSjoTcM7aur5b5mkpNTBaoZCP
         r6bRBk6H72VJ7I7LOiaTojrHHKsn9f8awf5fda+xObVzV7p7EhFfxuSsm/wcAGnuE9hl
         cEKn56iUA+GiHVEIRt63MzBBzWRDzWlUq3vMpndMOJFsa3gL9X7VHxFZqrqK6M7xqgqs
         ucC9G+thF8nSNYiCE0p3K292TpWoREJu0HM11NuJSgNFvcgy4lf0j3Qr2G4vSNh4tDSx
         APRrxFlAnXnvu7qwOK0UWWG0EOtM6OFmiI6TK2sgKFuru2P/BEKizipykXBSQVOzAEWy
         pQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913906; x=1709518706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2mPfz5hhKBgIesGtEKAqVUGi6/Ok6931Pv0c7OEASk=;
        b=SedGvXzt0aR8Z8znXthDoTH9IQXWCF63KiKpAyUgtnpefxZxOpu+ajO8aA+EgqzYTq
         JmanzENvOMo0E/Vh+ObD4H+tSTJQgSamOLwxxLilA/l0Asq06hofUtYIgFX45BkTMctW
         5cLDO7C1/6unkgI7YtTLhnO2+QCEDacZwKgtzRi4uUlYlzlfwhudsdS0+fjzkuYVWgf8
         cpS8KCS0I4lw0M+pWkGofKKWLROnjPbHYmB9p+E6CzyO/8V3a7CMPInyP+ZxR0nlQXpz
         UrV/ZXSrm3kKTFo+ldIYmy9Qihrzi2KJOG0/c0O8R88+Az0h/7n9XFf/q272U5dTOjY/
         Di5g==
X-Forwarded-Encrypted: i=1; AJvYcCWiSd5zNahlpRBBM5TbonL1cRzcCnThWcrNCMS1xKK6ZJk4fcMFD8pwdgKwgvczObc1jEkshxHiPVlTqIocgloyU8O8dW0GKTUFF8vtcw==
X-Gm-Message-State: AOJu0YzKsajrIdnDRrNj5mnLG+mDlMSQZPvd0LUs7R1bbo2T5gRDUgug
	Hmyaq1kFrOd3HZmeOELSvHfBg5qrM/m86/K9a6fObRoO3dzewJDpWxj+IBkLdTT3p++74lgVwM5
	UeCqrMEwPXhwrpO8dJ0fxLxxVu1Y=
X-Google-Smtp-Source: AGHT+IG4YXMtSR6+Ovg9afTjcqQBhdC+SfOMhUOP9Ekm86AA6U2NO9exkl50Tdv03vNTes7hWhi7L25b46hLMfluMj0=
X-Received: by 2002:a17:906:4f91:b0:a3e:7d36:62b1 with SMTP id
 o17-20020a1709064f9100b00a3e7d3662b1mr3289097eju.46.1708913906424; Sun, 25
 Feb 2024 18:18:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com> <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com>
In-Reply-To: <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Feb 2024 04:17:49 +0200
Message-ID: <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Sun, Feb 25, 2024, at 00:23, Andy Shevchenko wrote:
> > On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:

...

> > So, the problem is that those architectures do define GENERIC_IOMAP
> > which does NOT have implementations of ioread64*()/iowrite64*().
> >
> > Arnd, maybe you can shed a light on why it is so?
>
> The problem here is that x86 cannot do 64-bit accesses
> to IORESOURCE_IO() mappings, so neither inq()/outq() nor
> ioread64()/iowrite64() can be implemented for it without
> splitting the access into two 32-bit ones.
>
> If you have the specification for the device that tries
> to use this, you should be able to work out whether
> the top or the bottom half of the 64-bit register comes
> first and replace it with a pair of 32-bit accesses that
> work on both I/O and memory space, see
> include/linux/io-64-nonatomic-{hi-lo,lo-hi}.h
>
> > And we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the
> > part related to 64-bit IO accessors), which nobody tried.
>
> I could not figure out what that code is even trying to do,
> with its extra byteswap.
>
> > P.S. The workaround is to open code using readq()/writeq() [with
> > swab64() for BE].
>
> readq()/writeq() are not generally a replace for
> ioread64()/iowrite64() because they can't deal with ioport_map()
> type mappings, though the reverse is true and you can always
> replace readl()/writel() with ioread32()/iowrite32() if you
> can live with the performance overhead on x86.

The driver in question by name assumes that it won't perform IO port
access. Perhaps use of ioread*()/iowrite*() is not what we should even
consider there, Linus, Bart, do you know if gpio-mmio was ever used
for devices that want IO port rather than MMIO accesses?

--=20
With Best Regards,
Andy Shevchenko
