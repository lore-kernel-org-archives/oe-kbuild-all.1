Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD3E26AC7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfNvGFbb"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso7247200276.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702478647; x=1703083447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA9AYgq+Q6lLyujeVI1ujBo0nRXSJrVBxDPsrp2S+R4=;
        b=UfNvGFbbANFtVViN9TuQLEaUUqtC+es2sQlGKy/FonDi8c01guToXds4Xy0Mxxm0Bp
         Cl/OG1rIksoakW6TavX0wS1dd3aur6+uuslHvRem/byBHzVIEDhDE21U4DeoGh+uXobl
         y4bKQ/1Riz8PLH1+KCQNimKV6WRvpHjxHeTIhFgdxyjdaOh/oi5syvaHH+n1ObWp12o6
         shAJVjyCNrsxHKYU/fyBITH+GV0iXfoRwIPFqvtYd7f+lVnU0i6yhWQoxLjUfBB5UJdt
         cyg1CcUAOtiDBqCka6hszSyADj7eXzz+HBVZ8PojFEEN7fkOeTzP29Lcpjn5AuCrpKgW
         b6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478647; x=1703083447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA9AYgq+Q6lLyujeVI1ujBo0nRXSJrVBxDPsrp2S+R4=;
        b=hOXBD6G6vKa3Oa3evf2vEQd6g51rmpeGvJAd7fsxOSRdkrCaWH15TBh/j5LiML1yZR
         +WzOVApu2WvfVzvHndOsSU85I/aexJ7Devgs9Phv2Zl5gSMxeU3xx6e0dd89iLnp1Y/U
         pIAcP881+C+CQJyPG13p+HxoKYfNiC+qxstfyOLJTK0CeERHY+nzjLidLG6XwOZiHcqN
         meQJv+Ywpm75O+VhVmZC2J0TYqYm1i2HV1C9ERpIpjsO3ukPeRxo3LsFeLNu3jnWEx80
         id8KhIlmbkGAJ9VWKMi/2n4MDr7tDJa+RV+UqMqidUIPgJv7tRd3i0n6qT/vtktJqbvh
         LJmw==
X-Gm-Message-State: AOJu0Yymynr3IsFDyH0hfRiY96Jsb3Rh91MFabn6ygjbE1t+sYud6xzM
	uaV35ibFky4txrh94nDVwSC6OOwr9u/5OLnTI6E=
X-Google-Smtp-Source: AGHT+IEuu9eTC37h0uGuH3d+sHC+1yl29aTiQxb2OyOfh7A8H4bhb370iJVrewUB70HeP25ONnpIil5Z4wLYPKFVIvA=
X-Received: by 2002:a25:f202:0:b0:dbc:cd3a:aded with SMTP id
 i2-20020a25f202000000b00dbccd3aadedmr777115ybe.11.1702478647466; Wed, 13 Dec
 2023 06:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231130191050.3165862-2-hugo@hugovil.com> <202312061443.Cknef7Uq-lkp@intel.com>
 <20231207125243.c056d5cd0f875ea6dfdfa194@hugovil.com> <CAHp75VebCZckUrNraYQj9k=Mrn2kbYs1Lx26f5-8rKJ3RXeh-w@mail.gmail.com>
 <20231212150302.a9ec5d085a4ba65e89ca41af@hugovil.com>
In-Reply-To: <20231212150302.a9ec5d085a4ba65e89ca41af@hugovil.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Dec 2023 16:43:31 +0200
Message-ID: <CAHp75Vciqaphicuhs8HY3vmfLaLgHR55ebJbOXR3mw7X+HupSg@mail.gmail.com>
Subject: Re: [PATCH 1/7] serial: sc16is7xx: fix snprintf format specifier in sc16is7xx_regmap_name()
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	hvilleneuve@dimonoff.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:03=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com>=
 wrote:
> On Thu, 7 Dec 2023 20:24:45 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Dec 7, 2023 at 7:52=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.co=
m> wrote:

...

> > While at it, can you look at the following items to improve?
> > - sc16is7xx_alloc_line() can be updated to use IDA framework
> > - move return xxx; to the default cases in a few functions
> > - if (div > 0xffff) { --> if (div >=3D BIT(16)) { as it better shows wh=
y
> > the limit is that (we have only 16 bits for the divider)
> > - do {} while (0) in the sc16is7xx_port_irq, WTH?!
> > - while (1) { -- do { } while (keep_polling); in sc16is7xx_irq()
> > - use in_range() in sc16is7xx_setup_mctrl_ports() ? (maybe not, dunno)
> > - for (i--; i >=3D 0; i--) { --> while (i--) {
> > - use spi_get_device_match_data() and i2c_get_match_data()
> > - 15000000 --> 15 * HZ_PER_MHZ ?
> > - dropping MODULE_ALIAS (and fix the ID tables, _if_ needed)
> > - split the code to the core / main + SPI + I2C glue drivers
> >
> > * These just come on the first glance at the code, perhaps there is
> > more room to improve.
>
> Hi Andy,
> just to let you know that I have implemented almost all of the fixes /
> improvements. I will submit them once V2 of this current series
> lands in Greg's next tree.

Hooray!

> However, for sc16is7xx_alloc_line(), I looked at using the IDA framework
> but it doesn't seem possible because there is no IDA function
> to search if a bit is set, which is a needed functionality.

It can be done via trying to get it, but probably it's uglier than
current behaviour. Okay, let's leave it as is for now.

--=20
With Best Regards,
Andy Shevchenko
