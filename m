Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC85EAD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 01:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706665734; cv=none; b=A89+AMNTAxMLW0HAhV32IdTLZ9n5/V6hT0JE5AHDvLH6+Mt792S9s+u0x9XSOWLLIBgywwksOq5lLEohrAIfwgIt8B+KBRn6XgCuT9nApjRPZ+pHBLilZvtLSCDwyOYr3PWck9tF01UJKTzkvk22icW5xVHUXIlusDObs8b1jFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706665734; c=relaxed/simple;
	bh=Tm8gJ9OMkIOn77EjQD4TjioQACpDJzXIvuenwNCH390=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMAe/RgpD+apPgUcUtgsqRmajgtTMsVpJLBz8gKoUrnxPpNDiwYE8ylL7RSs8hOVpzRHVbMugeRYu/35cUOKWHlooGT5HlkZl5UDEiyBn9VMnNiBjDDPM7Gh4UT8W7xcDbKurGpfFAbpwS8trH3DkefL10Gj+9XyYUxOAI/zJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsMcsS23; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsMcsS23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706665732; x=1738201732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tm8gJ9OMkIOn77EjQD4TjioQACpDJzXIvuenwNCH390=;
  b=RsMcsS23j9YwXrPMCqP8a8rXBuRozgFlvjnPTt4uEH34zqxTh9XNHFTv
   I6XAIWZXkX9i+C8lWmVHxe0Z2DEwnBlRmGImPpnsVxF4BdSgT+wV0TnOx
   WOW2X9Hdu53Py+6T/UHCl1tS+LQuO7eAQTp4MtsR2DXYExqsR62xPok2Y
   CEoyyx81pDVPPsflV51IQFivvPcsgQTOY6kZqCpt+ylv4H5L2qebPjXI/
   /w2IQbtAJrLh4SlCvS/OFZ9bRNK6Kr0Gm9/UL0A/OzWy2Zc3GtFTxxJsa
   dYzMg1utmIJbRifEjUN4GEcSFXo0Hz8Q4YyIW+kTVN7ubNXk12b7hEAHW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16985975"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="16985975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3932263"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jan 2024 17:48:49 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUziZ-00011q-0C;
	Wed, 31 Jan 2024 01:48:47 +0000
Date: Wed, 31 Jan 2024 09:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli@kernel.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [cip:linux-4.4.y-st-rc 1078/1809] arch/m68k/kernel/signal.c:867:29:
 error: 'tregs' undeclared; did you mean 'regs'?
Message-ID: <202401310920.sBSI4BHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   4daf8df4558b5aae717516f7e941014c463772c2
commit: 9cabe0442a98d77cc23fb8b8cd2549d5c8e8995a [1078/1809] m68k: Move signal frame following exception on 68020/030
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240131/202401310920.sBSI4BHj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310920.sBSI4BHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/kernel/signal.c: In function 'setup_frame':
>> arch/m68k/kernel/signal.c:867:29: error: 'tregs' undeclared (first use in this function); did you mean 'regs'?
     frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
                                ^~~~~
                                regs
   arch/m68k/kernel/signal.c:867:29: note: each undeclared identifier is reported only once for each function it appears in
   arch/m68k/kernel/signal.c: In function 'setup_rt_frame':
   arch/m68k/kernel/signal.c:947:29: error: 'tregs' undeclared (first use in this function); did you mean 'regs'?
     frame = get_sigframe(ksig, tregs, sizeof(*frame));
                                ^~~~~
                                regs


vim +867 arch/m68k/kernel/signal.c

   850	
   851	static int setup_frame(struct ksignal *ksig, sigset_t *set,
   852				struct pt_regs *regs)
   853	{
   854		struct sigframe __user *frame;
   855		int fsize = frame_extra_sizes(regs->format);
   856		struct sigcontext context;
   857		int err = 0, sig = ksig->sig;
   858	
   859		if (fsize < 0) {
   860	#ifdef DEBUG
   861			printk ("setup_frame: Unknown frame format %#x\n",
   862				regs->format);
   863	#endif
   864			return -EFAULT;
   865		}
   866	
 > 867		frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
   868	
   869		if (fsize)
   870			err |= copy_to_user (frame + 1, regs + 1, fsize);
   871	
   872		err |= __put_user(sig, &frame->sig);
   873	
   874		err |= __put_user(regs->vector, &frame->code);
   875		err |= __put_user(&frame->sc, &frame->psc);
   876	
   877		if (_NSIG_WORDS > 1)
   878			err |= copy_to_user(frame->extramask, &set->sig[1],
   879					    sizeof(frame->extramask));
   880	
   881		setup_sigcontext(&context, regs, set->sig[0]);
   882		err |= copy_to_user (&frame->sc, &context, sizeof(context));
   883	
   884		/* Set up to return from userspace.  */
   885	#ifdef CONFIG_MMU
   886		err |= __put_user(frame->retcode, &frame->pretcode);
   887		/* moveq #,d0; trap #0 */
   888		err |= __put_user(0x70004e40 + (__NR_sigreturn << 16),
   889				  (long __user *)(frame->retcode));
   890	#else
   891		err |= __put_user((void *) ret_from_user_signal, &frame->pretcode);
   892	#endif
   893	
   894		if (err)
   895			return -EFAULT;
   896	
   897		push_cache ((unsigned long) &frame->retcode);
   898	
   899		/*
   900		 * Set up registers for signal handler.  All the state we are about
   901		 * to destroy is successfully copied to sigframe.
   902		 */
   903		wrusp ((unsigned long) frame);
   904		regs->pc = (unsigned long) ksig->ka.sa.sa_handler;
   905		adjustformat(regs);
   906	
   907		/*
   908		 * This is subtle; if we build more than one sigframe, all but the
   909		 * first one will see frame format 0 and have fsize == 0, so we won't
   910		 * screw stkadj.
   911		 */
   912		if (fsize)
   913			regs->stkadj = fsize;
   914	
   915		/* Prepare to skip over the extra stuff in the exception frame.  */
   916		if (regs->stkadj) {
   917			struct pt_regs *tregs =
   918				(struct pt_regs *)((ulong)regs + regs->stkadj);
   919	#ifdef DEBUG
   920			printk("Performing stackadjust=%04x\n", regs->stkadj);
   921	#endif
   922			/* This must be copied with decreasing addresses to
   923	                   handle overlaps.  */
   924			tregs->vector = 0;
   925			tregs->format = 0;
   926			tregs->pc = regs->pc;
   927			tregs->sr = regs->sr;
   928		}
   929		return 0;
   930	}
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
