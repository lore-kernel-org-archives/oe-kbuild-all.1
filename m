Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FA28F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391747; cv=none; b=P0cCrFJl7VnmG2dsM5ymcvjV8pBaw40iIg0y0eQ0L1q5z63ovaJwJzUJ/dKu264m6s9SUFiPW5mPBUjIYBbYy+DWreZQ1s5ffxYnUVqXziRGykGrqnF19RDB3EoTtaMSo6n2NMvaqIE1cmWS+CmtakVWzevh+aiogEPSN83ERgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391747; c=relaxed/simple;
	bh=gbkMNfwgfYdmOKAVYlr5A18p5tXwK5iqmUnvdxbkPn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAmYYsqdzYbPiLDQ0l7JfKH75nQAuhlBjzq1RzD3j+YGkgBG3h4YFfDDdoYGVD23zXyx1VWcXB6SSkfQQj3uHtvk8qHkC8LXwGrc5AWoxy40Q+1pgoSITbR9KBiN4JfBTUO4qgT6Q01tBPuOj+mG/ueiANBXJe/kTiRmrYRbXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523eb86b31aso2303395e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 00:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745391744; x=1745996544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLLT648Qo0bBu3L/szjjcPVs5CsDim4LfUXjSbqVkUo=;
        b=XOKsU9BwqFC+Dwn14EWFxQ1vtMtX1DAQNZs6NOj4nCVDHP6/MPMbQ3YFBhunsr8CF3
         skizgjEU5UX51v3gusAyBxgXWveVo+jPW0m0zZUfbvQtG0eYbiWzMDtKaqQz3hCbXokw
         cbmgi0XMaJwWUOKSu7hzzkcOSKRbmYsBQioxUUccVFw8BnO8UDXZLqULv+962phAPibc
         iGIB4b+u8xWfeWXhvkScRU0iMOrJw9Fl2cMXbUgeqGtfPBE8kLfHJihmproyaU4upgD3
         dHyaOqDrJn4jLBLLO2XhsbZv7CcMJ/80vwb2tSV3KEfX42KlCwWt4d1UdMXC0mN7G+SS
         hX9g==
X-Forwarded-Encrypted: i=1; AJvYcCVd5YzOIc5tJ0TLBTNtXvcueSbG5XWpG2xVIOi5potxCu4k/AsVqTPC25ikIiBPAqr8llHki6C+bViNnpAV@lists.linux.dev
X-Gm-Message-State: AOJu0YzK+BOXRHQ7jVFS3lPJ5ewQLRDFbR4KHUmbY2Yu/3spfN1g928G
	xuYKj6cvUDiVnA0mGL6jkuU+Bmirt6hyRiOtsYVWe68mFUyjdc4yuww3aWEu
X-Gm-Gg: ASbGnctBoeNMZeKN3a2SflgPzvOkIjICylfyBVtJ0VZDKfVAwkVW5/sTOa2m53rsB0n
	QZwQVBThGGrpvnJKN9PVk/nZPx203O5e8Ymwcv2N4gljwJVLjsmVh8oMwpT3PMqHPJElokwJI36
	vlvZNQvw3VrPtSMuGcBP3C2GpS2poLZtp6vVyNeBVvF2wyaH/2l9Zqt3zqWQ7hpT8MN8uZL/1Vy
	F0DBxCtncOBPkIqkxAFGnzrhB3A4YTBWz4+9tiwGj/ULvbpI2wPhgHeb1aueEPDLq7QxaTVv/S2
	8spM/qmLkiJqd+YZosjBnuVlG9rpDY7AFePSSCJHY9zx8TfzKbyoUSx8bBfOMHD2XbgituOM5UT
	N0PQ=
X-Google-Smtp-Source: AGHT+IFh0/CJZr1QATqxzsndmVR8ufKQjQrVdUzSRR2FejdRXSZ1EZB/uZyDCbW17wYunC9eR5afIQ==
X-Received: by 2002:a05:6122:884:b0:51f:405e:866e with SMTP id 71dfb90a1353d-529253b90dfmr12363583e0c.1.1745391743858;
        Wed, 23 Apr 2025 00:02:23 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87764799454sm2632855241.28.2025.04.23.00.02.22
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:02:22 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso2151037241.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 00:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGjMXAZWPYv+us4di2wMT/vtiqo/QPeC3sgyYi02GVUcXcHgQWuvEI1alnIWBiyTuyr4xYNfv2R+Jb1NqD@lists.linux.dev
X-Received: by 2002:a05:6102:115b:b0:4b9:bd00:454b with SMTP id
 ada2fe7eead31-4cb8011c0aemr10746966137.13.1745391742137; Wed, 23 Apr 2025
 00:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419115157.567249-1-cem@kernel.org> <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
 <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
In-Reply-To: <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 09:02:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5F1nEpF9+jJSP0oap6GdP9mQSPp0c3zSmXeOPrCzA9A@mail.gmail.com>
X-Gm-Features: ATxdqUGRbZuOINkFuxvCUmORu2B9D7f0xtqPILeeZNQ196gJiQhds1EEJ0BoHQA
Message-ID: <CAMuHMdU5F1nEpF9+jJSP0oap6GdP9mQSPp0c3zSmXeOPrCzA9A@mail.gmail.com>
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
To: Guenter Roeck <linux@roeck-us.net>
Cc: cem@kernel.org, linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com, 
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de, 
	angelogioacchino.delregno@collabora.com, Jonathan.Cameron@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Apr 2025 at 19:42, Guenter Roeck <linux@roeck-us.net> wrote:
> On Sun, Apr 20, 2025 at 08:40:27AM -0700, Guenter Roeck wrote:
> > On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> > > From: Carlos Maiolino <cem@kernel.org>
> > >
> > > Building linux on i386 might fail if a 64bit type is passed to
> >
> > i386 actually builds. Its compiler is probably able to convert
> > the offending mult_frac() without helpers since the divisor is
> > a constant. I see the problem with openrisc and parisc, with
> > gcc 13.3.0.
> >
> > > mult_fract(). To prevent the failure, use do_div() for the division
> > > calculation instead of hardcoding a / b.
> > >
> > > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> > > ---
> > >
> > > I'm sending it as a RFC because I didn't to extensive testing on this
> > > patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> > > only types. If that's the case, perhaps, a new mult_frac64() might be a
> > > better idea?!
> > >
> > >  include/linux/math.h | 19 ++++++++++---------
> > >  1 file changed, 10 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/include/linux/math.h b/include/linux/math.h
> > > index 0198c92cbe3e..05ea853b75b4 100644
> > > --- a/include/linux/math.h
> > > +++ b/include/linux/math.h
> > > @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
> > >  #undef __STRUCT_FRACT
> > >
> > >  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> > > -#define mult_frac(x, n, d) \
> > > -({                         \
> > > -   typeof(x) x_ = (x);     \
> > > -   typeof(n) n_ = (n);     \
> > > -   typeof(d) d_ = (d);     \
> > > -                           \
> > > -   typeof(x_) q = x_ / d_; \
> > > -   typeof(x_) r = x_ % d_; \
> > > -   q * n_ + r * n_ / d_;   \
> > > +#define mult_frac(x, n, d)         \
> > > +({                                 \
> > > +   typeof(x) x_ = (x);             \
> > > +   typeof(n) n_ = (n);             \
> > > +   typeof(d) d_ = (d);             \
> > > +                                   \
> > > +   typeof(x_) r = do_div(x_, d_);  \
> > > +   r *= n_;                        \
> > > +   do_div(r, d_);                  \
> > > +   x_ * n_ + r;                    \
> > >  })
> > >
> >
> > Unfortunately that doesn't work. I get build errors on parisc.
> >
>
> Turns out the first parameter of do_div needs to be u64, not s64,
> at least on parisc.

That is correct: the first parameter must be u64, the second must be u32:
https://elixir.bootlin.com/linux/v6.14.3/source/include/asm-generic/div64.h

As you must never use open-coded 64-bit divisions in the kernel,
simple helpers like mult_frac() can only be used for 32-bit values.
For anything involving 64-bit divisions, you must use the helpers from
<linux/math64.h>, e.g. mul_u64_u32_div().
https://elixir.bootlin.com/linux/v6.14.3/source/include/linux/math64.h#L257

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
