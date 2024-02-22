Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038C17C9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 23:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708644642; cv=none; b=aUIRJFx8e851cwWbqEfobE3CkLfK8oY4SgJCnnxZ1t28jjrgDEtE1a148099Y12y0GwpRh7LMIVxdbiyurwh2DDV8F0MJEnXZXJJApVNH97YvVgoyxyFDnqb1sikrHXTvNdPc6VR6K6ndoQY5XvoKArG9M9xlEeFEb9rl0nrC9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708644642; c=relaxed/simple;
	bh=KIZKKY40/mg0K3C8pfuj1XIIaih8/yElyyuKqz0IDzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJMjy8xM4y+7mY3npvcSblfpvOvqXEMFh1AMEtoXzmaaa9+e+yT0scrOAm9H29pMl7eYzojAj7Y39DsDhWrjA+MD+Jt9yA9kOekSlT7QYiG0XCaS3htUqvD9m5E9d2JIbd/umTecJI+tvHc8YO2m1qhI0AW3nYFRXnR8gI196KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKj453y1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKj453y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708644639; x=1740180639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIZKKY40/mg0K3C8pfuj1XIIaih8/yElyyuKqz0IDzQ=;
  b=UKj453y1Ff3OxSHQYZCY0GW+kclevgwQvLWaaXC0TKXfG1WmWpsRlmhF
   IvyWPy8NHm0+Ijca+JvBuqEGmDiNWRTwGt7tJ/lgDD3X54uy9/07ie4GZ
   Gf6gA47w3bxt16P0bq7Sb2tPMnWuwq+lqkSbNNB4GYe3ZxLL7THTAAUww
   AwedjX67V113WWs6dUoHUNW56SyP8oCz8pOXFlYp2n1UVVE0gm0L8Zklq
   01N1NPQh9VzF7//UBh3yqdRWFBkBXbjrdoK0ekwwfXRygx/NSQjWrYouW
   vncIZ5klPT4w1obtd7Wl1VH6x0kVWnnp/+rIxfADVr6J3uPU8f2HvrorW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6692005"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6692005"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 15:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936921318"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="936921318"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 15:30:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdIWR-0006my-1h;
	Thu, 22 Feb 2024 23:30:35 +0000
Date: Fri, 23 Feb 2024 07:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 171/290]
 fs/xfs/libxfs/xfs_exchmaps.h:53:41: warning: conversion from 'long long
 unsigned int' to 'long unsigned int' changes value from
 '9223372036854775808' to '0'
Message-ID: <202402230705.tZp0MKd7-lkp@intel.com>
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
commit: 83540962578dd4512531df68089f37dc104007ac [171/290] xfs: condense extended attributes after a mapping exchange operation
config: i386-randconfig-003-20240222 (https://download.01.org/0day-ci/archive/20240223/202402230705.tZp0MKd7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230705.tZp0MKd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230705.tZp0MKd7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:5180,
                    from fs/xfs/xfs_trace.c:50:
   fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfs_exchrange_class':
   fs/xfs/xfs_exchrange.h:10:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '9223372036854775808' to '0' [-Woverflow]
      10 | #define XFS_EXCHRANGE_UPD_CMTIME1       (1ULL << 63)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4894:9: note: in expansion of macro 'TP_printk'
    4894 |         TP_printk("dev %d:%d flags %s bytecount 0x%llx "
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4898:20: note: in expansion of macro '__print_flags'
    4898 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                    ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4857:11: note: in expansion of macro 'XFS_EXCHRANGE_UPD_CMTIME1'
    4857 |         { XFS_EXCHRANGE_UPD_CMTIME1,    "CMTIME1" }, \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4898:55: note: in expansion of macro 'XFS_EXCHRANGE_FLAGS_STRS'
    4898 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_exchrange.h:11:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '4611686018427387904' to '0' [-Woverflow]
      11 | #define XFS_EXCHRANGE_UPD_CMTIME2       (1ULL << 62)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4894:9: note: in expansion of macro 'TP_printk'
    4894 |         TP_printk("dev %d:%d flags %s bytecount 0x%llx "
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4898:20: note: in expansion of macro '__print_flags'
    4898 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                    ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4858:11: note: in expansion of macro 'XFS_EXCHRANGE_UPD_CMTIME2'
    4858 |         { XFS_EXCHRANGE_UPD_CMTIME2,    "CMTIME2" }, \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4898:55: note: in expansion of macro 'XFS_EXCHRANGE_FLAGS_STRS'
    4898 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_exchrange.h:14:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
      14 | #define XFS_EXCHRANGE_CHECK_FRESH2      (1ULL << 61)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4894:9: note: in expansion of macro 'TP_printk'
    4894 |         TP_printk("dev %d:%d flags %s bytecount 0x%llx "
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4898:20: note: in expansion of macro '__print_flags'
    4898 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                    ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4859:11: note: in expansion of macro 'XFS_EXCHRANGE_CHECK_FRESH2'
    4859 |         { XFS_EXCHRANGE_CHECK_FRESH2,   "FRESH2" }
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4898:55: note: in expansion of macro 'XFS_EXCHRANGE_FLAGS_STRS'
    4898 |                    __print_flags(__entry->flags, "|", XFS_EXCHRANGE_FLAGS_STRS),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfs_exchmaps_estimate_class':
>> fs/xfs/libxfs/xfs_exchmaps.h:53:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '9223372036854775808' to '0' [-Woverflow]
      53 | #define XFS_EXCHMAPS_INO2_SHORTFORM     (1ULL << 63)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:5026:9: note: in expansion of macro 'TP_printk'
    5026 |         TP_printk("dev %d:%d ino1 0x%llx fileoff1 0x%llx ino2 0x%llx fileoff2 0x%llx fsbcount 0x%llx flags (%s) bcount1 0x%llx rtbcount1 0x%llx bcount2 0x%llx rtbcount2 0x%llx resblks 0x%llx nr_exchanges %llu",
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:5031:19: note: in expansion of macro '__print_flags'
    5031 |                   __print_flags(__entry->flags, "|", XFS_EXCHMAPS_STRINGS),
         |                   ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4803:11: note: in expansion of macro 'XFS_EXCHMAPS_INO2_SHORTFORM'
    4803 |         { XFS_EXCHMAPS_INO2_SHORTFORM,          "INO2_SF" }
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:5031:54: note: in expansion of macro 'XFS_EXCHMAPS_STRINGS'
    5031 |                   __print_flags(__entry->flags, "|", XFS_EXCHMAPS_STRINGS),
         |                                                      ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfs_exchmaps_intent_class':
>> fs/xfs/libxfs/xfs_exchmaps.h:53:41: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '9223372036854775808' to '0' [-Woverflow]
      53 | #define XFS_EXCHMAPS_INO2_SHORTFORM     (1ULL << 63)
         |                                         ^
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:5076:9: note: in expansion of macro 'TP_printk'
    5076 |         TP_printk("dev %d:%d ino1 0x%llx fileoff1 0x%llx ino2 0x%llx fileoff2 0x%llx fsbcount 0x%llx flags (%s) isize1 0x%llx newisize1 0x%llx isize2 0x%llx newisize2 0x%llx",
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:5081:19: note: in expansion of macro '__print_flags'
    5081 |                   __print_flags(__entry->flags, "|", XFS_EXCHMAPS_STRINGS),
         |                   ^~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4803:11: note: in expansion of macro 'XFS_EXCHMAPS_INO2_SHORTFORM'
    4803 |         { XFS_EXCHMAPS_INO2_SHORTFORM,          "INO2_SF" }
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:5081:54: note: in expansion of macro 'XFS_EXCHMAPS_STRINGS'
    5081 |                   __print_flags(__entry->flags, "|", XFS_EXCHMAPS_STRINGS),
         |                                                      ^~~~~~~~~~~~~~~~~~~~


vim +53 fs/xfs/libxfs/xfs_exchmaps.h

    51	
    52	/* Try to convert inode2 from block to short format at the end, if possible. */
  > 53	#define XFS_EXCHMAPS_INO2_SHORTFORM	(1ULL << 63)
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
