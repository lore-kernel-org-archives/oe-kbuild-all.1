Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65919818
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706402177; cv=none; b=EvYa4SldryYNpV+Cwo3yebP+FfRNoQDivPBIxd01Rz1/B05AEdFCNvgr9sQXpRj1hR0v96QvTD/2Tht/kUDrTk+KQ63FbfjOFIDXqOhmyfbyYsw3zyBmOTHvib9pt0b0zWkmtKTOXWtegmm9313KP1SUO4W5vHxr5Wra/zWysyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706402177; c=relaxed/simple;
	bh=EAf/u9vFTkosT5V962h4Ni3mQFQS7UgQpQMYIwZPgHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJzCUT8Bi4mvpVYZ2vxwNqp0/tx2eUbdQ4kpNrM4caK+OUgyjHKX6bKV6341EJotAEEmA78IQNakEKs4pj/TSu93SuUYMDRKFIMg15BT25g3yYoBuWjmaWkAr6dpYNr4hkq6RI/HBpFsLguXqvQ3gxLR1ZB1FpwIZFtHNHXzKDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZ9kamMy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZ9kamMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706402175; x=1737938175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAf/u9vFTkosT5V962h4Ni3mQFQS7UgQpQMYIwZPgHI=;
  b=UZ9kamMyCm8oi8T66pHkfzZoN6AiyySp1gtXcu37zJLUrAqsFymty4rf
   VfXXSMjzx4/bUBsXD2qWn0DF8ozJdDPTOj3BVPUqpMpX02IJ4FTfnFMg4
   +foKZQTwSXSpjrwsXl0BOa1NN7FGxgcc/jwmdtWxz17sLwMeRaQRlH7W/
   KPMDi9Gpr9KJE/umfm79Dl0UsB11TMTQcrN22ZpuenQEPDNyWHogAiaKj
   E7l40EANbGuBqyM63EqTairt9EHFgrgKm6Ua4SWvi3kTjR4FqYcwrO4RV
   BKToQ26GmGYvftgsiiOK7Ds/m5k5JxGzRH96Mt8sqWMTaB/oIcrj2x8Lc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9835861"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9835861"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3097720"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2024 16:36:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTt9a-0002ue-0y;
	Sun, 28 Jan 2024 00:36:06 +0000
Date: Sun, 28 Jan 2024 08:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 115/275] fs/xfs/./xfs_trace.h:4680:18:
 warning: assignment to 'int' from 'struct trace_event_fields *' makes
 integer from pointer without a cast
Message-ID: <202401280834.nlnj04Uk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   370f4f5a373f371e76fdc9634867b15775947255
commit: 419a4e475da9d40a65908b125856d1bb218a2c7d [115/275] xfs: connect in-memory btrees to xfiles
config: x86_64-randconfig-015-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280834.nlnj04Uk-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280834.nlnj04Uk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280834.nlnj04Uk-lkp@intel.com/

Note: the djwong-xfs/vectorized-scrub HEAD 370f4f5a373f371e76fdc9634867b15775947255 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:4705,
                    from fs/xfs/xfs_trace.c:56:
   fs/xfs/./xfs_trace.h:4674:11: error: unknown type name 'xfs_btnum_t'
    4674 |   __field(xfs_btnum_t, btnum)
         |           ^~~~~~~~~~~
   include/trace/trace_events.h:54:3: note: in definition of macro 'DECLARE_EVENT_CLASS'
      54 |   tstruct       \
         |   ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:4705,
                    from fs/xfs/xfs_trace.c:56:
   fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfbtree_freesp_class':
   fs/xfs/./xfs_trace.h:4686:38: error: 'XFS_BTNUM_STRINGS' undeclared (first use in this function); did you mean 'XFS_PTAG_STRINGS'?
    4686 |     __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                                      ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:27: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |  trace_event_printf(iter, print);    \
         |                           ^~~~~
   fs/xfs/./xfs_trace.h:4684:2: note: in expansion of macro 'TP_printk'
    4684 |  TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
         |  ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4686:5: note: in expansion of macro '__print_symbolic'
    4686 |     __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |     ^~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4686:38: note: each undeclared identifier is reported only once for each function it appears in
    4686 |     __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                                      ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:27: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |  trace_event_printf(iter, print);    \
         |                           ^~~~~
   fs/xfs/./xfs_trace.h:4684:2: note: in expansion of macro 'TP_printk'
    4684 |  TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
         |  ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4686:5: note: in expansion of macro '__print_symbolic'
    4686 |     __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |     ^~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:4705,
                    from fs/xfs/xfs_trace.c:56:
   fs/xfs/./xfs_trace.h: At top level:
   fs/xfs/./xfs_trace.h:4674:11: error: 'xfs_btnum_t' undeclared here (not in a function); did you mean 'xfs_rtxnum_t'?
    4674 |   __field(xfs_btnum_t, btnum)
         |           ^~~~~~~~~~~
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
>> include/trace/stages/stage4_event_fields.h:10:10: warning: initialization of 'int' from 'const struct trace_print_flags *' makes integer from pointer without a cast [-Wint-conversion]
      10 |  .size = sizeof(_type), .align = ALIGN_STRUCTFIELD(_type), \
         |          ^~~~~~
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   include/trace/stages/stage4_event_fields.h:10:10: note: (near initialization for 'trace_event_fields_xfbtree_freesp_class[1].<anonymous>.<anonymous>.size')
      10 |  .size = sizeof(_type), .align = ALIGN_STRUCTFIELD(_type), \
         |          ^~~~~~
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
>> include/trace/stages/stage4_event_fields.h:10:10: error: initializer element is not constant
      10 |  .size = sizeof(_type), .align = ALIGN_STRUCTFIELD(_type), \
         |          ^~~~~~
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   include/trace/stages/stage4_event_fields.h:10:10: note: (near initialization for 'trace_event_fields_xfbtree_freesp_class[1].<anonymous>.<anonymous>.size')
      10 |  .size = sizeof(_type), .align = ALIGN_STRUCTFIELD(_type), \
         |          ^~~~~~
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   fs/xfs/./xfs_trace.h:4674:11: error: expected specifier-qualifier-list before 'xfs_btnum_t'
    4674 |   __field(xfs_btnum_t, btnum)
         |           ^~~~~~~~~~~
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:10:34: note: in expansion of macro 'ALIGN_STRUCTFIELD'
      10 |  .size = sizeof(_type), .align = ALIGN_STRUCTFIELD(_type), \
         |                                  ^~~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
>> include/linux/compiler.h:242:32: error: called object is not a function or function pointer
     242 | #define is_signed_type(type) (((type)(-1)) < (__force type)1)
         |                                ^
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:11:15: note: in expansion of macro 'is_signed_type'
      11 |  .is_signed = is_signed_type(_type), .filter_type = _filter_type },
         |               ^~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   include/linux/compiler.h:242:60: error: expected ')' before numeric constant
     242 | #define is_signed_type(type) (((type)(-1)) < (__force type)1)
         |                              ~                             ^
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:11:15: note: in expansion of macro 'is_signed_type'
      11 |  .is_signed = is_signed_type(_type), .filter_type = _filter_type },
         |               ^~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   include/linux/compiler.h:242:30: error: initializer element is not constant
     242 | #define is_signed_type(type) (((type)(-1)) < (__force type)1)
         |                              ^
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:11:15: note: in expansion of macro 'is_signed_type'
      11 |  .is_signed = is_signed_type(_type), .filter_type = _filter_type },
         |               ^~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   include/linux/compiler.h:242:30: note: (near initialization for 'trace_event_fields_xfbtree_freesp_class[1].<anonymous>.<anonymous>.is_signed')
     242 | #define is_signed_type(type) (((type)(-1)) < (__force type)1)
         |                              ^
   include/trace/trace_events.h:244:2: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |  tstruct        \
         |  ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:2: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |  TP_STRUCT__entry(
         |  ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:11:15: note: in expansion of macro 'is_signed_type'
      11 |  .is_signed = is_signed_type(_type), .filter_type = _filter_type },
         |               ^~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:29: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item) __field_ext(type, item, FILTER_OTHER)
         |                             ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:3: note: in expansion of macro '__field'
    4674 |   __field(xfs_btnum_t, btnum)
         |   ^~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:4705,
                    from fs/xfs/xfs_trace.c:56:
   fs/xfs/./xfs_trace.h: In function 'trace_event_raw_event_xfbtree_freesp_class':
   fs/xfs/./xfs_trace.h:4680:23: error: 'struct xfs_btree_cur' has no member named 'bc_btnum'
    4680 |   __entry->btnum = cur->bc_btnum;
         |                       ^~
   include/trace/trace_events.h:402:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |  { assign; }       \
         |    ^~~~~~
   fs/xfs/./xfs_trace.h:4678:2: note: in expansion of macro 'TP_fast_assign'
    4678 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
>> fs/xfs/./xfs_trace.h:4680:18: warning: assignment to 'int' from 'struct trace_event_fields *' makes integer from pointer without a cast [-Wint-conversion]
    4680 |   __entry->btnum = cur->bc_btnum;
         |                  ^
   include/trace/trace_events.h:402:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |  { assign; }       \
         |    ^~~~~~
   fs/xfs/./xfs_trace.h:4678:2: note: in expansion of macro 'TP_fast_assign'
    4678 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103,
                    from fs/xfs/xfs_trace.h:4705,
                    from fs/xfs/xfs_trace.c:56:
   fs/xfs/./xfs_trace.h: In function 'perf_trace_xfbtree_freesp_class':
   fs/xfs/./xfs_trace.h:4680:23: error: 'struct xfs_btree_cur' has no member named 'bc_btnum'
    4680 |   __entry->btnum = cur->bc_btnum;
         |                       ^~
   include/trace/perf.h:51:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   fs/xfs/./xfs_trace.h:4678:2: note: in expansion of macro 'TP_fast_assign'
    4678 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
>> fs/xfs/./xfs_trace.h:4680:18: warning: assignment to 'int' from 'struct trace_event_fields *' makes integer from pointer without a cast [-Wint-conversion]
    4680 |   __entry->btnum = cur->bc_btnum;
         |                  ^
   include/trace/perf.h:51:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   fs/xfs/./xfs_trace.h:4678:2: note: in expansion of macro 'TP_fast_assign'
    4678 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~


vim +4680 fs/xfs/./xfs_trace.h

  4667	
  4668	DECLARE_EVENT_CLASS(xfbtree_freesp_class,
  4669		TP_PROTO(struct xfbtree *xfbt, struct xfs_btree_cur *cur,
  4670			 xfs_fileoff_t fileoff),
  4671		TP_ARGS(xfbt, cur, fileoff),
  4672		TP_STRUCT__entry(
  4673			__field(unsigned long, xfino)
  4674			__field(xfs_btnum_t, btnum)
  4675			__field(int, nlevels)
  4676			__field(xfs_fileoff_t, fileoff)
  4677		),
  4678		TP_fast_assign(
  4679			__entry->xfino = xfbtree_ino(xfbt);
> 4680			__entry->btnum = cur->bc_btnum;
  4681			__entry->nlevels = cur->bc_nlevels;
  4682			__entry->fileoff = fileoff;
  4683		),
  4684		TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
  4685			  __entry->xfino,
  4686			  __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
  4687			  __entry->nlevels,
  4688			  (unsigned long long)__entry->fileoff)
  4689	)
  4690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
