Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D615C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 06:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF364C433C8;
	Wed, 30 Aug 2023 06:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693377400;
	bh=CPjKhay2nf5jlTOGuWDpVHU3Z9L2w6KjQw94PGCdV/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cb7BP+r2iyDqrWqLbjOOkzQzH2e/CxEtejA8WEb1BKc//tZw9pZyPY5kelDrcgS4d
	 3uWhFcuDqrbHaGUBc3ppcjDbpbBBI0m9ahzG/GkQ4W7zPaY1UIc35M3HBvr3cCvhsm
	 s95ueLYtDk9nvZSGd+Ug4ao7JIIg8hUM6bMgLjNo=
Date: Wed, 30 Aug 2023 08:36:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>, julie.du@intel.com
Subject: Re: [stable:linux-5.10.y 9990/9999] arch/x86/lib/retpoline.o:
 warning: objtool: .altinstr_replacement+0x90: unsupported relocation in
 alternatives section
Message-ID: <2023083046-spout-hesitant-e8c6@gregkh>
References: <202308270243.86PKK5Yj-lkp@intel.com>
 <2023082641-overbite-deport-600b@gregkh>
 <ZOqsQPPZnKsyr60J@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOqsQPPZnKsyr60J@rli9-mobl>

On Sun, Aug 27, 2023 at 09:52:00AM +0800, Philip Li wrote:
> On Sat, Aug 26, 2023 at 10:05:58PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Aug 27, 2023 at 02:56:55AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
> > > head:   1599cb60bace881ce05fa520e5251be341e380d2
> > > commit: 06597b650beb49bffc61e077f41e39b830d72128 [9990/9999] x86/cpu: Cleanup the untrain mess
> > > config: x86_64-randconfig-074-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/config)
> > > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308270243.86PKK5Yj-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives section
> > 
> > I apprecate the help that the kernel test robot is giving us, but this
> > constant bisection is a bit annoying, especially for stuff that we
> > already know about (like this one), or stuff that is years old (like
> > other reports.)
> 
> Thanks Greg for the feedback, sorry that such reports are not that helpful.
> 
> > 
> > What exactly are you trying to help out with here for the stable kernel
> 
> Initially I thought the issues detected on stable could be a summary of
> issues with the first bad commit (since we only report when bisection is
> done). This can help maintainer pick up the fix per need based on it, though
> there's already automic approach at stable side to pick the needed fix
> from mainline.
> 
> Another thinking is per 0-day ci's randconfig test, it may find different
> issues (other than mainline) on stable.
> 
> > trees?  Why not just always test on the latest release and go from
> > there?
> 
> Got it, this is a good suggestion for us. I want to consult that
> 
> * We gather the issues on mainline as well, maybe we can only report
> issue to stable if the issue hasn't been detected on mainline yet?

Yes, that would be good.

> * Meanwhile, we limit the time that only to report issue which is
> within one year?

Again, that would be good too, but why so far back?  Why not just run
these on the releases when they happen (i.e. every week).  Why dig back
into really old stuff?

thanks,

greg k-h
