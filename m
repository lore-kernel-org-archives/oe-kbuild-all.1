Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C827A122;
	Mon, 12 Jan 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768221447; cv=none; b=uOX4qr9wwKQxqzsmnQexsZYIU7ndzgBp52FzfnqjqamjkfWWEtlSya/D8m3isrBh+MqvZ2p3nwriTfMWTb/ju8M8a2KMi7i+5A4WA7FjtmzwXBH9b7eLqOscETNgksGp5ilBaXp68s2ym7r7EenUhWpsa5l5j6VpW9LWEZLYWsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768221447; c=relaxed/simple;
	bh=jJqOWFHw8X4/g6VGJ13/Fib6EkrGu10rtaiOEe03tlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+KyfJOGqY0GVR+2BLO6tDv3PLBFynlJX9p+T/IPl2LE7r+T+/hqljhWffSbU0coRhmoIsB4/bok+g1DpAXdEaI5r7dt1oZqxcMwWt9ho8ouGdiCgmZmekDgyhH4mY/i5djR3C4HHFS3LaMfNfJGPa6uxNAlDgMi/ciSRKtCOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fMwv9lk+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fMwv9lk+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ki7G6Ttl+IuZ0q2BYE7QaZr70yT6iAS3rrmJK0I115g=; b=fMwv9lk+lqw4IgayCk3+LLBw4m
	H0ZIcZoizQ1noutyKNCaLDAH/PLDMH2s2CGTEyCAfb1hayaP+Gxcc/cD5y4Ekhnm5IVjZlqMf2VYb
	m1psMq0YuR+tITrhXt+0JgYxOEkVYfwm/YE+sCIluismtLDEB+gyt6Xp7SBaX5Wn+u83ablPUYGc9
	ostr55YgFIB3/PVaWfKH6ETf87cKlSUDY8r2wrG8SlgKHaFRNZrwx71VnPoewl7nV96FxZ8fBTwE7
	KTlA/xtPrHbJ6eBk8j0Dm2uFJrZC88qbQMfqBxiMR73OIdCLgwi0CpeKwhgYQQaKUsSYoYHD6bUGa
	7HsIS6hw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHAg-00000003DwH-2oEw;
	Mon, 12 Jan 2026 12:37:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 359793030B0; Mon, 12 Jan 2026 13:37:22 +0100 (CET)
Date: Mon, 12 Jan 2026 13:37:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112123722.GJ830755@noisy.programming.kicks-ass.net>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <20260111182010.GH3634291@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111182010.GH3634291@ZenIV>

On Sun, Jan 11, 2026 at 06:20:10PM +0000, Al Viro wrote:
> On Sat, Jan 10, 2026 at 10:35:48PM +0000, Al Viro wrote:
> 
> > Folks involved in putting that cast in arch/alpha/include/asm/rwonce.h Cc'd...
> 
> FWIW, there's a way to strip qualifiers from *any* non-array type.
> Look:
> 
> void f(void)
> {
> 	const int x;
> 	x = 1;		// an error
> 	typeof(((typeof(x)(*)(void))0)()) y;
> 	y = 2;		// perfectly fine
> }
> 
> The way it works is that qualifiers are stripped from return type when
> deriving a function type.  That was spelled out only in C17; 6.7.6.3[5]
> | If, in the declaration "T D1", D1 has the form
> | D ( parameter-type-list )
> |  or
> | D ( identifier-list[opt] )
> | and the type specified for ident in the declaration "T D" is
> | "derived-declarator-type-list T", then the type specified for ident
> | is "derived-declarator-type-list function returning the unqualified version
> | of T".
> but that "unqualified version of..." matched the common practice in
> earlier variants of standard; they stopped issuing TCs by that point
> (~2014), but both clang and gcc behave that way with any variant of
> standard.
> 
> IOW, this
> 
> #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> 
> would do the right thing without that _Generic cascade and it'll work
> just fine for e.g. kuid_t.  Using it for an array would trigger an error,
> array-returning functions being forbidden...
> 
> Guys, do you have any problems with replacing __unqual_scalar_typeof()
> uses with that thing?

There is also __typeof_unqual__, but I do not know if that is now
supported by all compilers, if so that is the better option. If not,
your function return type thing is awesome.
