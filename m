Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48806288C0E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814351; cv=none; b=tAmzJX2pGT09pgsVv7uRC6iEYJJEc4aWSGeXkrFJwCOTQ/1fdE29RgD1PCpFfj5mhenA6ahiEUWskPGr0Xsazd9rIkf0Li2Yne6gErgyhh3KvYzfAQ1eHQADlieTMuPB/xZlvu1XeUd4UTSCuqXXyle2MVe7LuGY0ohkOwr7cPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814351; c=relaxed/simple;
	bh=NfzQVvRz0j66jaf9EREGGd1Fm6hBT4Jg8bWSkq8Nx7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UE7HHDeDkK4QTpTGIzsI4i3WobybC7B8O0M0F5YMeKRfL0jPnPzlESsr1UmKFzqehkCxIXnqFbw4Emg+jHfTCOCbobEXXVQRtsXWHGDLOyhvr4PLr9Tq4AltBdBpePtu7NDvIT1qoolzITX+yEnR5y4kNUBYesDQv3NQT0q7SrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsjJkqcT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsjJkqcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756814349; x=1788350349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfzQVvRz0j66jaf9EREGGd1Fm6hBT4Jg8bWSkq8Nx7A=;
  b=jsjJkqcTEzK5VxWZKbUFmi82C+E46E3OQ0WwAZsm0OAncw9MbEhq0ot0
   9rYr7LQq+Cdic4Qxra8+pxZsoSl23JWrCpMZgWljuRO6H1VSmB20TZEJa
   UIozSlLvstGClOovTxXRX9HJmQrsVQXLl61U+877H0Uo//hnokp6pgcn2
   jGY7/Jh9fjedcXBnEojbew13CTxcOCWJy1mEJqZseHMTHGME3Nsfrr61e
   gC94pTmp35gRgnicnNRCs9kMDEpyF3CZ/hcSB8z5DWOz5NgWiVyjKvDVs
   0TVNoIH7CNpLf+VqzupYxdySXE4nKwL4PTj9XuuMD6URGgB+MjrIVjXbU
   g==;
X-CSE-ConnectionGUID: iK4m1prSRjCNmMEDkcNNug==
X-CSE-MsgGUID: BWhqRVQcTtumVujgI1MnXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58939860"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58939860"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 04:59:06 -0700
X-CSE-ConnectionGUID: 99glYnfASCauBUJFlprU6g==
X-CSE-MsgGUID: RaflenF7Sk+XxfIUJNPTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="194896904"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2025 04:59:05 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPfD-0001vp-1V;
	Tue, 02 Sep 2025 11:59:03 +0000
Date: Tue, 2 Sep 2025 19:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 15/17]
 kernel/signal.c:1307:48: error: 'struct pt_regs' has no member named 'tpc'
Message-ID: <202509021932.U5jZQgUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sparc64-generic-2
head:   d78a8d1f7fa83130264660695f2d256b1397190f
commit: 2da69dbe3dd23aa15c46678bc96e3cef9ee010e4 [15/17] debug signal
config: i386-buildonly-randconfig-003-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021932.U5jZQgUC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021932.U5jZQgUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021932.U5jZQgUC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/signal.c: In function 'force_sig_info_to_task':
>> kernel/signal.c:1307:48: error: 'struct pt_regs' has no member named 'tpc'
    1307 |                       t->mm->context.vdso, regs->tpc, regs->tpc - (unsigned long)t->mm->context.vdso);
         |                                                ^~
   kernel/signal.c:1307:59: error: 'struct pt_regs' has no member named 'tpc'
    1307 |                       t->mm->context.vdso, regs->tpc, regs->tpc - (unsigned long)t->mm->context.vdso);
         |                                                           ^~


vim +1307 kernel/signal.c

  1281	
  1282	/*
  1283	 * Force a signal that the process can't ignore: if necessary
  1284	 * we unblock the signal and change any SIG_IGN to SIG_DFL.
  1285	 *
  1286	 * Note: If we unblock the signal, we always reset it to SIG_DFL,
  1287	 * since we do not want to have a signal handler that was blocked
  1288	 * be invoked when user space had explicitly blocked it.
  1289	 *
  1290	 * We don't want to have recursive SIGSEGV's etc, for example,
  1291	 * that is why we also clear SIGNAL_UNKILLABLE.
  1292	 */
  1293	static int
  1294	force_sig_info_to_task(struct kernel_siginfo *info, struct task_struct *t,
  1295		enum sig_handler handler)
  1296	{
  1297		unsigned long int flags;
  1298		int ret, blocked, ignored;
  1299		struct k_sigaction *action;
  1300		int sig = info->si_signo;
  1301	
  1302		if (unlikely(is_global_init(t)) && sig == SIGSEGV) {
  1303			struct pt_regs *regs = task_pt_regs(t);
  1304	
  1305			panic("killing init, sig=%d errno=%d code=%d addr=%px vdso=%px pc=0x%lx vdsopc=0x%lx",
  1306			      info->si_signo, info->si_errno, info->si_code, info->si_addr,
> 1307			      t->mm->context.vdso, regs->tpc, regs->tpc - (unsigned long)t->mm->context.vdso);
  1308		}
  1309	
  1310		spin_lock_irqsave(&t->sighand->siglock, flags);
  1311		action = &t->sighand->action[sig-1];
  1312		ignored = action->sa.sa_handler == SIG_IGN;
  1313		blocked = sigismember(&t->blocked, sig);
  1314		if (blocked || ignored || (handler != HANDLER_CURRENT)) {
  1315			action->sa.sa_handler = SIG_DFL;
  1316			if (handler == HANDLER_EXIT)
  1317				action->sa.sa_flags |= SA_IMMUTABLE;
  1318			if (blocked)
  1319				sigdelset(&t->blocked, sig);
  1320		}
  1321		/*
  1322		 * Don't clear SIGNAL_UNKILLABLE for traced tasks, users won't expect
  1323		 * debugging to leave init killable. But HANDLER_EXIT is always fatal.
  1324		 */
  1325		if (action->sa.sa_handler == SIG_DFL &&
  1326		    (!t->ptrace || (handler == HANDLER_EXIT)))
  1327			t->signal->flags &= ~SIGNAL_UNKILLABLE;
  1328		ret = send_signal_locked(sig, info, t, PIDTYPE_PID);
  1329		/* This can happen if the signal was already pending and blocked */
  1330		if (!task_sigpending(t))
  1331			signal_wake_up(t, 0);
  1332		spin_unlock_irqrestore(&t->sighand->siglock, flags);
  1333	
  1334		return ret;
  1335	}
  1336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
