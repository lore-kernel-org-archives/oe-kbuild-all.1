Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F596340A62;
	Mon, 12 Jan 2026 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246138; cv=none; b=rLJmWiDsKLbUwXmplaBs8Zjkk1PJtGUluLKgpX7kM/YHptg5TXSzEMjpZbMKzRQYAtpQXXCX1A68U9fnGd/lFVw6DikgAhKZ0rBcZb7YMDNzmmzyCsuLpIgNqOwYEQcsJ2tuUCsGj1ZeDOrr1ImUOOyFg09KKqBzVP1qsiCQW/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246138; c=relaxed/simple;
	bh=ujDjJUzKE0Irouq5XRAIhfLD2GBRsnR0ZYqrOdC39xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmbC4wcvxP13HeMm0TZqSufrZrUnW7GHLjKMI/TLlN/evkzKX/VbFAnhlrzvfxZWyTAKJOGAMhFylmutCGVgQBje8tVbQ+G63WMUvg5Q9L+bRcdYW6Bsah41TeFmFQtOtHq8fLDJyVAI2VQymsOF7UEZHBdNemIW3Fb2OVmMS0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=hRJu1gYc; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="hRJu1gYc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tx83go8wexQYUn/V1nOi8bmPNS3Jba6qPMBh3tnp/m8=; b=hRJu1gYcj9J4jjArlAYyVv4CJ8
	zdCuTYKpbbeomfGVYWBkJjCeXGj7fWeCDa4pCBeUnvHIQMP6BjU8CMaMjaJ2pxvjpmOoK0WahUvWn
	nvKM+XaBGE86VEqsIvG2CVdpQR87Nh208hoyznXsftg078+qnc9HB03w91i205uquZQ54qNf6pPrf
	1CthzLjoXdB2OWraN5hWsKomlJI0Re2HFwuXA810SEs6kDmCc1F1SsxvHnDW+F5Ggwe9TVNgi1zWC
	iuDCs90nEAZ4ahlYcGSgTvXU23nHFQNVsYqSUR0YZJfzYHF3A3NTZEjI6IXJWw4AFEwLUTcU1oAZX
	UncX9TdQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vfNcJ-00000008KGk-3piD;
	Mon, 12 Jan 2026 19:30:19 +0000
Date: Mon, 12 Jan 2026 19:30:19 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112193019.GK3634291@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <20260112123224.GH830755@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112123224.GH830755@noisy.programming.kicks-ass.net>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jan 12, 2026 at 01:32:24PM +0100, Peter Zijlstra wrote:
> On Sat, Jan 10, 2026 at 10:35:48PM +0000, Al Viro wrote:
> 
> > #define __READ_ONCE(x)                                                  \
> > ({                                                                      \
> >         __unqual_scalar_typeof(x) __x =                                 \
> > 		(*(volatile typeof(__x) *)(&(x)));                      \
> > 	mb();                                                           \
> > 	(typeof(x))__x;                                                 \
> > })
> > combined with
> > typedef struct {
> >         uid_t val;
> > } kuid_t;
> > 
> > IOW, it complains about a cast from structure to itself, which is fair
> > enough - C is pretty clear about not allowing any typecasts to or from
> > non-scalar types, tautological or not.
> > 
> > Why do we even need that cast?  Seeing that generic __READ_ONCE() is
> > #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
> > the cast added on alpha seems to be pointless.
> 
> The problem was things like test_bit() that take a volatile argument,
> doing READ_ONCE() on them would instantiate a volatile temporary and GCC
> would end up generating shit code.
> 
> The __unqual_scalar_typeof() was the result of trying to remove CV
> qualifiers from a type.

Sure, but what does that have to do with the final cast in there?  Note
that generic __READ_ONCE() ends up with __unqual_scalar_typeof(x) for the
type of result and it seems to be working fine.

Why would the same type of result be a problem for alpha?  Sure, we need
a barrier there, so it can't be literal copy of generic __READ_ONCE(),
but what's the problem with using

#define __READ_ONCE(x)							\
({									\
	__unqual_scalar_typeof(x) __x =					\
 		(*(volatile typeof(__x) *)(&(x)));			\
	mb();								\
	__x;								\
})

there?  What could possibly need those qualifiers added back to the result?
It is, after all, an r-value, so...

IDGI...
