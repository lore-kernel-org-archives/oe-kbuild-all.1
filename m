Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87C7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 00:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682124150; x=1713660150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qweftMjDN+JAKdGRmBltUVoOtdIOpU+Wg7vMRNoHCY=;
  b=Suvy0GMmF2rz1ywgvVNEaUMdh2wPnBAzMAR0wkb8lcyhYQL8HBunoZQF
   O9vBseVfrTyv/7quzg+I1vqLzoj3fabrYYb4+0QVRKE6HJJOUVNg2s8ZC
   nlwxiltUBKY17wofd37rTIy+bnt/fajw2FJHwkzXBw6RTMXD06s3rEYNh
   DFELKZqXshessTmNRVsyS0rS0hIYubGpA3EYVDj8oulenHv6L+R7PqKNu
   AJMShclHMIKYHD+VOPVtvONhafm5hjUuonHSsBVSZ0WuIwizCAkjJQB4o
   3jI9t+5yFtDTFZiErJ1CM9fZ0OaKFow+vBcbWZ01RDuimBBVc21s2ce3e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411383463"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="411383463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 17:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="938675091"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="938675091"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2023 17:42:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq1Ke-000gxY-0k;
	Sat, 22 Apr 2023 00:42:28 +0000
Date: Sat, 22 Apr 2023 08:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 14/19] kernel/trace/trace_selftest.c:811: Error: junk
 `(__x86_call_count)' after expression
Message-ID: <202304220852.JehqJLS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: 1b941fed87d107c0bdd8bfa60b150563b2e7ae41 [14/19] x86: percpu: Use RIP-relative symbol references for per-CPU variables
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230422/202304220852.JehqJLS0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=1b941fed87d107c0bdd8bfa60b150563b2e7ae41
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout 1b941fed87d107c0bdd8bfa60b150563b2e7ae41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220852.JehqJLS0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/xen/xen-asm.S: Assembler messages:
>> arch/x86/xen/xen-asm.S:31: Error: junk `(% rip)+1' after expression
   arch/x86/xen/xen-asm.S:72: Error: junk `(% rip)+1' after expression
   arch/x86/xen/xen-asm.S:81: Error: junk `(% rip)+0' after expression
   arch/x86/xen/xen-asm.S:100: Error: junk `(% rip)+1' after expression
   arch/x86/xen/xen-asm.S:116: Error: junk `(% rip)+16' after expression
   arch/x86/xen/xen-asm.S:116: Error: junk `(% rip)+16' after expression
--
   kernel/trace/trace_selftest.c: Assembler messages:
>> kernel/trace/trace_selftest.c:811: Error: junk `(__x86_call_count)' after expression


vim +811 kernel/trace/trace_selftest.c

130c08065848a9 Jiri Olsa                2021-10-08  797  
7447dce96f2233 Frederic Weisbecker      2009-02-07  798  /*
7447dce96f2233 Frederic Weisbecker      2009-02-07  799   * Pretty much the same than for the function tracer from which the selftest
7447dce96f2233 Frederic Weisbecker      2009-02-07  800   * has been borrowed.
7447dce96f2233 Frederic Weisbecker      2009-02-07  801   */
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  802) __init int
7447dce96f2233 Frederic Weisbecker      2009-02-07  803  trace_selftest_startup_function_graph(struct tracer *trace,
7447dce96f2233 Frederic Weisbecker      2009-02-07  804  					struct trace_array *tr)
7447dce96f2233 Frederic Weisbecker      2009-02-07  805  {
7447dce96f2233 Frederic Weisbecker      2009-02-07  806  	int ret;
7447dce96f2233 Frederic Weisbecker      2009-02-07  807  	unsigned long count;
130c08065848a9 Jiri Olsa                2021-10-08  808  	char *func_name __maybe_unused;
7447dce96f2233 Frederic Weisbecker      2009-02-07  809  
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  810) #ifdef CONFIG_DYNAMIC_FTRACE
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27 @811) 	if (ftrace_filter_param) {
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  812) 		printk(KERN_CONT " ... kernel command line filter set: force PASS ... ");
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  813) 		return 0;
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  814) 	}
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  815) #endif
f1ed7c741fcd0c Steven Rostedt (Red Hat  2013-06-27  816) 
cf586b61f80229 Frederic Weisbecker      2009-03-22  817  	/*
cf586b61f80229 Frederic Weisbecker      2009-03-22  818  	 * Simulate the init() callback but we attach a watchdog callback
cf586b61f80229 Frederic Weisbecker      2009-03-22  819  	 * to detect and recover from possible hangs
cf586b61f80229 Frederic Weisbecker      2009-03-22  820  	 */
1c5eb4481e0151 Steven Rostedt (VMware   2020-01-09  821) 	tracing_reset_online_cpus(&tr->array_buffer);
1a0799a8fef5ac Frederic Weisbecker      2009-07-29  822  	set_graph_array(tr);
688f7089d8851b Steven Rostedt (VMware   2018-11-15  823) 	ret = register_ftrace_graph(&fgraph_ops);
7447dce96f2233 Frederic Weisbecker      2009-02-07  824  	if (ret) {
7447dce96f2233 Frederic Weisbecker      2009-02-07  825  		warn_failed_init_tracer(trace, ret);
7447dce96f2233 Frederic Weisbecker      2009-02-07  826  		goto out;
7447dce96f2233 Frederic Weisbecker      2009-02-07  827  	}
cf586b61f80229 Frederic Weisbecker      2009-03-22  828  	tracing_start_cmdline_record();
7447dce96f2233 Frederic Weisbecker      2009-02-07  829  
7447dce96f2233 Frederic Weisbecker      2009-02-07  830  	/* Sleep for a 1/10 of a second */
7447dce96f2233 Frederic Weisbecker      2009-02-07  831  	msleep(100);
7447dce96f2233 Frederic Weisbecker      2009-02-07  832  
cf586b61f80229 Frederic Weisbecker      2009-03-22  833  	/* Have we just recovered from a hang? */
cf586b61f80229 Frederic Weisbecker      2009-03-22  834  	if (graph_hang_thresh > GRAPH_MAX_FUNC_TEST) {
60efe21e5976d3 Masami Hiramatsu         2020-12-08  835  		disable_tracing_selftest("recovering from a hang");
cf586b61f80229 Frederic Weisbecker      2009-03-22  836  		ret = -1;
cf586b61f80229 Frederic Weisbecker      2009-03-22  837  		goto out;
cf586b61f80229 Frederic Weisbecker      2009-03-22  838  	}
cf586b61f80229 Frederic Weisbecker      2009-03-22  839  
7447dce96f2233 Frederic Weisbecker      2009-02-07  840  	tracing_stop();
7447dce96f2233 Frederic Weisbecker      2009-02-07  841  
7447dce96f2233 Frederic Weisbecker      2009-02-07  842  	/* check the trace buffer */
1c5eb4481e0151 Steven Rostedt (VMware   2020-01-09  843) 	ret = trace_test_buffer(&tr->array_buffer, &count);
7447dce96f2233 Frederic Weisbecker      2009-02-07  844  
52fde6e70cccc2 Steven Rostedt (VMware   2019-04-21  845) 	/* Need to also simulate the tr->reset to remove this fgraph_ops */
52fde6e70cccc2 Steven Rostedt (VMware   2019-04-21  846) 	tracing_stop_cmdline_record();
52fde6e70cccc2 Steven Rostedt (VMware   2019-04-21  847) 	unregister_ftrace_graph(&fgraph_ops);
52fde6e70cccc2 Steven Rostedt (VMware   2019-04-21  848) 
7447dce96f2233 Frederic Weisbecker      2009-02-07  849  	tracing_start();
7447dce96f2233 Frederic Weisbecker      2009-02-07  850  
7447dce96f2233 Frederic Weisbecker      2009-02-07  851  	if (!ret && !count) {
7447dce96f2233 Frederic Weisbecker      2009-02-07  852  		printk(KERN_CONT ".. no entries found ..");
7447dce96f2233 Frederic Weisbecker      2009-02-07  853  		ret = -1;
7447dce96f2233 Frederic Weisbecker      2009-02-07  854  		goto out;
7447dce96f2233 Frederic Weisbecker      2009-02-07  855  	}
7447dce96f2233 Frederic Weisbecker      2009-02-07  856  

:::::: The code at line 811 was first introduced by commit
:::::: f1ed7c741fcd0c3d7d318e7c19813d89934b9296 ftrace: Do not run selftest if command line parameter is set

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
