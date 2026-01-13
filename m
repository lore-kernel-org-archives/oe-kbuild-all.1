Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DFA1DEFE9;
	Tue, 13 Jan 2026 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318032; cv=none; b=gnDl/+J0RgriKTmexaiw0DAqofD48amKFP9Qk89bXPuHc77KckjxzzTSE8HfkjDf22ATQBnP4lXNfUoCQMrHyGxHSs+xQNfaBMGkslRBssRndQZeN28I1md+NMJdHJJxXHByfl+NUZGE04gBzmGYAmRjAAS0Zq8uDlA8cGirTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318032; c=relaxed/simple;
	bh=5izkz9YWdVMfAx+++xkEVc+IPz4QU2G/CDLDNbu0uiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8juNSHLqpkORIjyE7uwoARzxxeMkHS8ouJLNngQGZLphc2iyvf4JwTVR9IqDDwRhfjD/bMCAUH6qBVbSor3iDBolDofVZ1DWuWJzxgkk+XHO1RDMNGXKUO+nCVdL3fS/dgp+1UbzxWX+/xfYYAmk0niIFGlFtg0sy8bSTtckLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k/7Ny8Cu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k/7Ny8Cu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OMm7towrtfP3eRIO4ygJtjSPAgRnwDaV+heqCY/bJpk=; b=k/7Ny8CuWBYwcvHxWSJVI8wIfR
	gBKH2CbhSTigkQ+cOkd0eKcR0JkcsJy5yvvKCJ/9N+qiIFB8dOZaqHtANKUWL4CgK8RvKUtBMW84a
	BPzJt5KAItYr3zcluCqp6/5lRjO2sCsITcgKDUCxjhnbITNRT6C5tWorKesu1D9pYbmsC22PhCOei
	+XSbtq9/CboioIk8oQOvOWjA3FOlldMg0babXWXNIuo/roPic6oiCtYksOKj1QfAKdO3ZrZAMAnEY
	b6rXFIyjBjNn5NE3IhPird26jFKNVjlnQS6pKNkrkGwPo15FWE1U/4Qcj9aL7kwLu5Qyr5Swvm3kW
	2sMfxSGA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgIU-000000037mF-2eVn;
	Tue, 13 Jan 2026 15:27:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7E0FC3005E5; Tue, 13 Jan 2026 16:27:05 +0100 (CET)
Date: Tue, 13 Jan 2026 16:27:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260113152705.GX830755@noisy.programming.kicks-ass.net>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <20260112123224.GH830755@noisy.programming.kicks-ass.net>
 <20260112193019.GK3634291@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112193019.GK3634291@ZenIV>

On Mon, Jan 12, 2026 at 07:30:19PM +0000, Al Viro wrote:

> Sure, but what does that have to do with the final cast in there?  Note
> that generic __READ_ONCE() ends up with __unqual_scalar_typeof(x) for the
> type of result and it seems to be working fine.
> 
> Why would the same type of result be a problem for alpha?  Sure, we need
> a barrier there, so it can't be literal copy of generic __READ_ONCE(),
> but what's the problem with using
> 
> #define __READ_ONCE(x)							\
> ({									\
> 	__unqual_scalar_typeof(x) __x =					\
>  		(*(volatile typeof(__x) *)(&(x)));			\
> 	mb();								\
> 	__x;								\
> })
> 
> there?  What could possibly need those qualifiers added back to the result?
> It is, after all, an r-value, so...

Yeah, I'm not sure about the final cast, that was probably trying to add
'const' back.
