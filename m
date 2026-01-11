Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717851DF248;
	Sun, 11 Jan 2026 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768155532; cv=none; b=bqMMEgqNk/2/VzPNo1Fiz+96ZeTT9hSd5/PRAx10Yv6fG7G8/7DBrGcinm9GUZf07KyXeTZ6+yZiOfZu0aMs38YE5018BoJSY3SXi27MuJQbhxK5rTLAzkPAgfFdiOGTMElLyt5dpdLRGiJxnMphrc57fzRyKJKbxzR9RMNURII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768155532; c=relaxed/simple;
	bh=naJ9Gdxbxkx5ufird6hbPL7VRPVnCQr/Q0icXG1nlnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjRiOqhXbH7+9DJGi2ctPEPE9zPuby0iqb9MIxiqj97Jzl1nUHdw7SYiEgYriSspweZxHPyUk7BWwz9AAeW/DC3xTJZiAwhvgtfnlop4RvJ5Dm7qwdNq8qTP+pC+5C0pqEjwAQbFydspl57J8d9CUq2+jQBJvxGByEn1I9NRaMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=gMInXO3L; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="gMInXO3L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+f4zTVplTYgO3DUqTn1Asrt3QSGB3nQZRvJfEoRZmTM=; b=gMInXO3LPrjWY2lGM4rdXWUhtP
	7o2dWycw7AtLWxOXy0r6kokE9tSVvhP5XMjD8IeQDkRKlzoHDWrcmxyyI2Xo1FPn4tgv49uI+LaGm
	rn2YjBLVSCwBynLOQoA83s5z8eUuv4yacAsPYlwM1QWMPb5JAtwAALi/AiktsG9FYN4AUH1ENGWe9
	pTxkyJ918F19NKRf6vJRzg+bpIPRCmJINBThI7yAVsnaiwC+CkYErd+ZiH0LTv1FLE96ihFiu5eE3
	RUV2W0wa5D9zFdk6o+huE4MGbGPRJuFVsyxjUcR1pdg+7XH3pHeC9Svqns/v2ZCGMCesb1wWYcT3h
	l3TEfjOw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vf02s-00000009hQT-1NU4;
	Sun, 11 Jan 2026 18:20:10 +0000
Date: Sun, 11 Jan 2026 18:20:10 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260111182010.GH3634291@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110223548.GA4041651@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Jan 10, 2026 at 10:35:48PM +0000, Al Viro wrote:

> Folks involved in putting that cast in arch/alpha/include/asm/rwonce.h Cc'd...

FWIW, there's a way to strip qualifiers from *any* non-array type.
Look:

void f(void)
{
	const int x;
	x = 1;		// an error
	typeof(((typeof(x)(*)(void))0)()) y;
	y = 2;		// perfectly fine
}

The way it works is that qualifiers are stripped from return type when
deriving a function type.  That was spelled out only in C17; 6.7.6.3[5]
| If, in the declaration "T D1", D1 has the form
| D ( parameter-type-list )
|  or
| D ( identifier-list[opt] )
| and the type specified for ident in the declaration "T D" is
| "derived-declarator-type-list T", then the type specified for ident
| is "derived-declarator-type-list function returning the unqualified version
| of T".
but that "unqualified version of..." matched the common practice in
earlier variants of standard; they stopped issuing TCs by that point
(~2014), but both clang and gcc behave that way with any variant of
standard.

IOW, this

#define unqual_non_array(T) __typeof__(((T(*)(void))0)())

would do the right thing without that _Generic cascade and it'll work
just fine for e.g. kuid_t.  Using it for an array would trigger an error,
array-returning functions being forbidden...

Guys, do you have any problems with replacing __unqual_scalar_typeof()
uses with that thing?

As in,#ifndef __smp_load_acquire
#define __smp_load_acquire(p)                                           \
({                                                                      \
        unqual_non_array(__typeof__(*p)) ___p1 = READ_ONCE(*p);         \
...

Objections?  IMO it's more palatable than current __unqual_scalar_typeof()...
