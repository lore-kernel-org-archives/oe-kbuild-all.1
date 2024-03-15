Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B44635
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503832; cv=none; b=G/sC4xBVgSNxKpjha/mQEOlboeOg0/63kXqyfzZ5JBCq3286443DhS9Ie+v+oy9iY62I3EpsY4oGcM8pr9LYCaGcP1Q9ZMd//btOASEMcO1Jx/7OHmf6JQXy+0/hWD3rKX1yP7GKAh9uu0MzIfK1/l7Qond3IPvjxB8ORmgyopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503832; c=relaxed/simple;
	bh=fZ0P8PEbVHM789VeGb+vb1mqdPDRh1VdxyyNg+mrFQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/puB/QJ4yoFDPfXwYfO+DYrWeZmNo1f8uE45828ERnkY8ctAgR1MjvHr0fzbLSV8wAEtX3wl7XcR7sEeBqF1ETK79SESDZzlE9t/9KSjermLY+CT1ZAxmrXh6DPqZ10gaz3gAylQ4xKf1iRcBm9K1RIsDrswLBml4zUZzcTG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nr5oRQFB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nr5oRQFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710503830; x=1742039830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZ0P8PEbVHM789VeGb+vb1mqdPDRh1VdxyyNg+mrFQs=;
  b=Nr5oRQFBWatO+zQ+8U1POCTpDZCeYnWYsyVzn7HCsP5RPfqJ5gPuXCQJ
   jBJMhUb8a9h7IORxx4pvQQvIvwX01bEctOEV5R1IQjShhmbQ5w21J2Mq7
   nC7UHJ95bqDi43FkQHtHGVIMyKZsueCy8Ebxo/ygav9wnwKTzz7/UdeWS
   zhmkUfYgIp2pKIBKZtbHiWKcwq8khSwZcHk1QBEpJViq0REjx0pYshT3c
   lHjCe7EZx7p9FiDJRjBx/22lBy8/5CiCCF89anwgfAUMTq52L00pMv75/
   hcwk539cUoL+lz18K///+a/w26SmCFvxlsadpv5Z+R9Ea2ep4tVkvbxBk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16014647"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="16014647"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 04:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="13275093"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2024 04:57:08 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl6BM-000EOz-2s;
	Fri, 15 Mar 2024 11:57:04 +0000
Date: Fri, 15 Mar 2024 19:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 37/37] include/trace/events/qdisc.h:91:35:
 error: passing argument 1 of 'strcmp' from incompatible pointer type
Message-ID: <202403151902.lhce1yVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   eb871b9424cba3ba1466bb4db2a064d606430541
commit: eb871b9424cba3ba1466bb4db2a064d606430541 [37/37] tracing: Use strcmp() in __assign_str() WARN_ON() check
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240315/202403151902.lhce1yVS-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151902.lhce1yVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151902.lhce1yVS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/qdisc.h:153,
                    from net/core/net-traces.c:37:
   include/trace/events/qdisc.h: In function 'trace_event_raw_event_qdisc_reset':
>> include/trace/events/qdisc.h:91:35: error: passing argument 1 of 'strcmp' from incompatible pointer type [-Werror=incompatible-pointer-types]
      91 |                 __assign_str(dev, qdisc_dev(q));
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/qdisc.h:77:1: note: in expansion of macro 'TRACE_EVENT'
      77 | TRACE_EVENT(qdisc_reset,
         | ^~~~~~~~~~~
   include/trace/events/qdisc.h:90:9: note: in expansion of macro 'TP_fast_assign'
      90 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:17: note: in expansion of macro 'WARN_ON_ONCE'
      38 |                 WARN_ON_ONCE(__builtin_constant_p(src) ?                \
         |                 ^~~~~~~~~~~~
   include/trace/events/qdisc.h:91:17: note: in expansion of macro '__assign_str'
      91 |                 __assign_str(dev, qdisc_dev(q));
         |                 ^~~~~~~~~~~~
   In file included from include/linux/string.h:61,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/netdevice.h:24,
                    from net/core/net-traces.c:8:
   arch/arc/include/asm/string.h:31:31: note: expected 'const char *' but argument is of type 'struct net_device *'
      31 | extern int strcmp(const char *cs, const char *ct);
         |                   ~~~~~~~~~~~~^~
   include/trace/events/qdisc.h: In function 'trace_event_raw_event_qdisc_destroy':
   include/trace/events/qdisc.h:116:35: error: passing argument 1 of 'strcmp' from incompatible pointer type [-Werror=incompatible-pointer-types]
     116 |                 __assign_str(dev, qdisc_dev(q));
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/qdisc.h:102:1: note: in expansion of macro 'TRACE_EVENT'
     102 | TRACE_EVENT(qdisc_destroy,
         | ^~~~~~~~~~~
   include/trace/events/qdisc.h:115:9: note: in expansion of macro 'TP_fast_assign'
     115 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:17: note: in expansion of macro 'WARN_ON_ONCE'
      38 |                 WARN_ON_ONCE(__builtin_constant_p(src) ?                \
         |                 ^~~~~~~~~~~~
   include/trace/events/qdisc.h:116:17: note: in expansion of macro '__assign_str'
     116 |                 __assign_str(dev, qdisc_dev(q));
         |                 ^~~~~~~~~~~~
   arch/arc/include/asm/string.h:31:31: note: expected 'const char *' but argument is of type 'struct net_device *'
      31 | extern int strcmp(const char *cs, const char *ct);
         |                   ~~~~~~~~~~~~^~
   In file included from include/trace/define_trace.h:103:
   include/trace/events/qdisc.h: In function 'perf_trace_qdisc_reset':
>> include/trace/events/qdisc.h:91:35: error: passing argument 1 of 'strcmp' from incompatible pointer type [-Werror=incompatible-pointer-types]
      91 |                 __assign_str(dev, qdisc_dev(q));
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/qdisc.h:77:1: note: in expansion of macro 'TRACE_EVENT'
      77 | TRACE_EVENT(qdisc_reset,
         | ^~~~~~~~~~~
   include/trace/events/qdisc.h:90:9: note: in expansion of macro 'TP_fast_assign'
      90 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:17: note: in expansion of macro 'WARN_ON_ONCE'
      38 |                 WARN_ON_ONCE(__builtin_constant_p(src) ?                \
         |                 ^~~~~~~~~~~~
   include/trace/events/qdisc.h:91:17: note: in expansion of macro '__assign_str'
      91 |                 __assign_str(dev, qdisc_dev(q));
         |                 ^~~~~~~~~~~~
   arch/arc/include/asm/string.h:31:31: note: expected 'const char *' but argument is of type 'struct net_device *'
      31 | extern int strcmp(const char *cs, const char *ct);
         |                   ~~~~~~~~~~~~^~
   include/trace/events/qdisc.h: In function 'perf_trace_qdisc_destroy':
   include/trace/events/qdisc.h:116:35: error: passing argument 1 of 'strcmp' from incompatible pointer type [-Werror=incompatible-pointer-types]
     116 |                 __assign_str(dev, qdisc_dev(q));
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/qdisc.h:102:1: note: in expansion of macro 'TRACE_EVENT'
     102 | TRACE_EVENT(qdisc_destroy,
         | ^~~~~~~~~~~
   include/trace/events/qdisc.h:115:9: note: in expansion of macro 'TP_fast_assign'
     115 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:17: note: in expansion of macro 'WARN_ON_ONCE'
      38 |                 WARN_ON_ONCE(__builtin_constant_p(src) ?                \
         |                 ^~~~~~~~~~~~
   include/trace/events/qdisc.h:116:17: note: in expansion of macro '__assign_str'
     116 |                 __assign_str(dev, qdisc_dev(q));
         |                 ^~~~~~~~~~~~
   arch/arc/include/asm/string.h:31:31: note: expected 'const char *' but argument is of type 'struct net_device *'
      31 | extern int strcmp(const char *cs, const char *ct);
         |                   ~~~~~~~~~~~~^~
   cc1: some warnings being treated as errors


vim +/strcmp +91 include/trace/events/qdisc.h

a34dac0b9055202 Cong Wang 2020-05-26   78  
a34dac0b9055202 Cong Wang 2020-05-26   79  	TP_PROTO(struct Qdisc *q),
a34dac0b9055202 Cong Wang 2020-05-26   80  
a34dac0b9055202 Cong Wang 2020-05-26   81  	TP_ARGS(q),
a34dac0b9055202 Cong Wang 2020-05-26   82  
a34dac0b9055202 Cong Wang 2020-05-26   83  	TP_STRUCT__entry(
a34dac0b9055202 Cong Wang 2020-05-26   84  		__string(	dev,		qdisc_dev(q)	)
a34dac0b9055202 Cong Wang 2020-05-26   85  		__string(	kind,		q->ops->id	)
a34dac0b9055202 Cong Wang 2020-05-26   86  		__field(	u32,		parent		)
a34dac0b9055202 Cong Wang 2020-05-26   87  		__field(	u32,		handle		)
a34dac0b9055202 Cong Wang 2020-05-26   88  	),
a34dac0b9055202 Cong Wang 2020-05-26   89  
a34dac0b9055202 Cong Wang 2020-05-26   90  	TP_fast_assign(
a34dac0b9055202 Cong Wang 2020-05-26  @91  		__assign_str(dev, qdisc_dev(q));
a34dac0b9055202 Cong Wang 2020-05-26   92  		__assign_str(kind, q->ops->id);
a34dac0b9055202 Cong Wang 2020-05-26   93  		__entry->parent = q->parent;
a34dac0b9055202 Cong Wang 2020-05-26   94  		__entry->handle = q->handle;
a34dac0b9055202 Cong Wang 2020-05-26   95  	),
a34dac0b9055202 Cong Wang 2020-05-26   96  
a34dac0b9055202 Cong Wang 2020-05-26   97  	TP_printk("dev=%s kind=%s parent=%x:%x handle=%x:%x", __get_str(dev),
a34dac0b9055202 Cong Wang 2020-05-26   98  		  __get_str(kind), TC_H_MAJ(__entry->parent) >> 16, TC_H_MIN(__entry->parent),
a34dac0b9055202 Cong Wang 2020-05-26   99  		  TC_H_MAJ(__entry->handle) >> 16, TC_H_MIN(__entry->handle))
a34dac0b9055202 Cong Wang 2020-05-26  100  );
a34dac0b9055202 Cong Wang 2020-05-26  101  

:::::: The code at line 91 was first introduced by commit
:::::: a34dac0b9055202cf9c64e08d8d8dc5e23029d3a net_sched: add tracepoints for qdisc_reset() and qdisc_destroy()

:::::: TO: Cong Wang <xiyou.wangcong@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
