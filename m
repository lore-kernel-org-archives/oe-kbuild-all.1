Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90463274FE3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766839387; cv=none; b=omk5j7HqzvbtyYPvz4HguBY4YdpVWN1WsM9LG27Ip35DJKYdw0drA2/s/Xr/u/RZzVszdv8dyUs39FilbR0eEDNHr9H9x+AFzsUKak8fOL+dxjEJoK8pshIDvYwfG27T4WFQC92vqWqH1E7FNhiNi+dyL89/D4mDqvSnXbIPRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766839387; c=relaxed/simple;
	bh=swDwSh2bXGX/dNSbpmqWq4fasthjTXBIFcXAvWVH/rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AhQ46+EVSKtmDDcEh9EyhYm3JVkG3OlmloNAUKU1TCrei57pcJE40XcsCxJvqPtnsbje5aePQO0fhl9OZF0qFQ5nHHPCNT1wEeG2LYium6eVL92ncUFlFecxyhMExLXMbzkJo8zOekKogZAQWeTvxo4eqcZLU+qI+ESF256V/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoSjdBTH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoSjdBTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766839384; x=1798375384;
  h=date:from:to:cc:subject:message-id;
  bh=swDwSh2bXGX/dNSbpmqWq4fasthjTXBIFcXAvWVH/rU=;
  b=XoSjdBTHdAW9ltpw9qTL8gh9vJpWq09Ltu2947VCaTq0inzRFhD60rlt
   2JOSEyM1EOaacXr3XkCDpXLQ3My0W0BZcu3ZqmmQMtZKdyPgpaw0TDGlZ
   AmCN1dYObIYJcNdmyjyApDTOxg2G+JGDH/+Qn07shsbbGXQdPQDtnPyEx
   bu/rBTT0K+wLK0Rf+rFsKvCvX3swTNkFM7uyBC27mlbAoRdX+aX34k1u4
   PSFx4kdX5JSUYS/WBsxlOm3wwEN6qgwtJiNS8VVDksTzlPN42dCasMcBX
   TV/9DcPnzYP+W+PQzfaqUept9K3f92XFJq/CPvAwETejiqxCDVlch2p4a
   A==;
X-CSE-ConnectionGUID: 7QziHdewS9ObKfDLxpFdIw==
X-CSE-MsgGUID: p4P0DCU7T7O4VtiYDR8+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79660230"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79660230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 04:43:02 -0800
X-CSE-ConnectionGUID: CrzPjEHSRJeWh15OQYXptA==
X-CSE-MsgGUID: +rmjjNH/TNWtiZxcjNoTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="237952864"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2025 04:43:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZTdB-000000005px-1KtX;
	Sat, 27 Dec 2025 12:42:52 +0000
Date: Sat, 27 Dec 2025 20:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 4/6] include/trace/events/xen.h:166:52:
 error: 'pmd_t' {aka 'pmld_t'} has no member named 'pmd'
Message-ID: <202512272042.b55c3szS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 38905b0328f66722c250710e81d754e5d07f069a [4/6] use pmld_t for pmd_t pud_t p4d_t
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251227/202512272042.b55c3szS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272042.b55c3szS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272042.b55c3szS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/events/xen.h:459,
                    from arch/x86/xen/trace.c:21:
   include/trace/stages/init.h:29:9: error: redefinition of '__TRACE_SYSTEM_pmdval_t'
      29 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^~
   include/trace/events/xen.h:204:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     204 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:29:9: note: previous definition of '__TRACE_SYSTEM_pmdval_t' with type 'struct trace_eval_map'
      29 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^~
   include/trace/events/xen.h:156:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     156 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:37:10: error: redefinition of 'TRACE_SYSTEM_pmdval_t'
      37 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^~~~~~~~~~~~
   include/trace/events/xen.h:204:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     204 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:37:10: note: previous definition of 'TRACE_SYSTEM_pmdval_t' with type 'struct trace_eval_map *'
      37 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^~~~~~~~~~~~
   include/trace/events/xen.h:156:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     156 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:29:9: error: redefinition of '__TRACE_SYSTEM_pmdval_t'
      29 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^~
   include/trace/events/xen.h:221:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     221 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:29:9: note: previous definition of '__TRACE_SYSTEM_pmdval_t' with type 'struct trace_eval_map'
      29 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^~
   include/trace/events/xen.h:204:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     204 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:37:10: error: redefinition of 'TRACE_SYSTEM_pmdval_t'
      37 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^~~~~~~~~~~~
   include/trace/events/xen.h:221:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     221 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:37:10: note: previous definition of 'TRACE_SYSTEM_pmdval_t' with type 'struct trace_eval_map *'
      37 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^~~~~~~~~~~~
   include/trace/events/xen.h:204:1: note: in expansion of macro 'TRACE_DEFINE_SIZEOF'
     204 | TRACE_DEFINE_SIZEOF(pmdval_t);
         | ^~~~~~~~~~~~~~~~~~~
   include/trace/events/xen.h: In function 'do_trace_event_raw_event_xen_mmu_set_pmd':
>> include/trace/events/xen.h:166:52: error: 'pmd_t' {aka 'pmld_t'} has no member named 'pmd'
     166 |                            __entry->pmdval = pmdval.pmd),
         |                                                    ^
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
   include/trace/events/xen.h:158:1: note: in expansion of macro 'TRACE_EVENT'
     158 | TRACE_EVENT(xen_mmu_set_pmd,
         | ^~~~~~~~~~~
   include/trace/events/xen.h:165:13: note: in expansion of macro 'TP_fast_assign'
     165 |             TP_fast_assign(__entry->pmdp = pmdp;
         |             ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133:
   include/trace/events/xen.h: In function 'do_perf_trace_xen_mmu_set_pmd':
>> include/trace/events/xen.h:166:52: error: 'pmd_t' {aka 'pmld_t'} has no member named 'pmd'
     166 |                            __entry->pmdval = pmdval.pmd),
         |                                                    ^
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
   include/trace/events/xen.h:158:1: note: in expansion of macro 'TRACE_EVENT'
     158 | TRACE_EVENT(xen_mmu_set_pmd,
         | ^~~~~~~~~~~
   include/trace/events/xen.h:165:13: note: in expansion of macro 'TP_fast_assign'
     165 |             TP_fast_assign(__entry->pmdp = pmdp;
         |             ^~~~~~~~~~~~~~


vim +166 include/trace/events/xen.h

ff910cfdc6e928 Jeremy Linton           2017-05-31  157  
847088079162a5 Jeremy Fitzhardinge     2010-12-16  158  TRACE_EVENT(xen_mmu_set_pmd,
847088079162a5 Jeremy Fitzhardinge     2010-12-16  159  	    TP_PROTO(pmd_t *pmdp, pmd_t pmdval),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  160  	    TP_ARGS(pmdp, pmdval),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  161  	    TP_STRUCT__entry(
847088079162a5 Jeremy Fitzhardinge     2010-12-16  162  		    __field(pmd_t *, pmdp)
847088079162a5 Jeremy Fitzhardinge     2010-12-16  163  		    __field(pmdval_t, pmdval)
847088079162a5 Jeremy Fitzhardinge     2010-12-16  164  		    ),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  165  	    TP_fast_assign(__entry->pmdp = pmdp;
847088079162a5 Jeremy Fitzhardinge     2010-12-16 @166  			   __entry->pmdval = pmdval.pmd),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  167  	    TP_printk("pmdp %p pmdval %0*llx (raw %0*llx)",
847088079162a5 Jeremy Fitzhardinge     2010-12-16  168  		      __entry->pmdp,
847088079162a5 Jeremy Fitzhardinge     2010-12-16  169  		      (int)sizeof(pmdval_t) * 2, (unsigned long long)pmd_val(native_make_pmd(__entry->pmdval)),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  170  		      (int)sizeof(pmdval_t) * 2, (unsigned long long)__entry->pmdval)
847088079162a5 Jeremy Fitzhardinge     2010-12-16  171  	);
847088079162a5 Jeremy Fitzhardinge     2010-12-16  172  
e83543b4955982 Steven Rostedt (VMware  2017-10-10  173) #ifdef CONFIG_X86_PAE
e83543b4955982 Steven Rostedt (VMware  2017-10-10  174) DEFINE_XEN_MMU_SET_PTE(xen_mmu_set_pte_atomic);
e83543b4955982 Steven Rostedt (VMware  2017-10-10  175) 
e83543b4955982 Steven Rostedt (VMware  2017-10-10  176) TRACE_EVENT(xen_mmu_pte_clear,
e83543b4955982 Steven Rostedt (VMware  2017-10-10  177) 	    TP_PROTO(struct mm_struct *mm, unsigned long addr, pte_t *ptep),
e83543b4955982 Steven Rostedt (VMware  2017-10-10  178) 	    TP_ARGS(mm, addr, ptep),
e83543b4955982 Steven Rostedt (VMware  2017-10-10  179) 	    TP_STRUCT__entry(
e83543b4955982 Steven Rostedt (VMware  2017-10-10  180) 		    __field(struct mm_struct *, mm)
e83543b4955982 Steven Rostedt (VMware  2017-10-10  181) 		    __field(unsigned long, addr)
e83543b4955982 Steven Rostedt (VMware  2017-10-10  182) 		    __field(pte_t *, ptep)
e83543b4955982 Steven Rostedt (VMware  2017-10-10  183) 		    ),
e83543b4955982 Steven Rostedt (VMware  2017-10-10  184) 	    TP_fast_assign(__entry->mm = mm;
e83543b4955982 Steven Rostedt (VMware  2017-10-10  185) 			   __entry->addr = addr;
e83543b4955982 Steven Rostedt (VMware  2017-10-10  186) 			   __entry->ptep = ptep),
e83543b4955982 Steven Rostedt (VMware  2017-10-10  187) 	    TP_printk("mm %p addr %lx ptep %p",
e83543b4955982 Steven Rostedt (VMware  2017-10-10  188) 		      __entry->mm, __entry->addr, __entry->ptep)
e83543b4955982 Steven Rostedt (VMware  2017-10-10  189) 	);
e83543b4955982 Steven Rostedt (VMware  2017-10-10  190) 
847088079162a5 Jeremy Fitzhardinge     2010-12-16  191  TRACE_EVENT(xen_mmu_pmd_clear,
847088079162a5 Jeremy Fitzhardinge     2010-12-16  192  	    TP_PROTO(pmd_t *pmdp),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  193  	    TP_ARGS(pmdp),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  194  	    TP_STRUCT__entry(
847088079162a5 Jeremy Fitzhardinge     2010-12-16  195  		    __field(pmd_t *, pmdp)
847088079162a5 Jeremy Fitzhardinge     2010-12-16  196  		    ),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  197  	    TP_fast_assign(__entry->pmdp = pmdp),
847088079162a5 Jeremy Fitzhardinge     2010-12-16  198  	    TP_printk("pmdp %p", __entry->pmdp)
847088079162a5 Jeremy Fitzhardinge     2010-12-16  199  	);
e83543b4955982 Steven Rostedt (VMware  2017-10-10  200) #endif
847088079162a5 Jeremy Fitzhardinge     2010-12-16  201  
98233368338534 Kiryl Shutsemau         2015-04-14  202  #if CONFIG_PGTABLE_LEVELS >= 4
847088079162a5 Jeremy Fitzhardinge     2010-12-16  203  
7c4dfaf03d4105 Alex Shi                2025-12-25 @204  TRACE_DEFINE_SIZEOF(pmdval_t);
ff910cfdc6e928 Jeremy Linton           2017-05-31  205  

:::::: The code at line 166 was first introduced by commit
:::::: 847088079162a5cf8ab0d1ad1ecf7fa60c057246 xen/trace: add mmu tracepoints

:::::: TO: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
:::::: CC: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
