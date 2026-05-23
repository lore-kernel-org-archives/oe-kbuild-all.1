Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8A2472AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779567832; cv=none; b=Uh5voJgz6jQLEK41/U1cXHQV8z3jdbbYiHHe8Pk8AKaHI+T1518QwBZ89IO6X+5oHvN/gigtcXv0DHrmmBKmC0lEymC6hiSobNJb7JvRz2gj3+HBfBKNk4ByBsF29S0RFZ1TF7nzol7foSShMDGF00fegKMLjhDfgKSuD+BmzmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779567832; c=relaxed/simple;
	bh=hVyZm7RowaCnm6W9YouKbUuoq7TQJGljuh46KsGM0Tg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KnxLo4TD5hsV9Ie9r43NcAjtTJEwJVphvKSfhGTi/iGXmdmjmwrcT+ycYvPglzuo4ynZRXypBe/Yzm6ik95TfAdYZVTMXQM8xnW/6KwpMk9i9oa0ln68vEMgrz9jxGurrNVdx4Q75HrmiXLYARtDCFDhD4lhLMPFShWC8tbPBjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHhz8P9d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHhz8P9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779567827; x=1811103827;
  h=date:from:to:cc:subject:message-id;
  bh=hVyZm7RowaCnm6W9YouKbUuoq7TQJGljuh46KsGM0Tg=;
  b=OHhz8P9dZsHG29Onz/PQiqWOzlG+UlyrAyum/mYHsmHb2f/bGw2OG+fC
   6uC2UuQaroeS/HoqixqTypZL28asJxM58nQ98tYDzgJh3CWWIZwvIGRTU
   6QCRckGN9DKWRyGc5oXKb3POERdxtlRWT8YOh9X65g3QverCa1uiz3D3f
   FD/YL6Yn6QGoQmN66nJgxZPWsqDzeYse2dgrHMzCm0a/Q35D6Z9y5uU1X
   0dqf1v5QoDYVKvn07hHT+FgxIfNE6bgQvDPKQt0i/O9TXQ0PXe/WAy+Nf
   SUxYT84PdqY1llfKQ+2q25cFKPaQgfPWNiqbT38vQ5Kp5bHZSoRSGkt2u
   g==;
X-CSE-ConnectionGUID: yuwoz5hfQAa0IcCnYGaelw==
X-CSE-MsgGUID: gx4WuooETzaR/bWeMhUeoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="97881238"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="97881238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 13:23:47 -0700
X-CSE-ConnectionGUID: Q8q3G2HNSMe/CxUl/+zoMQ==
X-CSE-MsgGUID: MUwiuUnOQbiEsyZr5KBclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="265067970"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2026 13:23:45 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQssp-000000000K9-0neH;
	Sat, 23 May 2026 20:23:43 +0000
Date: Sun, 24 May 2026 04:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 135/137] fs/nfsd/./trace.h:1399:32: error:
 'struct trace_event_raw_nfsd_handle_dir_event' has no member named 'i_ino'
Message-ID: <202605240459.KHumjIY1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   32a48b959e92ab534d7109818e6f2f0d4013e249
commit: 04cc256388df5d2d284f4d9d3e9f22ebf974f806 [135/137] nfsd: fix ino_t format specifier in nfsd_handle_dir_event tracepoint
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605240459.KHumjIY1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240459.KHumjIY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240459.KHumjIY1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from fs/nfsd/trace.h:2781,
                    from fs/nfsd/trace.c:4:
   fs/nfsd/./trace.h: In function 'trace_raw_output_nfsd_handle_dir_event':
>> fs/nfsd/./trace.h:1399:32: error: 'struct trace_event_raw_nfsd_handle_dir_event' has no member named 'i_ino'
    1399 |                         __entry->i_ino, show_fsnotify_mask(__entry->mask),
         |                                ^~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   fs/nfsd/./trace.h:1381:1: note: in expansion of macro 'TRACE_EVENT'
    1381 | TRACE_EVENT(nfsd_handle_dir_event,
         | ^~~~~~~~~~~
   fs/nfsd/./trace.h:1397:9: note: in expansion of macro 'TP_printk'
    1397 |         TP_printk("inode=0x%x:0x%x:0x%llx mask=%s name=%s",
         |         ^~~~~~~~~
   fs/nfsd/./trace.h: In function 'do_trace_event_raw_event_nfsd_handle_dir_event':
   fs/nfsd/./trace.h:1394:24: error: 'struct trace_event_raw_nfsd_handle_dir_event' has no member named 'i_ino'
    1394 |                 __entry->i_ino = dir ? dir->i_ino : 0;
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
   fs/nfsd/./trace.h:1381:1: note: in expansion of macro 'TRACE_EVENT'
    1381 | TRACE_EVENT(nfsd_handle_dir_event,
         | ^~~~~~~~~~~
   fs/nfsd/./trace.h:1391:9: note: in expansion of macro 'TP_fast_assign'
    1391 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133:
   fs/nfsd/./trace.h: In function 'do_perf_trace_nfsd_handle_dir_event':
   fs/nfsd/./trace.h:1394:24: error: 'struct trace_event_raw_nfsd_handle_dir_event' has no member named 'i_ino'
    1394 |                 __entry->i_ino = dir ? dir->i_ino : 0;
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
   fs/nfsd/./trace.h:1381:1: note: in expansion of macro 'TRACE_EVENT'
    1381 | TRACE_EVENT(nfsd_handle_dir_event,
         | ^~~~~~~~~~~
   fs/nfsd/./trace.h:1391:9: note: in expansion of macro 'TP_fast_assign'
    1391 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +1399 fs/nfsd/./trace.h

65294c1f2c5e72b Jeff Layton 2019-08-18  1380  
cc1687d186b0542 Jeff Layton 2026-05-22  1381  TRACE_EVENT(nfsd_handle_dir_event,
cc1687d186b0542 Jeff Layton 2026-05-22  1382  	TP_PROTO(u32 mask, const struct inode *dir, const struct qstr *name),
cc1687d186b0542 Jeff Layton 2026-05-22  1383  	TP_ARGS(mask, dir, name),
cc1687d186b0542 Jeff Layton 2026-05-22  1384  	TP_STRUCT__entry(
cc1687d186b0542 Jeff Layton 2026-05-22  1385  		__field(u32, mask)
cc1687d186b0542 Jeff Layton 2026-05-22  1386  		__field(dev_t, s_dev)
04cc256388df5d2 Jeff Layton 2026-05-23  1387  		__field(ino_t, u64)
cc1687d186b0542 Jeff Layton 2026-05-22  1388  		__string_len(name, name ? name->name : NULL,
cc1687d186b0542 Jeff Layton 2026-05-22  1389  				   name ? name->len : 0)
cc1687d186b0542 Jeff Layton 2026-05-22  1390  	),
cc1687d186b0542 Jeff Layton 2026-05-22  1391  	TP_fast_assign(
cc1687d186b0542 Jeff Layton 2026-05-22  1392  		__entry->mask = mask;
cc1687d186b0542 Jeff Layton 2026-05-22  1393  		__entry->s_dev = dir ? dir->i_sb->s_dev : 0;
cc1687d186b0542 Jeff Layton 2026-05-22  1394  		__entry->i_ino = dir ? dir->i_ino : 0;
cc1687d186b0542 Jeff Layton 2026-05-22  1395  		__assign_str(name);
cc1687d186b0542 Jeff Layton 2026-05-22  1396  	),
04cc256388df5d2 Jeff Layton 2026-05-23  1397  	TP_printk("inode=0x%x:0x%x:0x%llx mask=%s name=%s",
cc1687d186b0542 Jeff Layton 2026-05-22  1398  			MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
cc1687d186b0542 Jeff Layton 2026-05-22 @1399  			__entry->i_ino, show_fsnotify_mask(__entry->mask),
cc1687d186b0542 Jeff Layton 2026-05-22  1400  			__get_str(name))
cc1687d186b0542 Jeff Layton 2026-05-22  1401  );
cc1687d186b0542 Jeff Layton 2026-05-22  1402  

:::::: The code at line 1399 was first introduced by commit
:::::: cc1687d186b0542390badca86c6a87e17c95b378 nfsd: add tracepoint to dir_event handler

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
