Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE115098E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617798; cv=none; b=LslCYQZforheVEmJTYPCkObXFHcpWIoS2u5p4wEJJ3HCWMK5WZg9A9S+wTy2uW4bM8mNxXOPm4gwQQNrHC+5jy68QlTsaiLVD2iFXn69ZwgFaNJiaQ2hv2os4iPXWsICmP/KFf1eAnhuRhm272V/rUWR3ykyfg+c2fBAqiLGkGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617798; c=relaxed/simple;
	bh=jxnaKd1lOtet1ehfaH9TnOvBcZn7KqYEpeSUYzU4b2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWtpVs2maAOeyB0/1RhQj08o0KpuuVwUt9NgmOP0rDCZ0ufZBwrtIzmujR+PM9R9ayNSTnP/dLAe+LL0568ec2jQnCNVceh3Jqa68NznxW4rt9WMk7sp6FmoVvju6NfJVfyeIZCz5/Y2e5OrRflcJ4++ZBVKDBuHEGEenR4mqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBHeloRT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBHeloRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708617796; x=1740153796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxnaKd1lOtet1ehfaH9TnOvBcZn7KqYEpeSUYzU4b2M=;
  b=CBHeloRT9XZaqm6Msjbq9QQKSZXYMxH1qHj3PMiYPtbtCgTT75qSIeCd
   1W3YtwO43rKXm0impzj8B5xE6Jq0mEwcG4zprcfjDH1HjSJvJM+5w4ctT
   oSfgcWH2sj30m1Lv9J+DYuO1qpmbuwYn3AkHHfJvZZGE9m7goXavVqMra
   UoExtYc1r88MhsNJK6Ah5vH2ukxuevehD7TXjTKUrMY6jv9ZW/eNlOM6b
   PIqOhR0dfA8CQmoMPqn11ox8hg6YQePhijSsput0GCa/w3Ys2byby1ruz
   ww3k0hEY/ncGc7QmEiIzbSyKBNZZfkuN8kw0Dpnip38ZGPQQtGdAmCd/D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13552738"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13552738"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10268860"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2024 08:03:13 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdBWy-0006SO-0c;
	Thu, 22 Feb 2024 16:02:53 +0000
Date: Fri, 23 Feb 2024 00:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 169/290] fs/xfs/xfs_exchrange.h:10:41:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '9223372036854775808' to '0'
Message-ID: <202402222318.sosx1QeY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   c89b9c47d9854d63bcf3b735701f0e3f46e84015
commit: e7f0dcdd13caeaf3e4a002169d3c1080d949090b [169/290] xfs: bind together the front and back ends of the file range exchange code
config: i386-randconfig-003-20240222 (https://download.01.org/0day-ci/archive/20240222/202402222318.sosx1QeY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222318.sosx1QeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222318.sosx1QeY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:5179,
                    from fs/xfs/xfs_trace.c:50:
   fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfs_exchrange_class':
>> fs/xfs/xfs_exchrange.h:10:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '9223372036854775808' to '0' [-Woverflow]
      10 | #define XFS_EXCHRANGE_UPD_CMTIME1       (1ULL << 63)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4893:9: note: in expansion of macro 'TP_printk'
    4893 |         TP_printk("dev %d:%d flags %s bytecount 0x%llx "
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4897:20: note: in expansion of macro '__print_flags'
    4897 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                    ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4856:11: note: in expansion of macro 'XFS_EXCHRANGE_UPD_CMTIME1'
    4856 |         { XFS_EXCHRANGE_UPD_CMTIME1,    "CMTIME1" }, \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4897:55: note: in expansion of macro 'XFS_EXCHRANGE_FLAGS_STRS'
    4897 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_exchrange.h:11:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '4611686018427387904' to '0' [-Woverflow]
      11 | #define XFS_EXCHRANGE_UPD_CMTIME2       (1ULL << 62)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4893:9: note: in expansion of macro 'TP_printk'
    4893 |         TP_printk("dev %d:%d flags %s bytecount 0x%llx "
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4897:20: note: in expansion of macro '__print_flags'
    4897 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                    ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4857:11: note: in expansion of macro 'XFS_EXCHRANGE_UPD_CMTIME2'
    4857 |         { XFS_EXCHRANGE_UPD_CMTIME2,    "CMTIME2" }, \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4897:55: note: in expansion of macro 'XFS_EXCHRANGE_FLAGS_STRS'
    4897 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_exchrange.h:14:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
      14 | #define XFS_EXCHRANGE_CHECK_FRESH2      (1ULL << 61)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4893:9: note: in expansion of macro 'TP_printk'
    4893 |         TP_printk("dev %d:%d flags %s bytecount 0x%llx "
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4897:20: note: in expansion of macro '__print_flags'
    4897 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                    ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4858:11: note: in expansion of macro 'XFS_EXCHRANGE_CHECK_FRESH2'
    4858 |         { XFS_EXCHRANGE_CHECK_FRESH2,   "FRESH2" }
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4897:55: note: in expansion of macro 'XFS_EXCHRANGE_FLAGS_STRS'
    4897 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~


vim +10 fs/xfs/xfs_exchrange.h

2a1f5c1eaec450 Darrick J. Wong 2024-01-09   8  
2a1f5c1eaec450 Darrick J. Wong 2024-01-09   9  /* Update the mtime/cmtime of file1 and file2 */
2a1f5c1eaec450 Darrick J. Wong 2024-01-09 @10  #define XFS_EXCHRANGE_UPD_CMTIME1	(1ULL << 63)
2a1f5c1eaec450 Darrick J. Wong 2024-01-09  11  #define XFS_EXCHRANGE_UPD_CMTIME2	(1ULL << 62)
2a1f5c1eaec450 Darrick J. Wong 2024-01-09  12  

:::::: The code at line 10 was first introduced by commit
:::::: 2a1f5c1eaec450dd23efe48d3e9f09678dfd22e9 xfs: introduce new file range exchange ioctl

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
