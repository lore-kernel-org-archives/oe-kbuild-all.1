Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4E316199;
	Mon, 12 Jan 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252506; cv=none; b=ty6BKtAPR6vZzdhuFxxvPHWk/GnNI2Ti0Qc/9BfoolkA/gh6wsrRP+RzcnbrO+IghR0uDUD/v0VrAzIxVcrevE+o+5WRsfrcT2LqUohwGtWoXGqgIVTyhX/SUYCiN6ZaaCQqGd7RzfbyM+sdxaFcyQpbjCGHsCtXn8HOVYAUfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252506; c=relaxed/simple;
	bh=Q+OmZ1kXcwRthryF8hU0Pdhpa2uHGXecuGx2KI8cESo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MW1qeIYaMm6VVM1I6YSOvr8cHhZP1dvW5rMsI8op8hVCIbzeh6nqYi/xTxnXZsBwkOsxr0+sdyspvY/WwL0408Q2PUito2vobVOibFXUSB2cSRaITsIbLpdcaubfsz7IKbR/mg5QcLJQWawsCb0JAGNM/MmJQQsNkR43k6+DUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=CRe1fupW; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="CRe1fupW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pzosVfKYwaf5kh31tMaA3mTAg+O6ZP6DMPjvkqOorbk=; b=CRe1fupW3GwR3FIM2XSLPYXCbi
	YrBhSCvK4M2z7KZvPx6085yDztX1CPvDUSoKxZ6MWwqUOzbYamOy/+kAsZ+E0mowhY6XhooQ7xkGK
	LSDbL3UJpORQgXqOKj1mTVKw2FlTKjItY+6gsU0TEWCILwGFFReOFvse/uu0BYP3Oy7xi83wLViyC
	ZAbJhu1TgQBHcAI0Q2OgphqqIt9S9N5rhe5XFKRKwKsGKvXxtFzpjRGEVlZQISY6o1rr/SH8Z7gz4
	+s0PK3VDqt9M3qNaFzmximYGXNR83r3fe5NhF+3Bj0x1Sw3ST9sIl0j35XYuq1Qvd7NwwdNGSrpgb
	hvz61Oow==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vfPGz-00000009EWN-3E8N;
	Mon, 12 Jan 2026 21:16:26 +0000
Date: Mon, 12 Jan 2026 21:16:25 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112211625.GL3634291@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <20260111182010.GH3634291@ZenIV>
 <20260112123722.GJ830755@noisy.programming.kicks-ass.net>
 <20260112192126.GJ3634291@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112192126.GJ3634291@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jan 12, 2026 at 07:21:26PM +0000, Al Viro wrote:
> On Mon, Jan 12, 2026 at 01:37:22PM +0100, Peter Zijlstra wrote:
> 
> > > #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > 
> > > would do the right thing without that _Generic cascade and it'll work
> > > just fine for e.g. kuid_t.  Using it for an array would trigger an error,
> > > array-returning functions being forbidden...
> > > 
> > > Guys, do you have any problems with replacing __unqual_scalar_typeof()
> > > uses with that thing?
> > 
> > There is also __typeof_unqual__, but I do not know if that is now
> > supported by all compilers, if so that is the better option. If not,
> > your function return type thing is awesome.
> 
> >From experimenting with godbolt.org:
> 			clang		gcc		icc
> __typeof_unqual__	>= 19.0.1	>= 14.1		no
> this trick		>= 3.0.0	>= 8.4		>= 13.0.1
> our minima		15.0.0		8.1
> 
> So __typeof_unqual__ is well out of our range; this trick is slightly
> out of range, but nowhere near as bad.  Prior to 8.4 gcc had a bug
> in that area, unfortunately ;-/
> 
> Might make sense to reconsider it next time we bump gcc minimum...

Speaking of fun gcc bugs: prior to 11.1 gcc would not strip qualifiers
in conditional operator; I hadn't tried to RTFS, but it almost looks like
they took the union of qualifiers on the second and the third arguments
of ?:

That's a direct violation of standard, all way back to C90 - the type
of 0 ? x : x where x is an l-value of qualified type *is* explicitly
required to be the unqualified version of that type; C90#6.2.2.1 does
list the contexts where l-value is not converted to non-l-value and ?:
arguments are not among those, with clearly stated requirement to strip
qualifiers when converting to non-l-value.

Once upon a time gcc used to have a weird extension that made (a ? b : c)
an l-value if both b and c had been, which might explain the origin of
that bug, but that went further - even in cases like
	const int x;
	__typeof__(0 ? x : 1) y;
they ended with const leaking to y, which would be a bug even in C++,
where that extension for ?: originated (prvalue int as the third argument
ends up with lvalue-to-rvalue conversions applied to the second one,
stripping any qualifiers from it)...
