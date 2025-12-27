Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE91E0B9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766843442; cv=none; b=gWcn7HVRkdTS61BHfJE/oXtiFgv5IBs5RbFSSPUhM8cvBNNMfgxwB/oxg4kvWw9dkrQpmlVYxNsrO6FqgRo9OpXP497T5ll5GAl/oT96JQeQwx49PpnNcYucBXCQiS+q8XPbVmv5x9lMxpbntadrbgPGpuSLC1brvI0iiURuR8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766843442; c=relaxed/simple;
	bh=Po9E7msBvBB8TQw1TBURdiHy2DyTSHR0MBrptWFvKP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rP5fuXKYt53OPAqIMVU//J2dcO8bH3jXK+pPsA17hs0+mR4F7ZYgpMuCVSSnw5rPV8U76umUCbhh6EEFK8vLLo5ZFYAfHpsfgClCfebIY2hly2oYSWGwWs1TICBUUmDVMaaj0aA/Xa0o+dLPJmzqnoDfc37peotwHyGnlHzMiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGTMU0lV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGTMU0lV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766843441; x=1798379441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Po9E7msBvBB8TQw1TBURdiHy2DyTSHR0MBrptWFvKP0=;
  b=BGTMU0lVYnBoeUEaazDgcbZnLpEo4CSIM3xeHx929i4ociUZlPPLnXt0
   ulGVMgXIHZY9NnNL/E9qEocvjUFyjFKWF+Jg20FPa+sXTf51FF0W2FIZZ
   Q+dKfueE8ymi+aP5QVRPyV8d7x+OYQ6yM00DpN1dCwjCSYFwY+R9Z+rOg
   zyA7vsJj1Ng17cvxEDjz8OzJNH8mXmgbbGMaC2GwOy0kUlJH+a7/Sp+4l
   +Kcoi8DNFpnabLn83bQhLZUJv9IWG1YMEjTPVf2sRZu7WNdu+MnCVobE4
   9hoWY/49rr32xFLkYBSH0pBVW+z03wtA/XaGj7dOA2/0NIh7Tiv1at3gJ
   Q==;
X-CSE-ConnectionGUID: zMGHctOFRc6HeofcZ5+Bfg==
X-CSE-MsgGUID: gRawjK36SVyTmVOp2eetCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="72167997"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72167997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 05:50:40 -0800
X-CSE-ConnectionGUID: CDxm/VHbTbGWkSRwiiiQLw==
X-CSE-MsgGUID: d8c7+A5JSLKXlVmMpZ61/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="201030674"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2025 05:50:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZUgm-000000007CG-36W4;
	Sat, 27 Dec 2025 13:50:36 +0000
Date: Sat, 27 Dec 2025 14:50:31 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 4/6] include/trace/events/xen.h:166:52: error:
 'pmd_t' {aka 'pmld_t'} has no member named 'pmd'
Message-ID: <202512271459.Vh3XAGoS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 38905b0328f66722c250710e81d754e5d07f069a [4/6] use pmld_t for pmd_t pud_t p4d_t
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251227/202512271459.Vh3XAGoS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271459.Vh3XAGoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271459.Vh3XAGoS-lkp@intel.com/

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

ff910cfdc6e928 Jeremy Linton       2017-05-31  157  
847088079162a5 Jeremy Fitzhardinge 2010-12-16  158  TRACE_EVENT(xen_mmu_set_pmd,
847088079162a5 Jeremy Fitzhardinge 2010-12-16  159  	    TP_PROTO(pmd_t *pmdp, pmd_t pmdval),
847088079162a5 Jeremy Fitzhardinge 2010-12-16  160  	    TP_ARGS(pmdp, pmdval),
847088079162a5 Jeremy Fitzhardinge 2010-12-16  161  	    TP_STRUCT__entry(
847088079162a5 Jeremy Fitzhardinge 2010-12-16  162  		    __field(pmd_t *, pmdp)
847088079162a5 Jeremy Fitzhardinge 2010-12-16  163  		    __field(pmdval_t, pmdval)
847088079162a5 Jeremy Fitzhardinge 2010-12-16  164  		    ),
847088079162a5 Jeremy Fitzhardinge 2010-12-16  165  	    TP_fast_assign(__entry->pmdp = pmdp;
847088079162a5 Jeremy Fitzhardinge 2010-12-16 @166  			   __entry->pmdval = pmdval.pmd),
847088079162a5 Jeremy Fitzhardinge 2010-12-16  167  	    TP_printk("pmdp %p pmdval %0*llx (raw %0*llx)",
847088079162a5 Jeremy Fitzhardinge 2010-12-16  168  		      __entry->pmdp,
847088079162a5 Jeremy Fitzhardinge 2010-12-16  169  		      (int)sizeof(pmdval_t) * 2, (unsigned long long)pmd_val(native_make_pmd(__entry->pmdval)),
847088079162a5 Jeremy Fitzhardinge 2010-12-16  170  		      (int)sizeof(pmdval_t) * 2, (unsigned long long)__entry->pmdval)
847088079162a5 Jeremy Fitzhardinge 2010-12-16  171  	);
847088079162a5 Jeremy Fitzhardinge 2010-12-16  172  

:::::: The code at line 166 was first introduced by commit
:::::: 847088079162a5cf8ab0d1ad1ecf7fa60c057246 xen/trace: add mmu tracepoints

:::::: TO: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
:::::: CC: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
