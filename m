Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393231D6A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 14:52:45 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5E6D22185F;
	Thu, 14 Sep 2023 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694703164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=167lqha1toqxasAvYkAFsUrCAO5mzUe0unVfWbEtKKA=;
	b=s8dV1zwZxD6pTrXwcsUH9mnmk5Rl8CYuzb3u758pa9YmzxcF9bjm05JR1yZrowlvYUG2t7
	OGlM0ZQlp/7RpOA+s6+Ng8+y19kk94bv580/3k5YJwH2j2dsQAy+6zhltF7JM2JMIJitdD
	HwaxSehMS/mVtgAd9IYrK1gu09+kZSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694703164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=167lqha1toqxasAvYkAFsUrCAO5mzUe0unVfWbEtKKA=;
	b=hKtzmz1ebDJhyqVAD9S1K9suz7jomJ7IEPeC8i7a5jDJNBKnKWtfg38RNROq4tGWWfX+oS
	pgrqyZf2md6MJXAg==
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E7B552C142;
	Thu, 14 Sep 2023 14:52:43 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 10510)
	id EAF2A680B; Thu, 14 Sep 2023 14:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by wotan.suse.de (Postfix) with ESMTP id E87426806;
	Thu, 14 Sep 2023 14:52:43 +0000 (UTC)
Date: Thu, 14 Sep 2023 14:52:43 +0000 (UTC)
From: Michael Matz <matz@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
cc: Ingo Molnar <mingo@kernel.org>, "Huang, Kai" <kai.huang@intel.com>, 
    lkp <lkp@intel.com>, 
    "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
    "x86@kernel.org" <x86@kernel.org>, 
    "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [tip:x86/tdx 8/12] vmlinux.o: warning: objtool: __tdx_hypercall+0x128:
 __tdx_hypercall_failed() is missing a __noreturn annotation
In-Reply-To: <20230914142644.GC18948@noisy.programming.kicks-ass.net>
Message-ID: <alpine.LSU.2.20.2309141446000.28991@wotan.suse.de>
References: <202309140828.9RdmlH2Z-lkp@intel.com> <90f0a4d44704f9c296f3a4d8b72c57f2916aa09d.camel@intel.com> <377b1ce2ecd390f4b6f8cdf68d22c708f7cef6d1.camel@intel.com> <20230914072959.GC16631@noisy.programming.kicks-ass.net> <ZQMVz/wepyo9rlhE@gmail.com>
 <20230914142644.GC18948@noisy.programming.kicks-ass.net>
User-Agent: Alpine 2.20 (LSU 67 2015-01-07)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hey,

On Thu, 14 Sep 2023, Peter Zijlstra wrote:

> > > > It appears the __noreturn must be annotated to the function declaration 
> > > > but not the function body.  I'll send out the fix as soon as I confirm 
> > > > the fix with LKP.
> > > 
> > > FWIW, the reason being that...
> > > 
> > > The point of noreturn is that the caller should know to stop generating 
> > > code. For that the declaration needs the attribute, because call sites 
> > > typically do not have access to the function definition in C.
> > 
> > BTW., arguably shouldn't the compiler generate a warning to begin with, 
> > when it encounters a noreturn function definition whose prototype doesn't 
> > have the attribute?
> 
> Yeah, I would agree with that,

That makes sense, yeah.  We actually have a warning -Wmissing-attributes 
that would fit this usecase, but currently doesn't implement this case (it 
only applies to aliases, not to decl vs. def).

> but I think the problem is that gnu
> attributes are all considered 'optional' and do not factor into the
> actual signature.

That actually depends on the attribute :)  Most attributes are like that, 
true, but some aren't optional in that sense as they influence the 
callee-caller contract (e.g. those that change the ABI, like fastcall).  
Those must then be part of the functions type.

'noreturn' is optional in that sense.  But a warning might still be 
warranted.


Ciao,
Michael.
