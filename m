Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056E21ADB9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753647191; cv=none; b=pbwfgilVhIuLJLbLZgU1Mm2HH15/1GG0GMKzA8lJZLIqzD5RAzPKVngmEC3h3dlqtR2cxozQ3CTWVe+F5ZEPzknA6DND7IJejPHIYyPPEcET54duFCSlNHEICI8wagCBtgBuYhFLKW0LqzjNRTVKFO7dvTYoP1esVwqgNgb14pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753647191; c=relaxed/simple;
	bh=KQIe7Ezhuc+FxJ0GEcxeweEgfbpNvznzirT+6jH9tJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jVkJaxzquBOw4El+Zyg1N1ODv9zfCDFBBykQgQcqZ1nmdnUNF6/wvGQYJW4tL1hQNtmddLAuig+Akx7YeJpYQT3nKa1esRuQhiWG0rg//zipc+KHQ0QsGMOzUo+Jchk+CTPp4pl3B4vtLdjlU2J67ZF+uY84nPm8X17YjM7OAt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHv7SN8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHv7SN8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0A7C4CEEB;
	Sun, 27 Jul 2025 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753647190;
	bh=KQIe7Ezhuc+FxJ0GEcxeweEgfbpNvznzirT+6jH9tJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vHv7SN8r2+EJ+L64YFaggrmMrZZydENog1JOijWcikotl+u9nrKAfCrz/HXDT5H49
	 jy0bxUc5WFKMbcnQJMI+Qob37e2EDalmbxPx05uBNqlicdPxE1aGhGc5r42jLva0Ks
	 2HEwwBpWIHeG/r/fi2l1/ZZ4i+6xnkH4TEAsbr0ghBEW6E57csU15eRAg5SFHdbAlk
	 GOdGaTbm+XVJKVTj+R2EgpfK+GRNMGKdjCr72GKCHBs/+XtYfOZY2HjWhoN91K3Bwq
	 VQETSUinKAiDsVshEmf1G6KcRx46XjJ6kE0xDZxhj6xodQFzXrWsB9SCa+9+UKX1/H
	 RrwaH90BFI7Bw==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 34/101] mm/mprotect.c:726:13: error: 'PAGE_NONE' undeclared; did you mean 'PAGE_U_NONE'?
Date: Sun, 27 Jul 2025 13:13:07 -0700
Message-Id: <20250727201307.53385-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250727174544.63218-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Jul 2025 10:45:44 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Sun, 27 Jul 2025 08:16:01 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> > head:   de1df744d5c68470ace629863436a2b0b7360254
> > commit: af1d8aa70d3ae773ee9c7b9782ccfef1876bb027 [34/101] mm/mprotect: use PAGE_NONE for change_protection(..., MM_CP_PROT_DAMON)
> > config: arc-randconfig-001-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270855.YvsYlfrv-lkp@intel.com/config)
> > compiler: arc-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270855.YvsYlfrv-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507270855.YvsYlfrv-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from include/linux/pagewalk.h:5,
> >                     from mm/mprotect.c:12:
> >    include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
> >     #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
> >     
> >    In file included from arch/arc/include/asm/irqflags-compact.h:16,
> >                     from arch/arc/include/asm/irqflags.h:11,
> >                     from include/linux/irqflags.h:18,
> >                     from include/linux/spinlock.h:59,
> >                     from include/linux/mmzone.h:8,
> >                     from include/linux/gfp.h:7,
> >                     from include/linux/mm.h:7,
> >                     from include/linux/pagewalk.h:5,
> >                     from mm/mprotect.c:12:
> >    arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
> >     #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
> >     
> >    mm/mprotect.c: In function 'change_protection':
> > >> mm/mprotect.c:726:13: error: 'PAGE_NONE' undeclared (first use in this function); did you mean 'PAGE_U_NONE'?
> >       newprot = PAGE_NONE;
> >                 ^~~~~~~~~
> >                 PAGE_U_NONE
> >    mm/mprotect.c:726:13: note: each undeclared identifier is reported only once for each function it appears in
> 
> Thank you for this report!  I just pushed a fix:
> https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=bbc588c9166d6ff4ac9b270929732760215a94c3

There was a silly typo, sorry.  Pushed another fix for that:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=7e65eab68ae7ff67bcaaa0466278aab7ec966604


Thanks,
SJ

[...]
