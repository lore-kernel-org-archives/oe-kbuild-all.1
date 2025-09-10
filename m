Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E17217F29
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511979; cv=none; b=jD6eUYmxidcz07fdNDBs8aDvmBX8xqhr218kUw8R6UCrSkBBX4FXaO1VinkuTAbQo7jcvINaiGmtIdh4G1vnEIpdx3ufz32LAU8iam8Hd9ZDanxbxxn+SuVF/6sIAUimTIHzqnJso1PBxxwIaSlbEWfPDuH014HUJJZf0nhjnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511979; c=relaxed/simple;
	bh=jckwo4DzWJoSXQynmvCEPazuqxT9RAb0hM2+LiiTOlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5K39BNH8OxpYC19gjIBNJsRYBi6EwNrG2pNIF/VHgJY8JAw/u2N8A1WBajVx/4xzWoiAS4zHO6XOmOo1WV9Vs1u3gPELBFziB36Sfg8hppa14g38QBcQaUvy8Y6Lq0F+8XIuwz0xIPiWJZGurqXHpV1UPWjt+MRpCxlxeCRg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fSqTiv6t; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fSqTiv6t"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f98e7782bso905779e87.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757511975; x=1758116775; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jckwo4DzWJoSXQynmvCEPazuqxT9RAb0hM2+LiiTOlE=;
        b=fSqTiv6tWN09r0sdJDA448JeWUvtGzS29G6xOY/ZL31CmTXfGivG3tuSCFnABy3se0
         1oujoybukJFZG7mLqZNBBwZagwgsRiRu2Z+LXRfHk+VHBWPlo43wZDTQ9b60WlluV2Jy
         49c2+jdTTEJ9abxI7a4JVAZlNOzMCEjpWqWvMY3JdkBlINZ9uNakskWCpiMb0sKPSbsK
         0Exa9ccsw5WPgCdqtf1//xzX8fCJHMa1pMVL8vGe8hPqTZa0qHEd2y4GHrVyyro16xIe
         hzzutkMBs69HtFFuDRyS8liVNyU7McTos5G2kjNPc+1gtAWQEsbtaRTeQHA4G2h236PD
         do7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511975; x=1758116775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jckwo4DzWJoSXQynmvCEPazuqxT9RAb0hM2+LiiTOlE=;
        b=rIOLfORWy7n2EQGjTemCeh3N/GFwOtWsJZA4G17s98xIdc5kO1CfOen4K97M03qDaU
         s7Vqi4cvGyCPy/A9g54CGiSH+dLAvxNeZCgbvlv31EchInmENqaAtWsyFC/m2C7fsN0T
         1k9m/uwb2nziLqAFugEqu6WYxZpYyf2U23mNwQW4u1buoMGSDRlNiw9MvlcueF6L+j2t
         VpUuNiuwEF3crk+H4aGfAGYbrmjbzeA63kezm0jf1mncJpwxmmFMbolMbN9Qd3CbbN0X
         kKhqrFlMJNhJAYswI1UVlGthc4jgQmjE+lc+mcCbMLgTKThbqBTokRZ6NC437n2X+1Ld
         4ccQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5EM1RkW7UMYM3SzNk4hbpEKIbxlILzbhf7URUc3JzGP9bsHQ7aw9HefQHnyvp5roZuQAFOQKh6q7Rx5Nm@lists.linux.dev
X-Gm-Message-State: AOJu0YzJhCg9bvwRqQh4vTRL57jivfFea2XjGP2bi7tV1C/6vS2FKFK8
	e2mP0aa0o3qJ19IgD9tSMHy9JI6to0cLCKhA/OC4itybdxlWjHxfpwmkcXWWi9kPK7nXnyn+u+p
	K2JpfVseV5cLQL7gW6fKeRARIgzQ4I5nOfRSCki3e7Q==
X-Gm-Gg: ASbGncsaQ3Otu6juzCNHu1oRxbpA0P0HmHnxXPXBSP7QGA29lFd930qRUUxq6zP46XU
	Rsky1t6Rhk3aJ78OlqYl3rkp16Yn6qYCh21UMoeLgBDsg9S/0RupmfHBBcoNUsErdKe1wTc4MgO
	Paga3Odt+y0YBuY74IP7qFtk9eIM59KfMtQ9tNDI20dhJGhQak/mYDPjjNTFsPkT6dpVP6sBSqt
	H9fFN3BUEg+9qpNz+hzBLwPc+iaD2TABAf6e0E=
X-Google-Smtp-Source: AGHT+IFgj2ppHdy6zATwu9/GkdKc4tc5zX1z5/CmlY1l1JQXLE6h9ZkRqOvbziFLq6eYgZNZaXGJJCpLLoi+L5GfeRk=
X-Received: by 2002:a05:6512:1195:b0:55f:3c0b:9ca9 with SMTP id
 2adb3069b0e04-56273118a03mr5943244e87.1.1757511975363; Wed, 10 Sep 2025
 06:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu> <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu> <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>
 <aMF9QFIvXC5kI_9J@ada.csh.rit.edu>
In-Reply-To: <aMF9QFIvXC5kI_9J@ada.csh.rit.edu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:46:03 +0200
X-Gm-Features: Ac12FXw_b4dB1oBOSKat4kUqj6UH_gOF4z0OMCLiQ9S83rqNOEKPvjJcoe2D9qs
Message-ID: <CAMRc=MfSOTTBv3spbyiedpMifMyfmTkpmbvuDuKcbs5S1B+Esg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:29=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:
>
> On Wed, Sep 10, 2025 at 03:15:46PM +0200, Bartosz Golaszewski wrote:
> > I cannot really give you much feedback because this patch should be
> > first split into smaller chunks that explain what each change is
> > doing. As it is: it's so complex, I simply don't understand it and
> > don't have enough time to try and decipher it. Please try to make it
> > into a series of smaller patches.
>
> Got it. That's why I offered to break it up.
>
> Here's the order I did the work in:
> 1. Add quirk support + brik quirk
> 2. Label format (Only a few lines, could go into 1 or 3 if preferred)
> 3. RCU stuff
>
> Is this a reasonable order for the series? This would be the easiest
> way for me to do it given what I have in git.
>
> In a perfect world, I would like to have had:
>
> 1. RCU stuff (These are effectively bugfixes)

If these are bugfixes that should be backported to stable then they
should indeed come first.

FYI: Maybe consider also adding lock guards for rcu read locks if you're at=
 it?

Bart

> 2. Label stuff
> 3. Quirks
> 4. Brik quirk (possibly squashed into 3)
>
> Let me know what you think... Thank you!
