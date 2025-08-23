Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE51531C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755947608; cv=none; b=qkAYNT4rEvJ9P5Ji+auI/IWQS/gFBgIkvN4Prv1A4eVrZ+l0VzJv/MnXuDZhFRjjsT5sUUv7V1XAOnQw7tSiprCuX98KoyMpiasHUgL2lbioaaBGGgr29attTUJ0koyjhCJT2tR//KiHtsnQ1gigYWStGdo+AHaa3XreBjrGDrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755947608; c=relaxed/simple;
	bh=X+M2JtDRxmGdPSBaI0a8oi7coB4Y8mOg0n/00zdkW/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+KlHM8drqfiYBojQ9EuRATIOzFUh37Jo8eXGMP4eQHG4ao53v2DLggcJ+Z9l6SoeEjyRX++TOyHbmjmhmXVcdLnNfGP2VqbizlceZI4SLXc9rH05We0DfLulcSXBkgu/4NV9VuVC5cK4LgVx6eKC5eXfQaz9qhAWaBKr2azy9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk+y05a6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk+y05a6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755947607; x=1787483607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+M2JtDRxmGdPSBaI0a8oi7coB4Y8mOg0n/00zdkW/Q=;
  b=Nk+y05a6NVo699ONZLigmVncqmn6M6WcofoAz8yGAN2BjoSs3m/W6n8l
   MXEP9s52mK1r8SiooIfsvM1wXd+XWOBcKzMIsdAMBo03aGF/XfhdklTxE
   wbej23GwwLVpM2cCQaNGt2xtAT9p640z2GuMx7XEjEcprPWzz6NXym6lG
   2ueEDMNoPZXht/oXho8Lj+IU4LjmUsMey7kw9w86cBpWSvTTQ6DuwLjOI
   Oth4Ps+V5VJl5QvxNST7CCYWHpg+yp+oVHZcEqYXFQlBsYXwkLZHs4l+J
   dDKCJa1D0c4DXXleNmIpa0j8DG/GD08fFNfq/vqjvmsRT6MmFIkE8Bz8w
   w==;
X-CSE-ConnectionGUID: oEzQhwQERGWBlaaYRoOPzg==
X-CSE-MsgGUID: YXlNO9AgQgqii3+JJzzHmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="45806731"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45806731"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 04:13:26 -0700
X-CSE-ConnectionGUID: q4cQR3oCR6WXrDBWfGefEA==
X-CSE-MsgGUID: s7r6X+4cQNmCfqfQdZLMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192562721"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 04:13:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upmBW-000MGp-1n;
	Sat, 23 Aug 2025 11:13:22 +0000
Date: Sat, 23 Aug 2025 19:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 75/75]
 drivers/hwtracing/rvtrace/rvtrace-perf.c:106:24: error: 'struct perf_event'
 has no member named 'cpu'
Message-ID: <202508231911.ZQL1sEmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   753d28977ce73716ed8f186d94b13af7a08101ff
commit: 92deea46a4aa824180e18db93d5d47319a08187b [75/75] rvtrace: Add perf driver for tracing using perf tool
config: riscv-randconfig-r054-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231911.ZQL1sEmw-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231911.ZQL1sEmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231911.ZQL1sEmw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_setup_aux':
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:106:24: error: 'struct perf_event' has no member named 'cpu'
     106 |         int cpu = event->cpu, i;
         |                        ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_event_init':
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:170:18: error: 'struct perf_event' has no member named 'attr'
     170 |         if (event->attr.type != rvtrace_pmu.type)
         |                  ^~
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:173:14: error: 'struct perf_event' has no member named 'destroy'
     173 |         event->destroy = rvtrace_event_destroy;
         |              ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_event_start':
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:217:17: error: implicit declaration of function 'perf_report_aux_output_id'; did you mean 'perf_aux_output_end'? [-Werror=implicit-function-declaration]
     217 |                 perf_report_aux_output_id(event, cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 perf_aux_output_end
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:222:14: error: 'struct perf_event' has no member named 'hw'
     222 |         event->hw.state = 0;
         |              ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:226:14: error: 'struct perf_event' has no member named 'hw'
     226 |         event->hw.state = PERF_HES_STOPPED;
         |              ^~
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:226:27: error: 'PERF_HES_STOPPED' undeclared (first use in this function)
     226 |         event->hw.state = PERF_HES_STOPPED;
         |                           ^~~~~~~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:226:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_event_stop':
   drivers/hwtracing/rvtrace/rvtrace-perf.c:238:18: error: 'struct perf_event' has no member named 'hw'
     238 |         if (event->hw.state == PERF_HES_STOPPED)
         |                  ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:238:32: error: 'PERF_HES_STOPPED' undeclared (first use in this function)
     238 |         if (event->hw.state == PERF_HES_STOPPED)
         |                                ^~~~~~~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:252:22: error: 'struct perf_event' has no member named 'hw'
     252 |                 event->hw.state = PERF_HES_STOPPED;
         |                      ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:269:14: error: 'struct perf_event' has no member named 'hw'
     269 |         event->hw.state = PERF_HES_STOPPED;
         |              ^~
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:274:74: error: passing argument 3 of 'rvtrace_path_copyto_auxbuf' from incompatible pointer type [-Werror=incompatible-pointer-types]
     274 |                 ret = rvtrace_path_copyto_auxbuf(path, &event_data->buf, &size);
         |                                                                          ^~~~~
         |                                                                          |
         |                                                                          long unsigned int *
   In file included from drivers/hwtracing/rvtrace/rvtrace-perf.c:20:
   include/linux/rvtrace.h:295:47: note: expected 'size_t *' {aka 'unsigned int *'} but argument is of type 'long unsigned int *'
     295 |                                       size_t *bytes_copied);
         |                                       ~~~~~~~~^~~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_event_add':
   drivers/hwtracing/rvtrace/rvtrace-perf.c:286:43: error: 'struct perf_event' has no member named 'hw'
     286 |         struct hw_perf_event *hwc = &event->hw;
         |                                           ^~
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:291:24: error: 'struct hw_perf_event' has no member named 'state'
     291 |                 if (hwc->state & PERF_HES_STOPPED)
         |                        ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:291:34: error: 'PERF_HES_STOPPED' undeclared (first use in this function)
     291 |                 if (hwc->state & PERF_HES_STOPPED)
         |                                  ^~~~~~~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-perf.c:294:20: error: 'struct hw_perf_event' has no member named 'state'
     294 |                 hwc->state = PERF_HES_STOPPED;
         |                    ^~
   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_perf_init':
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:336:16: error: implicit declaration of function 'perf_pmu_register' [-Werror=implicit-function-declaration]
     336 |         return perf_pmu_register(&rvtrace_pmu, RVTRACE_PMU_NAME, -1);
         |                ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-perf.c: In function 'rvtrace_perf_exit':
>> drivers/hwtracing/rvtrace/rvtrace-perf.c:341:9: error: implicit declaration of function 'perf_pmu_unregister'; did you mean 'device_unregister'? [-Werror=implicit-function-declaration]
     341 |         perf_pmu_unregister(&rvtrace_pmu);
         |         ^~~~~~~~~~~~~~~~~~~
         |         device_unregister
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS
   Depends on [n]: HAVE_HW_BREAKPOINT [=n]
   Selected by [y]:
   - RISCV [=y]


vim +106 drivers/hwtracing/rvtrace/rvtrace-perf.c

   100	
   101	static void *rvtrace_setup_aux(struct perf_event *event, void **pages,
   102				   int nr_pages, bool overwrite)
   103	{
   104		struct rvtrace_event_data *event_data = NULL;
   105		struct page **pagelist;
 > 106		int cpu = event->cpu, i;
   107		cpumask_t *mask;
   108	
   109		event_data = alloc_event_data(cpu);
   110		if (!event_data)
   111			return NULL;
   112	
   113		INIT_WORK(&event_data->work, free_event_data);
   114		mask = &event_data->mask;
   115		/*
   116		 * Create the path for each CPU in the mask. In case of any failure skip the CPU
   117		 */
   118		for_each_cpu(cpu, mask) {
   119			struct rvtrace_component *src;
   120			struct rvtrace_path *path;
   121	
   122			src = rvtrace_cpu_source(cpu);
   123			if (!src)
   124				continue;
   125	
   126			path = rvtrace_create_path(src, NULL, RVTRACE_COMPONENT_MODE_PERF);
   127			if (!path)
   128				continue;
   129	
   130			*rvtrace_event_cpu_path_ptr(event_data, cpu) = path;
   131		}
   132	
   133		/* If we don't have any CPUs ready for tracing, abort */
   134		cpu = cpumask_first(&event_data->mask);
   135		if (cpu >= nr_cpu_ids)
   136			goto err;
   137	
   138		pagelist = kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
   139		if (!pagelist)
   140			goto err;
   141	
   142		for (i = 0; i < nr_pages; i++)
   143			pagelist[i] = virt_to_page(pages[i]);
   144	
   145		event_data->buf.base = vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
   146		if (!event_data->buf.base) {
   147			kfree(pagelist);
   148			goto err;
   149		}
   150	
   151		event_data->buf.nr_pages = nr_pages;
   152		event_data->buf.length = nr_pages * PAGE_SIZE;
   153		event_data->buf.pos = 0;
   154		return event_data;
   155	err:
   156		rvtrace_free_aux(event_data);
   157		return NULL;
   158	}
   159	
   160	static void rvtrace_event_read(struct perf_event *event)
   161	{
   162	}
   163	
   164	static void rvtrace_event_destroy(struct perf_event *event)
   165	{
   166	}
   167	
   168	static int rvtrace_event_init(struct perf_event *event)
   169	{
 > 170		if (event->attr.type != rvtrace_pmu.type)
   171			return -EINVAL;
   172	
 > 173		event->destroy = rvtrace_event_destroy;
   174		return 0;
   175	}
   176	
   177	static void rvtrace_event_start(struct perf_event *event, int flags)
   178	{
   179		struct rvtrace_ctxt *ctxt = this_cpu_ptr(&rvtrace_ctxt);
   180		struct perf_output_handle *handle = &ctxt->handle;
   181		struct rvtrace_event_data *event_data;
   182		int cpu = smp_processor_id();
   183		struct rvtrace_path *path;
   184	
   185		if (WARN_ON(ctxt->event_data))
   186			goto fail;
   187	
   188		/*
   189		 * Deal with the ring buffer API and get a handle on the
   190		 * session's information.
   191		 */
   192		event_data = perf_aux_output_begin(handle, event);
   193		if (!event_data)
   194			goto fail;
   195	
   196		if (!cpumask_test_cpu(cpu, &event_data->mask))
   197			goto out;
   198	
   199		event_data->buf.pos = handle->head % event_data->buf.length;
   200		path = *rvtrace_event_cpu_path_ptr(event_data, cpu);
   201		if (!path) {
   202			pr_err("Error. Path not found\n");
   203			return;
   204		}
   205	
   206		if (rvtrace_path_start(path)) {
   207			pr_err("Error. Tracing not started\n");
   208			return;
   209		}
   210	
   211		/*
   212		 * output cpu / trace ID in perf record, once for the lifetime
   213		 * of the event.
   214		 */
   215		if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
   216			cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
 > 217			perf_report_aux_output_id(event, cpu);
   218		}
   219	
   220	out:
   221		/* Tell the perf core the event is alive */
 > 222		event->hw.state = 0;
   223		ctxt->event_data = event_data;
   224		return;
   225	fail:
 > 226		event->hw.state = PERF_HES_STOPPED;
   227	}
   228	
   229	static void rvtrace_event_stop(struct perf_event *event, int mode)
   230	{
   231		struct rvtrace_ctxt *ctxt = this_cpu_ptr(&rvtrace_ctxt);
   232		struct perf_output_handle *handle = &ctxt->handle;
   233		struct rvtrace_event_data *event_data;
   234		int ret, cpu = smp_processor_id();
   235		struct rvtrace_path *path;
   236		unsigned long size;
   237	
   238		if (event->hw.state == PERF_HES_STOPPED)
   239			return;
   240	
   241		if (handle->event &&
   242		    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
   243			return;
   244	
   245		event_data = ctxt->event_data;
   246		ctxt->event_data = NULL;
   247	
   248		if (WARN_ON(!event_data))
   249			return;
   250	
   251		if (handle->event && (mode & PERF_EF_UPDATE) && !cpumask_test_cpu(cpu, &event_data->mask)) {
   252			event->hw.state = PERF_HES_STOPPED;
   253			perf_aux_output_end(handle, 0);
   254			return;
   255		}
   256	
   257		/* stop tracing */
   258		path = *rvtrace_event_cpu_path_ptr(event_data, cpu);
   259		if (!path) {
   260			pr_err("Error. Path not found\n");
   261			return;
   262		}
   263	
   264		if (rvtrace_path_stop(path)) {
   265			pr_err("Error. Tracing not stopped\n");
   266			return;
   267		}
   268	
   269		event->hw.state = PERF_HES_STOPPED;
   270		if (handle->event && (mode & PERF_EF_UPDATE)) {
   271			if (WARN_ON_ONCE(handle->event != event))
   272				return;
   273			spin_lock(&perf_buf_lock);
 > 274			ret = rvtrace_path_copyto_auxbuf(path, &event_data->buf, &size);
   275			spin_unlock(&perf_buf_lock);
   276			WARN_ON_ONCE(ret);
   277			if (READ_ONCE(handle->event))
   278				perf_aux_output_end(handle, size);
   279			else
   280				WARN_ON(size);
   281		}
   282	}
   283	
   284	static int rvtrace_event_add(struct perf_event *event, int mode)
   285	{
   286		struct hw_perf_event *hwc = &event->hw;
   287		int ret = 0;
   288	
   289		if (mode & PERF_EF_START) {
   290			rvtrace_event_start(event, 0);
 > 291			if (hwc->state & PERF_HES_STOPPED)
   292				ret = -EINVAL;
   293		} else
   294			hwc->state = PERF_HES_STOPPED;
   295	
   296		return ret;
   297	}
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
