Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD38472
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711896755; cv=none; b=MX9ZMr3pfaTH5Zq4Dq8Tw2SsTjo5RK3WQNQFLipj7qBz/hpDXElVrz/+d278zOs199pQ95DqRQouORHmz7kLs2QVDmIfo/nUS2hRkNtIDZUETYOw51lDrBlmUTO+AIPuyXrkyFt9nkUnTLM8GB5zqyJq8HQqsrbECBKaG6/pvc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711896755; c=relaxed/simple;
	bh=K2hX76VKzAvGosm6eJPPPW9C9keFF/WVdbpvM5F1TCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2qQ8lmNisUmJGOMAfP1By3VVDy83b19J8CTYI84i48EoW7TOkllHbo/OXmoxpFvvvu7lHXkNT6oJKmXDQNZneTVYDjq5iQG7YLWciZMYLKjKTJ5971GwFEif7Q6kG/g3DUuPDARTZ+Z1nu2Q73n0fvjP3JSMfBT8Vzc9OKpS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT1AsRbm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT1AsRbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711896752; x=1743432752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K2hX76VKzAvGosm6eJPPPW9C9keFF/WVdbpvM5F1TCw=;
  b=GT1AsRbmFWguaPAZcCXKMYEGhT31yjsk+LnhJBkMRrLRv9VOVQ7ZU0uo
   9bkdllIYKn43vvJPPJzpeolmYenVzSNf84vMWEomwUunTZ+kz87SwsoP9
   wQgJEmdC9XM9x7a6rjlueZebJXWFP2DOuWG0zi3kEyC6dW9mePyjk0FWY
   W0BqnJFkTprja3kOu+RoyEyL1mlyZzYbDRm3h7tr/SX+E/29btbZUAr5M
   fTdOChjUvEsC5FAby6VQ4v90JAX5kyOYzx/fDNCxsVrxM7bCW+SqZva9w
   6Jc9uw8TmmqzkXAPWpE1XU/23hm0lbj4/Yu09bPHkDJrfCkEpPULmbdrR
   w==;
X-CSE-ConnectionGUID: K9QhDVYRT86Rt0sVKD6Biw==
X-CSE-MsgGUID: A15FYdNtQPW42j4269+qNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10855799"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="10855799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 07:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17918112"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Mar 2024 07:52:30 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqwXr-0001CA-1I;
	Sun, 31 Mar 2024 14:52:27 +0000
Date: Sun, 31 Mar 2024 22:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 8630/30000]
 kernel/trace/trace_osnoise.c:933:undefined reference to `latency_fsnotify'
Message-ID: <202403312200.s5tItbNx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   737efe73dd2ca6ee503ba26e6fc3ee41bd8cf633
commit: d11dbe8b4e8ad4c5bd90147912352ef6f13a2bb6 [8630/30000] trace: Add osnoise tracer
config: x86_64-randconfig-073-20240330 (https://download.01.org/0day-ci/archive/20240331/202403312200.s5tItbNx-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403312200.s5tItbNx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403312200.s5tItbNx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: kernel/trace/trace_osnoise.o: in function `run_osnoise':
>> kernel/trace/trace_osnoise.c:933:(.text+0x3eb7): undefined reference to `latency_fsnotify'


vim +933 kernel/trace/trace_osnoise.c

   784	
   785	/*
   786	 * run_osnoise - Sample the time and look for osnoise
   787	 *
   788	 * Used to capture the time, looking for potential osnoise latency repeatedly.
   789	 * Different from hwlat_detector, it is called with preemption and interrupts
   790	 * enabled. This allows irqs, softirqs and threads to run, interfering on the
   791	 * osnoise sampling thread, as they would do with a regular thread.
   792	 */
   793	static int run_osnoise(void)
   794	{
   795		struct osnoise_variables *osn_var = this_cpu_osn_var();
   796		u64 noise = 0, sum_noise = 0, max_noise = 0;
   797		struct trace_array *tr = osnoise_trace;
   798		u64 start, sample, last_sample;
   799		u64 last_int_count, int_count;
   800		s64 total, last_total = 0;
   801		struct osnoise_sample s;
   802		unsigned int threshold;
   803		int hw_count = 0;
   804		u64 runtime, stop_in;
   805		int ret = -1;
   806	
   807		/*
   808		 * Considers the current thread as the workload.
   809		 */
   810		osn_var->pid = current->pid;
   811	
   812		/*
   813		 * Save the current stats for the diff
   814		 */
   815		save_osn_sample_stats(osn_var, &s);
   816	
   817		/*
   818		 * if threshold is 0, use the default value of 5 us.
   819		 */
   820		threshold = tracing_thresh ? : 5000;
   821	
   822		/*
   823		 * Make sure NMIs see sampling first
   824		 */
   825		osn_var->sampling = true;
   826		barrier();
   827	
   828		/*
   829		 * Transform the *_us config to nanoseconds to avoid the
   830		 * division on the main loop.
   831		 */
   832		runtime = osnoise_data.sample_runtime * NSEC_PER_USEC;
   833		stop_in = osnoise_data.stop_tracing * NSEC_PER_USEC;
   834	
   835		/*
   836		 * Start timestemp
   837		 */
   838		start = time_get();
   839	
   840		/*
   841		 * "previous" loop.
   842		 */
   843		last_int_count = set_int_safe_time(osn_var, &last_sample);
   844	
   845		do {
   846			/*
   847			 * Get sample!
   848			 */
   849			int_count = set_int_safe_time(osn_var, &sample);
   850	
   851			noise = time_sub(sample, last_sample);
   852	
   853			/*
   854			 * This shouldn't happen.
   855			 */
   856			if (noise < 0) {
   857				osnoise_taint("negative noise!");
   858				goto out;
   859			}
   860	
   861			/*
   862			 * Sample runtime.
   863			 */
   864			total = time_sub(sample, start);
   865	
   866			/*
   867			 * Check for possible overflows.
   868			 */
   869			if (total < last_total) {
   870				osnoise_taint("total overflow!");
   871				break;
   872			}
   873	
   874			last_total = total;
   875	
   876			if (noise >= threshold) {
   877				int interference = int_count - last_int_count;
   878	
   879				if (noise > max_noise)
   880					max_noise = noise;
   881	
   882				if (!interference)
   883					hw_count++;
   884	
   885				sum_noise += noise;
   886	
   887				trace_sample_threshold(last_sample, noise, interference);
   888	
   889				if (osnoise_data.stop_tracing)
   890					if (noise > stop_in)
   891						osnoise_stop_tracing();
   892			}
   893	
   894			/*
   895			 * For the non-preemptive kernel config: let threads runs, if
   896			 * they so wish.
   897			 */
   898			cond_resched();
   899	
   900			last_sample = sample;
   901			last_int_count = int_count;
   902	
   903		} while (total < runtime && !kthread_should_stop());
   904	
   905		/*
   906		 * Finish the above in the view for interrupts.
   907		 */
   908		barrier();
   909	
   910		osn_var->sampling = false;
   911	
   912		/*
   913		 * Make sure sampling data is no longer updated.
   914		 */
   915		barrier();
   916	
   917		/*
   918		 * Save noise info.
   919		 */
   920		s.noise = time_to_us(sum_noise);
   921		s.runtime = time_to_us(total);
   922		s.max_sample = time_to_us(max_noise);
   923		s.hw_count = hw_count;
   924	
   925		/* Save interference stats info */
   926		diff_osn_sample_stats(osn_var, &s);
   927	
   928		trace_osnoise_sample(&s);
   929	
   930		/* Keep a running maximum ever recorded osnoise "latency" */
   931		if (max_noise > tr->max_latency) {
   932			tr->max_latency = max_noise;
 > 933			latency_fsnotify(tr);
   934		}
   935	
   936		if (osnoise_data.stop_tracing_total)
   937			if (s.noise > osnoise_data.stop_tracing_total)
   938				osnoise_stop_tracing();
   939	
   940		return 0;
   941	out:
   942		return ret;
   943	}
   944	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
