Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0B329E6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238943; cv=none; b=aSPr5FbJ6Ldh0Yu2dbPBJU26bWCmQW2paNEx+JhOlAYjri3Z3qNMtGB2OlyK+eblyLNL0q95QPuLCsWD3hT4gYpN/rMipIamLOIcBpnhpDa55p+FlkVcLjeHuhBA2WDBVe2eWjT8fFqlgzQsOouEiGv+2/fn36A5B4jtFOfHncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238943; c=relaxed/simple;
	bh=WgZGIDHTZ2yGJPvf3HrBh6RhI6jHlRHm8hDy2sdVpM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxiVqylZ9iiJDyDk/Pf8BSbyisgN0UofSL4NbgrIb6MesD00IjjgkHmBjITOZUUSN94xp55Jmzlv7dUNCIu4ukhLMUPQvxBONT10wBk6KWG28P/DQNxc0nCGABvmPhZuR9eI9CD09V/4kMhkpowXgA4SpFO6B/WYsJGm8LmufVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso523646137.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 02:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238941; x=1764843741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j09ivE7kOjEbNLk28pWagcV+zggz3YJQi9QBU8ZUiM=;
        b=WSxXiUZSPMSquc19sDXo4ELEGl10Knyl9rFw7x18VutJiPp0sxtDMjLP/3DrRIBS37
         uYJzgbV8FV1D2JFXyMtjpgkufhyXfPo6A0N3CGSNSMCtsPZiDmbi80Zi2dczvQghOpF9
         A3qPfceb1BM2Qxruo9O+u9G+HqyKPlbyHgVdN8XH8UD5Grq8xDJkC4ipiNSJOVbTDfud
         dfqRkkLjUbtGWc3zdN/dd1A4u0ANT0DVNENMy8x1nx5m0TKV79m3mbD5FSn2lpaSKyK1
         Nfe20RYv7zNoC67A6OluZpJC2rrN/IDzLfjG/4k+tTnL/6jXvAt4R5P9F8Reh07JFRmm
         EzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmCGd/ZFgYFxVVJKxr/82+iLyEyUNTA31A330xkM+52T+9BrQm1FAccEZy0p+PK5yT+fPiC4WU+0j2kYqQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxPIddc7sX0LZyobSAbAT3qL4FGqlnL/ZLaEniF8dh20Wb1Iv7R
	ektVh+zR4bYOC4DgSzHNPCwLQuBlD9Vgfk3hafWDdXQSz/RcE8xs402TWXsBGxei
X-Gm-Gg: ASbGncuxr0l9kyMW6g7kugQiiiTpz/037FWFFuby8DW8fJ0IDcNK/y6YCHxkQkFUM5K
	QCPK56GsRVWyD2SJg6o7yFtDZauzvLRi8tJ7k7ni4dYRIJujeUz95brApWEcmvvZF6jYPQM6yTy
	aj9y9qi34u3/r5TBTG4kbk1g0t7rf7FbWNGA7TzZ0lSV2rV+M/BunPDMzjG+DuuGpLU0lWJYqVq
	NX+OErgrkjPqxKSYsO5UtsDdHJPaLaaB4bj1Dxw/9+a7RZPyPe9BndZQ282RU4DCwh2AhYDaE5t
	SJS/11C8QOfn2/AUtlb03d8mWC+OsTLeqdfG6DWPo0KbV080kVT1whWGpWNoSrfNB93RW3cD7iL
	B8JubRdZOVwkPEW2mM74iUW9XCPp5dEeGSobf2IrcD16G/9yt5aY1gzq1CmxEf8hWVbuNNbuYrc
	8wLcdevfs+ZrXOapD2JsKCggfM7LFvv7uQK4dsgbLKhdt089i7
X-Google-Smtp-Source: AGHT+IGaQ+usX3g7LZxY6nZm8GW9cm59RT3gzmkDeWAVcVfxufTGxtffowSDBXj5KNQg2xq+9pFG+w==
X-Received: by 2002:a67:e7cb:0:b0:5db:f5d1:5790 with SMTP id ada2fe7eead31-5e224294166mr3608872137.13.1764238940868;
        Thu, 27 Nov 2025 02:22:20 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d7f11c8sm386563137.0.2025.11.27.02.22.20
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:22:20 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93c6d160fbcso474857241.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 02:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMIaVRQXO6tENI7GsxtGDD1onC58Gdw0cd91zvamq3wIqxGSO/sl1PmovJXBHidy4fVaZ40MWP5AiRG4j5@lists.linux.dev
X-Received: by 2002:a05:6102:26d1:b0:5df:3b19:4119 with SMTP id
 ada2fe7eead31-5e2243d73aamr3298264137.26.1764238940353; Thu, 27 Nov 2025
 02:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
In-Reply-To: <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 11:22:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
X-Gm-Features: AWmQ_bkWE_UikKHWyVd5p5ZLA9UiWuUIjL7yc4JLz2wDvsO1mNkFp2kBVZB-msg
Message-ID: <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: Daniel Palmer <daniel@thingy.jp>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, kas@kernel.org, 
	mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Thu, 27 Nov 2025 at 11:13, Daniel Palmer <daniel@thingy.jp> wrote:
> On Thu, 27 Nov 2025 at 10:59, kernel test robot <lkp@intel.com> wrote:
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from fs/dcache.c:38:
> >    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
> > >> arch/m68k/include/asm/runtime-const.h:28:29: warning: unused variable 'end' [-Wunused-variable]
> >       28 |         const unsigned long end = start + sizeof(*value);
> >          |                             ^~~
> >    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_shift':
> >    arch/m68k/include/asm/runtime-const.h:51:29: warning: unused variable 'end' [-Wunused-variable]
> >       51 |         const unsigned long end = start + sizeof(*insn);
> >          |                             ^~~
>
> I guess this is because allnoconfig results in CONFIG_MMU=n and that means
> that the nommu defines for cache operations are used and those look like:
> #define flush_icache_range(start, len) __flush_icache_all()
>
> And the arguments getting passed aren't used. Also noticed that it's
> start and len
> there not start and end like everywhere else seems to be...
>
> I guess the  flush_icache_range macro needs to be tweaked to not
> trigger the unused
> warning but I'm not sure how right now.

Replacing the macros by static inline functions should fix that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
