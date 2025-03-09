Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC491F09BF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 23:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741563500; cv=none; b=sWmxTTjKnLdJlr2OmT+h1hyNm/x91boCTR3MC1NCWrjRfD40mHJGyx7PwWV1ydMY3ytYewJ6qHne0A/PHEIL/XUqfDtw9nByhyQaBfnVtm5KuUuM+4yPcxEGdGS3u47D/f9vMrdgQLLCqthb1u2GgNvE3r4kNhwszSLhAoxbdc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741563500; c=relaxed/simple;
	bh=wZDSD1ngEYavuvfOQB5UZQB/uUBF0FgmqpQZOikbE/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5MltQHzEjzu5x0ZrNTFo8aY/9eWlZoTMZkuFvR7ObznA2GwgBeJDubz3sV2IHOZdQT0A5BdR6+GKL6buhIQCE2vIz4IOsi9kS8W6aYlnAvCUOg6xkOrXJPQNt53oIkIBQt3DGs1UQESrL84ZS/v3lXqIpOlOW44QrfGO5XNoy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=To4v6vmH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="To4v6vmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741563498; x=1773099498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZDSD1ngEYavuvfOQB5UZQB/uUBF0FgmqpQZOikbE/8=;
  b=To4v6vmHm24HIEqr2gbvJBnXN4Z0LewhdL7A6NgcY8gETHu5dm+vS7Re
   iso6wBGyqGankwqFpJFEGJoCZuTWG+bzpcBgciiRICFqgS2L2lFGJhiz+
   UuOq2Mw1+wEE+Q3i4CERmZJfhEc/TowwclRcF/6ZIqxsFQmZ8Fnlf9LPH
   EL0O4tj14VxZGnccnxN/hZRdLLapRUgKP0ZmwfnAkgy+luyKsPuiY5vYz
   qGrqPjvmqsbhFFXQaqlpg39yUekigI1iLERY72/G7AwaXPm29D38QOP0x
   vIOylz1eiNKO8fCO0yT7w7bazQVg9Vku2klKlP+CP+csaZe8y6ufz8n1f
   w==;
X-CSE-ConnectionGUID: KqKEzLI2TMmj9NtwqO2yZw==
X-CSE-MsgGUID: c3h/hDzZQwi8Q68ubobfHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42456052"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42456052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:38:15 -0700
X-CSE-ConnectionGUID: X0f57u3URaOghVkmLNXrIQ==
X-CSE-MsgGUID: VEFZc8TPRH2m/0Jh7Fbp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119998478"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2025 16:38:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trQDk-0003Yi-23;
	Sun, 09 Mar 2025 23:38:12 +0000
Date: Mon, 10 Mar 2025 07:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/prjc 18/22] kernel/trace/trace.c:4125:20: error: implicit
 declaration of function 'preempt_model_lazy'; did you mean
 'preempt_model_rt'?
Message-ID: <202503100728.zINpgok1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/prjc
head:   1d44b04ab2b76e23b91cff10d950d52e5d4ac8a0
commit: 23e4d601a8170b92b646245a9b42faf438bff147 [18/22] sched/alt: Remove lazy preemption support through PREEMPT_DYNAMIC
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250310/202503100728.zINpgok1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100728.zINpgok1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100728.zINpgok1-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'print_trace_header':
>> kernel/trace/trace.c:4125:20: error: implicit declaration of function 'preempt_model_lazy'; did you mean 'preempt_model_rt'? [-Wimplicit-function-declaration]
    4125 |                    preempt_model_lazy()      ? "lazy"    :
         |                    ^~~~~~~~~~~~~~~~~~
         |                    preempt_model_rt


vim +4125 kernel/trace/trace.c

bc0c38d139ec7f Steven Rostedt           2008-05-12  4098  
62b915f1060996 Jiri Olsa                2010-04-02  4099  void
bc0c38d139ec7f Steven Rostedt           2008-05-12  4100  print_trace_header(struct seq_file *m, struct trace_iterator *iter)
bc0c38d139ec7f Steven Rostedt           2008-05-12  4101  {
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  4102) 	unsigned long sym_flags = (global_trace.trace_flags & TRACE_ITER_SYM_MASK);
1c5eb4481e0151 Steven Rostedt (VMware   2020-01-09  4103) 	struct array_buffer *buf = iter->array_buffer;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  4104) 	struct trace_array_cpu *data = per_cpu_ptr(buf->data, buf->cpu);
2b6080f28c7cc3 Steven Rostedt           2012-05-11  4105  	struct tracer *type = iter->trace;
39eaf7ef884dcc Steven Rostedt           2011-11-17  4106  	unsigned long entries;
39eaf7ef884dcc Steven Rostedt           2011-11-17  4107  	unsigned long total;
2decd16f47e3df liqiong                  2022-05-13  4108  	const char *name = type->name;
bc0c38d139ec7f Steven Rostedt           2008-05-12  4109  
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  4110) 	get_total_entries(buf, &total, &entries);
bc0c38d139ec7f Steven Rostedt           2008-05-12  4111  
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4112  	seq_printf(m, "# %s latency trace v1.1.5 on %s\n",
ed89683763a12e John Garry               2024-02-22  4113  		   name, init_utsname()->release);
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4114  	seq_puts(m, "# -----------------------------------"
bc0c38d139ec7f Steven Rostedt           2008-05-12  4115  		 "---------------------------------\n");
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4116  	seq_printf(m, "# latency: %lu us, #%lu/%lu, CPU#%d |"
bc0c38d139ec7f Steven Rostedt           2008-05-12  4117  		   " (M:%s VP:%d, KP:%d, SP:%d HP:%d",
57f50be14d57b0 Steven Rostedt           2008-05-12  4118  		   nsecs_to_usecs(data->saved_latency),
bc0c38d139ec7f Steven Rostedt           2008-05-12  4119  		   entries,
4c11d7aed38937 Steven Rostedt           2008-05-12  4120  		   total,
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  4121) 		   buf->cpu,
089c02ae2771a1 Valentin Schneider       2021-11-12  4122  		   preempt_model_none()      ? "server" :
089c02ae2771a1 Valentin Schneider       2021-11-12  4123  		   preempt_model_voluntary() ? "desktop" :
089c02ae2771a1 Valentin Schneider       2021-11-12  4124  		   preempt_model_full()      ? "preempt" :
24e0e610400aa2 Shrikanth Hegde          2025-01-03 @4125  		   preempt_model_lazy()	     ? "lazy"    :
089c02ae2771a1 Valentin Schneider       2021-11-12  4126  		   preempt_model_rt()        ? "preempt_rt" :
bc0c38d139ec7f Steven Rostedt           2008-05-12  4127  		   "unknown",
bc0c38d139ec7f Steven Rostedt           2008-05-12  4128  		   /* These are reserved for later use */
bc0c38d139ec7f Steven Rostedt           2008-05-12  4129  		   0, 0, 0, 0);
bc0c38d139ec7f Steven Rostedt           2008-05-12  4130  #ifdef CONFIG_SMP
bc0c38d139ec7f Steven Rostedt           2008-05-12  4131  	seq_printf(m, " #P:%d)\n", num_online_cpus());
bc0c38d139ec7f Steven Rostedt           2008-05-12  4132  #else
bc0c38d139ec7f Steven Rostedt           2008-05-12  4133  	seq_puts(m, ")\n");
bc0c38d139ec7f Steven Rostedt           2008-05-12  4134  #endif
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4135  	seq_puts(m, "#    -----------------\n");
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4136  	seq_printf(m, "#    | task: %.16s-%d "
bc0c38d139ec7f Steven Rostedt           2008-05-12  4137  		   "(uid:%d nice:%ld policy:%ld rt_prio:%ld)\n",
d20b92ab668cc4 Eric W. Biederman        2012-03-13  4138  		   data->comm, data->pid,
d20b92ab668cc4 Eric W. Biederman        2012-03-13  4139  		   from_kuid_munged(seq_user_ns(m), data->uid), data->nice,
bc0c38d139ec7f Steven Rostedt           2008-05-12  4140  		   data->policy, data->rt_priority);
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4141  	seq_puts(m, "#    -----------------\n");
bc0c38d139ec7f Steven Rostedt           2008-05-12  4142  
bc0c38d139ec7f Steven Rostedt           2008-05-12  4143  	if (data->critical_start) {
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4144  		seq_puts(m, "#  => started at: ");
214023c3d13a71 Steven Rostedt           2008-05-12  4145  		seq_print_ip_sym(&iter->seq, data->critical_start, sym_flags);
214023c3d13a71 Steven Rostedt           2008-05-12  4146  		trace_print_seq(m, &iter->seq);
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4147  		seq_puts(m, "\n#  => ended at:   ");
214023c3d13a71 Steven Rostedt           2008-05-12  4148  		seq_print_ip_sym(&iter->seq, data->critical_end, sym_flags);
214023c3d13a71 Steven Rostedt           2008-05-12  4149  		trace_print_seq(m, &iter->seq);
8248ac052dfd1e Steven Rostedt           2009-09-02  4150  		seq_puts(m, "\n#\n");
bc0c38d139ec7f Steven Rostedt           2008-05-12  4151  	}
bc0c38d139ec7f Steven Rostedt           2008-05-12  4152  
888b55dc314d26 KOSAKI Motohiro          2009-03-08  4153  	seq_puts(m, "#\n");
bc0c38d139ec7f Steven Rostedt           2008-05-12  4154  }
bc0c38d139ec7f Steven Rostedt           2008-05-12  4155  

:::::: The code at line 4125 was first introduced by commit
:::::: 24e0e610400aa2c765ee87b1b3c1401732b20fc5 tracing: Print lazy preemption model

:::::: TO: Shrikanth Hegde <sshegde@linux.ibm.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
