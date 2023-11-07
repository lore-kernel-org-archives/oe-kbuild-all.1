Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723236AED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4mfxM4i"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4ac3083ca04so1432970e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 12:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699387204; x=1699992004; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmxNlG3FaaeRhvK7Wue3XiQAUdscNV2HmALcVPSxmxM=;
        b=U4mfxM4ivW5Q1Q6tua/KTFbJgBmI4ry5R3p6aWL3x0Xjpbkwyh05MNcVQ3LPQGTCQX
         KxdS4fABfLCPiAiDbPj7hzMrVKDLBLMpSRlG+kxxZzUHGAok36xI//iTH/1ZukF4dwew
         vNOcyTiwH8V1zR7d1FUglfymqUrsZ8jOciWgO1M+e8El8LH72sxQ0wJ6nPjpp0BliKy9
         FpZLdi3UCr7XQ9/6cuKUawYYT4As2daeM3TNp7k8uWcnJFyTb4Dk0Qh9S8ood+QYAI2t
         a4GymbXVtJaTFu50SU77biSWstp3h07/x3j8cw5gk1O7cJhbA/gjpTKXKd0lxqr5ohvL
         3A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699387204; x=1699992004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmxNlG3FaaeRhvK7Wue3XiQAUdscNV2HmALcVPSxmxM=;
        b=GxN7j4+Ob21L/ayxPq6SyQ0E7DU/iWgvIEZ2rCk59PBSB4UdVeb8UockOKwMm8Jeai
         GUbzLxLrX0hFK7EDzbe0HNibWQK/gVVUI3cplgi+eNjTNa52b4mN4siwYk7dEBW6N7QD
         ABOwcsspRIRMIZJEN6nAtYTft2KtVF7Ib7PimhI5h4Rh5Z1KM1KbAQgAKR9E46z2g4pF
         2Kj1Oi4iHV3N9cNKdF9V3wT5ogA+X1xehzVh0rrjDK7oaXswkOyQV1KuxQ/nD7AFAMzn
         +rwa9tTpueYrWtbrp/9Xh9q7k95axVmuB5PZD8lDbS0vRG8GDka4qum3O5MtAoRMkJjd
         YwSQ==
X-Gm-Message-State: AOJu0YzfmhUb7Fi0Pg++SqNMgrfPAiFpt4eKbkZDfO8+irDFjlEdGeAW
	ptGHr3GRVy0sHXamG5ERG5U1vbjMvjJkkNtmTnA=
X-Google-Smtp-Source: AGHT+IEBsnIl1hunqub+h18HwKd4ax6cBTYLlFha49VxNSZYLAu23BZOwK5YBq+66A0PNrlEyT52vtBvqwOIjjKsTa8=
X-Received: by 2002:a1f:a851:0:b0:4ac:67f3:e0b5 with SMTP id
 r78-20020a1fa851000000b004ac67f3e0b5mr5169469vke.11.1699387203974; Tue, 07
 Nov 2023 12:00:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311051347.7J6bthD7-lkp@intel.com> <CAHp75VfmUXgx3nkFR=dZqffOu-LSnU_9u9GRYy0bTPLcdYhHbg@mail.gmail.com>
 <ZUdFtJeXBtx/httL@rli9-mobl> <abdb00c4-c2f1-96e6-9731-5a1773099336@axentia.se>
In-Reply-To: <abdb00c4-c2f1-96e6-9731-5a1773099336@axentia.se>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 7 Nov 2023 21:59:27 +0200
Message-ID: <CAHp75VeBgdSYE6=2q6kc+N6JDg_fy1Mc5DUJdJBmyZ8nnX8ywQ@mail.gmail.com>
Subject: Re: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
To: Peter Rosin <peda@axentia.se>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, oe-kbuild-all@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 11:31=E2=80=AFPM Peter Rosin <peda@axentia.se> wrote=
:
> 2023-11-05 at 08:35, Philip Li wrote:
> > On Sun, Nov 05, 2023 at 09:09:00AM +0200, Andy Shevchenko wrote:
> >> On Sun, Nov 5, 2023 at 7:03=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> >>> commit: e9e40543ad5b38b848879768359fd13650529961 spi: Add generic SPI=
 multiplexer

...

> >> I dunno why it's pointing out to that commit and some (random?) people
> >
> > Sorry for the incorrect bad commit, Andy. We will investigate this why
> > it locates to this commit in the bisection process, and try to avoid
> > similar wrong report if possible.
>
> In this case I think the reason is that you have CONFIG_SPI_MUX, which
> seletcs CONFIG_MULTIPLEXER, which in turn makes CONFIG_MUX_ADG792A
> "visible". I.e. before the fingered commit, it is likely that nothing
> selects CONFIG_MULTIPLEXER with the given configuration.

The use of the of_match_ptr() is quite doubtful, no?

--=20
With Best Regards,
Andy Shevchenko
