Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C71C746B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 15:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13797C433EF;
	Mon, 27 Feb 2023 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677510810;
	bh=u8rAdrW0LjOvoaHiZAoaHp3uIGx2ZxBvoFwtlLDHQfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1VsHCci9EqWjg/662qztuJ7DUi0tDZvsdbwLvpqkNq5wHgVqt8Z6qSq+CR9vV43s
	 WggEk6S7BhKM3cvVmd2FcbESgsKCdTpi101TF+lezcbAtt1UDX/NhI+AOO476z/HHd
	 t3paOpHZfWW8qCQXDkyrN6S02OM+hTvtYcUfaLYJsXoE5H7FbtvrKCJZrJLpKLBb+W
	 ihxsU9R900/FeiRkdbDu2S+JiRkRYoMSiPQ7dXr5e7ewRqICeNS+Zy1T+sQXEt34XZ
	 DUqXQo/jn7cdssmStlWSfC+FIKrVEgBV+6tT44R7bdNuTn8EERyaqVzSwL/CXLdoD6
	 hrWXdSAy6Ed4g==
Date: Mon, 27 Feb 2023 07:13:28 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: vmlinux.o: warning: objtool: mptscsih_abort+0x7f4: unreachable
 instruction
Message-ID: <20230227151328.lyvzzn7kggaa2t5z@treble>
References: <202302271743.78emit6I-lkp@intel.com>
 <Y/ykNfK+1G8ZNYSU@FVFF77S0Q05N>
 <Y/y5aucdGL7U+W7a@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/y5aucdGL7U+W7a@hirez.programming.kicks-ass.net>

On Mon, Feb 27, 2023 at 03:08:42PM +0100, Peter Zijlstra wrote:
> On Mon, Feb 27, 2023 at 12:38:13PM +0000, Mark Rutland wrote:
> > [adding Peter and Josh, given objtool]
> > 
> > On Mon, Feb 27, 2023 at 05:28:53PM +0800, kernel test robot wrote:
> > > Hi Mark,
> > > 
> > > FYI, the error/warning still remains.
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   f3a2439f20d918930cc4ae8f76fe1c1afd26958f
> > > commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
> > > date:   5 weeks ago
> > > config: x86_64-randconfig-r026-20230227 (https://download.01.org/0day-ci/archive/20230227/202302271743.78emit6I-lkp@intel.com/config)
> > > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > > reproduce (this is a W=1 build):
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c27cd083cfb9d392f304657ed00fcde1136704e7
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout c27cd083cfb9d392f304657ed00fcde1136704e7
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         make W=1 O=build_dir ARCH=x86_64 olddefconfig
> > >         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Link: https://lore.kernel.org/oe-kbuild-all/202302271743.78emit6I-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> vmlinux.o: warning: objtool: mptscsih_abort+0x7f4: unreachable instruction
> 
> > > 07ef  2fb7bff:	e8 00 00 00 00       	call   2fb7c04 <mptscsih_abort+0x7f4>	2fb7c00: R_X86_64_PLT32	mpt_halt_firmware-0x4
> > > 07f4  2fb7c04:	e9 75 fb ff ff       	jmp    2fb777e <mptscsih_abort+0x36e>
> 
> this is one of those noreturn things again... objtool was clever enough
> to figure out that mpt_halt_firmware() does not return (all it's control
> flow ends in panic()) and hence it 'knows' that +7f4 will not be
> executed. But GCC didn't figure out the same.

I can take care of this one, to go with my other two piles of noreturn
fixes for after the merge window.

-- 
Josh
