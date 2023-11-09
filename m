Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE20A1E522
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4EDG+dI"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59b5484fbe6so10642437b3.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Nov 2023 05:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699538386; x=1700143186; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26RX/Gn3lPvFD6lB3x5mc07fH2M7bXA10h8bpCf8H9g=;
        b=U4EDG+dIm0BYFrU4qjEXdFkBkJrNCQkFhNxsnrQlxlcvWGi7dw647Ey4ugnNe4z7OF
         h5wDc/ajk+8pE5LOtb/3cMevRdJ04g9qzSPjbBJYuTZVgKN2ZDngIcFLy98eg5bdCNTo
         c1zi7H8j5ME+Lvhs1AtXoNIgCn5DcCF/bm6XELcbykEuQYYSa3T11VmjaMU0Ti+pgS/O
         NbGgypTIh9hozpj151eXeCFCxZ8m036NoJ0j13IIqooXBleaOi0+HCLysHjGI6J+iYNk
         VrEiV0LpubDvxdudrLEkXFY7Ze/UJTSy9vSbMxWdIIQeq1LV7udrH/qipL37wJgL2iOG
         JbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699538386; x=1700143186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26RX/Gn3lPvFD6lB3x5mc07fH2M7bXA10h8bpCf8H9g=;
        b=RSZkB4NaqNCTm+MZj2LMSSwGc3KXAVVbDbxRdrYuWQKWieyxRrxUIiyEkRuiREOOEK
         jHEQ9vP3E5K9M/Rd9VvGzkFX89I/22WkckZyPMM8mfWyQwsArKbCcUbssL5iCIzbYhXw
         gG+jZTkcOZcrvQUiz+mcrB5mA88jippONTPkBkA5PY2PUy97LdneE5izUoz1Ven2NVZp
         BKKcXM8h/QgqEciT5fUUSAuotZJBAdQFC4igURzs88dNWlyRgmBwZScyk46naXmrntxw
         F8KY2rKp8OwiLZ4B7+pP6v/m4U7lvYIBAAM7wgdFpl3o6SAzKOJAh8gp/pBazFVhiK8k
         TSJQ==
X-Gm-Message-State: AOJu0YwNF21gyAkbLF9Fg3z37KuSII5RSa+jxiTwmLk4MKIQq39wxvXJ
	pFsrR21Xy+MF7wVThn0f1tDDXIncIxv3YfQubIA=
X-Google-Smtp-Source: AGHT+IGuKJ0r2icDGDgc44jaP3XgrjSwIEJmzX1gY6ajp7z8zQxHTORtb0BVo4vnAudTaqv6y58q/3TPc8TXuFnOASI=
X-Received: by 2002:a81:a0ce:0:b0:59f:687c:fb36 with SMTP id
 x197-20020a81a0ce000000b0059f687cfb36mr4951972ywg.45.1699538385791; Thu, 09
 Nov 2023 05:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311051347.7J6bthD7-lkp@intel.com> <CAHp75VfmUXgx3nkFR=dZqffOu-LSnU_9u9GRYy0bTPLcdYhHbg@mail.gmail.com>
 <ZUdFtJeXBtx/httL@rli9-mobl> <abdb00c4-c2f1-96e6-9731-5a1773099336@axentia.se>
 <CAHp75VeBgdSYE6=2q6kc+N6JDg_fy1Mc5DUJdJBmyZ8nnX8ywQ@mail.gmail.com> <c67a4871-a158-b7d0-42c5-cd8f31584ab4@axentia.se>
In-Reply-To: <c67a4871-a158-b7d0-42c5-cd8f31584ab4@axentia.se>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 Nov 2023 15:59:09 +0200
Message-ID: <CAHp75Vepv3YOpPusPM98vxL38rqE0u-ixniKuziRxBjJKT67SA@mail.gmail.com>
Subject: Re: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
To: Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, oe-kbuild-all@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 11:39=E2=80=AFPM Peter Rosin <peda@axentia.se> wrote=
:
> 2023-11-07 at 20:59, Andy Shevchenko wrote:
> > On Mon, Nov 6, 2023 at 11:31=E2=80=AFPM Peter Rosin <peda@axentia.se> w=
rote:

...

> > The use of the of_match_ptr() is quite doubtful, no?
>
> I was trying to answer why the spi-mux addition was (wrongly) fingered as
> the first bad commit. I should have been clearer...
>
> I don't see what's wrong with using of_match_ptr() in this driver as
> CONFIG_OF is not required here. Why isn't the correct fix to instead
> put the definition of adg792a_of_match in an #ifdef CONFIG_OF block?

Because:
- it is prone to error (as evidence this report)
- it adds ugly ifdeffery and more LoCs in the code for no value
- it prevents driver to be used in ACPI

I found at least two of these arguments are serious enough to drop
that macro and not use it _at all_ generally speaking.

--=20
With Best Regards,
Andy Shevchenko
