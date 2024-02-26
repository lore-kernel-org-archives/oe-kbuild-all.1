Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB2605A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708955763; cv=none; b=cQnAPk9V9HVDgMTxozV8H7woYMHh6v0i5YKQc8yYicT/ZiXKQ7ZqQekOeUPbAO5RaILvVzUAApuauNAiserGtLg6zFYZ7A9l/YkPop1aiIEYCNYGvFyMDjuyO8iHcF7BifOTggZxNqhp+EptxvTuohOLXmCcNQLaL5X08OZkKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708955763; c=relaxed/simple;
	bh=kijFRXEAIJIOHnczCA4GyA6DZgP9USLWRFlWcZX8esE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3G/L8jzFYT75eCcjvR3nf7UYJ29olVRcENJg+yyd13NmWHHPKZT47iFw+Yw7ME2MuIdLbG9BetkLn1ky55fAM93eRtm9UhXhnJ2dcSgdmM2BJEBm5aDfxDz5HtfcrWzJt0TqnVDPo3ZvKk4QgTrHajqOQAPcK96CAOw5gQbDV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vdrqU9J9; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vdrqU9J9"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2367653276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708955761; x=1709560561; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kijFRXEAIJIOHnczCA4GyA6DZgP9USLWRFlWcZX8esE=;
        b=vdrqU9J9m8yLTYVnf2F6rnIk2zpIDR/51UYlMjrkTQQLda1yMCDnUyPxbfH8sew5sm
         DZefrjQWPw34vhxk7uEgRrgU/ZO54HxXAIjUM2AZJ54gQ4sQOFUXPd2JO9iNoqaasGbM
         j7PBhqbgeHraXmodfTDCwOlpXQ1Dv3gwTLnzf8H4d/0MWcZsrnWK24/UhyU950qWqxCC
         2F1gIOIXe+uP7kTKKsqGQ/tLxy2jY5DsiIGpywzn2zabJrTKAVW0B53owvY64F6Plfrm
         /43Fh+k5SL7rzLKDdVw4aJZdHrY3YJP0uuYLFayzN2Ol9KnakN39zV/ZK8N6x80kvnfe
         bYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708955761; x=1709560561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kijFRXEAIJIOHnczCA4GyA6DZgP9USLWRFlWcZX8esE=;
        b=X4YqHnZAQOqrZxkn926FxaAgp/1lkuYjK4Z14UsG+1Dtazmsqz72gtDmNQqHH9qyKn
         coA8GeJiJ4zd2gnYqfNp17aVRLQCzTOyGy63tHAOeopUnHPugmHUR7lhGBC5o+KV8TAs
         TTvMPnb78hzVO2j2ef2WOe3GMX/+Wpm4yC4XTOwAqtbRrYmL63pfB42kRoJofxw2qjSN
         YtLn37iNTV2nQqDgWWUAL+VFFuNT0Zpa6T+8yozxETXmssmlU33rHN9MmdXZjacaApuc
         E8JjUaw4LsJPMfy3++YxzWdYii8GhexW52On9VecenR5j5A5rbERFhUmFZTiag4o/ckW
         7Xhg==
X-Forwarded-Encrypted: i=1; AJvYcCXGOgvD+xtr3AjXKdxcspNIH2MA990liCvN9tUqNcf0q4oVNIK7wjRLgvMYOHVAim2WP6t0wwTGKJYeynVVZD2OQas4WoMwKeO7wxJ7Zw==
X-Gm-Message-State: AOJu0YxJkXRuvOOAJFMMtYUN5nMOKfBUGJPu69paSZ9Dsi3sFxiAmSPB
	BaWXmsRWErkz0GW9DN+RSrTQOreWnyfBIrDWK8VQOflAh5h87MHgZ4Yh8pNvFglCKqVgFLVt8cW
	OqUxIaqQbqnC4pkLiHkxMnox7Jn/b3qbKvznZUQ==
X-Google-Smtp-Source: AGHT+IE0H7nN9il0DDLEq97xEWt7P5bKjUTnamF0j64gQzOWuB/3LyNokYd9GN4dUQscjFFY6+cKu2SDmRHXZHc1xJs=
X-Received: by 2002:a25:ed06:0:b0:dcc:fe98:368 with SMTP id
 k6-20020a25ed06000000b00dccfe980368mr3993446ybh.19.1708955761273; Mon, 26 Feb
 2024 05:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
 <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com> <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
In-Reply-To: <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 26 Feb 2024 14:55:50 +0100
Message-ID: <CACMJSesNN5A0ungLKWdV69nb8j4s=7334xZSRNt_sB64aQq4vA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 at 03:18, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
>
> On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> > On Sun, Feb 25, 2024, at 00:23, Andy Shevchenko wrote:
> > > On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
>
> ...
>
> > > So, the problem is that those architectures do define GENERIC_IOMAP
> > > which does NOT have implementations of ioread64*()/iowrite64*().
> > >
> > > Arnd, maybe you can shed a light on why it is so?
> >
> > The problem here is that x86 cannot do 64-bit accesses
> > to IORESOURCE_IO() mappings, so neither inq()/outq() nor
> > ioread64()/iowrite64() can be implemented for it without
> > splitting the access into two 32-bit ones.
> >
> > If you have the specification for the device that tries
> > to use this, you should be able to work out whether
> > the top or the bottom half of the 64-bit register comes
> > first and replace it with a pair of 32-bit accesses that
> > work on both I/O and memory space, see
> > include/linux/io-64-nonatomic-{hi-lo,lo-hi}.h
> >
> > > And we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the
> > > part related to 64-bit IO accessors), which nobody tried.
> >
> > I could not figure out what that code is even trying to do,
> > with its extra byteswap.
> >
> > > P.S. The workaround is to open code using readq()/writeq() [with
> > > swab64() for BE].
> >
> > readq()/writeq() are not generally a replace for
> > ioread64()/iowrite64() because they can't deal with ioport_map()
> > type mappings, though the reverse is true and you can always
> > replace readl()/writel() with ioread32()/iowrite32() if you
> > can live with the performance overhead on x86.
>
> The driver in question by name assumes that it won't perform IO port
> access. Perhaps use of ioread*()/iowrite*() is not what we should even
> consider there, Linus, Bart, do you know if gpio-mmio was ever used
> for devices that want IO port rather than MMIO accesses?
>

I don't know the answer. I'd also like to stabilize the for-next
branch as we're pretty late in the cycle so I'm really considering
backing this patch out unless you think you'll be able to fix it soon?
I'm quite busy ATM and will be travelling this week so can't really
spend time on it.

Bart

> --
> With Best Regards,
> Andy Shevchenko
