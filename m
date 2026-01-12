Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081E21CC5C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 00:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263986; cv=none; b=BQiXt78IKXH6JUxZg1kB+g1oHpaFJUbJLo9YDuk+jgjRNoi2KfX6PcywmWla5Y866KE4KZBqwrrlIFtM4B9z/cSw11ZmzvJfKBsgdi16kjAIRSfXWOBlEAmjybIIqoh282gDkdeCChjZm3Yq7RbGilHASZG4CKdO5V4GIZ3zGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263986; c=relaxed/simple;
	bh=bFgbnWZQw9wSzDEYIuS1d6lrUYUNDaNjYcUjSLSEC+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLyOtsyoA59i1QH8JBkMlkeF8cDlQbOzUhDdSYUOi8rGR9lqv79J6fYyiv1HB3AvhIpmhHMqOFyTqSSfwVnGkQqPe6yBCTtgOzCrd8bgufAg4mkHC7g7D67jeUtszZBkI/dRvIx3OaXiMVKdF/TxWuHh79yVZ3d2K9s67DYIvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSO6C4XI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSO6C4XI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b86ef1e864cso299654766b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 16:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768263983; x=1768868783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNpew3LId+sbRNthjyB0JdEWExSKan52urleQaEqaao=;
        b=bSO6C4XI8VF8kCjfQJPYZshDTJAoerC/NufF621C5fy8hkM7XzMqGcbZ9iQSFuDJz5
         WWYVPzuDqkZwBewkc9MEqg6vJlNn7DbmZXuXrTcfacTBZujEy7EoHJYA9cqmuYFWl35N
         iJ3xKu5VVtlD55GYaLcWQ8NRdI9mbnQaw3tSJkgQh/1TYeOedhLrwwchQk7BUeJZAx8S
         zdcQ8RkO2w4bwZy+iu/UBaSLEUBZUbchUgSHvyH/WQCq9lqDK++Qh/d8tmnNoCB1GpYh
         xVUSulB3uzo1O0Yt6Byujh4/QTnEAR3bhkb+In5o5K+DTPcDo8cX4ZsPtnQw6Ja9En/C
         bqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768263983; x=1768868783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNpew3LId+sbRNthjyB0JdEWExSKan52urleQaEqaao=;
        b=W9OQmRdlpm9LtL5aP4ViiHq9rM/29mvFyJM6k7U5ZPyt4eQffwFx7hacuCpDcaGEZB
         G6GQjHnF6AH5mjUA6vOccyzc0psBv/XcJEX+fCwwo7A+QdC+n9zBK3HJkbai9TEUzpKP
         yk1cZ70z1cuuOSH89cQaVE1mGDnVfxMsGGxPGeiNQGIoLEhpFGZJgNsQMSBbd4NO62Pp
         RK+AuUeRlA7dohC4QYMynX0bEJ193frhvutw4ksfwP87Yf+GaGSIHJuMROpACsqHRmvV
         8j6GqN6Y8KVJa594HPlwSc0gRa9hXrBweIoe73lTUv1I7NvRctHV3Ub+cxwY50gKJiJT
         P+mg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Kyzgex1r+nBDNN+O4W5gc6VJC8E/an6jg2cEdbRuEHvueVKHrbvN/QpEyVfIEV3pHJ5LMRmp4Op27ixj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+me1+RfEHn0OPp1zfBjLakpPJfD1ObRFgdbMXwG36PhX3p2PI
	dwio96+5aA6zTMrKd9rTCNoCzTtp03e5DaEFlr7Gn301UTABp8RT0yM6Wpstyg==
X-Gm-Gg: AY/fxX6ua7V8esWTAYw8f5avujSp9oakv7r97AkMnAG0HrfVVO47ffCihtoI6zk8Kcf
	G07+TsmviEQ18uUrVCgd+urrh16mmBzAHo6QWPrZhU529DJEsrWd9vDgPBgzGrXq02AdXAUo3V1
	D2WRvXIbP7y+Zb3CryqAPxfOiAPIK05X9liy3OLB+/Kl3pwAGiH3VB5sCu0q/0RBMV963fki08r
	q5dXb6yxWdWdw6mfWkhyIiuz3adYAEjBFvoV9OrbOpvhPPF+dfEh9OvufWX36J6EdnIZdsTWlaq
	bU3dYNKe92lO20f7VrW9C6Vd5dft3qoolP+7CWSH+JYB/PfyyuULfhTUfOedvPbVt8X9qOW5dVT
	lhCk6R5TlRoH4FuPoGyC/fKLR4c/KGSoIQ6hUEYw6lDK2eexGS7NK8AfUwMYPIQWIficWmLdg62
	hz2jo55i5kkDDVX4WthXHyp2qnHKHsCp4xO9CwLIyiG1MjiHN8zj9T
X-Google-Smtp-Source: AGHT+IE7GSDtbzTyRmgDkbP2ltmzA6dSB27mu/L7s99Fgr5xcOTDF5mka2V4i2+oXrm18D9zZurr4Q==
X-Received: by 2002:a05:600c:3e8e:b0:47d:2093:649f with SMTP id 5b1f17b1804b1-47d84b187b4mr211978445e9.8.1768257564764;
        Mon, 12 Jan 2026 14:39:24 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef885sm367288105e9.9.2026.01.12.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:39:24 -0800 (PST)
Date: Mon, 12 Jan 2026 22:39:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Eric Dumazet <edumazet@google.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>, Maciej =?UTF-8?B?xbtlbmN6eWtvd3NraQ==?=
 <maze@google.com>, Will Deacon <will@kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112223923.78784af1@pumpkin>
In-Reply-To: <20260112211625.GL3634291@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
	<20260110221508.GF3634291@ZenIV>
	<20260110223548.GA4041651@ZenIV>
	<20260111182010.GH3634291@ZenIV>
	<20260112123722.GJ830755@noisy.programming.kicks-ass.net>
	<20260112192126.GJ3634291@ZenIV>
	<20260112211625.GL3634291@ZenIV>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 21:16:25 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> On Mon, Jan 12, 2026 at 07:21:26PM +0000, Al Viro wrote:
> > On Mon, Jan 12, 2026 at 01:37:22PM +0100, Peter Zijlstra wrote:
> >   
> > > > #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > > 
> > > > would do the right thing without that _Generic cascade and it'll work
> > > > just fine for e.g. kuid_t.  Using it for an array would trigger an error,
> > > > array-returning functions being forbidden...
> > > > 
> > > > Guys, do you have any problems with replacing __unqual_scalar_typeof()
> > > > uses with that thing?  
> > > 
> > > There is also __typeof_unqual__, but I do not know if that is now
> > > supported by all compilers, if so that is the better option. If not,
> > > your function return type thing is awesome.  
> >   
> > >From experimenting with godbolt.org:  
> > 			clang		gcc		icc
> > __typeof_unqual__	>= 19.0.1	>= 14.1		no
> > this trick		>= 3.0.0	>= 8.4		>= 13.0.1
> > our minima		15.0.0		8.1
> > 
> > So __typeof_unqual__ is well out of our range; this trick is slightly
> > out of range, but nowhere near as bad.  Prior to 8.4 gcc had a bug
> > in that area, unfortunately ;-/
> > 
> > Might make sense to reconsider it next time we bump gcc minimum...  
> 
> Speaking of fun gcc bugs: prior to 11.1 gcc would not strip qualifiers
> in conditional operator; I hadn't tried to RTFS, but it almost looks like
> they took the union of qualifiers on the second and the third arguments
> of ?:
> 
> That's a direct violation of standard, all way back to C90 - the type
> of 0 ? x : x where x is an l-value of qualified type *is* explicitly
> required to be the unqualified version of that type; C90#6.2.2.1 does
> list the contexts where l-value is not converted to non-l-value and ?:
> arguments are not among those, with clearly stated requirement to strip
> qualifiers when converting to non-l-value.
> 
> Once upon a time gcc used to have a weird extension that made (a ? b : c)
> an l-value if both b and c had been, which might explain the origin of
> that bug, but that went further - even in cases like
> 	const int x;
> 	__typeof__(0 ? x : 1) y;
> they ended with const leaking to y, which would be a bug even in C++,
> where that extension for ?: originated (prvalue int as the third argument
> ends up with lvalue-to-rvalue conversions applied to the second one,
> stripping any qualifiers from it)...
> 

I got a warning from gcc for your example (massaged a bit to compile):
<source>: In function 'f':
<source>:5:18: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    5 |         typeof(((typeof(x)(*)(void))0)()) y;

Using __auto_type y = (1 ? 0 : 0+x) gives a non-const 'y' even with gcc 10.
The 0 seems to be needed, none of +x, -x or ~x 'lose' the constness.
Note that char/short get promoted to int - but that is hard to avoid,
and happens as soon as you use the value of a char/short variable,
?: should perform integer promotion.

I've a grep of __unqual_scalar_typeof() on my 'other monitor' (one of them)
from earlier. I'm sure most of them aren't needed at all.
arm64/..../barrier.h looks very strange - the actual accesses just depend on
the size of the item (even the union looks odd to me).

	David

