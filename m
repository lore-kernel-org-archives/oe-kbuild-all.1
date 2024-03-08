Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B71F93E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 22:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709938693; cv=none; b=ZfCc2PV40c7m4vsnhHU46an7AtDe2y3BhKna9ZUS4Jym57pFzvAer1MX3XxvXBNzxp7gDwYYP6RmPBWBu4jOm3OjZBi6BxaO102tukpZbn+F49Copmhim3Mq62dGKEdRN8lEkqJScp5L/XeuksHlFo5dZaW99gVHyffuFn4V9Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709938693; c=relaxed/simple;
	bh=wCDtEKpDbZL+mnvcou+GBGWrjbCI+4QcY/fdcbUHLls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhYd83RRuO5uHyzAUi1lHJHyi5LP8kaURsZ+aAeXgPtnX4AyvQwKZs8/8OwyDEv6Ix40uErCe/W+0RpTCx61UFyiONcchU4ZcM3SAnLALbKR5sI+EqI7aZ/tWU3Zyr2dekYu6ght1/ayDOceJFUumWYOjnFouMhFWGJWtCCMKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzUBn9g5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzUBn9g5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709938692; x=1741474692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCDtEKpDbZL+mnvcou+GBGWrjbCI+4QcY/fdcbUHLls=;
  b=jzUBn9g5YV0L963f40ry4wDHj3h2f4KC/mrpaNyLDTBcJFbOH68aS4VD
   jNRDtTU7T+U3cGEgqMqgeuqfNScWiLwd0pYnouwlQO3Bm8Y/HJFX1E2XN
   g/JoMgu66HltYlVrZWy5+mDqIt2DR8eoWUVjNtDUKhcZxX+d+HkGA456O
   y92zuGWrbZ2gyGqyAvKibMEKSBXuyp86l4Ro6OoDFxQ27IWH9rcwF7F6k
   SI815Wi1I1leNnRtfj4YKA01Z1gUgwKM7BwR55NHzHuYERif9qnYVUeTa
   taX5OhnPn4vI9Z9EhI3+m4gazf96WLh3YpY9I7OsQXwoNC0dTwsWpDFSR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4527519"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4527519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 14:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10658121"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2024 14:58:05 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rijA9-0006mT-30;
	Fri, 08 Mar 2024 22:58:01 +0000
Date: Sat, 9 Mar 2024 06:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 9/37]
 include/trace/events/fsverity.h:18:1: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202403090644.7Fpb00ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 6bcbc002b1f832b03eb57f87dcc64984efa975b5 [9/37] fsverity: add tracepoints
config: x86_64-randconfig-122-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090644.7Fpb00ua-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090644.7Fpb00ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090644.7Fpb00ua-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/verity/init.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fsverity.h, ...):
>> include/trace/events/fsverity.h:18:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] data_size @@     got restricted __le64 [usertype] data_size @@
   include/trace/events/fsverity.h:18:1: sparse:     expected unsigned long long [usertype] data_size
   include/trace/events/fsverity.h:18:1: sparse:     got restricted __le64 [usertype] data_size
   fs/verity/init.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/fsverity.h, ...):
>> include/trace/events/fsverity.h:18:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] data_size @@     got restricted __le64 [usertype] data_size @@
   include/trace/events/fsverity.h:18:1: sparse:     expected unsigned long long [usertype] data_size
   include/trace/events/fsverity.h:18:1: sparse:     got restricted __le64 [usertype] data_size

vim +18 include/trace/events/fsverity.h

    17	
  > 18	TRACE_EVENT(fsverity_enable,
    19		TP_PROTO(struct inode *inode, struct fsverity_descriptor *desc,
    20			struct merkle_tree_params *params),
    21		TP_ARGS(inode, desc, params),
    22		TP_STRUCT__entry(
    23			__field(ino_t, ino)
    24			__field(u64, data_size)
    25			__field(unsigned int, block_size)
    26			__field(unsigned int, num_levels)
    27			__field(u64, tree_size)
    28		),
    29		TP_fast_assign(
    30			__entry->ino = inode->i_ino;
    31			__entry->data_size = desc->data_size;
    32			__entry->block_size = params->block_size;
    33			__entry->num_levels = params->num_levels;
    34			__entry->tree_size = params->tree_size;
    35		),
    36		TP_printk("ino %lu data size %llu tree size %llu block size %u levels %u",
    37			(unsigned long) __entry->ino,
    38			__entry->data_size,
    39			__entry->tree_size,
    40			__entry->block_size,
    41			__entry->num_levels)
    42	);
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
