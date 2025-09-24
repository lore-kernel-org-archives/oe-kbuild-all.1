Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EC20296E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 03:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758683458; cv=none; b=rX8kOv8rVEB8qFBje7LsNA6D+2KyNvxb8BWYPGo8oZIr+rRgCAqsJoappvWhQQNQq6UW/GIlPvTNYIP0BK4NCMliaaAjQWjGDinhgTlZxaEpiPhOIrqRp9qUj2jLZJimwMQa0ZxgrzgUNXyeRtmFqMTcrtUUPWSpk26IPejReLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758683458; c=relaxed/simple;
	bh=A46BFuqO9qLZxtjuZDSODxD7Bs8CLWJc8g943Gw02lg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dvevl9t9/UCMyjDIz6hDI3sS2KPYkBPZOELAQGd2oeAilpOMFr6ZMM9ilYyerekEG8c9k1MzoYBXe2ds4WCz/C/f2ayAjbR9qQsRF0onP8WiI2loJyI34POI6KqQ5+UejmYlIEWxYx41Jr5P4tt4kCIASUvEpYoCaE4gW64BAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFcclxsF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFcclxsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758683456; x=1790219456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A46BFuqO9qLZxtjuZDSODxD7Bs8CLWJc8g943Gw02lg=;
  b=iFcclxsFmrA47s7uOopM5OGgDdAEC9vNco+kRF0cpKiQPDQY62DgFdL0
   hTMmW/rNPMZnLTol49Uipu9d2qyZ+5wv8pWRzVqiZTVpq0GDZay5FIy9u
   ykzrfZnyf9IAUpcPWr6Jar/tEr6k8KCBKy1Uy0yJ53xbk2Dshdn7FL6JH
   A/Gk+iZk2+1fYEb5F5ZU5I6M3zlPBwNdEpX4QcqN8FUYV5ESizuAn5z8X
   0bPIFeJEKr/BaBp39cMRv0PMBlDmVDz7XUfGtFZTbOTl01BUoIsc3pzE3
   7RmTtfAYra19+ZPgR4In0YU8oQInt0BXCim3UzUxjoTyxdkgOsgRqEcic
   g==;
X-CSE-ConnectionGUID: AEtYwVBTSPCZhTUr0MUjxA==
X-CSE-MsgGUID: r0WOoRdSRluOWKi+XVk2+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60014657"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60014657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:10:56 -0700
X-CSE-ConnectionGUID: Gt4rrjotR2eX1rkWHQbJYg==
X-CSE-MsgGUID: pFvwEn/9Qo64pbfP7AvfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="177315889"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2025 20:10:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Fu9-0003kr-0W;
	Wed, 24 Sep 2025 03:10:53 +0000
Date: Wed, 24 Sep 2025 11:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 4/10] include/linux/ftrace.h:569:5: warning: no
 previous prototype for 'modify_ftrace_direct_hash'
Message-ID: <202509241138.BhVTtAhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git test
head:   1b7fc74c36a93e90816f58c37a84522f0949095a
commit: bbc3f1e07924e420b74b4bf49f1c3b0a924db927 [4/10] ftrace: Add modify_ftrace_direct_hash function
config: alpha-randconfig-r073-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241138.BhVTtAhI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241138.BhVTtAhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241138.BhVTtAhI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from init/main.c:22:
   include/linux/ftrace.h:559:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
    int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:564:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
    int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:569:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
    int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
        ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/modify_ftrace_direct_hash +569 include/linux/ftrace.h

   558	
 > 559	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   560	{
   561		return -ENODEV;
   562	}
   563	
   564	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   565	{
   566		return -ENODEV;
   567	}
   568	
 > 569	int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
   570	{
   571		return -ENODEV;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
