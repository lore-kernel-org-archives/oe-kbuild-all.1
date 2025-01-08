Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F681FF1A5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736359869; cv=none; b=buyjq7zpwcNbbGkL6V+sKBFO2nOhpRkI4Z7ADJWs5Qx5L1lfMZH99pkbmw101LUOylEZVFBpm/lM0L2Xq2H/YFWN5QHX76wYtArzBcRA8WPcIFLhkT+A3XKd7dXTnkM4DB4v4dqassnWOJIAq9kmX1Z1MnpR9KFS1wWMDdjPAIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736359869; c=relaxed/simple;
	bh=yRlykbKSn5jYsW8wxQz5WQX3Mpwcq2FfRltURMyGjwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbIZif3r8uccQD3TDbp+p6Qf3p/pJJciTSRyc5kr0sF6abAyXWgABhmzsHfdkjxVsfws5lSijdJK4zqbCvum+pK3xe0qL3drA6yU4UxlL0Gu6emByRcrLIglgHUS4wPsRTiLR/eE22oOB04+HVEiz0i5zRsLupz5fvPps6iUCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TLIoViLX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TLIoViLX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeec07b705so21553866b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736359866; x=1736964666; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4L1kpXD4CvIKxF3DPmBbxJe2C0jfudiA06dORui5cI=;
        b=TLIoViLXs80PvL/6sp5EAmajOqYCQ059LoDbaHL1+MRoWUEgC3U9uBtBXBn6wxrDZ5
         VmLlRjNRhna3JxXP0QQV9zbhTgilJsUla52br6nSEXHMQ8xf1XYJBTwTEswGDRGCtYCW
         ObvoBwkJJuT3gqyarpOh5KYv8QV1VZkSK5hug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736359866; x=1736964666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4L1kpXD4CvIKxF3DPmBbxJe2C0jfudiA06dORui5cI=;
        b=VZiGvANEf7/SAljJdgYeSiFwyBRhk+pJpRzjvu50yJKVioJvz/FtALOUGC+1Z1MDQB
         ImQYvDpuPl5WHYN2WUq6tTMe7WXo25Fp04qAq6bwi43pKaLUX0wYBG9iYJotGTA4Jsf+
         FuP68nd1lIQzSFvezjVBqm1YTYHiuKR9YMte6IDLNonbGLNkjDDo+ON75Sjaky4Gcv6W
         eR3DPmGfsKDLUEOobu6xgh8N3mZMSGkPG93yNazObYGPGoCmHF5/BuE/MaRPycHOfxab
         fshIRccxZV9fO19x8PSMDvfGYKnG3AxI0gcL7P9LTJ8/bwAa222e85IZJfndNNcprjn3
         WEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXus03KeYWsZeo2cZtRO1nfX3hpnvJ1nKzYXTPrdw3je9+kjpo+u0qKvOvfKYMDQdT7F1m2SLqYe2ExB/eS@lists.linux.dev
X-Gm-Message-State: AOJu0YwaZR/XiAhBDwS6oJBMMzRkY+xZ4KwzrsP23zhnnw184wkZCpFQ
	8Jd/f1IgifM4t5lXCvV2lO2Jcm+45EgLKQMXp+Yo31ct2qSj4k2cD4ufxlStHhLGKqbPbho0fap
	Nt9VnoA==
X-Gm-Gg: ASbGncvFQnxZNWYjwGYcJ0aROBmRP1fwdn7bysY5UCBUPxzWRvrkYMico+76oyKLtL1
	TcQZ/PO1coaVPRHIhEG9l7hQgqSPJ9vQvOqTeRSdqcMTeg1efZ3RwHa6GeCoxowgJpL+9XoioPK
	8N5NN9HBho4oxfRxdNQluuW5XDYA2xGwOpr9jljE+e0zuT/a/3fM9SKDWsHqvUE1HHWrDL3jE9u
	lZijRgG83nOIlpSKUtzrgCe+aB/bynuYogi6/jD7AC54h7HCqF6BoLCoOSga3VOyQeDuL8H13z+
	harNSRsEa3+VjDuqIB8UQxlsevUP41s=
X-Google-Smtp-Source: AGHT+IEOp3dDhwspkhw39Z2/QaS15NokVR8NNOFKboDFB4NIDureiuZrJdjDoDIeCy9RSZnb1J4SNQ==
X-Received: by 2002:a17:907:d8e:b0:aae:ea52:3a5 with SMTP id a640c23a62f3a-ab2abdc0bc4mr378961066b.44.1736359866098;
        Wed, 08 Jan 2025 10:11:06 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830b47sm2550853266b.26.2025.01.08.10.11.05
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 10:11:05 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so19768766b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 10:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGmfsnPD4mFSV228PRnOdOAj1zKEydxIePMpU9J8v9sfWTAUSEfupiV6Jvat/gVI95orabYoeBMF6zQ8Id@lists.linux.dev
X-Received: by 2002:a17:907:1c93:b0:aae:8692:902b with SMTP id
 a640c23a62f3a-ab2ab748eeamr327286666b.31.1736359864937; Wed, 08 Jan 2025
 10:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com> <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
 <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com> <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
In-Reply-To: <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 Jan 2025 10:10:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whmhoFfty4GoAnN6u1K2EsjhWkoS767fa-+Lsf1Ya6A+w@mail.gmail.com>
X-Gm-Features: AbW1kvaDHAgFTamUSR1ieUMfa_7UpkwDHNwGJjelV-I2cxYJy3aNc-RISQlIhjU
Message-ID: <CAHk-=whmhoFfty4GoAnN6u1K2EsjhWkoS767fa-+Lsf1Ya6A+w@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 06:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> That leaves us with the "not addressable" sparse error.

Hmm. That one is actually a sparse mis-feature.

Sparse sees that

          "dmi" ((USItype)(v))

input, and the 'm' makes it go "it's a memory location" and that makes
sparse go "it must be addressable".

But for asm inputs, it just means that the compiler should *put* the
thing in memory to be an input.

And this is hidden on x86, because sparse recognizes "r" for register,
and says "if it can be either a register or memory, I don't require
memory". So there's various x86 inline asm that does something like

        "rm" (0)

and sparse won't complain about the zero not being addressable.

But in your case, just making the inputs lvalues will fix the sparse
problem, so I guess that's the right thing to do. I sadly don't see
sparse being fixed because we don't have a maintainer..

                 Linus
