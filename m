Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8866B5E06C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709151754; cv=none; b=JIJskIq9EF5L19eQ38oaeLd/62ka/YxiiiUIZS+uYoMSdGxBhkcmM1Y8jkI1ydGbHrI/YVM96D15n+V9t8kdXMlX/nt6aJWoc2PKcDtO/5Odhhl8XmyxT8eaR6prYFQ46cJOxLlHt2fNZt1E2USDZ6hNSyGEGgR+X+b74N1O3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709151754; c=relaxed/simple;
	bh=VrysG7PDAU7PwsauwVx7l58LADoG5of3eNOBWrdbm9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4w+lY4Os3PTLE6wxsVp6HQjfsvEKjYqKpRGlpbWEzaqYCxDRkNekCKzWxwF7MM21ZGSLL7HMoZDHHxMRHM60dCl7n+giTGg2lmkH/uTzYcmfrrkb39gDXdvo3DLQsMy+Sq78YAsV9wIKZscRWcT49i1bkP0JbLhVT4W1pWam9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY7iPiDC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY7iPiDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709151752; x=1740687752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrysG7PDAU7PwsauwVx7l58LADoG5of3eNOBWrdbm9g=;
  b=kY7iPiDCCXq2GXzTZaee+MmmFmgU5awrWDA6UDlmExwRFJ7CJxf2P38V
   lkQFsS9V/kUbI9TbObVeaZIfwu+BN39HhH+fll4r8f3HcGtSFH5yp4rau
   qtw6wO2daBf03u0qipLpT+4Jnm58BAESNvzTmi/BFTt+nD/M5zofu0pMD
   AwX7WkujS57kqwFJiU28ac+sfBT5tTh+kmEIgMTG0WVZ4MHdcKobjWIqf
   R1XycS3p1AgSjsaP01LpIZb7cXFeSc2KBXgDmW1p18N8XbQMcxIL7STH9
   6HEyHA8FDsehG8lGsQktEmSN/o7g+FtWBvL5/7EzCFmqq3GnfYn62Qihz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3444848"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3444848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 12:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="30730946"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Feb 2024 12:22:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfQRg-000CMr-1W;
	Wed, 28 Feb 2024 20:22:28 +0000
Date: Thu, 29 Feb 2024 04:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 9781/30000] kernel/trace/trace_osnoise.c:933:
 undefined reference to `latency_fsnotify'
Message-ID: <202402290415.QIyguW8r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e0a00cd6ae6571f9fc6f9f42313f70879df89904
commit: d11dbe8b4e8ad4c5bd90147912352ef6f13a2bb6 [9781/30000] trace: Add osnoise tracer
config: x86_64-randconfig-102-20240227 (https://download.01.org/0day-ci/archive/20240229/202402290415.QIyguW8r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290415.QIyguW8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290415.QIyguW8r-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: kernel/trace/trace_osnoise.o: in function `run_osnoise':
>> kernel/trace/trace_osnoise.c:933: undefined reference to `latency_fsnotify'


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
