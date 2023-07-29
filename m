Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D038A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690612360; x=1722148360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKyg/cV/OIJAErqjqS3ESTvPXb2zSUEq3WKihZ8dr5A=;
  b=A3fx5aBLATmIX1zVWcOdJPfjkHApBZ2UbCC+w5OccRnfrXvuwWJqegxN
   89z72jUWYJjfzjGspxQRmSf+ypVROLvi2WyyrEQHdTNrJOKRXYTT7nchK
   s2nY5Zm865lU1kIwlGlzUyPaqBu7rzBefuZaYP7dhL7hyslxUExTbp4N3
   9L8Ek8PsMeJEnMFpFrAvDpW+cY/Y4WKbW6KMufDoWPCzATihv2Lnsm0so
   gX1WvubJgYNO2txZbVNQfhmI/VfriqUV7HmSl5q98qX3N/Don8JCG8SiW
   mwaQDAtCdkiPtpJ8gLQzHAosH45bfmT9LWBgrudJnziuK6xuH/aCcRMQf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="455095076"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="455095076"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 23:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="797654631"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="797654631"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2023 23:32:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPdU4-0003sl-0A;
	Sat, 29 Jul 2023 06:32:08 +0000
Date: Sat, 29 Jul 2023 14:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 142/146]
 drivers/perf/resctrl_pmu.c:77:52: warning: passing argument 3 of
 'resctrl_arch_mon_ctx_free' makes pointer from integer without a cast
Message-ID: <202307291440.eye7GIIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   8a35b09275f16d009ed31e93b8b4b3004b04bceb
commit: 6f03509946c70fd34341fe086038e2135d65d0a1 [142/146] drivers/perf: Add PMU to support reading resctrl counters via perf
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230729/202307291440.eye7GIIa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291440.eye7GIIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291440.eye7GIIa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/resctrl_pmu.c: In function 'resctrl_pmu_event_destroy':
>> drivers/perf/resctrl_pmu.c:77:52: warning: passing argument 3 of 'resctrl_arch_mon_ctx_free' makes pointer from integer without a cast [-Wint-conversion]
      77 |         resctrl_arch_mon_ctx_free(r, event_num, hwc->idx);
         |                                                 ~~~^~~~~
         |                                                    |
         |                                                    int
   In file included from include/linux/resctrl.h:12,
                    from drivers/perf/resctrl_pmu.c:8:
   arch/x86/include/asm/resctrl.h:213:52: note: expected 'void *' but argument is of type 'int'
     213 |                                              void *ctx) { };
         |                                              ~~~~~~^~~
   drivers/perf/resctrl_pmu.c: In function 'resctrl_pmu_event_init':
>> drivers/perf/resctrl_pmu.c:147:18: warning: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     147 |         hwc->idx = resctrl_arch_mon_ctx_alloc_no_wait(r, event_num);
         |                  ^
   drivers/perf/resctrl_pmu.c: In function 'resctrl_pmu_event_update':
>> drivers/perf/resctrl_pmu.c:186:66: warning: passing argument 7 of 'resctrl_arch_rmid_read' makes pointer from integer without a cast [-Wint-conversion]
     186 |                                              event_num, &now, hwc->idx);
         |                                                               ~~~^~~~~
         |                                                                  |
         |                                                                  int
   include/linux/resctrl.h:430:44: note: expected 'void *' but argument is of type 'int'
     430 |                            u64 *val, void *arch_mon_ctx);
         |                                      ~~~~~~^~~~~~~~~~~~


vim +/resctrl_arch_mon_ctx_free +77 drivers/perf/resctrl_pmu.c

    66	
    67	static void resctrl_pmu_event_destroy(struct perf_event *event)
    68	{
    69		struct hw_perf_event *hwc = &event->hw;
    70		u16 event_num = get_event(event);
    71		struct rdt_resource *r;
    72	
    73		r = resctrl_event_get_resource(event_num);
    74		if (!r)
    75			return;
    76	
  > 77		resctrl_arch_mon_ctx_free(r, event_num, hwc->idx);
    78	}
    79	
    80	static int resctrl_pmu_event_init(struct perf_event *event)
    81	{
    82		struct hw_perf_event *hwc = &event->hw;
    83		struct resctrl_pmu *resctrl_pmu = to_resctrl_pmu(event->pmu);
    84		struct device *dev = resctrl_pmu->dev;
    85		struct perf_event *sibling;
    86		struct rdt_resource *r;
    87		struct rdt_domain *d;
    88		u16 event_num, domain_id;
    89		u32 closid, rmid;
    90		int err;
    91		u64 id;
    92	
    93		if (event->attr.type != event->pmu->type)
    94			return -ENOENT;
    95	
    96		if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
    97			return -EOPNOTSUPP;
    98	
    99		if (event->cpu < 0) {
   100			dev_dbg(dev, "Per-task mode not supported\n");
   101			return -EOPNOTSUPP;
   102		}
   103	
   104		/* Verify specified event is supported on this PMU */
   105		event_num = get_event(event);
   106		if (!resctrl_event_supported(event_num)) {
   107			dev_dbg(dev, "Invalid event %d for this PMU\n", event_num);
   108			return -EINVAL;
   109		}
   110	
   111		/* Verify the resctrl group currently exists */
   112		id = get_resctrl_id(event);
   113		err = resctrl_id_decode(id, &closid, &rmid);
   114		if (err)
   115			return err;
   116	
   117		/* Sanity check we have a resource and domain for this event */
   118		r = resctrl_event_get_resource(event_num);
   119		if (!r)
   120			return -EINVAL;
   121	
   122		domain_id = get_domain(event);
   123		cpus_read_lock();
   124		d = resctrl_arch_find_domain(r, domain_id);
   125		if (!d || WARN_ON_ONCE(cpumask_empty(&d->cpu_mask))) {
   126			cpus_read_unlock();
   127			return -EINVAL;
   128		}
   129	
   130		/* This must run on one of the domain's CPUs */
   131		event->cpu = cpumask_any(&d->cpu_mask);
   132		cpus_read_unlock();
   133	
   134		if (!is_software_event(event->group_leader)) {
   135			if (event->group_leader->pmu != event->pmu)
   136				return -EINVAL;
   137		}
   138	
   139		/* Don't allow groups with other PMUs, except for s/w events */
   140		for_each_sibling_event(sibling, event->group_leader) {
   141			if (is_software_event(sibling))
   142				continue;
   143			if (sibling->pmu != event->pmu)
   144				return -EINVAL;
   145		}
   146	
 > 147		hwc->idx = resctrl_arch_mon_ctx_alloc_no_wait(r, event_num);
   148		if (hwc->idx == -ENOSPC)
   149			return -ENOSPC;
   150		event->destroy = resctrl_pmu_event_destroy;
   151		local64_set(&hwc->prev_count, 0);
   152		local64_set(&event->count, 0);
   153	
   154		return err;
   155	}
   156	
   157	static void resctrl_pmu_event_update(struct perf_event *event)
   158	{
   159		struct hw_perf_event *hwc = &event->hw;
   160		u64 delta, now, prev, id;
   161		u16 event_num, domain_id;
   162		struct rdt_resource *r;
   163		struct rdt_domain *d;
   164		u32 closid, rmid;
   165		int err;
   166	
   167		event_num = get_event(event);
   168		id = get_resctrl_id(event);
   169		__resctrl_id_decode(id, &closid, &rmid);
   170	
   171		r = resctrl_event_get_resource(event_num);
   172		if (!r)
   173			return;
   174		domain_id = get_domain(event);
   175		d = resctrl_arch_find_domain(r, domain_id);
   176		if (!d)
   177			return;
   178	
   179		if (!cpumask_test_cpu(smp_processor_id(), &d->cpu_mask))
   180			return;
   181	
   182		do {
   183			prev = local64_read(&hwc->prev_count);
   184	
   185			err = resctrl_arch_rmid_read(r, d, closid, rmid,
 > 186						     event_num, &now, hwc->idx);
   187			if (err)
   188				return;
   189		} while (local64_cmpxchg(&hwc->prev_count, prev, now) != prev);
   190	
   191		/*
   192		 * Discard the first reading to initialise prev_count.
   193		 * Resctrl already handled overflow.
   194		 */
   195		if (prev != 0) {
   196			delta = now - prev;
   197			local64_add(delta, &event->count);
   198		}
   199	
   200		set_bit(PERF_HES_UPTODATE, (long *)&hwc->state);
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
