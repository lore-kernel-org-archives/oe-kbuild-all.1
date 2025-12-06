Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A31662E7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765041252; cv=none; b=AhELDnTAomKCtsGyGlJVZOt0ZhCujAzX2XKCBLDsdeUAcJPACtlQ0viZy4rg8HNSp3CtZQFe6KqN34qqQZN7cVs6FDMOt/lN7z7bdweqayIT1nZ+WL3Y2rQZYooG3+t+DZ3jqcwx6w8oPj6PzV3mP8mQNPYzBrw7ieg4R6b1W2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765041252; c=relaxed/simple;
	bh=F7e1SoTEN0lL3jWyWbkqfDlbdPW5WyzAW1dy7Z2lvxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmJyOPxppjQZwRA8dgOZydYi0sc/HN8FJcus8is70+0p1agH/gJ0Gvrr7+XUUmiwmT6OyO/EUmGOFIM8D8CpI+AvutTIu0G97fwCVTPG93f3J3IPFuDTFqcTeGMJ8mQRlsq2j0VzNw3xUw1ECxS84H0wIKyiXsXwVMLbn8s1Bkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbHCr7lN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbHCr7lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5305C4AF09
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765041251;
	bh=F7e1SoTEN0lL3jWyWbkqfDlbdPW5WyzAW1dy7Z2lvxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fbHCr7lNKRbTKvl1mY+5slme4OY0az2H6gzLvql7Mf8DvnftrIbPI5SGcWkYqByRL
	 4Ygby5rQzn8Z1TJyHJ8DA8Z0QwZRv3MKm8Cg5jFX89IyuInIQTGo10y6C7emS/g6kX
	 HyFTbkSEMdl0Qv2VTUOSR8UcBHgf09j4JFlc5vbRa2D6hYs75uZa8XpOxDP5SMCxOJ
	 UPm0sZBc/K/hZ2LfMxVItS/iU9UPt6wAYumaxCbtEb7S9OOOj5oZjKek2/lo1DPN8m
	 j95jyCveMgVhEkDyRpQEvH3X+A3XBlcu989OhTZfISACF3Z9V/PhzKENp3I13kRTJT
	 Fmsv7hHDQVDtw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso27453241fa.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Dec 2025 09:14:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3qk0a7C+KpANEBEC9Ua1GyfxIvFYUUmPuSoOMUwoutxWMLviV+TNMbjC16E/PMMxSNxUKF/ayBxBnmPhK@lists.linux.dev
X-Gm-Message-State: AOJu0YwyLBvSMji7GTeBd2b8VgEMfLUn2HhOiANHy1AtQ2JK9M2zmJvf
	0s1Axm9xnXyQe8O5DlwX0ky88mcmuxUAYHgaUH6kc+Wxh+MaVHvm5nvQ3So9FW0H+Yw5BboI/7i
	IRx9BWAbRZZwZ3S1LOWjyPFBITBdSFpk=
X-Google-Smtp-Source: AGHT+IGRVey+tYaM8AMZwesLpwMgi1TelcomflGsyk2qFL4nNDht73NsFJAZX8O8Z9yrLihOAihpgSAsIYprBLK2nws=
X-Received: by 2002:a2e:a986:0:b0:37a:2dca:cfc1 with SMTP id
 38308e7fff4ca-37ed2059d52mr7733441fa.20.1765041250500; Sat, 06 Dec 2025
 09:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com> <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
In-Reply-To: <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 6 Dec 2025 12:13:34 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
X-Gm-Features: AQt7F2oYPU0UXY-9DhJyOOFZP05rZ1ESY47CWDNW6FdihCsrTCLmDOkn4V2FUmA
Message-ID: <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:
>
> > This produces better diagnostics when incorrect inputs are passed.
>
> ...
>
> > -static void
> > +static void __printf(2, 3)
>
> 3?!
>
> I think it should be (2, 0). Yes, the both users call it with "%p..." in =
format
> string, but the second parameter tells compiler to check the variadic
> arguments, which are absent here. Changing 'const void *p' to '...' will =
align
> it with the given __printf() attribute, but I don't know if this what we =
want.

The second parameter is the first-to-check, it is not specific to
variadic arguments. Using 0 means that no arguments are checkable, so
the compiler only validates the format string itself and won=E2=80=99t
diagnose mismatches with `p`. This works whether or not we later
change `const void *p` to `...`.

Cheers.




Tamir
