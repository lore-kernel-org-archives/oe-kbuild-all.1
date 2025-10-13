Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55982FBDFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348519; cv=none; b=rNu32gAIf1zT7UZSC4wRF5DqZQA4ioW+4GLsIiUgqfV4yIwy9DsfIlaUaEBeitz+10r7l8Qd6UBi8n5z2LUnFMYS66t9FcsPgCOazBQ9lNF1ZsDaFTywmRZU48wQHXPIrQF++s0HcytgXUkWjfV7nHwMzuut0Cs4XoQL4e1zTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348519; c=relaxed/simple;
	bh=7OS6r0QXUdcNugcyHhSXlvIAJ1AcOpyHg7bGDGAZEH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuGXcdOqklOlR55F2ybRr8QkvpNh4U93jNGP9EPkCaZsd5WWEdzH3RijiM08B6TQSJACaIlH3VWx4qVy2BSsiLZis1wJRdYIFAKWqFvUJzg1LKND/uZ/4pW6rBEQMf8H4i/ManlTt6NFkPwCKLVi/mvGHQKzYtO/o4v2OyocLKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1WHvp0L1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1WHvp0L1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57e03279bfeso4997646e87.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760348516; x=1760953316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzyn5HR4B+RyFj646ROarW3G5ceUJxiCmvsRF8Iv79k=;
        b=1WHvp0L1+2cQFpNtvbQ+ENXITEivHcCTZ4txSGWtQFW36gzHX0uzHL7xWc+DbUBh0p
         mVftFJozsjQi7LWZhMZW6P4n9OoxKQ/Un5xElTlOh5NqflQdJLGG4adbrtt0b+6dysxh
         9zssGZfFyP9QoMiS6vGzGI9NAlyjibpuZ4BCBHfxIBe2nVaFe3v1BX+I1Ips5JLleMAe
         zmataxq3CEkE4s+xC7gWDNO96O1QFQcjw6Fm19vo1qoEKP9JS7pdw3AS/ZlC6z/pJUDF
         34I7BwMp9Btn2jPBFuS/lyBVByyt6dHGdA4Bb7YZ7IIeHoydIdyonwcbNYfNvlyl4tyz
         u2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348516; x=1760953316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzyn5HR4B+RyFj646ROarW3G5ceUJxiCmvsRF8Iv79k=;
        b=jRyoksd5lr/jeZC4NKSdKdu0+p29xTzLcygkwlnYb7UcjuCxMIk3AU2ujKF+gYz6VV
         FMEfcotKxAVc5kuMyEajVOi//gglxJnidaNSc9y+TlCnSW9pHMxXmbP36oe4s9G8M/SM
         IqzjjC+GGw0z18ihtqcwy0sKIh+ycP6jRQgGtd0OnxX2gRzXTatyrvBYQDUypAW2pTQ6
         q+Bt+SbDwMQdxO9YayuNfNjAliif7ewL5UnzG7GVhqfYxoc6CgLVIUYELL5yNCRGckIa
         3CQANHsXn/s9z0VF7DBWeQqfCOh/e58gpPewz6KaHx6ZZKlRGJ+cFIxZxXa/vyxUwBDp
         KKsw==
X-Forwarded-Encrypted: i=1; AJvYcCUlEjUbIyGbTU8p3YfrzM9UpkQqy0RcX6l7U4HEegE+zN26myeVpTrACY/MZcn4NpNTioUQCqMjH7Ysnlxk@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf1j6CtfDtyNUAVQOvwUDU20uLXZ8yciYJC1d1FEVNG+qCnxrb
	tsvALJ8A/+VSQXijrX5ul0aMBpvN5LP9Z/udIH4STfWSNgxsTktYgCPFbKrPE3WtKX1376mXKeh
	/SL1GBUa3QsRkCueWW1rxiDYp6JUvLxqMPNsLTbiquw==
X-Gm-Gg: ASbGncuPNXD5kduhivzF9ZSpDBQItm9UKJeuuI5YTIQ9e22tnE8sB/NBbORMzXn/f/R
	WSEh+97Uj5g2gEhbFbnQ95rPuWztrbfbK8TPWsG0y/S0U6AyKPw4ILyGVJwWpwvxWpq9AVWnmec
	M63DPx8mTtbLJZ/Bqvt8TKYwzGbaoX4emUcEDGqdcP+FBkFHQnBptLp3ELhJrMRNMMzWdYmPqo0
	hbRl0T5+SAPiCZ8/WZ5Dx+OJ7v5t7LgT8zrVe4P8OWsxc9mra9Typj/5w==
X-Google-Smtp-Source: AGHT+IEo2A2Q2VJMSBIH17uG06uyhaJ8OWT77uhilmx6FtBE+5N5iob0Ed/oF7xMbtYrws+KR2BR//E+D1FZ0z6K/go=
X-Received: by 2002:a05:6512:224d:b0:57d:cdb4:5b94 with SMTP id
 2adb3069b0e04-5905e2024e5mr7442241e87.11.1760348515946; Mon, 13 Oct 2025
 02:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com> <20251011122612.4fa7c97a@barney> <aOpAO7j0Uyo6FPcu@gmail.com>
In-Reply-To: <aOpAO7j0Uyo6FPcu@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 Oct 2025 11:41:43 +0200
X-Gm-Features: AS18NWAxbYdqmNzUcHN6qByywYTVDrUPwmo1A34-f5zcgyydo35rhG25EAcst_4
Message-ID: <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2025 at 1:32=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@gmail=
.com> wrote:
>
> On Sat, Oct 11, 2025 at 12:26:12PM +0200, Michael B=C3=BCsch wrote:
> > On Sat, 11 Oct 2025 09:43:54 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >
> > > Hi Vaibhav,
> > >
> > > kernel test robot noticed the following build errors:
> >
> > >    drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_suspend':
> > > >> drivers/gpio/gpio-bt8xx.c:233:19: error: 'struct bt8xxgpio' has no=
 member named 'saved_outen'
> > >      233 |                 bg->saved_outen =3D bgread(BT848_GPIO_OUT_=
EN);
> > >          |                   ^~
> >
> >
> > It looks like the
> > #ifdef CONFIG_PM
> > must be removed from struct bt8xxgpio definition.
> >
> > --
> > Michael B=C3=BCsch
> > https://bues.ch/
>
> Hello Michael,
>
> Ah yes, this macro somehow got overlooked by me. I will send a v2.
> Thanks for the review!
>
> Regards,
> Vaibhav

While at it: the subject should be: "gpio: bt8xx: ..."

Bart
