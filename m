Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B73195FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126128; cv=none; b=oipzG0Ii2AT1nBrkqS7QkEElZshhSd+0WaqR+1zpcb3j23iTsXQmgWiZ+l9LRJRDh5yVNdRXz/bv8wgWLqEua8rdLap5R7v3tP+fzRj7kxZy1MdCsTRgIgSo8WLhn8/t0odH5TBMArKktGnlZjzl4N8qireveEhRPNZbbYyyuqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126128; c=relaxed/simple;
	bh=SkIa+k5/Cwf85X8hgeaDIrJ7H7OsH2wduJ8tjP+qszo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1blixwVgMydufCj8RU7y2HqC7AoXRnWInNUJ53UxK2HGx0WHq2vYyXOi1MX1WLbUC9LpXY+/KeO2J3MS0OlbKlAoAU5XSE2IngGvAh37897GKIslWEB4zu1cUM6Zeep2dQ24j26uo+ITLgShfAOKP4PS2RTjt7PjKNQBvo8aWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m8bC0a5X; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8bC0a5X"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ffb41c1efaso32998781cf.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 02:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768126126; x=1768730926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rrtjs2Cx4O94EUqPlwgAEyAOEcj9GhEJf6ImUTi0os=;
        b=m8bC0a5XCcR82oQ9i6VyyGibZX9LqMDG6w9DyQ0AB/WVTslID7vIpOfcknKYwNvf/b
         bp3l74OlrC8ti4Cgv2kvmVv7J9TYtR41PVK8lXHCmFs246DK+l2I0tThV5M1+FX0Abft
         3pvpzVXf+4POEsmKx1+HZOJFQwj+J2Jy+r3Qb7lfDsFpi/E11Ycvfj5QfS5njmJ+MYb3
         G/xe9Pl0iEe+cAfd/R6Wq2s/pSfdltaHU+ycCeWgSCbhtdaDj0N7XHVuUlRLQ495vJVI
         5SvM36sjuQfm1TRVsEX7c2aXVwIhnKEyD6Q5oarDW+duiRZRyujL1i4azD1V8ZOPLHgV
         DrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768126126; x=1768730926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rrtjs2Cx4O94EUqPlwgAEyAOEcj9GhEJf6ImUTi0os=;
        b=KjXRzJZWu3pyYscDP9lcJDRdbAfaIz5rhtI3SBfJcmFl9HG4b/qt8HBg5AWFMFftaL
         z1iVn6uRSAmOAbEkjQyrVH7uAGSgoe5GJ5m5/vHO1K6qwrKSX1sxAOX/cLHC654w4BBS
         N9agU3NN8xwANG4Az++abazRzKecXPJl7PtjPeHGvWd4YqLeteEoPaDWR5I9/OAZn+iL
         g8aNkBYU+/GKguGTrVwyPmSCfu4gy3XK7IGSBJu/ycg4Pjmz5Xwna97uCbo57XCg5rWu
         qZfMXp+mIj3jF1709Y4ARG0mY6LWCWS1o1pjT4kuNPD1xdbsmvoyTKCymNRapdg2xHc5
         fBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM1sFlqylLwHeOVMFFOsEdLGfAg7Lxia4PHgbASMzSRZgkWJ/7pv9na21FhbToqfeYOpSrUrSvempHR1wx@lists.linux.dev
X-Gm-Message-State: AOJu0YzdiN/bwUiKs+ScmGTKXuFmvy8PtMxkGeq/smQWB7kZjs3Wu9+G
	4gwenVMVCbno2bcG5fSX5tUnjqzRRQFT6C30VyKQLkvl1qXroQBzrV6e3X8y2yxHL8ZlMzc7BIu
	q5s+isVz/YQYh0Grc6MhovsRUfICmtYValBPyD1O4
X-Gm-Gg: AY/fxX7aqSM2fMEDJTjDy/jyJrGsUpdjYnekjozV5iVtMOsQ/DywJdH/KjpzI7HyrpS
	6zOYmvLqbsYd3LMwA3gfVjbFb2SjRG79ip8gv9K94WLcyxaveMPpRjkZ4VMc53nAFyPEOoM6LR/
	Sf+KhZBItWVEbjsKdXc0wuGWgkOsJh7IlajMsKcy4Ci/C0mZ9RaAlKRiLWzH6gmQtLIuzaQFEpw
	6vtAiKJTJaUqZuc8W9zzQMtsd6RywEWlTz4j4odv7BYXKjCBq5EtnDTZWiHXUXV/8zBJA==
X-Google-Smtp-Source: AGHT+IG2ZqI5n4BDnV9VJbiAcfpSfdXA9xVaqhczLhwAFumSDkHD54AIOHK8YJGJiZ0iq4riUdSxXk3uiQySfD8tZTA=
X-Received: by 2002:a05:622a:480a:b0:4f3:5652:6743 with SMTP id
 d75a77b69052e-4ffb499a975mr196224291cf.39.1768126125506; Sun, 11 Jan 2026
 02:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601110443.5ENBRFej-lkp@intel.com> <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
In-Reply-To: <20260110223548.GA4041651@ZenIV>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 11 Jan 2026 11:08:34 +0100
X-Gm-Features: AZwV_Qiwi345dUpdotl7zEDrXgwwx-rFAwqaw0xnuZuyRQADzNfbLrF9cbBKx3c
Message-ID: <CANn89i+5CSw_uWAq8tKAxs7XcrxCGUKD=Yhp+=tdyJO72Yo-uw@mail.gmail.com>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	=?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Will Deacon <will@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 11:34=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
>
> On Sat, Jan 10, 2026 at 10:15:09PM +0000, Al Viro wrote:
> > On Sun, Jan 11, 2026 at 05:06:31AM +0800, kernel test robot wrote:
> >
> > Folks, could your bot be taught to recognize that kind of situation?
> > It's very clear what's going on - an inline function that gets the
> > same warning with this config every time it is called.  Commit in
> > question has added several calls of that thing; the origin of warning
> > has nothing whatsoever to do with it, and that can be guessed without
> > even looking at the source - the quoted diff between the logs is quite
> > enough for that.
> >
> > Looking at the function in question,
>
> [accidentally sent halfway through editing, sorry]
>
> e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2097)=
 static inline kuid_t sk_uid(const struct sock *sk)
> e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2098)=
 {
> e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2099)=
       /* Paired with WRITE_ONCE() in sockfs_setattr() */
> e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2100)=
       return READ_ONCE(sk->sk_uid);
> e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2101)=
 }
>
> we see that warning in question almost certainly comes from
>         READ_ONCE(some_kuid_t_object)
> and looking at alpha we see this:
> #define __READ_ONCE(x)                                                  \
> ({                                                                      \
>         __unqual_scalar_typeof(x) __x =3D                                =
 \
>                 (*(volatile typeof(__x) *)(&(x)));                      \
>         mb();                                                           \
>         (typeof(x))__x;                                                 \
> })
> combined with
> typedef struct {
>         uid_t val;
> } kuid_t;
>
> IOW, it complains about a cast from structure to itself, which is fair
> enough - C is pretty clear about not allowing any typecasts to or from
> non-scalar types, tautological or not.
>
> Why do we even need that cast?  Seeing that generic __READ_ONCE() is
> #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x=
))
> the cast added on alpha seems to be pointless.
>
> Folks involved in putting that cast in arch/alpha/include/asm/rwonce.h Cc=
'd...

I have sent a fix, but got no reply from any alpha users.

https://lists.openwall.net/linux-kernel/2025/11/03/350

My understanding is that this arch is no longer used.
