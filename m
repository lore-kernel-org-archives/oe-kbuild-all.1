Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4762BEC5A;
	Mon, 12 Jan 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230137; cv=none; b=Ta6Bd+QO4U1EwLCQytLk9qXsc7Vh7RIDYW/cxaLJS+lxzYtLvsdv16B8rWXcYgV59N52HpIaYPBb7Ef3hnui1YnXOu1LkpI8Kx4/End3ULVQYtEmN/74Or7DTKCmljdJ8radSdiyozOwjXg3FPayWWlLFs6qZjis6K8jS0PauEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230137; c=relaxed/simple;
	bh=bIFL8Yh6+K7dNLCRWwR/lo5RY6XFn3l/0ShCBQQwWoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQuluXcm6WHnf0LpCpog6GAv/kyBkR898NiLtE2xYWP8MOflRaivz3+y1PPVAajM8orqdfDopIcnsNnojVAIDV5HSYRn1rNozT+2xCW6yWJQgOinouEWe7CNRzTgQd7A1dsOxiczm8pXTUO8np9i1IL/aJSt9bIpHCwPOi5gibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfgFyLfU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfgFyLfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04C7C16AAE;
	Mon, 12 Jan 2026 15:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768230137;
	bh=bIFL8Yh6+K7dNLCRWwR/lo5RY6XFn3l/0ShCBQQwWoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfgFyLfUXbZCw6/fDuKt+BspOKlk60jIgOLl4eYZGdkf3vjRb8fXcnzilDWhebst6
	 qL1omQEF0AYOfYDpf9nBQmEN5EdYKpBBQ0VEwogysVb15mscETLHvWOPnuo2NYZomE
	 lIQwDgqx720tRqBaXTXneNNmNeieT9iUom0/dWumN3k6aoFyz89i9D61QcltyOLZWn
	 59EzeLrQ6v2WFoC+ehfY3Cf8L2K5Fm5RDGXB3DXc/NIogrfThCQvrCgUuDf5IeAYA/
	 97p7kLqIV89VN0Qu2qy1saSE49L7hpwjPjBzSjILp1OEmJfQ+/1D/114Cq13y6xReR
	 cY2BbJgb7XhNg==
Date: Mon, 12 Jan 2026 15:02:12 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <aWUM9L_4MKjlXcui@willie-the-truck>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <20260111182010.GH3634291@ZenIV>
 <20260112123722.GJ830755@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112123722.GJ830755@noisy.programming.kicks-ass.net>

On Mon, Jan 12, 2026 at 01:37:22PM +0100, Peter Zijlstra wrote:
> On Sun, Jan 11, 2026 at 06:20:10PM +0000, Al Viro wrote:
> > On Sat, Jan 10, 2026 at 10:35:48PM +0000, Al Viro wrote:
> > 
> > > Folks involved in putting that cast in arch/alpha/include/asm/rwonce.h Cc'd...
> > 
> > FWIW, there's a way to strip qualifiers from *any* non-array type.
> > Look:
> > 
> > void f(void)
> > {
> > 	const int x;
> > 	x = 1;		// an error
> > 	typeof(((typeof(x)(*)(void))0)()) y;
> > 	y = 2;		// perfectly fine
> > }
> > 
> > The way it works is that qualifiers are stripped from return type when
> > deriving a function type.  That was spelled out only in C17; 6.7.6.3[5]
> > | If, in the declaration "T D1", D1 has the form
> > | D ( parameter-type-list )
> > |  or
> > | D ( identifier-list[opt] )
> > | and the type specified for ident in the declaration "T D" is
> > | "derived-declarator-type-list T", then the type specified for ident
> > | is "derived-declarator-type-list function returning the unqualified version
> > | of T".
> > but that "unqualified version of..." matched the common practice in
> > earlier variants of standard; they stopped issuing TCs by that point
> > (~2014), but both clang and gcc behave that way with any variant of
> > standard.
> > 
> > IOW, this
> > 
> > #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > 
> > would do the right thing without that _Generic cascade and it'll work
> > just fine for e.g. kuid_t.  Using it for an array would trigger an error,
> > array-returning functions being forbidden...
> > 
> > Guys, do you have any problems with replacing __unqual_scalar_typeof()
> > uses with that thing?
> 
> There is also __typeof_unqual__, but I do not know if that is now
> supported by all compilers, if so that is the better option. If not,
> your function return type thing is awesome.

Agreed, that's a really neat trick. I wouldn't put it past somebody to
use READ_ONCE() on an array, but the build systems should shake any of
those out pretty quickly.

Will
