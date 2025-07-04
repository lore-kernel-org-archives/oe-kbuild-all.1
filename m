Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0566F226CF8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631473; cv=none; b=LcEDXzoqXGoWykBBYD7y6qwE0GXDusEvlE0xwoyEbwDNzKB996xNBqn3A+/dVqx9jpYJR917oyA6toqYccYN3znYoFFwqY6FeliMvbBHKVn/EDiEx5skNr1phIarNtPJW1xwV37LCp0HyQykF16uOUQD37jdgmpJjh6e12ne8JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631473; c=relaxed/simple;
	bh=2AMmHtnXTBIwzCTAu5psDyE68VtiVdKRpWe36LcZWB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jy//4QR6IqHuTcdYcMIcAzhZAv27AfzuHBSxI3TcZ+6cbfABqOkxUJJePnpq0fRneUd57XUYK0e9yLTej9FAVC1/QmjXFl9Are2VQDCKQSAoTaxs8F46DBVlAG1wJopM+mdtr+/367BXUnuyV0fcVPXbym1oA/tKa1V7g8NtGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSQaQBDn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSQaQBDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751631471; x=1783167471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2AMmHtnXTBIwzCTAu5psDyE68VtiVdKRpWe36LcZWB8=;
  b=SSQaQBDnU4DDFK1+T1SfyeaLyqAm8S/jqSj2U9Xo0zo8/d74sGtHl1CM
   ptWd/NJ/2wRfvKHPtJvVGMTkopUlz656Us6v5rqXeFREC3tsGx8I+vx+N
   9LCd8h1wYkXoCBGbRll5eJ2y6NWtg3sHGbT9HoKipbCSpudP/4iXe3utX
   7cTY3BQkGFD4kK123N9jXvvhYhWjnjcTfy1yjEqvWot+sDgJ/SwbTgdfP
   0opyJTFB90zIGIsPYV5IYR6AnMzn1Oqt4ASdUZHXPASCkGzBceTd9GI/i
   kyqYeONP+R0RqcJmP0HzHG7kYWARYHuSUC/dR3KhhFlzpwYs78d02WQd4
   w==;
X-CSE-ConnectionGUID: wszPo+pKTheoV12K8hKW5g==
X-CSE-MsgGUID: i5l8gqL+TMCe5zOuLSopPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64566913"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="64566913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 05:17:50 -0700
X-CSE-ConnectionGUID: XexQ88BfRvCRVgUBaUlsyw==
X-CSE-MsgGUID: Y6ZV59TxR2San7d3e1DPeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="160305462"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2025 05:17:49 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXfMQ-0003gf-2q;
	Fri, 04 Jul 2025 12:17:46 +0000
Date: Fri, 4 Jul 2025 20:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202507042005.DjLHpqJc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6042b63b2aebbf8dab865c8f72bedbb01b76bd7c
commit: 0d385a5b58ead06f4a2b6565cb1ce02b922863ce [1/1] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: x86_64-randconfig-r111-20250704 (https://download.01.org/0day-ci/archive/20250704/202507042005.DjLHpqJc-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507042005.DjLHpqJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507042005.DjLHpqJc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-buf-sysfs-stats.c: note: in included file:
>> include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +15 include/trace/hooks/dmabuf.h

    13	
    14	struct dma_buf_sysfs_entry;
  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
