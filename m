Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18E750095B;
	Sun, 11 Jan 2026 18:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768157420; cv=none; b=LMt8j0K5PP+EmT8Y2kjSlBBHvup6mYD3yJDS4dMnOp7GmZdLbOtaU3uwvHBVrFw4B3/VPrN7Oj96j21RLmymBzeX3nvhwT7dt3soHTsXD5VcNEC5anak268HnmAQcnY4JFMRpAf3hdP32sMtS29TtH198JMM2/Teq2rVKTKrZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768157420; c=relaxed/simple;
	bh=QAG//eHeE2TUM+J8fXGd1Rd9VSYBR6jDHyn5u2jiu3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQu1XAaP9wcrN7LsabeFc9h+IjXMU5XiZISL2moGFtYzakkdWEFzSiWqVbg/gPIV+VEN+pTXDc3lPW4u9V+g/2pR6UEDduP9ykOJ+vt96VA9SZgsY7QwgiDvGNXmnXK2WX5XbuBr2BkxhC0BEHc2w2SnafbD6uWT0Rg8c/DjkIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=cgqMVA7J; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="cgqMVA7J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MqMmNRRmeGGYkVuG9AAnzS4DuBQQWWSn5jTfHPwUGY0=; b=cgqMVA7Jxbtn2tmDk2O9JbZUwG
	yJCQ6WzTGV1dvGIKM13Ro4jo17BJXkPADOIsUZDSLNExCtQ5YJv7OcOEMVN6UF6Zl6YiliRh0nS24
	zCIk9B5mW6o+YlvNS8/0abc+rxpy8qF3Cr6Ft486pTOCnXMdcFYHZ8n4qtM9Pujbev3c8vKYwzQVN
	uJw/VBCBDZ8kGCuJF0AgAGSdnEphXYZSx/bTVm1TxgMbMwz1UGtsBu6tBHbVjAl9xVyt/0m0Vjc6b
	t+xJrqhB0Ut1/4EJNdxQondF1PRLcRCUFTBhO/TpAYWbKmj4YykYQthMXxv7cjhbY6WQERdVsWLLZ
	HzwygDkA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vf0XL-0000000A1sK-304u;
	Sun, 11 Jan 2026 18:51:39 +0000
Date: Sun, 11 Jan 2026 18:51:39 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260111185139.GI3634291@ZenIV>
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
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Jan 11, 2026 at 06:20:10PM +0000, Al Viro wrote:

> Guys, do you have any problems with replacing __unqual_scalar_typeof()
> uses with that thing?
> 
> As in,#ifndef __smp_load_acquire
> #define __smp_load_acquire(p)                                           \
> ({                                                                      \
>         unqual_non_array(__typeof__(*p)) ___p1 = READ_ONCE(*p);         \
> ...
> 
> Objections?  IMO it's more palatable than current __unqual_scalar_typeof()...

Argh...  gcc prior to 8.4 fucks it up, and our minimum is 8.1 ;-/
Pity, that...  I still think it's worth keeping in mind for when
we bump the minimal gcc revision, though.

FWIW, with clang it works all way back at least to 3.1; icc - at least
to 13.0.1...
