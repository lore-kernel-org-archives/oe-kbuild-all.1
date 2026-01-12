Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531C318B93;
	Mon, 12 Jan 2026 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245611; cv=none; b=BlC/sI9h5PLpCIiVtmi6eVoZV/iEgquXBytD2zLeq3NbY9ckqfbFerUDTG92CKa6GVQWOs7Xtk+RGo9Yf7/8+FuZrlVYfSSPp0jxmPU45ED0JnEA8r4c3HjjIaddT0GGkZ6pqewNmIQT68HvAw38dy9HbdylHZP38Jk4wzCOSfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245611; c=relaxed/simple;
	bh=AnYJjMEVMZsdOnvUxxMzQ0rIaXJ1ImiFT4DopIP2e8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOiOrIqjPoRG1YAghO/fweCDbjQXE35U9LooTLftKy/b1PLeE1xVMhz2spLbpU7tvPUqlye/YenWgW7FEMrmCSHSQC55UYwC7+Wj0BTu9YHJ7unqlup4kdfDrmVT415ba5qqctJHc7Qoi5a+1IFLGtXx6vqmJyY8twMsMVKO6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=NS+etShE; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="NS+etShE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M9x3fT9GGJxOFIKcgfkZY8y3OnO93rkZuMRejDtgsf0=; b=NS+etShE/bUyas90qb+jVjBIld
	py8Q8LHtDVRTFAC1GR1DufsAFBCVDAZslhREehB5aHuWD1T7EJC0yASTiyKPSToKp8oa5CaJwJnRB
	eov0frVCiqbzcKnvP3FOCEbDpcCqVVQ2skILn3JxVc93rJ5YM5uE44Vy88rjYaeRz0yLN+S8GZfUv
	iD44/pLkiuA/aEGVQflL5JOY3talptBMRFCmJYqBQVNvROu0wyi9wCQoUxiUYF7U5nImFUBFl9Ccl
	h5mpJQWH0DfhZil2NU/bxogCetcxw0rGIkFZKuGmnCdWAAgiJRdFw8TIkWQaixJub9jGbFAC6dBZA
	Q7m9sBmg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vfNTi-00000008GZv-1QYo;
	Mon, 12 Jan 2026 19:21:26 +0000
Date: Mon, 12 Jan 2026 19:21:26 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112192126.GJ3634291@ZenIV>
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
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jan 12, 2026 at 01:37:22PM +0100, Peter Zijlstra wrote:

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

From experimenting with godbolt.org:
			clang		gcc		icc
__typeof_unqual__	>= 19.0.1	>= 14.1		no
this trick		>= 3.0.0	>= 8.4		>= 13.0.1
our minima		15.0.0		8.1

So __typeof_unqual__ is well out of our range; this trick is slightly
out of range, but nowhere near as bad.  Prior to 8.4 gcc had a bug
in that area, unfortunately ;-/

Might make sense to reconsider it next time we bump gcc minimum...
