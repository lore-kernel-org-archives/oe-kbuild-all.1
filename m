Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3A79B9C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719167136; cv=none; b=pnCuzmcBBR0MyNx+Wj9Y2/WSbuKWh/PwFBEq1gLmtlGCeNUuss7EBdtQ3N1TEDdXW/kNeexP3HQQfS0fLzVpokQrQnwNsI6AmpgzpthwoEzLf+kqhTAATDFso6ENsFhcAvDvWPa35Yz5GxIg5fyVsr5iVoWSOkZ4VylXpim4osw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719167136; c=relaxed/simple;
	bh=as/miy1ciTXoov1k9v10YWH2KHSzwtS8c+tFIFA2eEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZgvQMzQUM6Ap7C63TkDI2P+k7I5Tb2QucIvMk6479uNjRZ1wWu9NlECTKlnnTmOgnhtvUaPF/fGlrhyN5AfRi5gJUbBRP1x5KkVgdj2ANCqKaqq8HoTFxhF/akQew6Nk/bGfvy8Q/z6H8h2Y+C9WJuRk+QaM1Xg/6+Hoh4rnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q8rqpkoc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q8rqpkoc"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6fe118805dso120810766b.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719167133; x=1719771933; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zPcDcr9W0nDXx9L0w2Y+uq4Fc6p+RIUkLyrf+Mc+Mfs=;
        b=Q8rqpkocXj50NCjqV/py2+udyazpo6QuMvoUBU5AZyQUr2niFFTKwAh/YEimzpHSTt
         mtThIPYFVVF5GAmfoXSRvYo5XnLOrTXNBp/CnQCICoLZwc4Vj3Jtxs4qrDBIhH6580zN
         0v5do++lHFiknunem+cqqV0gv9D1fA4scaRNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719167133; x=1719771933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPcDcr9W0nDXx9L0w2Y+uq4Fc6p+RIUkLyrf+Mc+Mfs=;
        b=Ezv6wa24ST4Yjxg1VIoh4bytxEhconD37WWPBXxNKF5szqvRrnRFG0hmNhovXFmfdG
         KdujxG7rSks4ZeMmQlIi1tpsMviBXZJJtx6geCgfvv/BfzgOx4SJI6uzxVfxgaVsrhje
         WfvTj7MGaFS0NTsTtOfTO5BxwlfeFT+CJvBcX6KqSjFSAhpCQUN9tPCDe+Ylqd0roxtF
         EGONTUu9LBhExV0/z+hPDrqDgbQvt3zZdxztPvtw2g1RrWjrm02mYcibZnJyHLOGaJVy
         Gi6va3t4bmUlP9C00KKNDq8uMi1FubvmjccgL5BGO5z9kSWX7HhK/Ek+o0aTH2YkYGjX
         O9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSw/kB9GBhe5k5XrVpLjGsCwU+ayFpshO0U05wrivFZf4ITWyzLJVSZ42i/0Xz+/izaTj9AOR+KM9T7qQ1sr4sROOe37f4XuCSibIE2A==
X-Gm-Message-State: AOJu0YzqSHUQrcV62BdOEIQMqJO4/yE+KsNMtoGC8TWeb+sqnA7iPNdw
	Vh18/T3oW/UxvIu5GfDhyvfYhcS1jjwsNMdkwTaE8pLcI1BH24Or+m5Mbrs3gpyQ9uYLO7A5Pq/
	yduNdCw==
X-Google-Smtp-Source: AGHT+IH6C3yxYJPycKPTchvTTQR8i3bFDpQkInEt2yYQzqyUTBchHdHLFK9NjR7L4jT/TmC8OPTIIA==
X-Received: by 2002:a17:907:c784:b0:a6f:dcf4:27c with SMTP id a640c23a62f3a-a7245dc96b8mr174923466b.47.1719167132876;
        Sun, 23 Jun 2024 11:25:32 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf42a65bsm327836766b.40.2024.06.23.11.25.32
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 11:25:32 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so448711066b.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVr5ZCNM9wqyspmf34Du521SEC2HQ9XygiJaFdVeDpvGqo4UyDbjgUIZPeIoHjBdrgSkkgMfIuuIRI+eQq+UvdwBpQKrw9wBrQinPGSw==
X-Received: by 2002:a17:906:c0c7:b0:a6f:e3d1:8b2 with SMTP id
 a640c23a62f3a-a7245c85a3emr178260866b.9.1719167131894; Sun, 23 Jun 2024
 11:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
 <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com> <CAFULd4b43=pTnAMKusJmGCeF1Bk-f6AyeOR8wGM8EieqhuH5WQ@mail.gmail.com>
In-Reply-To: <CAFULd4b43=pTnAMKusJmGCeF1Bk-f6AyeOR8wGM8EieqhuH5WQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 14:25:15 -0400
X-Gmail-Original-Message-ID: <CAHk-=wgHa_5u71j=Zx4DceTfjaeL2w1RCPPXbpEEL-xCw-J8ew@mail.gmail.com>
Message-ID: <CAHk-=wgHa_5u71j=Zx4DceTfjaeL2w1RCPPXbpEEL-xCw-J8ew@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 14:14, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> I disagree with *I tried to shift the blame to others*! I take full
> responsibility for my patch, and I'm perfectly capable of fixing the
> breakage with an alternative approach.

Ah, good. This is something I'm a bit sensitive about, just because
there's been so many arguments over it over the years, so now I go
into "preemptive nuclear mode" when the regression issue comes up.

Sorry.

> I'm OK with the revert, but it won't fix the underlying problem.
> Please see the definition of __arch_cmpxchg64_emu - it forces the
> address to %esi registers in the same way as __arch_try_cmpxchg64_emu.
> Effectively, the compiler allocates 5 input registers just for the
> instruction.

Oh, I entirely agree that this is a "random compiler implementation"
issue, and then the code around it makes all the difference.

> > Now, from having looked a bit at this, I can point you to the
> > differences introduced by having to have the emulation fallback.
>
> Yes, I know this - I also (runtime!) tested the emulation, but with GCC only.

Yeah, crossed emails, I started out just doing the "let's see what the
config difference is", and only after that realized that I had looked
at the wrong code for cmpxchg (ie I had looked at the simpler native
case).

> This can be achieved by implementing atomic64_{and,or,xor} as an
> outline function.

Yes, but then a lot of the whole point of commit 95ece48165c1 goes
away, doesn't it?

Or were you suggesting the out-of-line code only for the emulation
case? That would work.

             Linus
