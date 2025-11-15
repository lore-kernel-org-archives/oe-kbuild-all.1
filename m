Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E998F49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763172311; cv=none; b=fxXnLOR6r5G9YMk1nemPFzW1ghVXMgQMVTdsB5dGrSgz/H0wzmFKtSvODCj1K5yXnOAUCFCDh9ddeOfpxzkb8T9F/cxAcwpY/PH+FCJ8oV9ZwTJH0i2zQnR9FaTiCGJsZ0oct4nX27JwbHQZ2W38UCef5bUlLIB5j7RhWLXg7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763172311; c=relaxed/simple;
	bh=/2JOOwdY4oZyR9ZYAR294dXYQiG6hXGudvjPubw1sHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q72pwmx8kkEHOwharl2mOq0skZfx+L3Tl4639D4mvuTe+MN02/MQmG2RKQj+4QOQqpkbu32OB/jVBKTBAKGNSDEcPz62e0vgRJ3KuRKiWnTnbDnx0dDaOTCbDTBknwjhQtuTRHh1Jm7uMrRtDMzye6mMxsRBG96v2GB/FxH3eAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4dbGW/L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4dbGW/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763172309; x=1794708309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2JOOwdY4oZyR9ZYAR294dXYQiG6hXGudvjPubw1sHM=;
  b=R4dbGW/L3fES7ylrmkFgh5D/q18WHM/ZHzqyv0snsJtY2EUMD1hh9W61
   K4Qdw5w8Eynd4qvidtwgKORg5a2f7l3VIhKReUmwyyqwaVLe0iPyCBztv
   zN1NWTzBOlSxATBPgeA7EKe+5fBruZVrtOA2bsVCE8EtdkifbpI/5YFrL
   Eo4a95Vu1OaDWO4SivlditxqTJ9wWTe8kFGUezkDWqGXXqb3WpxLQ5A0s
   rADrtAWl+ZjIj8lBfm6R0cgzvijcLODAD2cuKjikfkSuQswkMXAJEwbcL
   /s4L7oFa8HpRIF9M4l2F5urWNvrA+PP1QSB2JQ/ce9CugR4a47+D2EsQH
   g==;
X-CSE-ConnectionGUID: WtJ4dCimS5GGDCYpJf3jhw==
X-CSE-MsgGUID: RjprkSV0Rcmivprz9qjRvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76371818"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="76371818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 18:05:07 -0800
X-CSE-ConnectionGUID: foDooTfzTEKbtNJpYbNpzA==
X-CSE-MsgGUID: +3U5XST0QZO91dkA5GMmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189187262"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2025 18:05:05 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK5ex-0007dp-2M;
	Sat, 15 Nov 2025 02:05:03 +0000
Date: Sat, 15 Nov 2025 10:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 92/104]
 fs/fuse/fuse_trace.h:195:3: error: no member named 'i_disk_size' in 'struct
 fuse_inode'
Message-ID: <202511150921.0YfjvFvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-ioerr-reporting
head:   fcfa2d1ca43ca32450cc8f8577771778de9a4da3
commit: a4807f31ce423b62a3a49487b5dced5dab433a9d [92/104] fuse: track on-disk file size for iomap files
config: x86_64-randconfig-073-20251114 (https://download.01.org/0day-ci/archive/20251115/202511150921.0YfjvFvL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150921.0YfjvFvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150921.0YfjvFvL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fuse/trace.c:15:
   In file included from fs/fuse/fuse_trace.h:1637:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:468:
>> fs/fuse/fuse_trace.h:195:3: error: no member named 'i_disk_size' in 'struct fuse_inode'
     183 |         TP_STRUCT__entry(
         |         ~~~~~~~~~~~~~~~~~
     184 |                 FUSE_INODE_FIELDS
         |                 ~~~~~~~~~~~~~~~~~
     185 |                 __field(unsigned int,           old_iflags)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |                 __field(unsigned int,           new_iflags)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     187 |         ),
         |         ~~
     188 | 
     189 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     190 |                 FUSE_INODE_ASSIGN(inode, fi, fm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     191 |                 __entry->old_iflags     =       old_iflags;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                 __entry->new_iflags     =       inode->i_flags;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     193 |         ),
         |         ~~
     194 | 
     195 |         TP_printk(FUSE_INODE_FMT " old_iflags 0x%x iflags 0x%x",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     196 |                   FUSE_INODE_PRINTK_ARGS,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~
     197 |                   __entry->old_iflags,
         |                   ~~~~~~~~~~~~~~~~~~~~
     198 |                   __entry->new_iflags)
         |                   ~~~~~~~~~~~~~~~~~~~~
   fs/fuse/fuse_trace.h:101:14: note: expanded from macro 'FUSE_INODE_ASSIGN'
     101 |                                                         (fi)->i_disk_size : 0
         |                                                               ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:435:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     433 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ~
     434 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:139:25: note: expanded from macro 'PARAMS'
     139 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:427:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from fs/fuse/trace.c:15:
   In file included from fs/fuse/fuse_trace.h:1637:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:468:
   fs/fuse/fuse_trace.h:226:3: error: no member named 'i_disk_size' in 'struct fuse_inode'
     212 |                 __field(umode_t,                mode)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     213 |                 __field(uint32_t,               valid)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     214 |                 __field(umode_t,                new_mode)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     215 |                 __field(uint64_t,               new_size)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     216 |         ),
         |         ~~
     217 | 
     218 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     219 |                 FUSE_INODE_ASSIGN(inode, fi, fm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     220 |                 __entry->mode           =       inode->i_mode;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     221 |                 __entry->valid          =       inarg->valid;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |                 __entry->new_mode       =       inarg->mode;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                 __entry->new_size       =       inarg->size;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     224 |         ),
         |         ~~
     225 | 
     226 |         TP_printk(FUSE_INODE_FMT " mode 0%o valid 0x%x new_mode 0%o new_size 0x%llx",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     227 |                   FUSE_INODE_PRINTK_ARGS,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/fuse_trace.h:101:14: note: expanded from macro 'FUSE_INODE_ASSIGN'
     101 |                                                         (fi)->i_disk_size : 0
         |                                                               ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:435:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     433 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ~
     434 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:139:25: note: expanded from macro 'PARAMS'
     139 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:427:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from fs/fuse/trace.c:15:
   In file included from fs/fuse/fuse_trace.h:1637:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:468:
   fs/fuse/fuse_trace.h:255:3: error: no member named 'i_disk_size' in 'struct fuse_inode'
     241 |                 __field(umode_t,                mode)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     242 |                 __field(uint32_t,               valid)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                 __field(umode_t,                new_mode)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     244 |                 __field(uint64_t,               new_size)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     245 |         ),
         |         ~~
     246 | 
     247 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     248 |                 FUSE_INODE_ASSIGN(inode, fi, fm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |                 __entry->mode           =       inode->i_mode;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                 __entry->valid          =       inarg->ia_valid;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     251 |                 __entry->new_mode       =       inarg->ia_mode;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                 __entry->new_size       =       inarg->ia_size;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     253 |         ),
         |         ~~
     254 | 
     255 |         TP_printk(FUSE_INODE_FMT " mode 0%o valid 0x%x new_mode 0%o new_size 0x%llx",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     256 |                   FUSE_INODE_PRINTK_ARGS,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/fuse_trace.h:101:14: note: expanded from macro 'FUSE_INODE_ASSIGN'
     101 |                                                         (fi)->i_disk_size : 0
         |                                                               ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:435:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     433 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ~
     434 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     435 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:139:25: note: expanded from macro 'PARAMS'
     139 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:427:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     427 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from fs/fuse/trace.c:15:
   In file included from fs/fuse/fuse_trace.h:1637:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> fs/fuse/fuse_trace.h:195:3: error: no member named 'i_disk_size' in 'struct fuse_inode'
     183 |         TP_STRUCT__entry(
         |         ~~~~~~~~~~~~~~~~~
     184 |                 FUSE_INODE_FIELDS
         |                 ~~~~~~~~~~~~~~~~~
     185 |                 __field(unsigned int,           old_iflags)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |                 __field(unsigned int,           new_iflags)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     187 |         ),
         |         ~~
     188 | 
     189 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     190 |                 FUSE_INODE_ASSIGN(inode, fi, fm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     191 |                 __entry->old_iflags     =       old_iflags;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                 __entry->new_iflags     =       inode->i_flags;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     193 |         ),
         |         ~~
     194 | 
     195 |         TP_printk(FUSE_INODE_FMT " old_iflags 0x%x iflags 0x%x",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     196 |                   FUSE_INODE_PRINTK_ARGS,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~
     197 |                   __entry->old_iflags,
         |                   ~~~~~~~~~~~~~~~~~~~~
     198 |                   __entry->new_iflags)
         |                   ~~~~~~~~~~~~~~~~~~~~
   fs/fuse/fuse_trace.h:101:14: note: expanded from macro 'FUSE_INODE_ASSIGN'
     101 |                                                         (fi)->i_disk_size : 0
         |                                                               ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/perf.h:67:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
      65 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ~
      66 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:139:25: note: expanded from macro 'PARAMS'
     139 | #define PARAMS(args...) args
         |                         ^
   include/trace/perf.h:51:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from fs/fuse/trace.c:15:
   In file included from fs/fuse/fuse_trace.h:1637:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
   fs/fuse/fuse_trace.h:226:3: error: no member named 'i_disk_size' in 'struct fuse_inode'
     212 |                 __field(umode_t,                mode)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     213 |                 __field(uint32_t,               valid)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     214 |                 __field(umode_t,                new_mode)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     215 |                 __field(uint64_t,               new_size)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     216 |         ),
         |         ~~
     217 | 
     218 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     219 |                 FUSE_INODE_ASSIGN(inode, fi, fm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     220 |                 __entry->mode           =       inode->i_mode;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     221 |                 __entry->valid          =       inarg->valid;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |                 __entry->new_mode       =       inarg->mode;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                 __entry->new_size       =       inarg->size;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     224 |         ),
         |         ~~
     225 | 
     226 |         TP_printk(FUSE_INODE_FMT " mode 0%o valid 0x%x new_mode 0%o new_size 0x%llx",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     227 |                   FUSE_INODE_PRINTK_ARGS,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/fuse_trace.h:101:14: note: expanded from macro 'FUSE_INODE_ASSIGN'
     101 |                                                         (fi)->i_disk_size : 0
         |                                                               ^
   include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
     133 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +195 fs/fuse/fuse_trace.h

396b209e405a571 Josef Bacik     2024-07-03  182  
7c57f211f99a4cd Darrick J. Wong 2025-09-12  183  DECLARE_EVENT_CLASS(fuse_fileattr_class,
7c57f211f99a4cd Darrick J. Wong 2025-09-12  184  	TP_PROTO(const struct inode *inode, unsigned int old_iflags),
7c57f211f99a4cd Darrick J. Wong 2025-09-12  185  
7c57f211f99a4cd Darrick J. Wong 2025-09-12  186  	TP_ARGS(inode, old_iflags),
7c57f211f99a4cd Darrick J. Wong 2025-09-12  187  
7c57f211f99a4cd Darrick J. Wong 2025-09-12  188  	TP_STRUCT__entry(
7c57f211f99a4cd Darrick J. Wong 2025-09-12  189  		FUSE_INODE_FIELDS
7c57f211f99a4cd Darrick J. Wong 2025-09-12  190  		__field(unsigned int,		old_iflags)
7c57f211f99a4cd Darrick J. Wong 2025-09-12  191  		__field(unsigned int,		new_iflags)
7c57f211f99a4cd Darrick J. Wong 2025-09-12  192  	),
7c57f211f99a4cd Darrick J. Wong 2025-09-12  193  
7c57f211f99a4cd Darrick J. Wong 2025-09-12  194  	TP_fast_assign(
7c57f211f99a4cd Darrick J. Wong 2025-09-12 @195  		FUSE_INODE_ASSIGN(inode, fi, fm);
7c57f211f99a4cd Darrick J. Wong 2025-09-12  196  		__entry->old_iflags	=	old_iflags;
7c57f211f99a4cd Darrick J. Wong 2025-09-12  197  		__entry->new_iflags	=	inode->i_flags;
7c57f211f99a4cd Darrick J. Wong 2025-09-12  198  	),
7c57f211f99a4cd Darrick J. Wong 2025-09-12  199  
7c57f211f99a4cd Darrick J. Wong 2025-09-12  200  	TP_printk(FUSE_INODE_FMT " old_iflags 0x%x iflags 0x%x",
7c57f211f99a4cd Darrick J. Wong 2025-09-12  201  		  FUSE_INODE_PRINTK_ARGS,
7c57f211f99a4cd Darrick J. Wong 2025-09-12  202  		  __entry->old_iflags,
7c57f211f99a4cd Darrick J. Wong 2025-09-12  203  		  __entry->new_iflags)
7c57f211f99a4cd Darrick J. Wong 2025-09-12  204  );
7c57f211f99a4cd Darrick J. Wong 2025-09-12  205  #define DEFINE_FUSE_FILEATTR_EVENT(name)	\
7c57f211f99a4cd Darrick J. Wong 2025-09-12  206  DEFINE_EVENT(fuse_fileattr_class, name,		\
7c57f211f99a4cd Darrick J. Wong 2025-09-12  207  	TP_PROTO(const struct inode *inode, unsigned int old_iflags), \
7c57f211f99a4cd Darrick J. Wong 2025-09-12  208  	TP_ARGS(inode, old_iflags))
7c57f211f99a4cd Darrick J. Wong 2025-09-12  209  DEFINE_FUSE_FILEATTR_EVENT(fuse_fileattr_update_inode);
7c57f211f99a4cd Darrick J. Wong 2025-09-12  210  DEFINE_FUSE_FILEATTR_EVENT(fuse_fileattr_init);
7c57f211f99a4cd Darrick J. Wong 2025-09-12  211  

:::::: The code at line 195 was first introduced by commit
:::::: 7c57f211f99a4cd04afd78b6759d97f87d1e07bb fuse_trace: allow local filesystems to set some VFS iflags

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
