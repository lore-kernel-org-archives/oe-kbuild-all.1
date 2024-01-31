Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBA47AE50
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691716; cv=none; b=IvsPx3CvsPYbUbMPq7AmC7HWPQ3wlIg1Rciy9jutUbDEzQGhLanb6IeSvCGGX4TIf/qAHN73E25Re4ocYZMUABMSygVNllFahwq55Q1+1ALMjWkUCjJTvG5Rvob0F60hIAIcD2irCjuAqvCqkgUccyDybFLgI+dxwdCCUpyoD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691716; c=relaxed/simple;
	bh=zvkDc2pNkPsz2BY8UkUtrKMvgtpi+/PHJ5RXNslLMpQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R96/ZcPzKlLR2yS1LwlgBz8bNilS/w2iBM+1kv4h+gn8HbpR6lRGnRKUVOqQhIzqfXYS/oLNIMr7f2/5tYS2ZOb5kMA6WwL0mXVhIKj8WE1kXo1uV8o0V64cMN+TDr8NMNQpRpKSFx5Ax7bG21iSXNbzVSBcj3N6RKy0PHas/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZdVI6b1J; arc=none smtp.client-ip=64.147.123.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZdVI6b1J"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D34CB3200A33;
	Wed, 31 Jan 2024 04:01:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 31 Jan 2024 04:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706691711; x=1706778111; bh=SQSw84oJKBIQV6Br3y/0Vk4j6Th8
	tdOmF6EKFPravMI=; b=ZdVI6b1JJer308bQpsqr1u26l1Jpftzln0KRJAVVVlAH
	q3iRytekAFrSXkvMPvkzOzM1i+HeO14VuzorPYErpct7k7+Qm5IfF8OmL4qO/fQF
	xgrFtOoFX6vSbufdT9630qc9hEaiheLqNiTQ8ilpNvsKj9/STuTrwA+drWPxDPnF
	oYCibQF8DA/QYu4R3e1kNO9XTAV8iWfKFYdXdaVOiog2FlO/L7geG/cGlBSRuHJe
	+OzBHt+c3flotUP1EIQcKKQTuhrLnwYGwOjyh+oGiG1gPip28oquNQBxLPn8COMs
	6J0w9TnEJ1/2WhEZbz6sVUi9cQnTKOhbptDs+DsUJA==
X-ME-Sender: <xms:fgy6ZfR9INQkCot5CWOCnHGFtVscLl9s1i_YXzWLfVrbm7baJ1FV4Q>
    <xme:fgy6ZQz15H_CuwVEc6ulsZCquj1YybID7g0hnKjI_NVjLXdIPToy3xkHj_Y3zdf2q
    Nx4N4IUSDcsxGXj4NI>
X-ME-Received: <xmr:fgy6ZU12FW-HzEJMoiBhrI_1C_T-qa_Yn18Hs-ytkwkKNIiMhD4b8NtIpcmrGdKye8HvrBXr24orUSPJq9IsnaXU504v2NaywZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtkedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhephffhtdehjeelgfeifffhhfeffffgjeefleeuudefuefhvedtieehhedu
    hfegheeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehl
    ihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:fgy6ZfD4S64U7BlD8Zt0PzWNAB_5LUMcFd5ZWxtyxAd-2AlrjyPDNw>
    <xmx:fgy6ZYhihFHq-f4Qv-ldmURCeGI2ly02azPgnRlm9RuPHDnOo2Skpg>
    <xmx:fgy6ZTrAKuzhYnkYcjenpAFX5b9k0OK6nAP1fsG-W_BssV6OPaJDpw>
    <xmx:fwy6ZRsz8bK74-UNZis8woIguJ_6_DEjJKfqvwOejr4Rcp7Rw7HfjA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Jan 2024 04:01:47 -0500 (EST)
Date: Wed, 31 Jan 2024 20:01:57 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    Ulrich Hecht <uli@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [cip:linux-4.4.y-st-rc 1078/1809] arch/m68k/kernel/signal.c:867:29:
 error: 'tregs' undeclared; did you mean 'regs'?
In-Reply-To: <ccdc3701-bcd4-3030-d38c-798e9ace31e1@gmail.com>
Message-ID: <75e4e6e4-a914-de89-c1a2-505a473375d4@linux-m68k.org>
References: <202401310920.sBSI4BHj-lkp@intel.com> <ccdc3701-bcd4-3030-d38c-798e9ace31e1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Hello Michael

On Wed, 31 Jan 2024, Michael Schmitz wrote:

> Hi Finn,
> 
> incomplete patch backport? This patch needs commit 4bb0bd81ce5e9 as a
> prerequisite, I suppose?
> 

The v4.4 build failure below appears to come from a Civil Infrastructure 
Project (CIP) branch. v4.4.y is no longer an active -stable branch and has 
fallen from my radar too.

Many of Al Viro's fixes have not been backported. When I build v4.14.y 
binaries for upload to the mac68k project on sourceforge, I backport those 
fixes myself.

To answer your question, after a shallow reading of 4bb0bd81ce5e9, I don't 
see anything that would prevent backporting that commit to v4.4 but that 
would need to be tested. Unfortunately my git repo is suffering from "bad 
packed object CRC" right now, and I haven't had time to repair it yet.

I can see the value in backporting all of those fixes -- both Al's fixes 
and our own -- but there is some work involved. The v4.19.y banch could be 
a more realisitic goal. Hard to say... I'm not familiar with the CIP and 
its aims.

Regards
Finn

> Cheers,
> 
> 	Michael
> 
> 
> Am 31.01.2024 um 14:48 schrieb kernel test robot:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
> > linux-4.4.y-st-rc
> > head:   4daf8df4558b5aae717516f7e941014c463772c2
> > commit: 9cabe0442a98d77cc23fb8b8cd2549d5c8e8995a [1078/1809] m68k: Move
> > signal frame following exception on 68020/030
> > config: m68k-allnoconfig
> > (https://download.01.org/0day-ci/archive/20240131/202401310920.sBSI4BHj-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 7.5.0
> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20240131/202401310920.sBSI4BHj-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version
> > of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/m68k/kernel/signal.c: In function 'setup_frame':
> >>> arch/m68k/kernel/signal.c:867:29: error: 'tregs' undeclared (first use in
> >>> this function); did you mean 'regs'?
> >      frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
> >                                 ^~~~~
> >                                 regs
> >    arch/m68k/kernel/signal.c:867:29: note: each undeclared identifier is
> >    reported only once for each function it appears in
> >    arch/m68k/kernel/signal.c: In function 'setup_rt_frame':
> >    arch/m68k/kernel/signal.c:947:29: error: 'tregs' undeclared (first use in
> >    this function); did you mean 'regs'?
> >      frame = get_sigframe(ksig, tregs, sizeof(*frame));
> >                                 ^~~~~
> >                                 regs
> >
> >
> > vim +867 arch/m68k/kernel/signal.c
> >
> >    850	
> >    851	static int setup_frame(struct ksignal *ksig, sigset_t *set,
> >    852				struct pt_regs *regs)
> >    853	{
> >    854		struct sigframe __user *frame;
> >    855		int fsize = frame_extra_sizes(regs->format);
> >    856		struct sigcontext context;
> >    857		int err = 0, sig = ksig->sig;
> >    858	
> >    859		if (fsize < 0) {
> >    860	#ifdef DEBUG
> >    861			printk ("setup_frame: Unknown frame format
> >    %#x\n",
> >    862				regs->format);
> >    863	#endif
> >    864			return -EFAULT;
> >    865		}
> >    866	
> >  > 867		frame = get_sigframe(ksig, tregs, sizeof(*frame) +
> >  > fsize);
> >    868	
> >    869		if (fsize)
> >    870			err |= copy_to_user (frame + 1, regs + 1,
> >    fsize);
> >    871	
> >    872		err |= __put_user(sig, &frame->sig);
> >    873	
> >    874		err |= __put_user(regs->vector, &frame->code);
> >    875		err |= __put_user(&frame->sc, &frame->psc);
> >    876	
> >    877		if (_NSIG_WORDS > 1)
> >    878			err |= copy_to_user(frame->extramask,
> >    &set->sig[1],
> >    879					    sizeof(frame->extramask));
> >    880	
> >    881		setup_sigcontext(&context, regs, set->sig[0]);
> >    882		err |= copy_to_user (&frame->sc, &context,
> >    sizeof(context));
> >    883	
> >    884		/* Set up to return from userspace.  */
> >    885	#ifdef CONFIG_MMU
> >    886		err |= __put_user(frame->retcode, &frame->pretcode);
> >    887		/* moveq #,d0; trap #0 */
> >    888		err |= __put_user(0x70004e40 + (__NR_sigreturn << 16),
> >    889				  (long __user *)(frame->retcode));
> >    890	#else
> >    891		err |= __put_user((void *) ret_from_user_signal,
> >    &frame->pretcode);
> >    892	#endif
> >    893	
> >    894		if (err)
> >    895			return -EFAULT;
> >    896	
> >    897		push_cache ((unsigned long) &frame->retcode);
> >    898	
> >    899		/*
> >    900		 * Set up registers for signal handler.  All the state
> >    we are about
> >    901		 * to destroy is successfully copied to sigframe.
> >    902		 */
> >    903		wrusp ((unsigned long) frame);
> >    904		regs->pc = (unsigned long) ksig->ka.sa.sa_handler;
> >    905		adjustformat(regs);
> >    906	
> >    907		/*
> >    908		 * This is subtle; if we build more than one sigframe,
> >    all but the
> >    909		 * first one will see frame format 0 and have fsize ==
> >    0, so we won't
> >    910		 * screw stkadj.
> >    911		 */
> >    912		if (fsize)
> >    913			regs->stkadj = fsize;
> >    914	
> >    915		/* Prepare to skip over the extra stuff in the
> >    exception frame.  */
> >    916		if (regs->stkadj) {
> >    917			struct pt_regs *tregs =
> >    918				(struct pt_regs *)((ulong)regs +
> >    regs->stkadj);
> >    919	#ifdef DEBUG
> >    920			printk("Performing stackadjust=%04x\n",
> >    regs->stkadj);
> >    921	#endif
> >    922			/* This must be copied with decreasing
> >    addresses to
> >    923	                   handle overlaps.  */
> >    924			tregs->vector = 0;
> >    925			tregs->format = 0;
> >    926			tregs->pc = regs->pc;
> >    927			tregs->sr = regs->sr;
> >    928		}
> >    929		return 0;
> >    930	}
> >    931	
> >
> 
