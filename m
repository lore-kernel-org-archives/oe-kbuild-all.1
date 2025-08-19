Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7A253B40
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755619238; cv=none; b=fP5+WyAz8S/s8SuhC/L2M6lcl4unNkfWZ0Iz2x4R8PmWUhtEDg90z82nHoEHlL+ARxC9ED80uW/+TQ1qKkXcXqURCwhc/v5TvLWjr3P3LrfpnTMdnc2IWn1+O9PyVqYG70m+0Wz7BkU1AlvJAfqzc87zrWoND6uDXvZoTuztYkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755619238; c=relaxed/simple;
	bh=9pCGquBfB9iEH+++tWiD+pVK53sSQfG2z2BeRYgVW70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+oUXqgvbsacLIGGFVTe+Bb25eX3GKSBup0Zctl8xc0EYWrXCv18w03t1icRo9GjCiAc+3qRuRk7gglpwc3ZpDjOCJ4a4RJ0uaYPCJ5b+qFt2uZuE0nIiOed13SkfF10OTK/6VhO75rCRUnsV22L/jjBirPgbCiflgrodW3Hy/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2kQEUBR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2kQEUBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755619237; x=1787155237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pCGquBfB9iEH+++tWiD+pVK53sSQfG2z2BeRYgVW70=;
  b=W2kQEUBRsPrPbBnm8gGyCOd0gkXFLTjoEfqTi4+0tqvwldhqLSjlGgeT
   1mSDlUS9wZraubae2phPfRAY7tiyZMtpNOz3gFMQ64FdRh0Qi1JJVBLEp
   lzRzLjbN3oggDZer9xXKCjSq3BY5u5hdg+ZfvBrNOUoqQnFTYMENE0Z/z
   YJLRDSyUAwpghsynrDfErsitF0h1gVFFemgKFYaxZglBUTxWMw8wWBLn4
   lWR3Sb/aGRtXqpwJvZGEApSdpZTRWtHLguVH/rnbJSN/69MS9iskEQJ2V
   /8VzgYqdhVZtEWe6W1GhxUbMcskzg08eipw8s3qKx8zz8TFOAsR7rptKS
   A==;
X-CSE-ConnectionGUID: 39d2PGUfTP+ng2XsSe6ABA==
X-CSE-MsgGUID: db0t28hNTDeCInWafU+M+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="56896696"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="56896696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 09:00:35 -0700
X-CSE-ConnectionGUID: RPcjQSr2QdGwG+6/sj9wKg==
X-CSE-MsgGUID: 6kHb0nwpQF+Tr0QnUKeOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="191567611"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2025 09:00:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoOl0-000H55-0I;
	Tue, 19 Aug 2025 16:00:21 +0000
Date: Wed, 20 Aug 2025 00:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Xiang Gao <gxxa03070307@gmail.com>, akpm@linux-foundation.org,
	david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH] mm/cma: add available_count and total count in
 trace_cma_alloc_start
Message-ID: <202508192303.cnpF2rQG-lkp@intel.com>
References: <20250819032654.4345-1-gxxa03070307@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819032654.4345-1-gxxa03070307@gmail.com>

Hi Xiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiang-Gao/mm-cma-add-available_count-and-total-count-in-trace_cma_alloc_start/20250819-112831
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250819032654.4345-1-gxxa03070307%40gmail.com
patch subject: [PATCH] mm/cma: add available_count and total count in trace_cma_alloc_start
config: s390-randconfig-002-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192303.cnpF2rQG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192303.cnpF2rQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508192303.cnpF2rQG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/cma.h:138,
                    from mm/cma.c:31:
   include/trace/events/cma.h: In function 'trace_raw_output_cma_alloc_start':
>> include/trace/events/cma.h:62:19: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
      62 |         TP_printk("name=%s count=%lu align=%u",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/cma.h:39:1: note: in expansion of macro 'TRACE_EVENT'
      39 | TRACE_EVENT(cma_alloc_start,
         | ^~~~~~~~~~~
   include/trace/events/cma.h:62:9: note: in expansion of macro 'TP_printk'
      62 |         TP_printk("name=%s count=%lu align=%u",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:256:
   include/trace/events/cma.h:62:45: note: format string is defined here
      62 |         TP_printk("name=%s count=%lu align=%u",
         |                                            ~^
         |                                             |
         |                                             unsigned int
         |                                            %lu
>> include/trace/events/cma.h:62:19: warning: too many arguments for format [-Wformat-extra-args]
      62 |         TP_printk("name=%s count=%lu align=%u",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/cma.h:39:1: note: in expansion of macro 'TRACE_EVENT'
      39 | TRACE_EVENT(cma_alloc_start,
         | ^~~~~~~~~~~
   include/trace/events/cma.h:62:9: note: in expansion of macro 'TP_printk'
      62 |         TP_printk("name=%s count=%lu align=%u",
         |         ^~~~~~~~~
   include/trace/events/cma.h: In function 'do_trace_event_raw_event_cma_alloc_start':
>> include/trace/events/cma.h:56:24: error: 'struct trace_event_raw_cma_alloc_start' has no member named 'count'
      56 |                 __entry->count = request_count;
         |                        ^~
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
   include/trace/events/cma.h:39:1: note: in expansion of macro 'TRACE_EVENT'
      39 | TRACE_EVENT(cma_alloc_start,
         | ^~~~~~~~~~~
   include/trace/events/cma.h:54:9: note: in expansion of macro 'TP_fast_assign'
      54 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133:
   include/trace/events/cma.h: In function 'do_perf_trace_cma_alloc_start':
>> include/trace/events/cma.h:56:24: error: 'struct trace_event_raw_cma_alloc_start' has no member named 'count'
      56 |                 __entry->count = request_count;
         |                        ^~
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
   include/trace/events/cma.h:39:1: note: in expansion of macro 'TRACE_EVENT'
      39 | TRACE_EVENT(cma_alloc_start,
         | ^~~~~~~~~~~
   include/trace/events/cma.h:54:9: note: in expansion of macro 'TP_fast_assign'
      54 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +56 include/trace/events/cma.h

    38	
  > 39	TRACE_EVENT(cma_alloc_start,
    40	
    41		TP_PROTO(const char *name, unsigned long request_count, unsigned long available_count,
    42			unsigned long total_count, unsigned int align),
    43	
    44		TP_ARGS(name, request_count, available_count, total_count, align),
    45	
    46		TP_STRUCT__entry(
    47			__string(name, name)
    48			__field(unsigned long, request_count)
    49			__field(unsigned long, available_count)
    50			__field(unsigned long, total_count)
    51			__field(unsigned int, align)
    52		),
    53	
    54		TP_fast_assign(
    55			__assign_str(name);
  > 56			__entry->count = request_count;
    57			__entry->available_count = available_count;
    58			__entry->total_count = total_count;
    59			__entry->align = align;
    60		),
    61	
  > 62		TP_printk("name=%s count=%lu align=%u",
    63			  __get_str(name),
    64			  __entry->request_count,
    65			  __entry->available_count,
    66			  __entry->total_count,
    67			  __entry->align)
    68	);
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
