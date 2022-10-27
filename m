Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EABB10EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Oct 2022 01:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666835969; x=1698371969;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D6BgFh4fDnmpKPhJw8naSB4dipMift34TqCSC9+KVx4=;
  b=PQgnODFsnFOJ/KKO9ZyJsKg355hN7HnEhCDJ3VSMVlZA+pw1hg8prcBD
   +bouWGN6VXRuWcVQUWcNhMFnbC/opM4t3BXnenIrcsFsdIHDglXI7Pg64
   td1+x2HgnGVuonvapQdaDKyDDmbDN9PA8Hj9TovzBvNAvgj94RJYOy4DA
   bhZsXSMv+UJTp1VgxBMgir1HmFBVIdWEW7o/a41d795aomEaoEpPswr4y
   ijP5MkEdPbFpcjTajCJY7bBEdd1xmFwK5ALFXL1JN3Efnl2Te/uIr7WFn
   ozDbLVu2+eCJwEiB0r69E22PU+yoeAehpCowY4WElKv8N+8QIVLFbop/Z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="295516160"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="295516160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 18:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="695613502"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="695613502"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Oct 2022 18:59:26 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onsB4-00087s-0h;
	Thu, 27 Oct 2022 01:59:26 +0000
Date: Thu, 27 Oct 2022 09:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+403 bytes kernel size regression] [i386-tinyconfig]
 [c4e473c7a2] bitmap: improve small_const case for find_next() functions
Message-ID: <6359e5f8.s3JxUntpZZnVcUvy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +403 bytes kernel size regression due to commit:

commit: c4e473c7a2b7a553d07e42ff19a0c07d814086ed (bitmap: improve small_const case for find_next() functions)
https://github.com/norov/linux bbmap


Details as below (size data is obtained by `nm --size-sort vmlinux`):

28f93a4d: bitmap: switch from inline to __always_inline
c4e473c7: bitmap: improve small_const case for find_next() functions

+--------------------------------+----------+----------+-------+
|             symbol             | 28f93a4d | c4e473c7 | delta |
+--------------------------------+----------+----------+-------+
| nm.t.__perf_sched_find_counter | 0        | 338      | 338   |
| nm.t.pcpu_find_zero_area       | 0        | 122      | 122   |
| bzImage                        | 491456   | 491552   | 96    |
| nm.t.pcpu_is_populated         | 0        | 79       | 79    |
| nm.t.next_pending_bucket       | 0        | 65       | 65    |
| nm.t.find_next_fd              | 0        | 60       | 60    |
| nm.t.__queue_work              | 293      | 353      | 60    |
| nm.t.intel_pmu_cpu_starting    | 519      | 562      | 43    |
| nm.T.populate_cache_leaves     | 457      | 496      | 39    |
| nm.T.clocksource_verify_percpu | 48       | 85       | 37    |
| nm.t.free_cache_attributes     | 86       | 120      | 34    |
| nm.t.try_to_unmap_one          | 564      | 596      | 32    |
| nm.t.__reserve_bp_slot         | 249      | 280      | 31    |
| nm.t.clocksource_watchdog      | 1005     | 1034     | 29    |
| nm.T.flush_tlb_mm_range        | 155      | 182      | 27    |
| nm.t.toggle_bp_slot            | 308      | 335      | 27    |
| nm.t.tsc_sync_check_timer_fn   | 38       | 64       | 26    |
| nm.T.arch_tlbbatch_flush       | 98       | 121      | 23    |
| nm.t.__drain_all_pages         | 144      | 167      | 23    |
| nm.t.do_sched_rt_period_timer  | 488      | 504      | 16    |
| nm.T.seq_hlist_next_percpu     | 66       | 73       | 7     |
| nm.T.xas_find_marked           | 359      | 361      | 2     |
| nm.T.ida_alloc_range           | 645      | 634      | -11   |
| nm.T.tag_pages_for_writeback   | 236      | 215      | -21   |
| nm.t.xas_find_chunk            | 54       | 31       | -23   |
| nm.t.intel_arch_events_quirk   | 80       | 57       | -23   |
| nm.t.zhaoxin_arch_events_quirk | 80       | 57       | -23   |
| nm.t.pcpu_find_block_fit       | 228      | 189      | -39   |
| nm.t.alloc_fd                  | 204      | 157      | -47   |
| nm.t.run_timer_softirq         | 439      | 365      | -74   |
| nm.t.pcpu_alloc_area           | 404      | 305      | -99   |
| nm.T.perf_assign_events        | 659      | 302      | -357  |
+--------------------------------+----------+----------+-------+



Thanks

