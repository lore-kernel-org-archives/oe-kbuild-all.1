Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BEE59B55
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307198; cv=none; b=lX32Tv0meTiQz4dwFXavY1Lx6VFI7YixUZa0q4tjC9DPUQPMGBu7Pr1wfCwvcNyj1EBfQLXHgyvb1d1Cvl0s1yjNrBCrhTyJ65KfY3gLm0Cvh20AbM4UXDi1ZgTVB1DCpqeegnxOD3gLuEV0rGy2yAeX8+UXxFm/sQ137+dkpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307198; c=relaxed/simple;
	bh=ULClAM2Xj+zFHur6ZD6kfLtMfazUOebpUUvAkCyxkuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSMw5r/ef7U2+IX16CppAhKgqwj3PUzZ3VnhwXIxaGkTsWj7wMfSbsJysJjDIme58s3nDInjs8R+SvB7pmn0nOyyTdZ0s9W15h+ZFcGzslLQu6X+FV5UWF0cICedsvnx4FvUD1bpgo7Wa6vaTLmvMkFfYjOugGo4E5n2W/ZQD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDQXKdHZ; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDQXKdHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707307196; x=1738843196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULClAM2Xj+zFHur6ZD6kfLtMfazUOebpUUvAkCyxkuM=;
  b=GDQXKdHZBlGQgc9TH2LrxMoC01Y/uxpitaVGKJ6DTSjjC/4+PlK+rcGJ
   4IBXLJOsNCfin3hkWJuJR/LOybVXQ9pJKnSG2Xt6w5aeTdGU8FuoCJ6hz
   uxdeSDNuKK+vnMo9hxMTB3ivdqr7xNIgd+4P6KMtc+fcsGtMM1Hu92HoD
   mefnfjBm0808iqS+SrkmHYiT2rUrJqa6Qah2q4tp8xMtNOdXdimxmHNBJ
   c4xhv3LtAWxrxs0RoGWE+DxJYohTI8p/Mt4pkIRknDjFq8jfRfPnP5O26
   6yeYJ/TTtF9rXbHUnPtRZO9EuSqe7BZGIIY7qoY68jZwmLI0YvVHbd4Q/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436105463"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="436105463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 03:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1308972"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2024 03:59:54 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXgal-0002bE-30;
	Wed, 07 Feb 2024 11:59:51 +0000
Date: Wed, 7 Feb 2024 19:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [mhiramat:topic/fprobe-on-fgraph 13/36]
 arch/loongarch/kernel/ftrace_dyn.c:251:9: error: 'old' undeclared
Message-ID: <202402071912.jHdwZP6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   16faadea75ebaf7a228a30f1424387cac61e478e
commit: 83bf31855f46d3518ed42295c912c11d593bed59 [13/36] function_graph: Have the instances use their own ftrace_ops for filtering
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240207/202402071912.jHdwZP6s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071912.jHdwZP6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071912.jHdwZP6s-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/ftrace_dyn.c: In function 'ftrace_graph_func':
>> arch/loongarch/kernel/ftrace_dyn.c:251:9: error: 'old' undeclared (first use in this function)
     251 |         old = *parent;
         |         ^~~
   arch/loongarch/kernel/ftrace_dyn.c:251:9: note: each undeclared identifier is reported only once for each function it appears in
>> arch/loongarch/kernel/ftrace_dyn.c:254:27: error: 'return_hooker' undeclared (first use in this function); did you mean 'return_ptr'?
     254 |                 *parent = return_hooker;
         |                           ^~~~~~~~~~~~~
         |                           return_ptr


vim +/old +251 arch/loongarch/kernel/ftrace_dyn.c

   239	
   240	#ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
   241	void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
   242			       struct ftrace_ops *op, struct ftrace_regs *fregs)
   243	{
   244		struct fgraph_ops *gops = container_of(op, struct fgraph_ops, ops);
   245		struct pt_regs *regs = &fregs->regs;
   246		unsigned long *parent = (unsigned long *)&regs->regs[1];
   247	
   248		if (unlikely(atomic_read(&current->tracing_graph_pause)))
   249			return;
   250	
 > 251		old = *parent;
   252	
   253		if (!function_graph_enter_ops(old, ip, 0, parent, gops))
 > 254			*parent = return_hooker;
   255	}
   256	#else
   257	static int ftrace_modify_graph_caller(bool enable)
   258	{
   259		u32 branch, nop;
   260		unsigned long pc, func;
   261		extern void ftrace_graph_call(void);
   262	
   263		pc = (unsigned long)&ftrace_graph_call;
   264		func = (unsigned long)&ftrace_graph_caller;
   265	
   266		nop = larch_insn_gen_nop();
   267		branch = larch_insn_gen_b(pc, func);
   268	
   269		if (enable)
   270			return ftrace_modify_code(pc, nop, branch, true);
   271		else
   272			return ftrace_modify_code(pc, branch, nop, true);
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
