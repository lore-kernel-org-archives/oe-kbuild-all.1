Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744AC8592F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961625; cv=none; b=jtuhVaf1Y5ARYm1n5012PDvc53BqdaGU11bgrhSAQtWI/Dhf+y1vd77AMmL/zSpLkzW9NUVusNtvLvd8yxO3pXQk7ZYIqCSI0PWbtgSAI4sd9/yULpZA1F3t9A0n/X74C7Zkzi8j2QBu5aYYH5rWKJmqxUfS63a7FOiZfxH2l+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961625; c=relaxed/simple;
	bh=zXq/oKtDFQ0k9CwqLBfkJgxugkC4ZPpjIEwL+WAqDz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlZc0SfKj58Y4HmqlgZLKD94JQLvsPsxznoEiFsgVMwrybw5i/uYHovRKU6b1KbPgcYr0RaF6ZtK+iODdY4pTpsF7OV8jIGTKR11pV8InQ5uL8iuSfLTVZ2FCbxz9ZYDy54w4Ntk9snaNvwBptnL0sG62EuA8W/TQXX9/b1LE4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQmcdrsa; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQmcdrsa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e891b5e4eso372974366b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 07:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708961622; x=1709566422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXq/oKtDFQ0k9CwqLBfkJgxugkC4ZPpjIEwL+WAqDz0=;
        b=DQmcdrsasBCnl6AveeRlg8JBOU4h2xSPq68Gr4Fu+SiGzdrMvm+Tg6G9G5woodecAN
         L5IyJYn6+/pyvUALjcflFZXrc0AehB3rEKL8EUOHLylTlqD4LnbrNl9eALa8dGun2x2t
         Q8wioTUh8v1kINmELQgd259FsWgJ1YLRs2Q4TddBrrAF6L0IaHPSTnVmVKZDsVzV96wg
         e8y9gfvw/xgo9JWwXfpaGxuBccm16YRAs4UA/Wk0jLBFoG4Why/c9/3+aQ6CKkPXWxwd
         j0RXmJ6yDGHlmUfDMCN6FqGOa7c2g5smxe8kqJBT/jzqNeoG+U2gVL5f8XoTLI3jI+ji
         w8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961622; x=1709566422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXq/oKtDFQ0k9CwqLBfkJgxugkC4ZPpjIEwL+WAqDz0=;
        b=uD+ILxBcUCxyE/P5c1a2rZ5ygmCszWd8sPjC+yCNR8u0D3/u8qThNm464jHFsEMu2c
         Xf2z2FmeVSX1rjOl5lDsakkdQZFdvmaFpqFhg8FLQOepppaGY+ANR+bjX/EJ7VDZDXsU
         z6tZ9VPmO2MQsIWbe4Upneyz07YaYPGz1+ORdugDjHW60vYneXHs40BE4gS2CF5meZ4S
         Aa+w9Ri35Z93MtPT2tMgRdfV5FUQIOsxzzGV7iZFCtdOV8qgGeZnK5q9kHARRVvjMYES
         zv+ant4ODIeuwtSzQVx8kVUuYfPneZv992xPvZxhoYW/Pigse9BSOqnpBipTQ0KR69j9
         Je1w==
X-Forwarded-Encrypted: i=1; AJvYcCWuRq8l0LacXrkbBCjaRN0O4lYHdOqxKqFQpLfTBYqOF5m0pvg0/biCLRAXZhljdn+C/9o74xuTg0+365AcOcME43KvLMOmfzrHFKZTGw==
X-Gm-Message-State: AOJu0YxxXNDv//51uZaFBVOQrTR6p3ZYpIcboGItRah71EuePa61fryU
	4zXuy52qAuIW8b2PcMxb0y6DJswXmFnPSVkpbPT3ghboCK37isebRHkXNxsm/BfUHi9NjRFnoej
	5PkwQU4Arr4jfSm87B3qKM2lStoo=
X-Google-Smtp-Source: AGHT+IEUueOGBV4LM8rI0AeP/xW87MpTTlFUQKbfJsvee8XWP05bk4bxfsfZIj/A/YPygp73zSkyzPjyazV8CQQ4Dw0=
X-Received: by 2002:a17:906:3ac9:b0:a3e:c3ee:33a5 with SMTP id
 z9-20020a1709063ac900b00a3ec3ee33a5mr4690856ejd.45.1708961621541; Mon, 26 Feb
 2024 07:33:41 -0800 (PST)
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
 <CACMJSesNN5A0ungLKWdV69nb8j4s=7334xZSRNt_sB64aQq4vA@mail.gmail.com>
In-Reply-To: <CACMJSesNN5A0ungLKWdV69nb8j4s=7334xZSRNt_sB64aQq4vA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Feb 2024 17:33:04 +0200
Message-ID: <CAHp75VfAHLGozhZw02-5N=ALt4gXuQpKaYCx0OXcnZJYxbW91w@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 3:56=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
> On Mon, 26 Feb 2024 at 03:18, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
> > On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:

...

> > The driver in question by name assumes that it won't perform IO port
> > access. Perhaps use of ioread*()/iowrite*() is not what we should even
> > consider there, Linus, Bart, do you know if gpio-mmio was ever used
> > for devices that want IO port rather than MMIO accesses?
>
> I don't know the answer. I'd also like to stabilize the for-next
> branch as we're pretty late in the cycle so I'm really considering
> backing this patch out unless you think you'll be able to fix it soon?
> I'm quite busy ATM and will be travelling this week so can't really
> spend time on it.

Then, revert it. Not a big deal to me right now, thanks!

--=20
With Best Regards,
Andy Shevchenko
