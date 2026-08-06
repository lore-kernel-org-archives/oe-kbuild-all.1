Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DEE494801
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786045176; cv=none; b=lzDvY5qpzBmu+421SariWXRFgd9VJmmAuzRl3VeBEfaTB5EcYkK72HQmz0nQdx4+klpfFi31pEuS1cyEx74st1QGSa+yHUkoGTStghzVnANyAhBmYef/Z/nkti6us0LE2TnQ/NUnolhtkU4vUJiSY3qibDD2+haQVBoJcUJ1Ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786045176; c=relaxed/simple;
	bh=ANZHdTM7TN93BOTwXE42UMStode/Rb+Fv/a3OigaJ0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNOB1Gd18v7q3KWozedT0XqXgsTqbIaF9seV47yOw1z8rCjvKFTrPFaLnNLBfsZ4bD8AeTda6JOQYq0YP7N9/7aKpjK52anPmOuBjH7v806MsNFoG2TIhTAxcglmz6arNe4G7xmUSi8vgLwotg03ltqVPdJjV8hbgh3HlAcxMI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEE2d/C5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEE2d/C5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786045174; x=1817581174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANZHdTM7TN93BOTwXE42UMStode/Rb+Fv/a3OigaJ0I=;
  b=HEE2d/C53YMOZyzxTstLZ6n+nztT2QxlBREdqTqCxBkYHGmn3xL2zm5R
   WS8sksBAs0MHx3++radBFQ6nsTF6ERmKTMLtLWCeDnIBP28oTXr61N5ua
   jSLeiSF6baVy80cH2gRHBCSaFNmXHmfQ59a+LXjQtwoA2dtwMjMDUiE4y
   IJ/GnzBAmPUOi3BIkvZL5QKsYPAMcJLikDFWnb6f9lN6/svx9NrwPnsrn
   mhwN3aCtpW/vALE/qhm6UHEPFb8h6mdgtFQKTqHlVAB9zjiAvNwochO+9
   A2H9vh9GwSdwGaD38d6gkpNHjyQvXMQ6gv8dTJp7shqcTrloYoVDjP8oz
   w==;
X-CSE-ConnectionGUID: MCfIWZJ0QSmijn/bIbRLVA==
X-CSE-MsgGUID: BwOsoOwbQtGGiH/MlyNMLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86681330"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86681330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 12:39:14 -0700
X-CSE-ConnectionGUID: 0q/JnHUxTOq/4wxZaJ2hfA==
X-CSE-MsgGUID: FaM/PIf4TDSad8HX7GGsiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="266427342"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2026 12:39:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws3vq-00000000G5B-0mwl;
	Thu, 06 Aug 2026 19:39:10 +0000
Date: Fri, 7 Aug 2026 03:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Weiss <martin.githubacc@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Martin Weiss <Martin.weiss2410@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] trace_branch: use per-cpu counters for correct/incorrect
 stats
Message-ID: <202608070304.QNhu3z0S-lkp@intel.com>
References: <20260629095838.601926-1-Martin.weiss2410@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629095838.601926-1-Martin.weiss2410@gmail.com>

Hi Martin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on linus/master v7.2-rc6 next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Weiss/trace_branch-use-per-cpu-counters-for-correct-incorrect-stats/20260806-093445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20260629095838.601926-1-Martin.weiss2410%40gmail.com
patch subject: [PATCH] trace_branch: use per-cpu counters for correct/incorrect stats
config: um-randconfig-r123-20260806 (https://download.01.org/0day-ci/archive/20260807/202608070304.QNhu3z0S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070304.QNhu3z0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070304.QNhu3z0S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_branch.c:218:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:218:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:218:17: sparse:     got unsigned long *
>> kernel/trace/trace_branch.c:218:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:218:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:218:17: sparse:     got unsigned long *
>> kernel/trace/trace_branch.c:218:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:218:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:218:17: sparse:     got unsigned long *
>> kernel/trace/trace_branch.c:218:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:218:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:218:17: sparse:     got unsigned long *
>> kernel/trace/trace_branch.c:218:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:218:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:218:17: sparse:     got unsigned long *
   kernel/trace/trace_branch.c:220:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:220:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:220:17: sparse:     got unsigned long *
   kernel/trace/trace_branch.c:220:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:220:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:220:17: sparse:     got unsigned long *
   kernel/trace/trace_branch.c:220:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:220:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:220:17: sparse:     got unsigned long *
   kernel/trace/trace_branch.c:220:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:220:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:220:17: sparse:     got unsigned long *
   kernel/trace/trace_branch.c:220:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
   kernel/trace/trace_branch.c:220:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_branch.c:220:17: sparse:     got unsigned long *

vim +218 kernel/trace/trace_branch.c

   197	
   198	void ftrace_likely_update(struct ftrace_likely_data *f, int val,
   199				  int expect, int is_constant)
   200	{
   201		unsigned long flags = user_access_save();
   202	
   203		/* A constant is always correct */
   204		if (is_constant) {
   205			f->constant++;
   206			val = expect;
   207		}
   208		/*
   209		 * I would love to have a trace point here instead, but the
   210		 * trace point code is so inundated with unlikely and likely
   211		 * conditions that the recursive nightmare that exists is too
   212		 * much to try to get working. At least for now.
   213		 */
   214		trace_likely_condition(f, val, expect);
   215	
   216		/* use per-cpu counters to avoid contention */
   217		if (val == expect)
 > 218			this_cpu_inc(f->data.correct);
   219		else
   220			this_cpu_inc(f->data.incorrect);
   221	
   222		user_access_restore(flags);
   223	}
   224	EXPORT_SYMBOL(ftrace_likely_update);
   225	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
