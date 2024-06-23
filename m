Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB2181CED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719164580; cv=none; b=WElzgLYzllIIuY0T5N6m6E8CY+7FF0ludDpBqnvVpkn+Gmm+9gVcnILQkZz7dI5rUx++YrdGfGohRpbfB85qyn/Rvp8A0Ybvj/ryk96uLPnJ/754TaA8eEPofRPthYX0cz5Oeu1wosGEq65YeU5DD8506jRnD0CVyRsuZxmNBJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719164580; c=relaxed/simple;
	bh=oscGVzq/NKo+oTZZ1AvZihbrJjyPE1GySVqYQwm8a2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1Eu+ixjjQl2T2nf0FnPQncqdiZ0MI5zryaavilzbHzfU42JviOV5iCQR0H9Ooyt5CKe9hO6cFOSQMD0H4ouihnz5MI0dIwqykagSPp20B3CHWOUzsWqiH+IOOWdxhTU73s32SDmt6pHDlrnFe8uwvJ29P2hr3k0qZpy/lM3i/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HXrSyV+8; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HXrSyV+8"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a724e067017so44305366b.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719164576; x=1719769376; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5fJ88lZfkWH2C1vrrOnmXc3j9YkLX+Ta+d42tuBCSQ=;
        b=HXrSyV+8PGXKcKhn2rmklZx0DMbxomK5TvflyY2owl3snB8C+COt8H+Z/0jjbP+m7Z
         Ew77a6XeOAYL99WoF/nXpYN9mchj1W0bpX5o6bTpfFH0wGNX4n/9+1mAirrD8i3erk8R
         wLedDy4T8ITBCfDf8ahQ4omvbhDDV5V8IhGRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719164576; x=1719769376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5fJ88lZfkWH2C1vrrOnmXc3j9YkLX+Ta+d42tuBCSQ=;
        b=bUrILx8OHm0BmsEa9gw6S+feTGfwko1FzWC0gMqSmIwhMcGiv5hpbdn7jp9FuMY5tV
         l4hDhOK/LK1f9/ye+1VQNQZhw9zNezHONRYJY9alcwQhTyuPEWwOo2wL5y/+kf/dTjdJ
         a2/u0BRuBFBcnbupyd3O1z0Kj+HC3WqtNJer6HC6L2zOqd2EWLAJrgdbPmxNGTxt8SaQ
         ldml0RuX8P+YL+6oiiFxsxKE7C7crMvhgMjWxzTNz5XGooSSGjr8CfH0tv09SDYFR5jq
         nEHmB0UKl71f/fpbOJ0nV2ucWVEa0xbOjKssg/kW7Lu73pIbu/fhaueV+9CsK6Ww8dAy
         Cbnw==
X-Forwarded-Encrypted: i=1; AJvYcCVFcVy76mx7cTIwc61wem9qNBxv45TjRozy3uZGC97amw9y15ZvD1ixgGosDj4PWhFv3Jnsz9vRbf7GSZnz8/v/tXujktyjk7hr1tR/cw==
X-Gm-Message-State: AOJu0YzYDdPMLykEjTgUKhWzVmtIOs+ObjDYSloTBh5UVPxLVttDrsPd
	PHfFn+Z6IcL4RnJdEF3oCoTJq+WoPFBT0x461wmSIRFAtR0hi2OqJOZ5m+W7fLl7CuIJJ4/P1Ny
	RhpscsA==
X-Google-Smtp-Source: AGHT+IFeujlcmOU8X3j9Ndn7IiRzKX0mreuKChkvesZ9GzS5EWZYyzIe/FAhX7GevIIHVDz3TTZKpw==
X-Received: by 2002:a17:906:199a:b0:a72:450f:6045 with SMTP id a640c23a62f3a-a7245b6252cmr126270366b.21.1719164576280;
        Sun, 23 Jun 2024 10:42:56 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724162f037sm162190766b.194.2024.06.23.10.42.55
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 10:42:55 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d07464aa9so3248229a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 10:42:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUh+KSI3eRoAfhial1FxMw9zLWl5ycOlBdHeDMSP8YvuTPYzcvi3qJi7Sca7kRuzQc31uy0mKC3d9YD0hmXY7/KwZbTkWegyVgqtQ9wrA==
X-Received: by 2002:a50:99de:0:b0:579:cd46:cbfd with SMTP id
 4fb4d7f45d1cf-57d4bd804c1mr1559683a12.18.1719164574484; Sun, 23 Jun 2024
 10:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 13:42:37 -0400
X-Gmail-Original-Message-ID: <CAHk-=wiM5CNFsxnTnKxX+bGgA8E5r=sSD5iy2evcTDs0ARihHw@mail.gmail.com>
Message-ID: <CAHk-=wiM5CNFsxnTnKxX+bGgA8E5r=sSD5iy2evcTDs0ARihHw@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 11:42, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> For example, why does that 32-bit __arch_try_cmpxchg64() do this:
>
>         if (unlikely(!ret))                                             \
>                 *(_oldp) = o.full;                                      \
>
> when I think it would be simpler and more straightforward to just do
> that *(_oldp) = o.full unconditionally?

I can repro the clang issue, and no, removing the conditional doesn't fix it.

A plain revert of

   95ece48165c1 ("locking/atomic/x86: Rewrite x86_32
arch_atomic64_{,fetch}_{and,or,xor}() functions")

does fix it.

The problem does *NOT* happen with a defconfig, so it's clearly
triggered by some horror in that config:

    https://download.01.org/0day-ci/archive/20240623/202406230912.F6XFIyA6-lkp@intel.com/config

and a quick config bisection seems to imply that it might just be

 X86_MINIMUM_CPU_FAMILY 6 -> 4

from setting CONFIG_MGEODEGX1=y instead of M686.

Hmm. While I'm not willing to leave x86-32 behind, I personally have
thought for a couple of years that we should leave Pentium and earlier
behind. We should just require cmpxchg64b support.

It does look like the complication at least partly comes from the
emulation alternative, but I didn't go look any closer.

                Linus
