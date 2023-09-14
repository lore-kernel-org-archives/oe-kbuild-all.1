Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD3D309
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rg4afThrd0boKj++tc2gp5IX8j6/oqBQQnl2Ndhwbw8=; b=LGDddFnqewuxTTVGO3/21p4nK0
	qBYceHdhjMDF3DDM4uvGRYIDHZBtIaHqwfYXeYxi6blUI1atxm19kehFcpZR4ijNk8EdYLXCCyBaT
	t3HaLClVDFfGctv8AaRdE5vKqtwGqu9xPwV8qq0ZIW+wf8dNJEX77OE15kHHe+WuqbyyYwxOheQ8b
	Qc1qJPnJhrBVmQ2skDuqhTS2REN7ZvocBsH0HsbdBnMATgZnNcxee4oTWsdWR/eJSbMV10K5C5lJ+
	J46vvMVAoO/9M757fY9J6+y/Tn55uEamWc/IkI0XluTNKM5Uji5jItVbYr90c0DdxZ3zqNbibD/wt
	6sUXZlZw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnIq-007vTK-00;
	Thu, 14 Sep 2023 14:26:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1FB1430036C; Thu, 14 Sep 2023 16:26:45 +0200 (CEST)
Date: Thu, 14 Sep 2023 16:26:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: "Huang, Kai" <kai.huang@intel.com>, lkp <lkp@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	matz@suse.de
Subject: Re: [tip:x86/tdx 8/12] vmlinux.o: warning: objtool:
 __tdx_hypercall+0x128: __tdx_hypercall_failed() is missing a __noreturn
 annotation
Message-ID: <20230914142644.GC18948@noisy.programming.kicks-ass.net>
References: <202309140828.9RdmlH2Z-lkp@intel.com>
 <90f0a4d44704f9c296f3a4d8b72c57f2916aa09d.camel@intel.com>
 <377b1ce2ecd390f4b6f8cdf68d22c708f7cef6d1.camel@intel.com>
 <20230914072959.GC16631@noisy.programming.kicks-ass.net>
 <ZQMVz/wepyo9rlhE@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQMVz/wepyo9rlhE@gmail.com>

On Thu, Sep 14, 2023 at 04:16:47PM +0200, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > It appears the __noreturn must be annotated to the function declaration 
> > > but not the function body.  I'll send out the fix as soon as I confirm 
> > > the fix with LKP.
> > 
> > FWIW, the reason being that...
> > 
> > The point of noreturn is that the caller should know to stop generating 
> > code. For that the declaration needs the attribute, because call sites 
> > typically do not have access to the function definition in C.
> 
> BTW., arguably shouldn't the compiler generate a warning to begin with, 
> when it encounters a noreturn function definition whose prototype doesn't 
> have the attribute?

Yeah, I would agree with that, but I think the problem is that gnu
attributes are all considered 'optional' and do not factor into the
actual signature.

Added Michael to Cc so he may clarify if I'm talking nonsense.
