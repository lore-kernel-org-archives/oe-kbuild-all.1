Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC543A935
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 02:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741574086; cv=none; b=PFnHEPN/Pn0bdqOlT0hB0Sogw8Gr0EI+Yy5PZaTu4NZfxxbgK3Wnxx1R0ytKzTAtvrYb9rFa5jDa0L5sqXqDc+a0VKYOF8JifO0XJVUOWJ9FJzn15zvWcbjHbltM+Ft5zNaLc1edb6bPhkorCEfVKxqBdVinyO2FDWwUofiohfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741574086; c=relaxed/simple;
	bh=jDeX6OdXLoziICpX/jsx1bycCLKULKNfFuiAQONQwV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1DC9YMcoHmtYh/igbllincotRRfFAlC8TpNRM5/cg//cKHS3sNol+CrJVwOZA7CFCMY2ad6j1W0dlk0fhv26HAZyLq69wbSJ7GQmjXHbkD5RaOJrtP72+kzsp8y0gYZu3e1Vc9++DwlcsR5IxUl49CUTySSnloWtVbFnTM0BXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hytBWGOu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hytBWGOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741574085; x=1773110085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDeX6OdXLoziICpX/jsx1bycCLKULKNfFuiAQONQwV8=;
  b=hytBWGOuc02VcdJa/DdCLtMjtB+KqWTMSQwsER6DTFjO4SIPOm0eLHT9
   oYevb6C4KPHeiTf2+9d4XmLkFC1XPO2RPxOO3RSaDpnfZSoAfm0MeDkHM
   B9QTwJYUAaal7WL2twBrRki0amfZ21M7iml4H8b/UJt9aSyw/Lq7BsZhP
   NTIejNYxKRwCDlAOHSz+qSnCmboT9Vf9OhmHzzZVll+f/+rueHUl5hf9W
   9Yr7Zzdu4qQW7nlK1pBnVjZW7Urw0nGHnrrTv4jQ1/oAsTq8ghUiI59Q0
   C05QwrWqt0ZxEy89zxUEkWcMq1lWmfWeYv/YgM0XgvfvxGnlrC9i/GWb4
   w==;
X-CSE-ConnectionGUID: KDLrIXQTTl+FaaSfV8o94A==
X-CSE-MsgGUID: 7MyiJmgjT/OEDN21UeA7Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46201153"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46201153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:34:44 -0700
X-CSE-ConnectionGUID: Zu9aPCuASpCAj45Mv8ojhg==
X-CSE-MsgGUID: q9/4L5ceQci3lYVqZkI4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="150635322"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Mar 2025 19:34:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trSyW-0003iz-35;
	Mon, 10 Mar 2025 02:34:40 +0000
Date: Mon, 10 Mar 2025 10:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/prjc 18/22] kernel/trace/trace.c:4125:6: error: call to
 undeclared function 'preempt_model_lazy'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503101059.9Jhvyv7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/prjc
head:   af532942f81312b5de3a96a475055b8c28bf1222
commit: 23e4d601a8170b92b646245a9b42faf438bff147 [18/22] sched/alt: Remove lazy preemption support through PREEMPT_DYNAMIC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250310/202503101059.9Jhvyv7w-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101059.9Jhvyv7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101059.9Jhvyv7w-lkp@intel.com/

Note: the zen/6.13/prjc HEAD af532942f81312b5de3a96a475055b8c28bf1222 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:15:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:4125:6: error: call to undeclared function 'preempt_model_lazy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4125 |                    preempt_model_lazy()      ? "lazy"    :
         |                    ^
   3 warnings and 1 error generated.


vim +/preempt_model_lazy +4125 kernel/trace/trace.c

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
