Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105FC192B84
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735874820; cv=none; b=teME7d6jQLn4vhl9uDwxEgE4cdh/NYigAqVx94+1psCdorVCeMfVTuB54H/KtpEO6MtYHEBGSXY2R935INViqZtILbfcXt4p2tH0dpLEkeHfcL8zUutyFq52fBAuHfzAxEW0Ue8xqbWK1bore3Xwe7AJ3YrkSvD/kESaJlEp5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735874820; c=relaxed/simple;
	bh=GxW347A06KGACrrKAtG3pH4StgwFtQ9QEeHon+G1MDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7LTC/7hoP3HmYFI5iwBHdW71KKz356GoW1ZjfcCFXdz80UEeseFIdeCmpHy9OoT9rtaDb8vsNKh/sWJYuXBIrDPRhmeoMc2pjALYSbGr27L1gBnOtehPygzcTf59yB/QtfxIwy/9KoTRPCty/vsD5cwBlMSx/Ps69le2E8qirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=To3cHYdJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="To3cHYdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735874818; x=1767410818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GxW347A06KGACrrKAtG3pH4StgwFtQ9QEeHon+G1MDE=;
  b=To3cHYdJSiEiS7C2H8AGXnyalCV5ZgfspDffVaDhylZE4yn832xDRMoM
   bHEB8G1lvnRmhWDzpRD9R9+gBXMNz1ie61GndzO72J8QZ24e+Y9UIybwy
   vyha9ndCZ+1Pql586ze8cwQ2wtQHPZBrYyvuOLqdN+rSQ0KoAnvwqxuQC
   ysu4l4+uu6eT5WCLKWtOadcilN4TuRyMZnXkMGORT7sxah3WANQ/zhHrE
   YHrXOX8OSPNomnF3EmrKUgnPbGyZMQvgfmcMnV3jJKoYe6UyOd+oNE5s3
   s5amXdKL5/eA9ge7U0gYvRcbzJMrdIaAL1mCEEIAc7YzoFcmL+xyMyj0N
   w==;
X-CSE-ConnectionGUID: bw4j9ODiTRia0/OvnyBrbg==
X-CSE-MsgGUID: vNRYVJp5SVeIvl2oEbc4QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="23716721"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23716721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 19:26:58 -0800
X-CSE-ConnectionGUID: cBgGPF6bSsm5tTJ4XjeGuA==
X-CSE-MsgGUID: 2g/UP4MUQEGrtyt7++hT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106729632"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jan 2025 19:26:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTYKs-00098v-1H;
	Fri, 03 Jan 2025 03:26:54 +0000
Date: Fri, 3 Jan 2025 11:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/mv_ctltables 3/4] kernel/trace/trace.c:142:5:
 sparse: sparse: symbol '__disable_trace_on_warning' was not declared. Should
 it be static?
Message-ID: <202501031113.biLQaeOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/mv_ctltables
head:   d065a4aec275d0bab083678e1330285bc50b1590
commit: 3e97d1a775c38faac60cd694b1274d94b525a942 [3/4] ftrace: Move trace sysctls into trace.c
config: um-randconfig-r122-20241231 (https://download.01.org/0day-ci/archive/20250103/202501031113.biLQaeOt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031113.biLQaeOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031113.biLQaeOt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace.c:142:5: sparse: sparse: symbol '__disable_trace_on_warning' was not declared. Should it be static?
   kernel/trace/trace.c:490:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:490:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:490:28: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:504:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:504:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:504:33: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:2822:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2822:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.c:2822:38: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace.c:444:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:444:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:444:9: sparse:    struct trace_export *
   kernel/trace/trace.c:459:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:459:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:459:9: sparse:    struct trace_export *

vim +/__disable_trace_on_warning +142 kernel/trace/trace.c

60efe21e5976d3 Masami Hiramatsu         2020-12-08   84  
0daa2302968c13 Steven Rostedt (Red Hat  2014-12-12   85) /* Pipe tracepoints to printk */
a76d4648a0bbd6 Xiu Jianfeng             2022-11-22   86  static struct trace_iterator *tracepoint_print_iter;
0daa2302968c13 Steven Rostedt (Red Hat  2014-12-12  @87) int tracepoint_printk;
f38601368f4a0c Steven Rostedt (VMware   2021-06-17   88) static bool tracepoint_printk_stop_on_boot __initdata;
4239174570da08 Steven Rostedt (Red Hat  2016-11-23   89) static DEFINE_STATIC_KEY_FALSE(tracepoint_printk_key);
0daa2302968c13 Steven Rostedt (Red Hat  2014-12-12   90) 
adf9f19574334c Frederic Weisbecker      2008-11-17   91  /* For tracers that don't implement custom flags */
adf9f19574334c Frederic Weisbecker      2008-11-17   92  static struct tracer_opt dummy_tracer_opt[] = {
adf9f19574334c Frederic Weisbecker      2008-11-17   93  	{ }
adf9f19574334c Frederic Weisbecker      2008-11-17   94  };
adf9f19574334c Frederic Weisbecker      2008-11-17   95  
8c1a49aedb73fb Steven Rostedt (Red Hat  2014-01-10   96) static int
8c1a49aedb73fb Steven Rostedt (Red Hat  2014-01-10   97) dummy_set_flag(struct trace_array *tr, u32 old_flags, u32 bit, int set)
adf9f19574334c Frederic Weisbecker      2008-11-17   98  {
adf9f19574334c Frederic Weisbecker      2008-11-17   99  	return 0;
adf9f19574334c Frederic Weisbecker      2008-11-17  100  }
0f04870148ecb8 Steven Rostedt           2008-11-05  101  
7ffbd48d5cab22 Steven Rostedt           2012-10-11  102  /*
7ffbd48d5cab22 Steven Rostedt           2012-10-11  103   * To prevent the comm cache from being overwritten when no
7ffbd48d5cab22 Steven Rostedt           2012-10-11  104   * tracing is active, only save the comm when a trace event
7ffbd48d5cab22 Steven Rostedt           2012-10-11  105   * occurred.
7ffbd48d5cab22 Steven Rostedt           2012-10-11  106   */
2cc621fd2e9b84 Steven Rostedt (Google   2024-02-20  107) DEFINE_PER_CPU(bool, trace_taskinfo_save);
7ffbd48d5cab22 Steven Rostedt           2012-10-11  108  
0f04870148ecb8 Steven Rostedt           2008-11-05  109  /*
0f04870148ecb8 Steven Rostedt           2008-11-05  110   * Kill all tracing for good (never come back).
0f04870148ecb8 Steven Rostedt           2008-11-05  111   * It is initialized to 1 but will turn to zero if the initialization
0f04870148ecb8 Steven Rostedt           2008-11-05  112   * of the tracer is successful. But that is the only place that sets
0f04870148ecb8 Steven Rostedt           2008-11-05  113   * this back to zero.
0f04870148ecb8 Steven Rostedt           2008-11-05  114   */
4fd2735881bf4d Hannes Eder              2009-02-10  115  static int tracing_disabled = 1;
0f04870148ecb8 Steven Rostedt           2008-11-05  116  
955b61e5979847 Jason Wessel             2010-08-05  117  cpumask_var_t __read_mostly	tracing_buffer_mask;
ab46428c6969d5 Steven Rostedt           2008-05-12  118  
3e97d1a775c38f Joel Granados            2024-12-29  119  #define MAX_TRACER_SIZE		100
944ac4259e3980 Steven Rostedt           2008-10-23  120  /*
944ac4259e3980 Steven Rostedt           2008-10-23  121   * ftrace_dump_on_oops - variable to dump ftrace buffer on oops
944ac4259e3980 Steven Rostedt           2008-10-23  122   *
944ac4259e3980 Steven Rostedt           2008-10-23  123   * If there is an oops (or kernel panic) and the ftrace_dump_on_oops
944ac4259e3980 Steven Rostedt           2008-10-23  124   * is set, then ftrace_dump is called. This will output the contents
944ac4259e3980 Steven Rostedt           2008-10-23  125   * of the ftrace buffers to the console.  This is very useful for
944ac4259e3980 Steven Rostedt           2008-10-23  126   * capturing traces that lead to crashes and outputing it to a
944ac4259e3980 Steven Rostedt           2008-10-23  127   * serial console.
944ac4259e3980 Steven Rostedt           2008-10-23  128   *
944ac4259e3980 Steven Rostedt           2008-10-23  129   * It is default off, but you can enable it with either specifying
944ac4259e3980 Steven Rostedt           2008-10-23  130   * "ftrace_dump_on_oops" in the kernel command line, or setting
cecbca96da3874 Frederic Weisbecker      2010-04-18  131   * /proc/sys/kernel/ftrace_dump_on_oops
cecbca96da3874 Frederic Weisbecker      2010-04-18  132   * Set 1 if you want to dump buffers of all CPUs
cecbca96da3874 Frederic Weisbecker      2010-04-18  133   * Set 2 if you want to dump the buffer of the CPU that triggered oops
19f0423fd55c30 Huang Yiwei              2024-02-23  134   * Set instance name if you want to dump the specific trace instance
19f0423fd55c30 Huang Yiwei              2024-02-23  135   * Multiple instance dump is also supported, and instances are seperated
19f0423fd55c30 Huang Yiwei              2024-02-23  136   * by commas.
944ac4259e3980 Steven Rostedt           2008-10-23  137   */
19f0423fd55c30 Huang Yiwei              2024-02-23  138  /* Set to string format zero to disable by default */
19f0423fd55c30 Huang Yiwei              2024-02-23  139  char ftrace_dump_on_oops[MAX_TRACER_SIZE] = "0";
944ac4259e3980 Steven Rostedt           2008-10-23  140  
de7edd31457b62 Steven Rostedt (Red Hat  2013-06-14  141) /* When set, tracing will stop when a WARN*() is hit */
de7edd31457b62 Steven Rostedt (Red Hat  2013-06-14 @142) int __disable_trace_on_warning;
de7edd31457b62 Steven Rostedt (Red Hat  2013-06-14  143) 

:::::: The code at line 142 was first introduced by commit
:::::: de7edd31457b626e54a0b2a7e8ff4d65492f01ad tracing: Disable tracing on warning

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
