Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A70D239E61
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760123598; cv=none; b=hrYzPk8Pa45DkFcA5KjNdVUXb8ZCpCORhjLM870O4JtB/K1Bdt3rC3DQEpqgeJI3drvrSmvCNCVUM4rBHnKFWjyu9PJXOechSnEqPQrmnB3Wmz+W8z1vOh3gN16aidD1uBB5KL2xP3NCWkv+8yxxfMdVEolfkqUe31OxgWAjcL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760123598; c=relaxed/simple;
	bh=zwUr6RMEAftJmiF4SSZ6aganAESW0EnFlJ+N37ufrBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHGrmNjPuWGkERjtZVQcxbHcfVkDLgO1vzhwXZPRdUJiwUszTq+d2P3ZDRhpUBtSsZQcRRfuLBjEuG8SAHweG5yDGcloH0AdGzReIiU6e9vifzdgjDT0Yn6hCbbs7CDiGrMtmD9Fa2ctkcT/ga30zeWmIbuiwYUWtRjr9h5XOZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0EF1fLN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0EF1fLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760123596; x=1791659596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwUr6RMEAftJmiF4SSZ6aganAESW0EnFlJ+N37ufrBY=;
  b=N0EF1fLNdc2/npDy42onFh39LpBpgZmcbvRhoMnDKqXcBPYWmpilNhZ7
   T0MsZ3POjVYO6GG5Hoa+YxcpoeozHSz7qyXHEGYnbY72um4dGuUsWs4ZH
   JYXtqHkY6QplZfr+jJvoA0z2xw7meukLJ9oGM1/RGQ8+WNVjk7nxzC5Zm
   PNhhwsz4d4zaUZiRkkILXOGwF76pRRxjllBKcYrUuq2lV82BfY3FIsLJO
   RwaHvjy7IOIMBexw/H0YxaqSxbuwkDucFWwWMS8eq6F1cD0PqwsgTPLJS
   bPJLcyEYx15vS6Qn54EPFgBuYPe6QlaqVG1+DHKmXtWaqq+TyTMM0nuha
   w==;
X-CSE-ConnectionGUID: Fb9rhMYHSjycneyhIDzhRQ==
X-CSE-MsgGUID: KuXCc7tZQgSAyTbrFXIwDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64969616"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="64969616"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 12:13:15 -0700
X-CSE-ConnectionGUID: NI6quCI8Qo279nfTmwznVQ==
X-CSE-MsgGUID: jHBha3X8Sgi7GTuVNcCfbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180874676"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2025 12:13:15 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7IYC-00035F-01;
	Fri, 10 Oct 2025 19:13:12 +0000
Date: Sat, 11 Oct 2025 03:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rv-reactor-signal 7/9]
 kernel/trace/rv/reactor_signal.c:79:27: error: 'rv_reaction_sigtrap'
 undeclared here (not in a function); did you mean 'rv_reaction_signal'?
Message-ID: <202510110345.b4PoV6Gr-lkp@intel.com>
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
config: arm64-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110345.b4PoV6Gr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110345.b4PoV6Gr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110345.b4PoV6Gr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> kernel/trace/rv/reactor_signal.c:71:13: warning: 'rv_reaction_sigbus' defined but not used [-Wunused-function]
      71 | static void rv_reaction_sigbus(const char *fmt, va_list args)
         |             ^~~~~~~~~~~~~~~~~~


vim +79 kernel/trace/rv/reactor_signal.c

    69	
    70	__printf(1, 0)
  > 71	static void rv_reaction_sigbus(const char *fmt, va_list args)
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
