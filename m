Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2280187C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0vYBXeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702144385; x=1733680385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXk6ZDv98MfSOw8eys7/E8Ag8zozIdZauYuu1Jdm5fA=;
  b=P0vYBXeLJ/TiWEp/iJ0iAvDVcNcIFdGHZvPm+2RaPG+RoHRgoy0y+HPV
   WTk5zY7lor+OS6bM0dd9NBmG3hVicjVVN1fMa2+zX0ItF9Ov7KkjVFEdZ
   csWETU/psaVwfhy5aVAcXasPaUQBxmsALTHK5/vi+0Kh3q266l5mXq0/S
   7R2gJgXwL9cKt2TP/GKAIneGiCmi3UxijaUwADQW70PXLAHk8ycLzm1RL
   +GHO55oiR07hD319UBUvCTobh2XENMmEubrJotZbqUsxV0n3qv/EF08B8
   bfMA2kQWi1S9kizuikI5vNLbcJeV1/NKnoCV3r4cy/TaZjBo2BDIDEiLn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1643504"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1643504"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 09:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="895873977"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="895873977"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2023 09:53:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC1Vc-000Fi7-1i;
	Sat, 09 Dec 2023 17:53:00 +0000
Date: Sun, 10 Dec 2023 01:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC V2 4/4] coresight: Have a stab at support for pause /
 resume
Message-ID: <202312100131.QphwFtTa-lkp@intel.com>
References: <20231208172449.35444-5-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208172449.35444-5-adrian.hunter@intel.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.7-rc4 next-20231208]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Hunter/perf-core-Add-aux_pause-aux_resume-aux_start_paused/20231209-013450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20231208172449.35444-5-adrian.hunter%40intel.com
patch subject: [PATCH RFC V2 4/4] coresight: Have a stab at support for pause / resume
config: arm-randconfig-002-20231209 (https://download.01.org/0day-ci/archive/20231210/202312100131.QphwFtTa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100131.QphwFtTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100131.QphwFtTa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-etm-perf.c: In function 'etm_event_start':
>> drivers/hwtracing/coresight/coresight-etm-perf.c:456:13: error: 'mode' undeclared (first use in this function); did you mean 'node'?
     456 |         if (mode & PERF_EF_RESUME) {
         |             ^~~~
         |             node
   drivers/hwtracing/coresight/coresight-etm-perf.c:456:13: note: each undeclared identifier is reported only once for each function it appears in


vim +456 drivers/hwtracing/coresight/coresight-etm-perf.c

   445	
   446	static void etm_event_start(struct perf_event *event, int flags)
   447	{
   448		int cpu = smp_processor_id();
   449		struct etm_event_data *event_data;
   450		struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
   451		struct perf_output_handle *handle = &ctxt->handle;
   452		struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
   453		struct list_head *path;
   454		u64 hw_id;
   455	
 > 456		if (mode & PERF_EF_RESUME) {
   457			if (!READ_ONCE(ctxt->pr_allowed))
   458				return;
   459		} else if (READ_ONCE(event->aux_paused)) {
   460			goto out_pr_allowed;
   461		}
   462	
   463		if (!csdev)
   464			goto fail;
   465	
   466		/* Have we messed up our tracking ? */
   467		if (WARN_ON(ctxt->event_data))
   468			goto fail;
   469	
   470		/*
   471		 * Deal with the ring buffer API and get a handle on the
   472		 * session's information.
   473		 */
   474		event_data = perf_aux_output_begin(handle, event);
   475		if (!event_data)
   476			goto fail;
   477	
   478		/*
   479		 * Check if this ETM is allowed to trace, as decided
   480		 * at etm_setup_aux(). This could be due to an unreachable
   481		 * sink from this ETM. We can't do much in this case if
   482		 * the sink was specified or hinted to the driver. For
   483		 * now, simply don't record anything on this ETM.
   484		 *
   485		 * As such we pretend that everything is fine, and let
   486		 * it continue without actually tracing. The event could
   487		 * continue tracing when it moves to a CPU where it is
   488		 * reachable to a sink.
   489		 */
   490		if (!cpumask_test_cpu(cpu, &event_data->mask))
   491			goto out;
   492	
   493		path = etm_event_cpu_path(event_data, cpu);
   494		/* We need a sink, no need to continue without one */
   495		sink = coresight_get_sink(path);
   496		if (WARN_ON_ONCE(!sink))
   497			goto fail_end_stop;
   498	
   499		/* Nothing will happen without a path */
   500		if (coresight_enable_path(path, CS_MODE_PERF, handle))
   501			goto fail_end_stop;
   502	
   503		/* Finally enable the tracer */
   504		if (coresight_enable_source(csdev, CS_MODE_PERF, event))
   505			goto fail_disable_path;
   506	
   507		/*
   508		 * output cpu / trace ID in perf record, once for the lifetime
   509		 * of the event.
   510		 */
   511		if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
   512			cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
   513			hw_id = FIELD_PREP(CS_AUX_HW_ID_VERSION_MASK,
   514					   CS_AUX_HW_ID_CURR_VERSION);
   515			hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK,
   516					    coresight_trace_id_read_cpu_id(cpu));
   517			perf_report_aux_output_id(event, hw_id);
   518		}
   519	
   520	out:
   521		/* Tell the perf core the event is alive */
   522		event->hw.state = 0;
   523		/* Save the event_data for this ETM */
   524		ctxt->event_data = event_data;
   525	out_pr_allowed:
   526		WRITE_ONCE(ctxt->pr_allowed, 1);
   527		return;
   528	
   529	fail_disable_path:
   530		coresight_disable_path(path);
   531	fail_end_stop:
   532		/*
   533		 * Check if the handle is still associated with the event,
   534		 * to handle cases where if the sink failed to start the
   535		 * trace and TRUNCATED the handle already.
   536		 */
   537		if (READ_ONCE(handle->event)) {
   538			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
   539			perf_aux_output_end(handle, 0);
   540		}
   541	fail:
   542		event->hw.state = PERF_HES_STOPPED;
   543		WRITE_ONCE(ctxt->pr_allowed, 0);
   544		return;
   545	}
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
