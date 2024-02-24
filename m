Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13D43AC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708801028; cv=none; b=hri8NTHgPIqEBOZEkSm7qkeWP8fhlOkhiDcac3d3z0v/P2DsxBdlA3XYXKEWlKQuFsaDGGTqVbFKsG/ebgX/Xrknp2FWBM4hu0Iu/C2ijnJmDiOIAPWqK4lxl2OoAAN44R1dZgs7kdSQWmJ1V10+TE3LHaiPdfGpkL+9jo646U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708801028; c=relaxed/simple;
	bh=ZYRTKusNjhoRms5QaEKUoN2lpVAHFgTGslctrMED8L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3B+5KJQa5ebZKsNtFjeHgOF9JCdwLMBOgJqCD1y6oV1MW4GE5h67lNLbojhyQ2P68ZxGG1esH8hT1KvR0W5Atx7scjP8wg9JsulVOzcz/ybA5KUxg1jq3+4kuxBCBta3FGzL8ye8gYj/ZvpVp3GIwmfJtboAx8Ot8ecRajRX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oaWIQ+k5; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oaWIQ+k5"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4cfa1b3c3a2so715711e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708801025; x=1709405825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g6l3eAVLnBHfDxE7wyqkZmE1aw5q5MGhmCobbv8fTQ=;
        b=oaWIQ+k5UMM0pzx0zS2xNClBAKeasxRxO2RCUuU+rnHjxSjcmEdUBOttBmdNcaxchA
         emO2aiEgTHBKXcVyr7+njzgwujEH+36q+YDIWdp/ON+Fynll0tnfY3kQEIOQQMoUo/tB
         Da/7Ug28e6zJQwx5P62cm5H/+Pri42chgat0zE1i9fdjIUY4ux78647XcNFO3eDTdotZ
         I7W2LXy9TnXeZJ5nTZjuLjxYByuamhYBjq9y072QlotNaRL72yn56YT0deq3VcfGdIgH
         lFsaKqihxDGT5Kev/vjAVMKKjWJAYRpPhXVktHR0uyDXQd0lMCQ5ONvwgeXLuEW8LkPx
         3gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708801025; x=1709405825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g6l3eAVLnBHfDxE7wyqkZmE1aw5q5MGhmCobbv8fTQ=;
        b=So75/+Jf7P9rrt44aW/M/lGSk5TL18gF389m6ltzzoI6DoVUo2aw9ehrEPeKWxnWtX
         XJh1OYW/pWj0RHVwJB56gXW6Js/Zrk+cuG+4bs4BiF8xX96AB8YJ2eumTmVzfv2WjrJr
         hG06+3c5NySMY4HT7w+6xt1Mu9nWLSyGhNHYy4tP2gCAsWnekH2fwIRj+VMxCI6Gwfk0
         /RKdDg4wVFlpBYFyJwckL66vlzQSpAA3nG6LQWrdAfKJQtEQqURH0irJiLjfG5oCD49T
         e1FzbnM9GmmZGO97hTy03dGfAZVHd4jKPlEKU6svg02mTHfZJc2vnTHynjChyTCGlX7K
         29ew==
X-Forwarded-Encrypted: i=1; AJvYcCUAysd4OJa64s8RGRQRvuvtmjMhRZDwY2N7GqiKY1qZWtXec1QdNjVVnpNgFfKZsAR5qzTuouUtqKTQdGOFQ5XF/Ew1MMBz1X7KXiBADA==
X-Gm-Message-State: AOJu0Yzi+wPmu1JcfVSaRy4PNL+Cyu9A/GBkXOV1jWzKlxGSPKbnVDwI
	I5Kw1zMv3xz+u6YIIUj2QJWVxI7E3Ldymx6f7VnDC0nUpanJKYpQDpabfGUNGY+prBCLKcSRuo6
	FXT4HVqPZlBFr5GoVW9a/lzOXohp1utGm0qIOvQ==
X-Google-Smtp-Source: AGHT+IEO2hrUoHhPWvohQA+K1R2xXirwjhjJF+iF5CkzSxqlZSBxnYTIfU3MNndbyuj4V3JcuzLlufJPh7rm2a9wew8=
X-Received: by 2002:a1f:dac3:0:b0:4cc:b98:43d2 with SMTP id
 r186-20020a1fdac3000000b004cc0b9843d2mr2598775vkg.4.1708801025155; Sat, 24
 Feb 2024 10:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
In-Reply-To: <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 24 Feb 2024 19:56:54 +0100
Message-ID: <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel test robot <lkp@intel.com>, "andy.shevchenko" <andy.shevchenko@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git =
gpio/for-next
> > head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
> > commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: Su=
pport 64-bit BE access
> > config: um-allyesconfig (https://download.01.org/0day-ci/archive/202402=
23/202402232058.4eDf4GRs-lkp@intel.com/config)
>
> UM Linux now again.
>
> gpio-mmio depends on HAS_IOMEM
> and UM Linux has set HAS_IOMEM, but
> also claims to support 64bit without providing the necessary 64bit
> io-accessors.
>
> Maybe UM Linux need to be fixed?
>
> Yours,
> Linus Walleij
>

Nah, there were other reports for the same issues, at least for x86
and alpha. I hope Andy will have some time to look into it early this
week, otherwise we'll have to revert the offending patch.

Bart
