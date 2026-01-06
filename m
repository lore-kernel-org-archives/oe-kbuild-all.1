Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31988194C96
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735729; cv=none; b=khr3JU3QoD9EzGqe+Sr/JNZpDCKoPncD/MI/Xi+/ajEAugSCawHRNZ7S9XB02fTYANJ04y7oWwQBWa2RapdeAOV+TykeZih506++TtWk81aS9ondy31HfHyauCOF67eLQUUm3A0wz1HTSsFeURIbfqbmPppwfwiU5WOsXojYpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735729; c=relaxed/simple;
	bh=pQbpZYihmAFaoBBeTjRW4B1U3HNmrdEMH8y/mTnU6F4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lFYTs6HTxUddFh7s0N0HIM8N/mtkrxzgD0chvmbO/7SK2I4H/Wlwp5qNGrX+WnaPXSqmwUyi6BSO59Pi/qFRePHkLMR2w0dkCvJUIJyhStl3XvKFlXoaIgtivaPy26MInG7giVShnZAWK7I43dySzBA4bMf1yX2VLndaujiM0T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFxCWNTr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFxCWNTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767735728; x=1799271728;
  h=date:from:to:cc:subject:message-id;
  bh=pQbpZYihmAFaoBBeTjRW4B1U3HNmrdEMH8y/mTnU6F4=;
  b=AFxCWNTrIWgw6o8dtteAHUUaAcfNiRSeVprXImaIpWHE5AZ0H6xSQycw
   oQDteoojASOGa6pTkC/sHWSuJumtvKBRI9CmZufUIVMPN2KKZ4/MArLyJ
   24puoX7TAyS2EAlxfpyxP0pI1dNBSzdlSNUWuUroAMqpuEEpQo8MwAusS
   v1zWBgw+wpM3qKGyXExEmop3fG0IVnx57k9dOxhMDWosoOa+toDhxKdss
   pm7UuEKJwxmbYSGVH7uvmyro7NVv/CZT4vg/Z1D02NDA1Dv6x0gy57454
   SySroDdTfB4daPrVINrKGSrGKY9ws0MnERHqkSiiERmzsVvR7vfukRBqd
   w==;
X-CSE-ConnectionGUID: jrLdPPH7SRWWzwtLhMq7vA==
X-CSE-MsgGUID: s9YcasAlQT6icreUhhXNew==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79824896"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="79824896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:42:04 -0800
X-CSE-ConnectionGUID: WuPdg22rR/KkV1ED52XSJg==
X-CSE-MsgGUID: CcXda9FxTyC2B+M2jtz0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="203011927"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jan 2026 13:42:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEoS-000000003FZ-2HJn;
	Tue, 06 Jan 2026 21:42:00 +0000
Date: Wed, 07 Jan 2026 05:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 224/226]
 include/trace/events/vmscan.h:238:68: error: invalid use of undefined type
 'struct mem_cgroup'
Message-ID: <202601070540.h0lMglk1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   d51d3f6765d29ab5cdc6a59ad832017e660d5add
commit: b84bca52c8e661aa7da507a03cc3f6831fef2edf [224/226] mm: vmscan: add cgroup IDs to vmscan tracepoints
config: i386-randconfig-011-20260107 (https://download.01.org/0day-ci/archive/20260107/202601070540.h0lMglk1-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070540.h0lMglk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601070540.h0lMglk1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/vmscan.h:554,
                    from mm/vmscan.c:73:
   include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shrink_slab_start':
>> include/trace/events/vmscan.h:238:68: error: invalid use of undefined type 'struct mem_cgroup'
     238 |                 __entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
         |                                                                    ^~
   include/trace/trace_events.h:427:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/vmscan.h:206:1: note: in expansion of macro 'TRACE_EVENT'
     206 | TRACE_EVENT(mm_shrink_slab_start,
         | ^~~~~~~~~~~
   include/trace/events/vmscan.h:228:9: note: in expansion of macro 'TP_fast_assign'
     228 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shrink_slab_end':
   include/trace/events/vmscan.h:280:56: error: invalid use of undefined type 'struct mem_cgroup'
     280 |                 __entry->memcg_id = cgroup_id(sc->memcg->css.cgroup);
         |                                                        ^~
   include/trace/trace_events.h:427:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/vmscan.h:254:1: note: in expansion of macro 'TRACE_EVENT'
     254 | TRACE_EVENT(mm_shrink_slab_end,
         | ^~~~~~~~~~~
   include/trace/events/vmscan.h:272:9: note: in expansion of macro 'TP_fast_assign'
     272 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133:
   include/trace/events/vmscan.h: In function 'do_perf_trace_mm_shrink_slab_start':
>> include/trace/events/vmscan.h:238:68: error: invalid use of undefined type 'struct mem_cgroup'
     238 |                 __entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
         |                                                                    ^~
   include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/vmscan.h:206:1: note: in expansion of macro 'TRACE_EVENT'
     206 | TRACE_EVENT(mm_shrink_slab_start,
         | ^~~~~~~~~~~
   include/trace/events/vmscan.h:228:9: note: in expansion of macro 'TP_fast_assign'
     228 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/trace/events/vmscan.h: In function 'do_perf_trace_mm_shrink_slab_end':
   include/trace/events/vmscan.h:280:56: error: invalid use of undefined type 'struct mem_cgroup'
     280 |                 __entry->memcg_id = cgroup_id(sc->memcg->css.cgroup);
         |                                                        ^~
   include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/vmscan.h:254:1: note: in expansion of macro 'TRACE_EVENT'
     254 | TRACE_EVENT(mm_shrink_slab_end,
         | ^~~~~~~~~~~
   include/trace/events/vmscan.h:272:9: note: in expansion of macro 'TP_fast_assign'
     272 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +238 include/trace/events/vmscan.h

   205	
   206	TRACE_EVENT(mm_shrink_slab_start,
   207		TP_PROTO(struct shrinker *shr, struct shrink_control *sc,
   208			long nr_objects_to_shrink, unsigned long cache_items,
   209			unsigned long long delta, unsigned long total_scan,
   210			int priority),
   211	
   212		TP_ARGS(shr, sc, nr_objects_to_shrink, cache_items, delta, total_scan,
   213			priority),
   214	
   215		TP_STRUCT__entry(
   216			__field(struct shrinker *, shr)
   217			__field(void *, shrink)
   218			__field(long, nr_objects_to_shrink)
   219			__field(unsigned long, gfp_flags)
   220			__field(unsigned long, cache_items)
   221			__field(unsigned long long, delta)
   222			__field(unsigned long, total_scan)
   223			__field(int, priority)
   224			__field(int, nid)
   225			__field(unsigned short, memcg_id)
   226		),
   227	
   228		TP_fast_assign(
   229			__entry->shr = shr;
   230			__entry->shrink = shr->scan_objects;
   231			__entry->nr_objects_to_shrink = nr_objects_to_shrink;
   232			__entry->gfp_flags = (__force unsigned long)sc->gfp_mask;
   233			__entry->cache_items = cache_items;
   234			__entry->delta = delta;
   235			__entry->total_scan = total_scan;
   236			__entry->priority = priority;
   237			__entry->nid = sc->nid;
 > 238			__entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
   239		),
   240	
   241		TP_printk("%pS %p: nid: %d memcg_id: %u objects to shrink %ld gfp_flags %s cache items %ld delta %lld total_scan %ld priority %d",
   242			__entry->shrink,
   243			__entry->shr,
   244			__entry->nid,
   245			__entry->memcg_id,
   246			__entry->nr_objects_to_shrink,
   247			show_gfp_flags(__entry->gfp_flags),
   248			__entry->cache_items,
   249			__entry->delta,
   250			__entry->total_scan,
   251			__entry->priority)
   252	);
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
