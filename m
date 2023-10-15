Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285A7FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 00:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik3OjJdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697330711; x=1728866711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IY4OwZh1CleGde2AMusK8qYYTOv+nkeGPPam6yY+tnY=;
  b=ik3OjJduyvWtbP9Rv2W1n3DVCiNyp/3QY9sHCe0aj6s/pl+fCY2E7jgD
   0XbPxfQgiQq6Gq//X1Tle1wNScKlbBRON6ojmiMPKvE0t33ScV5IBn2Eo
   BoUdikx5BwQqSTkij86+jQl69lyfgxj/GOtoz1s4FyV1v4Mj0yj0Sh1yD
   Y1rw61Jaz49W9iUXi4zLDCkETXTuv4ZpK3MJE3+2JLsQWv1/fI7BSb0LV
   MHjVQ9B1zLpq6cHNfBmhvK6AasEQ3jTT0i1DjzqtuiNmBZq8LT74Uhv/p
   M4gSF5d8hzyqQx3R70wLGMSs8DUT2fCvy6I0N4/rC46ip84w3pTeKl5oB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370427471"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="370427471"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 17:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731810821"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="731810821"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 17:45:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrpFj-0006rx-07;
	Sun, 15 Oct 2023 00:45:07 +0000
Date: Sun, 15 Oct 2023 08:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-kitchen-sink 44/55] include/trace/events/dyndbg.h:35:48:
 error: 'const struct _ddebug' has no member named 'modname'
Message-ID: <202310150844.eBrGSmj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-kitchen-sink
head:   7e157cd3c1be4bbc30eddcbfea1ed696e904de89
commit: d29863260b8ca9da769e1a94192bda326b2482b4 [44/55] dyndbg: add 2 trace-events: pr_debug, dev_dbg
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20231015/202310150844.eBrGSmj9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150844.eBrGSmj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150844.eBrGSmj9-lkp@intel.com/

Note: the jimc/dd-kitchen-sink HEAD 7e157cd3c1be4bbc30eddcbfea1ed696e904de89 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/dyndbg.h:74,
                    from lib/dynamic_debug.c:44:
   include/trace/events/dyndbg.h: In function 'trace_raw_output_prdbg':
>> include/trace/events/dyndbg.h:35:48: error: 'const struct _ddebug' has no member named 'modname'
      35 |             TP_printk("%s.%s %s", __entry->desc->modname,
         |                                                ^~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/dyndbg.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(prdbg,
         | ^~~~~~~~~~~
   include/trace/events/dyndbg.h:35:13: note: in expansion of macro 'TP_printk'
      35 |             TP_printk("%s.%s %s", __entry->desc->modname,
         |             ^~~~~~~~~
>> include/trace/events/dyndbg.h:36:36: error: 'const struct _ddebug' has no member named 'function'
      36 |                       __entry->desc->function, __get_str(msg))
         |                                    ^~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/dyndbg.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(prdbg,
         | ^~~~~~~~~~~
   include/trace/events/dyndbg.h:35:13: note: in expansion of macro 'TP_printk'
      35 |             TP_printk("%s.%s %s", __entry->desc->modname,
         |             ^~~~~~~~~
   include/trace/events/dyndbg.h: In function 'trace_raw_output_devdbg':
   include/trace/events/dyndbg.h:67:48: error: 'const struct _ddebug' has no member named 'modname'
      67 |             TP_printk("%s.%s %s", __entry->desc->modname,
         |                                                ^~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/dyndbg.h:40:1: note: in expansion of macro 'TRACE_EVENT'
      40 | TRACE_EVENT(devdbg,
         | ^~~~~~~~~~~
   include/trace/events/dyndbg.h:67:13: note: in expansion of macro 'TP_printk'
      67 |             TP_printk("%s.%s %s", __entry->desc->modname,
         |             ^~~~~~~~~
   include/trace/events/dyndbg.h:68:36: error: 'const struct _ddebug' has no member named 'function'
      68 |                       __entry->desc->function, __get_str(msg))
         |                                    ^~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/dyndbg.h:40:1: note: in expansion of macro 'TRACE_EVENT'
      40 | TRACE_EVENT(devdbg,
         | ^~~~~~~~~~~
   include/trace/events/dyndbg.h:67:13: note: in expansion of macro 'TP_printk'
      67 |             TP_printk("%s.%s %s", __entry->desc->modname,
         |             ^~~~~~~~~
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:120:6: warning: no previous prototype for 'ddebug_clear_prefix_cache' [-Wmissing-prototypes]
     120 | void ddebug_clear_prefix_cache(const struct _ddebug *dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +35 include/trace/events/dyndbg.h

     9	
    10	/* capture pr_debug() callsite descriptor and message */
    11	TRACE_EVENT(prdbg,
    12		    TP_PROTO(const struct _ddebug *desc, const char *text, size_t len),
    13	
    14		    TP_ARGS(desc, text, len),
    15	
    16		    TP_STRUCT__entry(
    17			    __field(const struct _ddebug *, desc)
    18			    __dynamic_array(char, msg, len + 1)
    19			    ),
    20	
    21		    TP_fast_assign(
    22			    __entry->desc = desc;
    23			    /*
    24			     * Each trace entry is printed in a new line.
    25			     * If the msg finishes with '\n', cut it off
    26			     * to avoid blank lines in the trace.
    27			     */
    28			    if (len > 0 && (text[len - 1] == '\n'))
    29				    len -= 1;
    30	
    31			    memcpy(__get_str(msg), text, len);
    32			    __get_str(msg)[len] = 0;
    33			    ),
    34	
  > 35		    TP_printk("%s.%s %s", __entry->desc->modname,
  > 36			      __entry->desc->function, __get_str(msg))
    37	);
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
