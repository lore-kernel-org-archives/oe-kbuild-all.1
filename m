Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136BA1F1524
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549811; cv=none; b=HQA1Y9m0VvdmttMcKwMM6HcRhvQp0XPUmaUsUP1+lg+u/evIKbp0OMNvcKlGwIDloQBpIeOoaoFUjjlTpvzPeXjAFYHlxIoK2r9db0wt0sVPbu9hBqKOVu/lDErvUM6VrOFOZ7yD6ZK/koMpoiVnAJJsvygB6Kqk4zNZgZRHj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549811; c=relaxed/simple;
	bh=/pOwpvz3SSNp8c5scminz/oXZnWulPynBd16kMIEiW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvYO9cGe4sAALj9Eh0m9awr6UcwvZlDzEncgH98V9nioAFvX0+AYOltjQKM2UX5Y4y75FsND/YdBLkcrMHZXMuOIqidqkXHjXQ/gxxrjylK8WGbsej6QzZ5+/t6E83RdirSwDrTOpFh3ZHYPeBeZTNM+0BsMNCtR+BUODkew2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so773824241.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 02:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549807; x=1743154607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpI2ZDWuq3G6Uk5QSQZYNIovPpchlt6ElQHUEbJygfM=;
        b=FL9CiMUlyey0HXBldicjgLLA1K1sEsfGfG82IqfYeGUTBvMaasNhH9d637mIWfi8R+
         UjN0E4YNSbI+GBsl6v+rbv1KpQZn8O6pcAADQCUfU8r5T1oxGP9NiK1mDnhehzEVjXnE
         ff/wjV0/isLn05K6C55drmhJsSZTuT4O9HAhAGtOPGzRzYjtoaAWq/zKAOubuqCmzqKP
         KVISUx4vHIlwSGpoE8pMKEwIayjgZeSYvYSaS0vGqmVIJqUx1rnhiLNVDf+6kJHy3Rz8
         J227+CZP53DhU6H8v9Zyce6+9bHuqLH4TL5hUTCE9km9vUR/vBWLh5xfH97/6YhqJ9aY
         sz2w==
X-Forwarded-Encrypted: i=1; AJvYcCVvXF6+R3kTiLb1WogQCgzUJ+FmSJWmPyEj9Uvc5uyCGuCy/CUW8RNMzWLWFAvPKIUBt0RznDSxMVukNweq@lists.linux.dev
X-Gm-Message-State: AOJu0YwfiFgvtocLJHaixpk3XVPi1cgQSQAVXbR+CflhWJ/i3yop6KE4
	IHTkXdxC10+qAkskgF8gYCrQjyDeKkQ8peHd84FLnSsJrGOzeHaeeQn2ZUxt
X-Gm-Gg: ASbGncsfRlUwU2PLwWeJr7YjA5PBhbrY3GE22hm+bql/k+Lf/u1n98OMJtB+U6IGkPp
	pBGfAk3gk2+jIX3ne2kz/AIusJ4MKuUeg1vnoAJXoO+T7e7vKAcEXOvBydwQpau09IyV3S+YJNn
	uWN9qqFxccvwBhybg+qRjSrRs/p7eVUSLxRY6zvKl/TkZktp73eaYu1nCbKxZYKVcCuf5eZDOmi
	HweBIf/gg3LvFQmGNDuI4ASSufRmeePSx81fXaU/dRVvE0oi1J0Oo3xl50GYSc1/B6GxbdkYLWc
	WsaS7lN7UMU2+gLJ05n5LGsk3st8dP+S++vl4nl9Uue8BETg4mx1VuG+tDpP9fIFcFKYUwitvP5
	GLl9lmEE=
X-Google-Smtp-Source: AGHT+IGe/mkew9dVlBsp3cH4IqKvWObyH/9Iz+pXuqAy/ySSSTOB0MceJyrfpawTCHE2y2eu0JnBlw==
X-Received: by 2002:a05:6102:2ad5:b0:4c4:e42c:38ba with SMTP id ada2fe7eead31-4c50d4fa2a8mr1644138137.13.1742549807153;
        Fri, 21 Mar 2025 02:36:47 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3c2c6fsm310603241.17.2025.03.21.02.36.46
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:36:46 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso798756241.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 02:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqcaJlJTeKIZtkkQGACek+lTqdpl04GU7MShi4Td3x8M9uJFyCipg2ULeP/TvN8GOWpVlpJT8eqOPCdjSN@lists.linux.dev
X-Received: by 2002:a05:6102:54a4:b0:4c1:8b8e:e9f7 with SMTP id
 ada2fe7eead31-4c50d4b370emr1929888137.8.1742549805933; Fri, 21 Mar 2025
 02:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503211029.DnQpqsJs-lkp@intel.com> <927105f8-4aa8-4579-ac2e-bce4bce12b1e@app.fastmail.com>
In-Reply-To: <927105f8-4aa8-4579-ac2e-bce4bce12b1e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Mar 2025 10:36:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeynpmUUmZPViEBttANFmEhpjFn0wqNc1wQB6wRbd0rQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqEvbttQ-lKLZf8npFjdUhrt-aqV_OwYka3KjE3DchYx8eW7jqUyLFbARM
Message-ID: <CAMuHMdUeynpmUUmZPViEBttANFmEhpjFn0wqNc1wQB6wRbd0rQ@mail.gmail.com>
Subject: Re: [soc:soc/drivers 20/24] ERROR: modpost: "__ffsdi2"
 [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	arm <arm@kernel.org>, linux-sh@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 21 Mar 2025 at 09:41, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Mar 21, 2025, at 03:41, kernel test robot wrote:
> > First bad commit (maybe != root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> > soc/drivers
> > head:   ba8755ab541fc629948233125db870d4dbf00a75
> > commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform:
> > cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
> > config: sh-allmodconfig
> > (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202503211029.DnQpqsJs-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

Bug in driver (must not use __delay() directly).

> > ERROR: modpost: "devm_of_clk_add_hw_provider"
> > [drivers/media/i2c/tc358746.ko] undefined!
> > ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko]
> > undefined!
> > ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko]
> > undefined!

Missing dependencies for driver.

> >>> ERROR: modpost: "__ffsdi2" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
>
> This comes from __bf_shf(spec) in omnia_mcu_request_irq().
>
> As far as I can tell, this is not your problem but in the
> SH architecture missing one of the libgcc functions that are
> called by gcc.
>
> Since this is only for compile-testing sh allmodconfig, and
> that is already broken because of other bugs, I'm not going
> to care either.
>
> Adding the linux-sh list to Cc, it would be nice to get a clean
> build again. All four problems should be trivial to address,
> and some of these have been broken for many years.

So one SH-specific issue to fix...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
