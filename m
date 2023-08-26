Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596ACA53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 20:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A36AC433C7;
	Sat, 26 Aug 2023 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693080360;
	bh=NTNzbd6BbG7jdbeIiKdbOt8S9wN60qJQdXCiG4oi9L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUIizmkrXQAIQrMBEn7t5Huzn5DkGhPSOStQ37PsltJTHs6AZxkaN1FCZZDZw17IG
	 xwnSXW9B7mY0Ogu4L2A+8cZHHLFHPL3tQNboETBcFe6GmfwxErj1pUPQ13X+Dt8haA
	 DdSWV1K2wCmtKv0Vxi7sThN50IlWR3qXI72kKlGg=
Date: Sat, 26 Aug 2023 22:05:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [stable:linux-5.10.y 9990/9999] arch/x86/lib/retpoline.o:
 warning: objtool: .altinstr_replacement+0x90: unsupported relocation in
 alternatives section
Message-ID: <2023082641-overbite-deport-600b@gregkh>
References: <202308270243.86PKK5Yj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308270243.86PKK5Yj-lkp@intel.com>

On Sun, Aug 27, 2023 at 02:56:55AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
> head:   1599cb60bace881ce05fa520e5251be341e380d2
> commit: 06597b650beb49bffc61e077f41e39b830d72128 [9990/9999] x86/cpu: Cleanup the untrain mess
> config: x86_64-randconfig-074-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308270243.86PKK5Yj-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives section

I apprecate the help that the kernel test robot is giving us, but this
constant bisection is a bit annoying, especially for stuff that we
already know about (like this one), or stuff that is years old (like
other reports.)

What exactly are you trying to help out with here for the stable kernel
trees?  Why not just always test on the latest release and go from
there?

And this specific should be resolved in the next release.

thanks,

greg k-h
