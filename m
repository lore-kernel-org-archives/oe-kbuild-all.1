Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27E31A571
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238411; cv=none; b=oVSvWJnuUtzkWvGNJgUxOnoUVFyiP1fNbQTEr628WLsR00vX7Fvyi+JkI7Y+JorQcyPkg764vxMX3IXzTn+6n3/LH8PP1F5+UrdQ4+gxjeUtLKXsJmZGI4+TZNDF6lZskSS8GvDsjHGpvJsDuytJqs/vdSSAvJWl2BECeSY81hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238411; c=relaxed/simple;
	bh=4w1bH2Zii6Zu7K0e3B7e/yk8NzMWKK/avccfx9Avjqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clngeubsXc4mQTXs30zHEh7ejD+jrV1TOugvJENN8XpgmXIOlasADk0Dabw+GhQY6ZXPKxZQqFuPLGj9D/yv6lc0RMzxleJ4W1b1QNa1qI1+712pPvMzL/TKm6kJITAX2wOUP0bxsaP5l07txD0eClRRBlm0Jv7RxYhgvyhlpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Bg0ZBUno; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Bg0ZBUno"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-343514c7854so417322a91.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 02:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764238409; x=1764843209; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4yXF0STHKbVk68ib7oC0OatHTusRkrsuLLpoDJSIArM=;
        b=Bg0ZBUno3WYxPLT9mFVtZjIrNvSJWu77c4pyT8807dyIg5t1Ap8CLmZ98JwFzpKn/g
         d3wYpsG6HjWSHZ7fS6oF6xdwS2FuzV/EBThDbbjV2MjFK5QXZmlm3h1G/snMrxfCZ3y4
         BXM7ieBT7mY3cVqczHt2u0K3GWQfWcvxTVGRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238409; x=1764843209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yXF0STHKbVk68ib7oC0OatHTusRkrsuLLpoDJSIArM=;
        b=RWLl9hyfo+l71QNmW1ry88HIt4VxjlvhkCgdR8/r7yVWNZEQGD9/MNyflYxKNCsAmB
         I9WlW+XsSj/ooqeQZ2VhIPWIcNw5gdUOP3lL1qeJR/BX+MMb3mEgyRNZ+/qJF8RBEwkd
         KrjOdOItBoCtwGRvoBMXzEG3+ukPCIHRD4Zp4Os8C5PzRubaobuS/Ohlq9t3806Y8NIy
         b35a9hSV1pYQrcQfEmJOwQZ5WOuZ8LwrTP09r0f3bn7IyD2kHuotCFg4mDAbvDWcnuLJ
         rCP8eHKqQEAI2gui72WLJFfTIYsHVwaQoZA34Wvnrds/agRqDrvDJsoDZoOWgcJpp3p8
         66Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVEzcQrSuNwf7byQwy8uwHz3Ax/eG8icGB8aR5F/iSPcsSpgefckX9AcMs1uIPRiSsNX+8gV2epQNEr1aGn@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw7+CRmfEBmxJFAXaj48LpCgJ8013iTM7YUERQN1gX3WITy9mV
	04T5k+U5evJowMXahdTRypmbWHPnd3q29rt5vJLK4/cpqLm3e8WUF83nbhDA2JGQZ518uXahTRG
	xmxz4hVpFzxp87AitBIYeJ/4g5Eu6a26L+L4pUhWrgQ==
X-Gm-Gg: ASbGncsQ3pu+i4zZyk1eCGTKRgTkcRwabFK60bOm3zXT3Y3y7/Ks7nGCUdTzO8Fwy9r
	0dPBL//fUOc6Bep0HH89i9Ect7dKAnA3djKV3pNqoKFeyrLYl42E7PL710F7rEVKnRxkyIveS2K
	QXKT71y6b4UjOOcpP4F2SvS6TWowug5ZG7ypPeUZDDkpxA1pcPcL6x8PV1ogjisb1uNInC3krOy
	TS9U+/neTBMGOxB9xeSORevjqwH3VJNVvHkXhPHu/C57B2cwyu78/+LokPB4H0V+OuJxkY=
X-Google-Smtp-Source: AGHT+IGs1+Oqa9L0Ztx8wyyjXGhLd8CsGobn9ZgsTmaJJ0XQBMQBnD3KQr9QI20mell3pLRlPlUKRwiPGkG9LWJXLno=
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id
 98e67ed59e1d1-347298a9f91mr23679092a91.11.1764238408648; Thu, 27 Nov 2025
 02:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
In-Reply-To: <202511270956.hzGiPzdZ-lkp@intel.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 27 Nov 2025 19:13:17 +0900
X-Gm-Features: AWmQ_bkTLym0lY7lSJOa-U0lUNbQyc4cDmvAcoBWHk3sm-hpRCRHcHOzlQQfKN0
Message-ID: <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: kernel test robot <lkp@intel.com>
Cc: geert@linux-m68k.org, oe-kbuild-all@lists.linux.dev, kas@kernel.org, 
	mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi test robot,

On Thu, 27 Nov 2025 at 10:59, kernel test robot <lkp@intel.com> wrote:
> All warnings (new ones prefixed by >>):
>
>    In file included from fs/dcache.c:38:
>    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
> >> arch/m68k/include/asm/runtime-const.h:28:29: warning: unused variable 'end' [-Wunused-variable]
>       28 |         const unsigned long end = start + sizeof(*value);
>          |                             ^~~
>    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_shift':
>    arch/m68k/include/asm/runtime-const.h:51:29: warning: unused variable 'end' [-Wunused-variable]
>       51 |         const unsigned long end = start + sizeof(*insn);
>          |                             ^~~

I guess this is because allnoconfig results in CONFIG_MMU=n and that means
that the nommu defines for cache operations are used and those look like:
#define flush_icache_range(start, len) __flush_icache_all()

And the arguments getting passed aren't used. Also noticed that it's
start and len
there not start and end like everywhere else seems to be...

I guess the  flush_icache_range macro needs to be tweaked to not
trigger the unused
warning but I'm not sure how right now.

Cheers,

Daniel
