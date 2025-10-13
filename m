Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A224A078
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358442; cv=none; b=uTTaSmxtfF1c83X9GLgLkXytUrTBscsn3KbpGkU4FWCI5Hm18yR8C6wgmgd7oD5+VUEmcqHSmuawR0qGa/HTgxK4Ah4EdZrjP5pimSonhsNf9HJLMOPFAAZ5SVcQlpL/J1/pTC5pk0g8fAOkUrdvpCgs3nj3iSoF4+ltKCf4TPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358442; c=relaxed/simple;
	bh=6pyKCkz6Zh+aDO9kIWmGgGvlE6JYqCH6aft9dTe4THk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XUkGF+WRJ/Wsoixc1PpeVL3Ptu/pCPgN+bSKTVGh4xMSYJJJt2uR9HLB75l39bYbp6fARxyjHtUIoXURnOunJlKmhYbFmDUVpeh1t8n5yyC44dexzf5GSgMrDh9rbq6RePrS/2AyuNmRq8QQGVZO5LLCCMoMQ0VIW0wOJ6vi4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOl20JeJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOl20JeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358440; x=1791894440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6pyKCkz6Zh+aDO9kIWmGgGvlE6JYqCH6aft9dTe4THk=;
  b=MOl20JeJI+pHK+BrRnKJdFEOInJ2l0tPfg4x7jMx1tfCTiJWqMA2wx0w
   rHH+m+rY9cyjOKYejoOrdW8uunxiyFg5GaQ++XCAEJ3YqqQjO6CznHJw3
   jzOI2v3OEY0/ip5uhdBScKd27SRLfNk2eOALtlPyT60JSaEr7rqxFhZR6
   2s5pMivMD0qkf0zIsSzp0vg21L9LnVFU9dpQ798og1lK7pvnPJ7GHpTYe
   ia/D1e0BXM8uWhBrX6VIC3AXobxHW4Kfdxp5A4JlGUfyNrZz8zkWB9mad
   882PMVpb4qchfo0G2UiESZyX5qAg3PC5Ujf6Nd3FxqYmo5qJyGcZ+5VYA
   Q==;
X-CSE-ConnectionGUID: sHwFP3O/RM+bX51ZEcN2Qg==
X-CSE-MsgGUID: hwiaraxlSjK46oLXoXsCiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62384053"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62384053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:20 -0700
X-CSE-ConnectionGUID: q0BQJ9iMQQOXSMYEIOqBng==
X-CSE-MsgGUID: nma0NmHDSPyZPC/2M1ugEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="185849827"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008sL-2D7Q;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:45 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rv-reactor-signal 7/9]
 kernel/trace/rv/reactor_signal.c:79:27: error: 'rv_reaction_sigtrap'
 undeclared here (not in a function); did you mean 'rv_reaction_signal'?
Message-ID: <202510120058.UqTTUN1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rv-reactor-signal
head:   5f1e83d0ead9b8fc09102bea3ac5c9c87daeb8a9
commit: a76f73540c61e3be2a51a2461888479973f5029c [7/9] SIGTRAP
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251012/202510120058.UqTTUN1q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120058.UqTTUN1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120058.UqTTUN1q-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/rv/reactor_signal.c: In function 'rv_reaction_signal':
   kernel/trace/rv/reactor_signal.c:53:17: warning: function 'rv_reaction_signal' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      53 |                 vsnprintf(message, sizeof(message), fmt, args);
         |                 ^~~~~~~~~
   kernel/trace/rv/reactor_signal.c:60:9: warning: function 'rv_reaction_signal' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      60 |         vsnprintf(work->message, sizeof(work->message), fmt, args);
         |         ^~~~~~~~~
   kernel/trace/rv/reactor_signal.c: At top level:
>> kernel/trace/rv/reactor_signal.c:79:27: error: 'rv_reaction_sigtrap' undeclared here (not in a function); did you mean 'rv_reaction_signal'?
      79 |         .react          = rv_reaction_sigtrap,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           rv_reaction_signal
   kernel/trace/rv/reactor_signal.c:71:13: warning: 'rv_reaction_sigbus' defined but not used [-Wunused-function]
      71 | static void rv_reaction_sigbus(const char *fmt, va_list args)
         |             ^~~~~~~~~~~~~~~~~~


vim +79 kernel/trace/rv/reactor_signal.c

    44	
    45	static void rv_reaction_signal(int signal, const char *fmt, va_list args)
    46	{
    47		struct rv_signal_work *work;
    48		char message[256];
    49	
    50		work = mempool_alloc_preallocated(rv_signal_task_work_pool);
    51		if (!work) {
    52			pr_warn_ratelimited("Unable to signal through task_work, sending directly\n");
  > 53			vsnprintf(message, sizeof(message), fmt, args);
    54			rv_signal_force_sig(signal, message);
    55			return;
    56		}
    57	
    58		init_task_work(&work->twork, rv_signal_task_work);
    59		work->signal = signal;
    60		vsnprintf(work->message, sizeof(work->message), fmt, args);
    61	
    62		/*
    63		 * The reactor can be called from any context through tracepoints.
    64		 * To avoid any locking or other operations not usable from all contexts, use TWA_RESUME.
    65		 * The signal might be delayed, but that shouldn't be an issue.
    66		 */
    67		task_work_add(current, &work->twork, TWA_RESUME);
    68	}
    69	
    70	__printf(1, 0)
    71	static void rv_reaction_sigbus(const char *fmt, va_list args)
    72	{
    73		rv_reaction_signal(SIGTRAP, fmt, args);
    74	}
    75	
    76	static struct rv_reactor rv_sigtrap = {
    77		.name		= "sigtrap",
    78		.description	= "Kill the current task with SIGTRAP",
  > 79		.react		= rv_reaction_sigtrap,
    80	};
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
