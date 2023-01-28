Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AE6FD7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674930411; x=1706466411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nz8GX3QOo82LFTJHTuntX781bnPSCczSWXsrTZiCOQ4=;
  b=Qn2BEufPWAUt5QPpU3yETXHF3eX7+jequgqyNB12t4ihGss8V90+pF68
   fRrniCLMClCC5zvMqtBIuTkLPPf6BbHTYIFEN16b3YxvUlyOlkc4EWykY
   bgjTsKtOohUQpe0MqY4xZy/jLXiSGKx1aqJMwZV0uOLqIXqOUoA1lRXD4
   4xhZYvylD5RXZllkTj+N4oOGBfdA6O+2hvMyXTZzYa/KxJtqJu1nJlWiT
   KxgNDen0m66n1Q7N4ipK8mJYr5SkmcQ4mIM/ZTf1Z321FS5Rac0DeFY6U
   tA1FZW6aFI0wLbYCwsG4CCdEzWprKso1QqpNuUfz0AOUF6YjJY63EuZwj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="307660936"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="307660936"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613556307"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="613556307"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 10:26:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLpuX-0000zH-2h;
	Sat, 28 Jan 2023 18:26:45 +0000
Date: Sun, 29 Jan 2023 02:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [trace:trace/for-next 19/23] htmldocs:
 Documentation/trace/histogram.rst:1969: WARNING: Unexpected indentation.
Message-ID: <202301290253.LU5yIxcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   9f712417e1fc7d3db042941524e59573e02a55c7
commit: 88238513bb26713ef6d4418bdf1af062fe608bcb [19/23] tracing/histogram: Document variable stacktrace
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=88238513bb26713ef6d4418bdf1af062fe608bcb
        git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
        git fetch --no-tags trace trace/for-next
        git checkout 88238513bb26713ef6d4418bdf1af062fe608bcb
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/trace/histogram.rst:1969: WARNING: Unexpected indentation.
>> Documentation/trace/histogram.rst:1970: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/trace/histogram.rst:2014: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +1969 Documentation/trace/histogram.rst

  1949	
  1950	  # cd /sys/kernel/tracing
  1951	  # echo 's:block_lat pid_t pid; u64 delta; unsigned long[] stack;' > dynamic_events
  1952	  # echo 'hist:keys=next_pid:ts=common_timestamp.usecs,st=stacktrace  if prev_state == 2' >> events/sched/sched_switch/trigger
  1953	  # echo 'hist:keys=prev_pid:delta=common_timestamp.usecs-$ts,s=$st:onmax($delta).trace(block_lat,prev_pid,$delta,$s)' >> events/sched/sched_switch/trigger
  1954	  # echo 1 > events/synthetic/block_lat/enable
  1955	  # cat trace
  1956	
  1957	  # tracer: nop
  1958	  #
  1959	  # entries-in-buffer/entries-written: 2/2   #P:8
  1960	  #
  1961	  #                                _-----=> irqs-off/BH-disabled
  1962	  #                               / _----=> need-resched
  1963	  #                              | / _---=> hardirq/softirq
  1964	  #                              || / _--=> preempt-depth
  1965	  #                              ||| / _-=> migrate-disable
  1966	  #                              |||| /     delay
  1967	  #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
  1968	  #              | |         |   |||||     |         |
> 1969	            <idle>-0       [005] d..4.   521.164922: block_lat: pid=0 delta=8322 stack=STACK:
> 1970	  => __schedule+0x448/0x7b0
  1971	  => schedule+0x5a/0xb0
  1972	  => io_schedule+0x42/0x70
  1973	  => bit_wait_io+0xd/0x60
  1974	  => __wait_on_bit+0x4b/0x140
  1975	  => out_of_line_wait_on_bit+0x91/0xb0
  1976	  => jbd2_journal_commit_transaction+0x1679/0x1a70
  1977	  => kjournald2+0xa9/0x280
  1978	  => kthread+0xe9/0x110
  1979	  => ret_from_fork+0x2c/0x50
  1980	
  1981	             <...>-2       [004] d..4.   525.184257: block_lat: pid=2 delta=76 stack=STACK:
  1982	  => __schedule+0x448/0x7b0
  1983	  => schedule+0x5a/0xb0
  1984	  => schedule_timeout+0x11a/0x150
  1985	  => wait_for_completion_killable+0x144/0x1f0
  1986	  => __kthread_create_on_node+0xe7/0x1e0
  1987	  => kthread_create_on_node+0x51/0x70
  1988	  => create_worker+0xcc/0x1a0
  1989	  => worker_thread+0x2ad/0x380
  1990	  => kthread+0xe9/0x110
  1991	  => ret_from_fork+0x2c/0x50
  1992	
  1993	A synthetic event that has a stacktrace field may use it as a key in histogram:
  1994	
  1995	  # echo 'hist:delta.buckets=100,stack.stacktrace:sort=delta' > events/synthetic/block_lat/trigger
  1996	  # cat events/synthetic/block_lat/hist
  1997	
  1998	  # event histogram
  1999	  #
  2000	  # trigger info: hist:keys=delta.buckets=100,stacktrace:vals=hitcount:sort=delta.buckets=100:size=2048 [active]
  2001	  #
  2002	
  2003	  { delta: ~ 0-99, stacktrace:
  2004	           event_hist_trigger+0x464/0x480
  2005	           event_triggers_call+0x52/0xe0
  2006	           trace_event_buffer_commit+0x193/0x250
  2007	           trace_event_raw_event_sched_switch+0xfc/0x150
  2008	           __traceiter_sched_switch+0x41/0x60
  2009	           __schedule+0x448/0x7b0
  2010	           schedule_idle+0x26/0x40
  2011	           cpu_startup_entry+0x19/0x20
  2012	           start_secondary+0xed/0xf0
  2013	           secondary_startup_64_no_verify+0xe0/0xeb
> 2014	  } hitcount:          6
  2015	  { delta: ~ 0-99, stacktrace:
  2016	           event_hist_trigger+0x464/0x480
  2017	           event_triggers_call+0x52/0xe0
  2018	           trace_event_buffer_commit+0x193/0x250
  2019	           trace_event_raw_event_sched_switch+0xfc/0x150
  2020	           __traceiter_sched_switch+0x41/0x60
  2021	           __schedule+0x448/0x7b0
  2022	           schedule_idle+0x26/0x40
  2023	           cpu_startup_entry+0x19/0x20
  2024	           __pfx_kernel_init+0x0/0x10
  2025	           arch_call_rest_init+0xa/0x24
  2026	           start_kernel+0x964/0x98d
  2027	           secondary_startup_64_no_verify+0xe0/0xeb
  2028	  } hitcount:          3
  2029	  { delta: ~ 0-99, stacktrace:
  2030	           event_hist_trigger+0x464/0x480
  2031	           event_triggers_call+0x52/0xe0
  2032	           trace_event_buffer_commit+0x193/0x250
  2033	           trace_event_raw_event_sched_switch+0xfc/0x150
  2034	           __traceiter_sched_switch+0x41/0x60
  2035	           __schedule+0x448/0x7b0
  2036	           schedule+0x5a/0xb0
  2037	           worker_thread+0xaf/0x380
  2038	           kthread+0xe9/0x110
  2039	           ret_from_fork+0x2c/0x50
  2040	  } hitcount:          1
  2041	  { delta: ~ 100-199, stacktrace:
  2042	           event_hist_trigger+0x464/0x480
  2043	           event_triggers_call+0x52/0xe0
  2044	           trace_event_buffer_commit+0x193/0x250
  2045	           trace_event_raw_event_sched_switch+0xfc/0x150
  2046	           __traceiter_sched_switch+0x41/0x60
  2047	           __schedule+0x448/0x7b0
  2048	           schedule_idle+0x26/0x40
  2049	           cpu_startup_entry+0x19/0x20
  2050	           start_secondary+0xed/0xf0
  2051	           secondary_startup_64_no_verify+0xe0/0xeb
  2052	  } hitcount:         15
  2053	  [..]
  2054	  { delta: ~ 8500-8599, stacktrace:
  2055	           event_hist_trigger+0x464/0x480
  2056	           event_triggers_call+0x52/0xe0
  2057	           trace_event_buffer_commit+0x193/0x250
  2058	           trace_event_raw_event_sched_switch+0xfc/0x150
  2059	           __traceiter_sched_switch+0x41/0x60
  2060	           __schedule+0x448/0x7b0
  2061	           schedule_idle+0x26/0x40
  2062	           cpu_startup_entry+0x19/0x20
  2063	           start_secondary+0xed/0xf0
  2064	           secondary_startup_64_no_verify+0xe0/0xeb
  2065	  } hitcount:          1
  2066	
  2067	  Totals:
  2068	      Hits: 89
  2069	      Entries: 11
  2070	      Dropped: 0
  2071	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
