Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59528272816;
	Mon, 12 Jan 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768221157; cv=none; b=XGachL+TVBn9lm3sqt/zsrDP1uSpYcEEsUlf5w4rFmZnNNT6pE6fF4czPbUAXd5xEv2z5LuP/f78OsDPi84ggJaFu3Gn6yqPiPbOHjb86B30liTp1JYz3bnuKo6U5F+Ur2VJ0Jn7hkNGql00IjLDD4P6/NodDDKsAY/F7e5/sEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768221157; c=relaxed/simple;
	bh=krOwZEv+3KpLs++saQlmDBrbdFZ6TjXWuGQdGnnLDR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjbThP6WDFt0eGOXkONgiW5GktvStdJ8oFc+puSEU0VwnHvRnVOWHZJ0aP/TS4uvEa2/JamB80gNnx8bfqKUqTIkWQzStqQ4yLf+yGvBW5/t2Ck4xYbHdCVEwP8Uzkh0YQiSBI9Cs7n1R0upQPkJ0wAGYQkznfG97SR7dGl/J74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VEhl+rO/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VEhl+rO/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mjz30gjZaZm71su+mxiw8fHmGYkmZlBRp6D9eos5vWU=; b=VEhl+rO/f7bMPfgQ0gNuAPSRVQ
	k/iAKb11ZPeW+iMKgOCekgUePvIDBLKdd++iW5zMdbYGYImvLBsgw8wki/8Q7q29Qn6BuL9c2iYS2
	xG1l4ufJvvmZltYURlBVF2uTF7PEUzZB0MKQxSxMoEEK+3trbz4KnwA8JklO58bUAs/phkeGUiC4e
	RXZ6KTZpdR9YRRTu5ru3cosqzNwjftfwwfrAxLHn+lhFOfbj3Cw644rdKQfz+7bQ0wK38mF1DVqxZ
	xlBx+7kaYBi0WxLcZKpDpW3DesrVnyhDkYlWWJVu0CQyt8T6oMqUsy2jXMZJ2gt553qqXQC1GnDnn
	GbIEi5KA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfH5z-00000003DfX-0d5y;
	Mon, 12 Jan 2026 12:32:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D0ABF30057E; Mon, 12 Jan 2026 13:32:24 +0100 (CET)
Date: Mon, 12 Jan 2026 13:32:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112123224.GH830755@noisy.programming.kicks-ass.net>
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

On Sat, Jan 10, 2026 at 10:35:48PM +0000, Al Viro wrote:

> #define __READ_ONCE(x)                                                  \
> ({                                                                      \
>         __unqual_scalar_typeof(x) __x =                                 \
> 		(*(volatile typeof(__x) *)(&(x)));                      \
> 	mb();                                                           \
> 	(typeof(x))__x;                                                 \
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
> #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
> the cast added on alpha seems to be pointless.

The problem was things like test_bit() that take a volatile argument,
doing READ_ONCE() on them would instantiate a volatile temporary and GCC
would end up generating shit code.

The __unqual_scalar_typeof() was the result of trying to remove CV
qualifiers from a type.
