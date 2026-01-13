Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224D221DB1;
	Tue, 13 Jan 2026 00:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768264000; cv=none; b=le8/jS4HsCU2LnoH967hpiVRt4ah1fI9v8PZ9EBL4kX7SWhzFwqkybtFBFrUHbyK7lfDrMbxINt05R5i2i56TSNeWq20xSeWfRt7YrMNS9l2zCgTvlX0J8L0CCFuiR4K3L5WBnwZEu96aTwBHMVP+qM198LqSz3S/+7pJeHunBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768264000; c=relaxed/simple;
	bh=LKgEGLfdo4dWiOOzxWGyXInqXlTgyR3k0icQEQYAuYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjvT6PPQ8QPMFn0hbwW4SYbDfVH9s+YQPk7Okn+eNLV6dpYph8NHEDCWZb0BOuGLD7M37x4thzPdQsxZRLhCynVkPXqUxUMgn3QPn4zKPT+QOFQXQaFW1+vfyIsOVky8A7Yw1uWIe0biUhA/F3CFckCpBLn4nUGarx7NA698H0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=QyV7GFwf; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="QyV7GFwf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i/xiS/tPwB4VQFgSTMgVyKSV15qnRrD2Ti/SNxdVUq0=; b=QyV7GFwfnWbWd6dnGsIHIFIKe6
	8zPj9Vc1otrQsWjqa/QtLbDcae0tyaNwg4frk++B3HEHgSundMTUWvs8iWRA2NeKOxNpQe43f2TlU
	j+mxi01aLLq9ytijbgIhUkGlyOoiffIu4ugxlM6U88t+Vguwf6fTkbVRsQ4ZuaQH1EMrUlh+sUcx8
	M/sPnoYe/OgZT9PMlJDCjg1Jk+fPv9TClaRW/kfM0RrFJZKdJvzmka0La+AreFq36/D3vWu5+K+ZD
	tDOIOx4ps4IMVJwlEYgpxL3T5fXfCKH4kOL7QTeujNopGAbyt/RYLszmbZcbCp0BZP+F02CKoAhzQ
	TSHGMOrw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vfSGO-0000000AhrA-0kJv;
	Tue, 13 Jan 2026 00:28:00 +0000
Date: Tue, 13 Jan 2026 00:28:00 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260113002800.GM3634291@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <20260111182010.GH3634291@ZenIV>
 <20260112123722.GJ830755@noisy.programming.kicks-ass.net>
 <20260112192126.GJ3634291@ZenIV>
 <20260112211625.GL3634291@ZenIV>
 <20260112223923.78784af1@pumpkin>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112223923.78784af1@pumpkin>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jan 12, 2026 at 10:39:23PM +0000, David Laight wrote:

> Using __auto_type y = (1 ? 0 : 0+x) gives a non-const 'y' even with gcc 10.

... which does not work at all for the example that has started
that thread:

typedef struct {
        uid_t val;
} kuid_t;

Arithmetics is not an option for existing uses.  , and ?: would be OK, but
they are even worse than return type - at least that got fixed in 8.4.

As for the -Wignored-qualifiers...  Sure, that's included into -Wextra, along
with many other insanities - -Wunused-parameter, for example.  Grep for
-Wextra and you'll see...
