Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362742915
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5DlddhjUVyteXMoL09oPHpi3KfoXAOYSYC67ZyBWCcg=; b=V/T0AS0FQjnWHcsJxlp10IjHZN
	X1QU9duBdgIY8sBztxRpJHnTbJWsK9ni18zQBp+163HAPNGulZZSN1SElli0Luou3q2bMWzX+PlOu
	aUTU6By5q7oeBPUbogiftneD4aySzXux/YtMXNpqIQJcoUl3bVDANRBw/FwSaOLiOKF30JvW4dy9b
	HL9mmwfjlHOghwHhFbK7YXKfWh8xnreHZkDy5KpRMrTXZe3PxGhTuKnfcgREbaUywapOUYyGgDqGt
	iodmIHEH3l+0FHWlMUUvMVELepx7m5q8Y0Zt1aY2XMMDQWVV1jbtSucXBpsKUpjFJjtTkuz8fJmYF
	8VWPmh2Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qggnY-001YQ9-GZ; Thu, 14 Sep 2023 07:30:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1195E300422; Thu, 14 Sep 2023 09:30:00 +0200 (CEST)
Date: Thu, 14 Sep 2023 09:29:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: lkp <lkp@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [tip:x86/tdx 8/12] vmlinux.o: warning: objtool:
 __tdx_hypercall+0x128: __tdx_hypercall_failed() is missing a __noreturn
 annotation
Message-ID: <20230914072959.GC16631@noisy.programming.kicks-ass.net>
References: <202309140828.9RdmlH2Z-lkp@intel.com>
 <90f0a4d44704f9c296f3a4d8b72c57f2916aa09d.camel@intel.com>
 <377b1ce2ecd390f4b6f8cdf68d22c708f7cef6d1.camel@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377b1ce2ecd390f4b6f8cdf68d22c708f7cef6d1.camel@intel.com>

On Thu, Sep 14, 2023 at 03:21:29AM +0000, Huang, Kai wrote:
> On Thu, 2023-09-14 at 01:23 +0000, Huang, Kai wrote:
> > On Thu, 2023-09-14 at 09:05 +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
> > > head:   7b804135d4d1f0a2b9dda69c6303d3f2dcbe9d37
> > > commit: c641cfb5c157b6c3062a824fd8ba190bf06fb952 [8/12] x86/tdx: Make TDX_HYPERCALL asm similar to TDX_MODULE_CALL
> > > config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20230914/202309140828.9RdmlH2Z-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140828.9RdmlH2Z-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309140828.9RdmlH2Z-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > > > vmlinux.o: warning: objtool: __tdx_hypercall+0x128: __tdx_hypercall_failed() is missing a __noreturn annotation
> > > 
> > 
> > Hmm.. The __tdx_hypercall_failed() is already annotated with __noreturn (I
> > explicitly added it to silent such warning):
> > 
> > /* Called from __tdx_hypercall() for unrecoverable failure */
> > noinstr void __noreturn __tdx_hypercall_failed(void)
> > {
> >         instrumentation_begin();
> >         panic("TDVMCALL failed. TDX module bug?");
> > }
> > 
> > Not sure why the objtool is still complaining this?
> > 
> 
> It appears the __noreturn must be annotated to the function declaration but not
> the function body.  I'll send out the fix as soon as I confirm the fix with LKP.

FWIW, the reason being that...

The point of noreturn is that the caller should know to stop generating
code. For that the declaration needs the attribute, because call sites
typically do not have access to the function definition in C.
