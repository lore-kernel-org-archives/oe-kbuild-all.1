Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60D23ED5B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 22:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765059070; cv=none; b=AINhRi5QDucNd0248F67UoNGK0IWBTElX2KL2FF77g3w/DFozc0g5PkX33v8kKb6Oz3GaveIC3q2hSmBor/6xF6bztRNcyh678j8u/GideGpWE13DSxTT7sViVpi3J8Oe7KjtE56SBDe9CXCCx1ltjxSpBr9U2ej/ecMpvKB2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765059070; c=relaxed/simple;
	bh=bNOZhYK2I7LKyoYuL/DZvHAhJen5agtAl9/7n6GIHdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1TrYBTBzjWe2Sgk7sWaE/pS4j5A17tUsqrLaUrUOGxVahtLBILcCB0Wh7Y5pjTV1mYzsqb7TpjZ1PGk0uJ5PR2/dgeC/9XOPLdgV8qzZ0HcyvuoxbivqcAzTd2QUi8acYRL+80eSF+5gTYV6Qh5KM9bKb5Yv1bvLvWHNFhZk90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLg+yRqC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLg+yRqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765059067; x=1796595067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNOZhYK2I7LKyoYuL/DZvHAhJen5agtAl9/7n6GIHdM=;
  b=OLg+yRqC1Y5WiZePDSKKAs2WebGhA+9FJbdKiwoTNg0ui8NEYwyz96sI
   TvzppkZ1mCJzy1OIuw6zD0Kr362rnlE1IaG/WoFTs0Q5+rUwGyV8byX5/
   pxSUcBqnG8l6/8zlpcL/7qwu9svQSchsEmjhYCIJccbRDfPX5MenfZCyC
   UbzFWIQoWDSLgPZfvchTkg548aejQeLMUqCAxWsyV0TfTxDIM59uwbDdW
   ycAXzfXxsbNjWLcmyv3fLBqdmpg97+whgABy4XEI1+nKp0l6MMNSv8I9U
   t8hbhO8rCLnGvzyhz5niiBPKxg4iNA1xOokveaLRg35EXXavItwUsMzpN
   Q==;
X-CSE-ConnectionGUID: zhWZPvqrTI+YlpbS3O71cg==
X-CSE-MsgGUID: 8bDRG3KEShm/4ap57BJgyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67219215"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67219215"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 14:11:05 -0800
X-CSE-ConnectionGUID: i79czWfXTxqO9NygJdNW7Q==
X-CSE-MsgGUID: U8iz/ubdS0S8+DnVz7y+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="232961512"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2025 14:11:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS0UX-00000000Im1-2xar;
	Sat, 06 Dec 2025 22:11:01 +0000
Date: Sun, 7 Dec 2025 06:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 67/84]
 fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no
 member named 'i_disk_size'
Message-ID: <202512070624.LRj2vM0C-lkp@intel.com>
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
config: sparc64-randconfig-r073-20251207 (https://download.01.org/0day-ci/archive/20251207/202512070624.LRj2vM0C-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070624.LRj2vM0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070624.LRj2vM0C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from fs/fuse/fuse_trace.h:1164,
                    from fs/fuse/trace.c:15:
   fs/fuse/./fuse_trace.h: In function 'do_trace_event_raw_event_fuse_fileattr_class':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
           (fi)->i_disk_size : 0
               ^~
   include/trace/trace_events.h:427:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     { assign; }       \
       ^~~~~~
   include/trace/trace_events.h:435:9: note: in expansion of macro 'PARAMS'
            PARAMS(assign), PARAMS(print))   \
            ^~~~~~
   fs/fuse/./fuse_trace.h:183:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
    DECLARE_EVENT_CLASS(fuse_fileattr_class,
    ^~~~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:194:2: note: in expansion of macro 'TP_fast_assign'
     TP_fast_assign(
     ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:195:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
      FUSE_INODE_ASSIGN(inode, fi, fm);
      ^~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133,
                    from fs/fuse/fuse_trace.h:1164,
                    from fs/fuse/trace.c:15:
   fs/fuse/./fuse_trace.h: In function 'do_perf_trace_fuse_fileattr_class':
>> fs/fuse/./fuse_trace.h:101:12: error: 'const struct fuse_inode' has no member named 'i_disk_size'
           (fi)->i_disk_size : 0
               ^~
   include/trace/perf.h:51:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     { assign; }       \
       ^~~~~~
   include/trace/perf.h:67:9: note: in expansion of macro 'PARAMS'
            PARAMS(assign), PARAMS(print))   \
            ^~~~~~
   fs/fuse/./fuse_trace.h:183:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
    DECLARE_EVENT_CLASS(fuse_fileattr_class,
    ^~~~~~~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:194:2: note: in expansion of macro 'TP_fast_assign'
     TP_fast_assign(
     ^~~~~~~~~~~~~~
   fs/fuse/./fuse_trace.h:195:3: note: in expansion of macro 'FUSE_INODE_ASSIGN'
      FUSE_INODE_ASSIGN(inode, fi, fm);
      ^~~~~~~~~~~~~~~~~


vim +101 fs/fuse/./fuse_trace.h

396b209e405a57 Josef Bacik     2024-07-03   83  
facab7b602718e Darrick J. Wong 2025-09-12   84  /* tracepoint boilerplate so we don't have to keep doing this */
facab7b602718e Darrick J. Wong 2025-09-12   85  #define FUSE_INODE_FIELDS \
facab7b602718e Darrick J. Wong 2025-09-12   86  		__field(dev_t,			connection) \
facab7b602718e Darrick J. Wong 2025-09-12   87  		__field(uint64_t,		ino) \
facab7b602718e Darrick J. Wong 2025-09-12   88  		__field(uint64_t,		nodeid) \
d8dfbf6dfe7767 Darrick J. Wong 2025-09-12   89  		__field(loff_t,			isize) \
d8dfbf6dfe7767 Darrick J. Wong 2025-09-12   90  		__field(loff_t,			idisksize)
facab7b602718e Darrick J. Wong 2025-09-12   91  
facab7b602718e Darrick J. Wong 2025-09-12   92  #define FUSE_INODE_ASSIGN(inode, fi, fm) \
facab7b602718e Darrick J. Wong 2025-09-12   93  		const struct fuse_inode *fi = get_fuse_inode(inode); \
facab7b602718e Darrick J. Wong 2025-09-12   94  		const struct fuse_mount *fm = get_fuse_mount(inode); \
facab7b602718e Darrick J. Wong 2025-09-12   95  \
facab7b602718e Darrick J. Wong 2025-09-12   96  		__entry->connection	=	(fm)->fc->dev; \
facab7b602718e Darrick J. Wong 2025-09-12   97  		__entry->ino		=	(fi)->orig_ino; \
facab7b602718e Darrick J. Wong 2025-09-12   98  		__entry->nodeid		=	(fi)->nodeid; \
d8dfbf6dfe7767 Darrick J. Wong 2025-09-12   99  		__entry->isize		=	i_size_read(inode); \
d8dfbf6dfe7767 Darrick J. Wong 2025-09-12  100  		__entry->idisksize	=	fuse_inode_has_iomap(inode) ? \
d8dfbf6dfe7767 Darrick J. Wong 2025-09-12 @101  							(fi)->i_disk_size : 0
facab7b602718e Darrick J. Wong 2025-09-12  102  

:::::: The code at line 101 was first introduced by commit
:::::: d8dfbf6dfe776798eee1722760dd0921641b293f fuse_trace: implement direct IO with iomap

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
