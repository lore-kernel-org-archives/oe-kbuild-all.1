Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874A3C461
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 21:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706478953; cv=none; b=Qzoe6/V4T8FracJqPmt6IxMlFGaKVDlD+Pf7iOOY9rW1It5SOnRI++4cCqhV0evB+D9qNe+eH9a848NvxSzZSNL7jtrsOQjN24vUOQQXdcSShBipL8UiIcrgeH7Lf9T1bOu63fk5GPaSdYHA6A0lHoOiT924hWTLR8cKqiT8TBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706478953; c=relaxed/simple;
	bh=9jSkYnuonGJybCKZEIMVw8ZfaI1LKdY3jyIXSfaWi08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aS/vR4RgBJot2ERjkVXUQdHEm4V9z/PIzWjeKInpMkg66UD4fuVxLo9yUq2VFeuKowR+B005YQmZPvqHCdvWncdvHyey5lfzX0sR3VyJYbKFOuvHRaLy1VwxzETh+NP5QfOgI5xsDcCI4cpfTtydt069l0fextAfkYwAM6hrIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PBXVMw1E; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PBXVMw1E"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cf3ea86423so22561371fa.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 13:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706478949; x=1707083749; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nLt6r4XtTa4SPYOVEEGfDF0wKF4MI0mrfWV0xt83Pcc=;
        b=PBXVMw1EF1WtKEWzbnvI/DDwPZ2j2Ojo0+PYWGrvxdaQ0V+c7GNt4LKHf5U1MVLICl
         an/aNSCcHd23/oECZuP02HU3HIzOY7GlYl0ksgLI/G+WB4jSTiECFuBuOxmxw0IKL5Co
         rzXPwELXX/YXRPUcYPecOSHmqdXKk4L11BEb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706478949; x=1707083749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLt6r4XtTa4SPYOVEEGfDF0wKF4MI0mrfWV0xt83Pcc=;
        b=H+Su/7Qx6h4d7tWuvh44ReQurPUP7Bn8fqUvlO8EUUzvRER7+7y9TPJ3spsUBEwVQz
         VPauQ28oOlt1u+1PR7JkMI2vLyLdZXCVCaHxvDvQWwqolcPtMPUyGqvvA6NtO+y3YdS+
         /BaKaNF3A32Tf+XJlN9AsJNVPGbE4KUv14gMb+l+5AD5orZ19yTB1DSpd5aG8qHYBGlb
         hokjr67F9lpNdS/14mAwyn+OZDc0/afeWV7IQjvAQXJq/JOXzm29ystrTrjOtpPc8+tZ
         FQmQzrbf0mpOHIvD9faRjNC3yaFHSzwg346ocdgFD4ZkxoF7iJXkfPhAV5Qk7GBY+bKH
         9Gog==
X-Gm-Message-State: AOJu0YxEkLDreIS9SIiF8cWw4eeKH/0zs6Xz7HT5Yf46cjJw0v5JZH1v
	xGDKy/045h1P14seOsmx3hQ4b2opTuavXyUtkMHKqSQqKVfFvxGVhcUAc2QLT9yEOV6v2SxR8/s
	99cU=
X-Google-Smtp-Source: AGHT+IHk+wayWVWhnzZdmumftkoUSW8w1ywBlKtssj8pUbgtHpzXs4otMf6d16gRCn0a90VCSGzqkg==
X-Received: by 2002:a2e:b384:0:b0:2cd:8ee5:2d8c with SMTP id f4-20020a2eb384000000b002cd8ee52d8cmr3001356lje.33.1706478949192;
        Sun, 28 Jan 2024 13:55:49 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e9252000000b002ce00b2e429sm963134ljg.110.2024.01.28.13.55.48
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 13:55:48 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5100ed2b33dso3267013e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 13:55:48 -0800 (PST)
X-Received: by 2002:ac2:4570:0:b0:510:c2e:e0e with SMTP id k16-20020ac24570000000b005100c2e0e0emr2432391lfm.13.1706478948313;
 Sun, 28 Jan 2024 13:55:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401280650.Us2Lrkgl-lkp@intel.com> <20240128211544.GD2087318@ZenIV>
In-Reply-To: <20240128211544.GD2087318@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jan 2024 13:55:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8LUAX_rwM4=N9kNGeg=E+KoxY6uQfyqf=k7MOrb4+aA@mail.gmail.com>
Message-ID: <CAHk-=wj8LUAX_rwM4=N9kNGeg=E+KoxY6uQfyqf=k7MOrb4+aA@mail.gmail.com>
Subject: Re: [viro-vfs:work.alpha 5/8] arch/alpha/kernel/io.c:655:1: error:
 redefinition of 'scr_memcpyw'
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 13:15, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> The thing is, VT_BUF_HAVE_... are defined in asm/vga.h, so if you don't
> have VGA_CONSOLE or MDA_CONSOLE you are going to get the default ones.
> In case of scr_memcpyw() it's going to end up with memcpy(); on alpha
> that does *not* match the native scr_memcpyw() instance.
>
> Since we have vga.h in mandatory-y, with asm-generic fallback being
> reasonable enough...  Should that include of asm/vga.h be conditional
> in the first place?

It should be conditional, because that's the only case you want to
actually have that special scr_memsetw() etc.

I think the problem is that you added the vtbuf include to <asm/io.h>,
which gets included from VGA_H early, before vga.h has even had time
to tell people that it overrides those helper functions.

I assume that moving the

    #define VT_BUF_HAVE_RW
    #define VT_BUF_HAVE_MEMSETW
    #define VT_BUF_HAVE_MEMCPYW

to above the

    #include <asm/io.h>

fixes the build?

That said, a good alternative might be to just stop using 'inline' for
the default scr_memsetw() and scr_memcpyw() functions, make them real
functions, and mark them __weak.

Then architectures can override them much more easily, and inlining
them seems a bit pointless.

But I doubt it's even worth cleaning things up in this area.

             Linus
