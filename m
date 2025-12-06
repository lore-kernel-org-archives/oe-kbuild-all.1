Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6664D2DC32D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765058409; cv=none; b=YL4e5vibdamWkJo25QN8TVcWcWRr+LeJS5c7Wvo/y+Eo0gdkrXVBrYPfJHzkAP32xtrSRXxG+TnqeHoiE+BjoKLiLB9K4J/iKucZYOrWJiX8viBlVdjfM2PlgLqbmrMXuiT0l220SrHV/2gzOyBrRGwlbepu1zYEICe8hpqmvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765058409; c=relaxed/simple;
	bh=LMkQpNAwCINmeGPeI036VebRkecwMeDVm+s6DgWRgw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJkzIV7f3a71WskRQVih0eWsCpeEBFo5FNPbFWvgboe0mEOQCTvZaLlLhTOoAHZ3BJKrrrl1kFsYTU1U9KWkE8gm1dgB8uc6QMShQm+3ITqphmUVrpeRRwN+VPajYyTP2p8Z4oEZ1wl6nqVFvFLEA14WUbcDomHyAQMktETOp4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dARnQDxU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dARnQDxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765058407; x=1796594407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMkQpNAwCINmeGPeI036VebRkecwMeDVm+s6DgWRgw4=;
  b=dARnQDxUkERuht9MMI9BkFYFIFpzCIxOaSwuv09I6XhMNrXNATG7WM+x
   4ZWS6cwjdpkzZfgYwgrWJrsBx58A3OdxKP+ZGx7YYiyWFYJvmgrMVooch
   pXMCFTKaalSIfwsuo9Ycimp98cDVTXxXMdHYlYBlk5nL+b2Mo6rr++ses
   Mmfo2guifoPobCBxPuheZX4Q07bm4vgOlXDstnS/ZO4qDr+hH84onYI0B
   AbPvisUhFfh/WAm7I3hD5NJV9DuNnQ/ktltdPho5qdlESKbZtGL2d69l0
   syu9MO7ApOQv27Z9nS6Hf1nROIHIkH/Bhqvucc9oHLIrYLtKkXLksIHDO
   Q==;
X-CSE-ConnectionGUID: 5OJrUOQIRW6d+2ra7RQsRQ==
X-CSE-MsgGUID: tdUnWhHVRweIvh14FDpdnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66950220"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66950220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 14:00:04 -0800
X-CSE-ConnectionGUID: YtYi5ZUtRz6XQBk62g1+Yw==
X-CSE-MsgGUID: yrvdj7pPTIiDUiaGfbQnKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226246692"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 14:00:03 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS0Jt-00000000IlV-0Djo;
	Sat, 06 Dec 2025 22:00:01 +0000
Date: Sun, 7 Dec 2025 05:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 67/84]
 fs/fuse/fuse_trace.h:195:3: error: no member named 'i_disk_size' in 'struct
 fuse_inode'
Message-ID: <202512070537.A5PBibOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   c7c260b520be1625f0276edbff4c5b61cba0bec3
commit: 2a70895e3c6d0819a02cefba820265e2e323e8fc [67/84] fuse_trace: allow local filesystems to set some VFS iflags
config: x86_64-randconfig-161-20251207 (https://download.01.org/0day-ci/archive/20251207/202512070537.A5PBibOT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070537.A5PBibOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070537.A5PBibOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fuse/trace.c:15:
   In file included from fs/fuse/fuse_trace.h:1164:
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
   In file included from fs/fuse/fuse_trace.h:1164:
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
   2 errors generated.


vim +195 fs/fuse/fuse_trace.h

   182	
   183	DECLARE_EVENT_CLASS(fuse_fileattr_class,
   184		TP_PROTO(const struct inode *inode, unsigned int old_iflags),
   185	
   186		TP_ARGS(inode, old_iflags),
   187	
   188		TP_STRUCT__entry(
   189			FUSE_INODE_FIELDS
   190			__field(unsigned int,		old_iflags)
   191			__field(unsigned int,		new_iflags)
   192		),
   193	
   194		TP_fast_assign(
 > 195			FUSE_INODE_ASSIGN(inode, fi, fm);
   196			__entry->old_iflags	=	old_iflags;
   197			__entry->new_iflags	=	inode->i_flags;
   198		),
   199	
   200		TP_printk(FUSE_INODE_FMT " old_iflags 0x%x iflags 0x%x",
   201			  FUSE_INODE_PRINTK_ARGS,
   202			  __entry->old_iflags,
   203			  __entry->new_iflags)
   204	);
   205	#define DEFINE_FUSE_FILEATTR_EVENT(name)	\
   206	DEFINE_EVENT(fuse_fileattr_class, name,		\
   207		TP_PROTO(const struct inode *inode, unsigned int old_iflags), \
   208		TP_ARGS(inode, old_iflags))
   209	DEFINE_FUSE_FILEATTR_EVENT(fuse_fileattr_update_inode);
   210	DEFINE_FUSE_FILEATTR_EVENT(fuse_fileattr_init);
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
