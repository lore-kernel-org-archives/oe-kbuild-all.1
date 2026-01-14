Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113BA3793B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 21:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426960; cv=pass; b=pExlKB7DnUZYsbj8bix958ziPT5hUuMZ6cB47aamwo7CbddtGPqa23s6Cn35TyfpYRMcacfQrcA5zS9SYQ6gga9eqNM3X79+87G7IUu3M/8AyMZNAJ5rQ7re8gs16y7Xfh5tvZPnmr7wd+ijr7RiiSYsU2jsOZYJfg46KQl1XGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426960; c=relaxed/simple;
	bh=PaDTA3+EpXvXOsvBJ6HbfO2QlGoYB0SMEmmvqktGTbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOIbx+eV9k8zykoNdJdB2skFyvbXWcOyukrweKPsitLFJlC3kj/S92qJ7EMSJEvBcZIAV6ejHBJXMkwtcnPZwWBGanax6pGzfFzRi8Ao17k05Plro83XuN5ZxtYS+gZO+hb0MGGrw039vISNhC2UjMZZXCI2ueFRQPwhmLGgMj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v3jCVQOT; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v3jCVQOT"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12331482a4dso768c88.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 13:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768426939; cv=none;
        d=google.com; s=arc-20240605;
        b=goK02AHfU+d66OUn8ev4UgFrl1c3Eb9ntqrV6NdlOvkZDPyqxzaj0x1cGVhO6s/QV+
         4DXJwrMUzluoBN9z7o58K+krUH3nKy485jJF3BbiVwpFmS99Nxq/tRfiz9Dzkz3m/BZk
         nETHql8iPe8Z6dM3ndt8JlFAN5EH9EZ+yzFZG0Asu7zA3UZ4vDnLUbxoJI+CCrrqWXIg
         Mi1rOb/02UaJIdnVAhg82x2qVK/2TlDdI+wLSD8UL1XaTWJBpiiFNZUpd+gqVC/7B91G
         fvHc+tecaXGoqXFnwZuN9FcczA5Da5EYdgK9wSyb+rp1UvYfruhx01L07UEVz3fC0yT3
         46iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPsOUb98shRywJ7SCS1pmD82RBRORpLiTjAj2+pWE7Y=;
        fh=QR+XIUb/fzhtFVhHmZCatIWqP7cOSblTRzcPyDCG/mY=;
        b=Wha2UrAzJNHC2Lg7y1y4qhJTLz0inS3voI93dFAa8RdWDsBJuO8ymimGE02tXg5eRW
         dqaeyaiJ1OY9M7CYhX7uSzjue1cxlUhfrcwNwOajA6GENxfKHTfS8M9hBz4ZdvMh5AzJ
         PLmzYhEZs6RC2eYGuPSHDBbWnkeCZWXBCksg+jNfXcAiClg8bBovoJ5L89IH/bdZ5Rkz
         n9vvsXVYYiRcf7nbbhPVXxRrGoTpEVvAXQZUACR3M/4P2Pk3DDM10s5eXVXNmZXm9wz+
         9WBv37Q4FhMzyRpED8xywChSjpNajDlUHMiqGIKk/wJ5YnPPXFmPyFUInuXzKICj1yxH
         dqDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768426939; x=1769031739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPsOUb98shRywJ7SCS1pmD82RBRORpLiTjAj2+pWE7Y=;
        b=v3jCVQOTEc49/wTE/9AvZcA6F1iCuaR+sADWMIBX1fgEaghlm1QEdL7jxyjxpi5+1B
         CXiZs04Smry8Dydcp/+SwijsjRhok+GNG5HJvCCwKvB7MxFYaeE2ts+hRXm6LFUT389w
         LSm8GyUs+L5Uewy+bj4Q1LFPpUyZh8j4J4DR6onf8OF/XPlVa6VcZ/X3K1F6H1N6Q4CN
         lABbSjwFRvCFBzi3pu0ddHsT5zMf+5/UmU/+3wcLW4KXGh3Y6KMzohsAe8VJJlOgjjB8
         2BQjNr54zFYfaj/n++VI2te3fbl/BGm+4JC+Nkk8s228OttFooByxhpvzLMtZgzRBAn/
         UvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426939; x=1769031739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPsOUb98shRywJ7SCS1pmD82RBRORpLiTjAj2+pWE7Y=;
        b=W9sb0ozuQE2XLvwoAYZ/6WjxAk2QOmHwnRHyPxN5y1c4eh4hIENJJjALBFtycL3klC
         EofRr7dxQers9fJn+Mn4gGbT9DwGerTk2G6k7Lwx8y0IYL73Hd0k17CkxR44dGXoId11
         Jym5FzI8CgkM2ME3IGkbonZ+A/VoFvjA/mwKyb7BZY3lsrNPqjQgJMpXSfgkfZ81WlaE
         ben2nGJzzqazTY58K93V0R/rOzeyuXtjQdDoE9kGF9hVAppZi/Ptp5F207pc5h1rfUm5
         Uv7ezB0tON7x5eLgVABvgIWxFwdDaCG51tl1eFHG1Q34sNlRbv1jxS9/XXpoyu3muRPG
         yqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2qcpE3oodYLhOaTxmuMPQU1WnqrJuBGjJMKdNcSlUAJ00X5x2IjtVzkXta9eI+1TiBiXwJjj5LOJrz6g@lists.linux.dev
X-Gm-Message-State: AOJu0YxR+mtuVwBWazIePv8qJx2CZ/zQnDt8tJfiWOyf7P+4xtUSS5Ux
	g5jJ4YS1Eu8c1EwmLxM0rG+pZqrnn56ANwaYvKFl02IJ376t2sbUtvxAtJUeI1rF/ip3PCbf0tK
	RYQSk1oAlq2W2/onXKkYMBkUuwg3oP/NQedWoX3r2
X-Gm-Gg: AY/fxX4SfJdXARoSfA2yo6QVtBQdr3FgkVHrFS1yBUQnRHdB4DNW1/58zAs8MlsmPBq
	BkzP8dfBf/ap/RvSzIEZKqKZ/Sgj8QNORulNhhHbXsnADR4QOw/CGEQMfWxBLPLum/N9EyNi/8a
	U2BNXu2h3vgStHy89I9KXiEqJ7tsWKMpRSDTsgJtYj+Vl0f9AoLRBO1onMEjBt3VLKuC64eDaIT
	HprZoRldQV6nFetJ3DZWdZwerRin6Ymq13jV4LM+ZcbeNH8FEuFIHJlfxEeOwDfUQHKDS2l0Sxu
	i3yQ5LsSKRYBaPOlUqvY1rWg3SEJog==
X-Received: by 2002:a05:7022:1282:b0:11d:f440:2690 with SMTP id
 a92af1059eb24-1233dcba292mr36250c88.0.1768426938729; Wed, 14 Jan 2026
 13:42:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601150001.sKSN644a-lkp@intel.com> <CAP-5=fUyAtf9PQqYvagByK+-=-mN-T1zuLmxuvsPFVVHT3qLXA@mail.gmail.com>
 <874ioohsft.ffs@tglx> <CAP-5=fVGnY37bCOUHx_tCgQ=K55CcSOzs98Hg2Mh7KF4Mbya+g@mail.gmail.com>
 <871pjrj36d.ffs@tglx>
In-Reply-To: <871pjrj36d.ffs@tglx>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Jan 2026 13:42:06 -0800
X-Gm-Features: AZwV_QiJ0bC2B8X6R7V2ZjhQLuYbItIXjYozqOhuQBO0iBDevHQW3Mq_frHe8Bs
Message-ID: <CAP-5=fWgReuXY5im5-qCMBmryZHkRcZCLTkU6YzOSGJwufnYJg@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
To: Thomas Gleixner <tglx@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 1:27=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Wed, Jan 14 2026 at 13:03, Ian Rogers wrote:
> > On Wed, Jan 14, 2026 at 12:04=E2=80=AFPM Thomas Gleixner <tglx@kernel.o=
rg> wrote:
> >> > My preference would be 1 as I have a suspicion I played 2 and though=
t
> >> > the non-const cast was best (hence it being in the patch) given othe=
r
> >> > issues.
> >>
> >> Preferences based on suspicions are not really usefull. Please go and
> >> figure out what's going on and either fix it in the kernel code or tel=
l
> >> the sparse folks what they are missing.
> >>
> >> Leaving it unresolved and handwaved away is not an option.
> >
> > I'd like to call this option, play a bunch of wac-a-mole but then
>
> I'm not familiar enough with internet slang, but to my limited knowledge
> it's spelled 'Whack-a-mole'. That aside:
>
>      "Whack-a-mole" without a real conclusive explanation is really a
>       lame excuse, actually it's beyond lame.
>
> > still don't really progress. I had tried out I believe all the options
> > 6 months ago where the builds were clean. There's always 1 more tool
> > that's going to raise its head and complain about types, my motivation
> > remains clang and gcc for user space copies of this code so we don't
> > need to propagate -fno-strict-aliasing into places like perf.
>
> So because your motivation ends there and other tools which raise their
> ugly heads are not relevant to you ...
>
> > Tbh, I'm not going to be able to look at this for a while so I'd
> > suggest just dropping the patches.
>
> ... everything stays with the status quo, i.e. unresolved.
>
> That makes a lot of sense - NOT!
>
> Thanks for wasting my time to deal with your patches and welcome to my
> extremly short ignore list!

The patches have been through 5 versions with considerable hurdles
jumped, testing my ending, both kernel building and user space tool
building and running with sanitizers, etc. My work commitments mean I
can't just leap up and say I'm going to explore the ramifications of
moving the (void*) to (const void*) in all these combinations again,
but as a a const lover (even having published papers on it [1]) I
doubt the choice of using "void*" rather than "const void*" is likely
no accident. Even if I come up with a new series, waiting months for
any kind of review, merging, feedback, .. I'm just left in limbo and I
lose the context that I've built up and we end up here. In perf
changes we often end up with good patches vs perfect patches and I
don't believe with these patches we'll ever get perfect, hence saying
we should move forward even with the sparse regression that may only
be fixable with #ifdef DOING_A_SPARSE_BUILD... Given the bar seems to
be perfect, I'm recommending just dropping the patches.

Sorry to be on your ignore list,
Ian

[1] https://research.manchester.ac.uk/en/publications/constraint-based-opti=
mization-of-stationary-fields/

> Your's grumpy
>
>        Thomas
>
>
>
