Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A9208C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 11:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=31Mk8LyxJ/i2+GjpPHSXdxRgP0SAQUj9tBvhJ35XS1Q=; b=pMq0MbCDyhC/AppRuT/3DlvLCr
	b95eGXoEwxDyiyj/L9//DrjtXUWlf7+A3YaZn6tnPgzDwDXMpn2QJPUD1Wc7509exPNNsr3DFu6U/
	sLOX5oTNucU4KpFcw/3OQSd2KmvzXNK9mq+JOhzKsw1dyJBBm4VBzTXwYhEZaWN6saslZT35DKFA5
	SuZ+/ZmxlaB9iwo9N8NBFCZlhIYYSxDUnkwxLzpCsVeIb0nKKnSk03aZIHdff+FCLsQtnBY3Beavt
	Nx14FlXYmC6CXursGkIUZQlHYOTVGGc3TvplR+7mPJ+bu9e1ErH1oQ9Lf3hZ6m+Utp3hDJoLGyA3i
	TfCmlkdw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qgkAd-002XTv-O7; Thu, 14 Sep 2023 11:06:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 69D7930036C; Thu, 14 Sep 2023 13:06:03 +0200 (CEST)
Date: Thu, 14 Sep 2023 13:06:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	lkp <lkp@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [tip:x86/tdx 8/12] vmlinux.o: warning: objtool:
 __tdx_hypercall+0x128: __tdx_hypercall_failed() is missing a __noreturn
 annotation
Message-ID: <20230914110603.GA18948@noisy.programming.kicks-ass.net>
References: <202309140828.9RdmlH2Z-lkp@intel.com>
 <90f0a4d44704f9c296f3a4d8b72c57f2916aa09d.camel@intel.com>
 <377b1ce2ecd390f4b6f8cdf68d22c708f7cef6d1.camel@intel.com>
 <20230914072959.GC16631@noisy.programming.kicks-ass.net>
 <9eb77be3a64c25b3264d5011a93242d006b88627.camel@intel.com>
 <20230914085913.GD16631@noisy.programming.kicks-ass.net>
 <560662b4dd5088164119e0d312f88ed97f6f94a7.camel@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560662b4dd5088164119e0d312f88ed97f6f94a7.camel@intel.com>

On Thu, Sep 14, 2023 at 10:02:40AM +0000, Huang, Kai wrote:
> On Thu, 2023-09-14 at 10:59 +0200, Peter Zijlstra wrote:
> > On Thu, Sep 14, 2023 at 07:54:10AM +0000, Huang, Kai wrote:
> > 
> > > > The point of noreturn is that the caller should know to stop generating
> > > > code. For that the declaration needs the attribute, because call sites
> > > > typically do not have access to the function definition in C.
> > > 
> > > Ah that makes perfect sense.  Thanks!
> > > 
> > > Then I assume we don't need to annotate __noreturn in the function body, but
> > > only in the declaration?  Because the compiler must already have seen the
> > > declaration when it generates the code for the function body.
> > 
> > I think so, I'm sure it'll tell you if it disagrees :-)
> > 
> > > Btw, I happened to notice that the objtool documentation suggests that we should
> > > also add the the function to tools/objtool/noreturns.h:
> > > 
> > > 3. file.o: warning: objtool: foo+0x48c: bar() is missing a __noreturn annotation
> > > 
> > >    The call from foo() to bar() doesn't return, but bar() is missing the
> > >    __noreturn annotation.  NOTE: In addition to annotating the function
> > >    with __noreturn, please also add it to tools/objtool/noreturns.h.
> > > 
> > > Is it a behaviour that we still need to follow?
> > 
> > Yes. objtool has some heuristics to detect noreturn, but is is very
> > difficult. Sadly noreturn is not something that is reflected in the ELF
> > object file so we have to guess.
> > 
> > For now manually adding it to the objtool list is required, we're trying
> > to get to the point where it is generated/validated by the compiler,
> > perhaps with a plugin, but we're not there yet.
> 
> Sorry one more question, do you know what Kconfig option triggers this
> __noreturn objtool check?  I couldn't reproduce it on my own machine but have to
> depend on LKP for now.

Nope, sorry. Could be very GCC version specific through, this is all
about a specific code-gen pattern.

AFAICT we emit this warning when objtool finds this function is a
noreturn but code-gen continued.
