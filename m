Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0CB1400F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnCShuZx"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4259295ca72so4103141cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Dec 2023 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701973522; x=1702578322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JdtSkhV/uZ+qgTv5nm/tjN7XRjVnjCUJ7V0n44iPxI=;
        b=YnCShuZxM7xp0KA98mv86HKGvkTxRnOEx28JGCzlB4MMXQdAIrXc9R2pvKNQcNmCw1
         CNUFdXFADos5IzWFXhslEG2KLeAetEG9LMD1qnleoWWoB0zEx7H0PuUSHyYO2D4a1oiL
         +qkFiaXS9W0XLkqCOhmmegM5AY3BwT7JSEGtgtppDy8XBNnxUdBK3W+mKoBbYH1dN6R0
         R+i45SBG72bwzFUhPmsRbRDX0qzSNuBAB3UkeonEZ4YaXxeE2QjNk21QMK/YlOGBE8HZ
         7uNkcbl0CX6+Vdw3pW/Dctj+5aYbyO4z9bC8wWfeQcBxL/F+vQElkFGeruEPuUUVpF5E
         YTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701973522; x=1702578322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JdtSkhV/uZ+qgTv5nm/tjN7XRjVnjCUJ7V0n44iPxI=;
        b=mWDGsho90Mp9AddgPlSg1IQaXbfGP7s3L62ZgkqT9JmPL2r4Sk5M7IOR08h6N0Fstr
         e3YTcAfg8DNDkFH9wlLrb4aEJjbJwlvqgeGcrsFuLU7M6TYeEbivcQPN38vz5iM6lRaX
         49PKTb2IKFxeJ5Kq3d5plrwaOhTPsEd7uD0oJDoEc8B79cZGbGC2EB9BztYGnfgtISIp
         ozGOINyg8Tv/a76nnSCg7T/Hfr0AznjQm6Ncx89aVRryz3wfINkJvTT2mBiHkDwnUgFv
         S28MPOKxRe8Lu1HdL+sT9A335w5FGvnJrVvZ2WKASm4ROzhcjGE32rXtH4uM+zr8/4ZM
         qoUg==
X-Gm-Message-State: AOJu0YxHQwrHam3hjA0CGxxhcW63FJPnA4RtseCeZf+woHdw1l40XXRs
	V92yq+4MLmVLOnUR1MacSY+Rom4jj9u5t0j/M4U=
X-Google-Smtp-Source: AGHT+IHY+s/sc69Wv6rSKgC8GVl9b1PBrwAVNxIVr9rnmx1+q5QlZJy/UldZI2uZtz7PpgeFAYDI2UwljpPqDCLnd6Y=
X-Received: by 2002:ad4:4f11:0:b0:67a:a721:e140 with SMTP id
 fb17-20020ad44f11000000b0067aa721e140mr3126459qvb.109.1701973521839; Thu, 07
 Dec 2023 10:25:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231130191050.3165862-2-hugo@hugovil.com> <202312061443.Cknef7Uq-lkp@intel.com>
 <20231207125243.c056d5cd0f875ea6dfdfa194@hugovil.com>
In-Reply-To: <20231207125243.c056d5cd0f875ea6dfdfa194@hugovil.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Dec 2023 20:24:45 +0200
Message-ID: <CAHp75VebCZckUrNraYQj9k=Mrn2kbYs1Lx26f5-8rKJ3RXeh-w@mail.gmail.com>
Subject: Re: [PATCH 1/7] serial: sc16is7xx: fix snprintf format specifier in sc16is7xx_regmap_name()
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	hvilleneuve@dimonoff.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 7:52=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com> w=
rote:
> On Wed, 6 Dec 2023 14:29:39 +0800
> kernel test robot <lkp@intel.com> wrote:

...

> >    drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_i2c_probe':
> > >> drivers/tty/serial/sc16is7xx.c:1703:41: warning: '%u' directive outp=
ut may be truncated writing between 1 and 10 bytes into a region of size 2 =
[-Wformat-truncation=3D]
> >     1703 |         snprintf(buf, sizeof(buf), "port%u", port_id);
> >          |                                         ^~
> >    In function 'sc16is7xx_regmap_name',
> >        inlined from 'sc16is7xx_i2c_probe' at drivers/tty/serial/sc16is7=
xx.c:1805:17:
> >    drivers/tty/serial/sc16is7xx.c:1703:36: note: directive argument in =
the range [0, 4294967294]
> >     1703 |         snprintf(buf, sizeof(buf), "port%u", port_id);
> >          |                                    ^~~~~~~~
> >    drivers/tty/serial/sc16is7xx.c:1703:9: note: 'snprintf' output betwe=
en 6 and 15 bytes into a destination of size 6
> >     1703 |         snprintf(buf, sizeof(buf), "port%u", port_id);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Hi,
> the only solution I could find is to add this line just before snprintf:
>
>     BUG_ON(port_id > MAX310X_MAX_PORTS);
>
> it allows us to have the smallest buffer size possible.
>
> One other solution would be to change port_id from "unsigned int"
> to "u8", and increase the buffer by an additional 2 bytes to silence
> the warning, but then wasting 2 bytes for each channel, like so:

I didn't get this. It's a buffer that is rewritten on each port (why
is it even static?). Just make sure it's enough for any given number
and drop the static.

...

While at it, can you look at the following items to improve?
- sc16is7xx_alloc_line() can be updated to use IDA framework
- move return xxx; to the default cases in a few functions
- if (div > 0xffff) { --> if (div >=3D BIT(16)) { as it better shows why
the limit is that (we have only 16 bits for the divider)
- do {} while (0) in the sc16is7xx_port_irq, WTH?!
- while (1) { -- do { } while (keep_polling); in sc16is7xx_irq()
- use in_range() in sc16is7xx_setup_mctrl_ports() ? (maybe not, dunno)
- for (i--; i >=3D 0; i--) { --> while (i--) {
- use spi_get_device_match_data() and i2c_get_match_data()
- 15000000 --> 15 * HZ_PER_MHZ ?
- dropping MODULE_ALIAS (and fix the ID tables, _if_ needed)
- split the code to the core / main + SPI + I2C glue drivers

* These just come on the first glance at the code, perhaps there is
more room to improve.

--
With Best Regards,
Andy Shevchenko
