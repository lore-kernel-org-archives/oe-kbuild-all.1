Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133FF15E8B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733189610; cv=none; b=glwYsHwmZbmqHPi59OOdNL61+6ZkM+C7V6gZZ5Q1INPm3aBN4+OM4S/Bi2v4VJDhT4SYimjl3IkpSJnpSdsLldwq8b+S+Zo5E0t9Zj9bZ1emdXP2+w+Rnn4X5HTTrAYWd+jzupWzcXX9DQFOfdU2T0O1FsklvQC8McPMRnsSkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733189610; c=relaxed/simple;
	bh=OVo3n7sNZ5BcUS8rJwlfyvajPUIDz+6QSxQgZNql6g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwhQiFX6vAlhjMyveM8ii4cf+hmaEm0X1lqNJ5avE3mj5ZgWyLL+FzY31HcsuptfLaU7zm0sySBZ5admhqGY4y1eQvwPYclptfpdj3hi+IMtAABuNs3bDZZQ7AMt/OGiMUW8i7wpBIGAobI+N+MPOHI/Q8teOwxsLBn8Y/DPtQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUds2CFt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUds2CFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733189609; x=1764725609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OVo3n7sNZ5BcUS8rJwlfyvajPUIDz+6QSxQgZNql6g8=;
  b=IUds2CFtVGo0asC0Sonxr5vgdWIATtVqoT75Vh6EpFZZ6rQLC08QG7mx
   WZmsEuUNwLnRX/myWg18wadPC12pP3ZXdoW+ea3BaphtHxZYC/XqkDrF7
   2hEeg5jJkse9i6zE3rldVWu0ZBB9oRuiBUdz6IpjJRG5Vlw6dJHk/LRZi
   G/0iEBmrugN9qFmfcLBkGrxPApFbrWaqKqD53/0iIZsLbGkvOm0kxPqr+
   NnKjnc/8/u/4GCu9jzSG/FnrdGsXX5HfmbHwRKQu77iQJ6+Gz42CPZPf0
   N3TS2G1coapEgjYgsuRxLyEfIaLfmDtu0QsHfN8QHXFS4UgaHgtPPxDJC
   Q==;
X-CSE-ConnectionGUID: uWvqqyA9Qv+MTmPqCl19hA==
X-CSE-MsgGUID: FLdc0NUzSaWihfNH9KR8Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37321222"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="37321222"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:33:28 -0800
X-CSE-ConnectionGUID: CYlQijRuTFSFLrCC67GzHw==
X-CSE-MsgGUID: JIFFxdthSd6AIe0HhKcpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="116541107"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2024 17:33:27 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHn2-000380-1s;
	Tue, 03 Dec 2024 01:33:24 +0000
Date: Tue, 3 Dec 2024 09:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-09 2196/29207]
 drivers/staging/android/debug_kinfo.c:164:34: warning: unused variable
 'debug_kinfo_of_match'
Message-ID: <202412030940.nqMq2FMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jone,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-09
head:   53d799cb1bbb9b2318d65a94b95275f52fc826b9
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/29207] ANDROID: staging: add debug-kinfo driver
config: i386-randconfig-r052-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030940.nqMq2FMF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030940.nqMq2FMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030940.nqMq2FMF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/android/debug_kinfo.c:10:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1515:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/android/debug_kinfo.c:164:34: warning: unused variable 'debug_kinfo_of_match' [-Wunused-const-variable]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/debug_kinfo_of_match +164 drivers/staging/android/debug_kinfo.c

   163	
 > 164	static const struct of_device_id debug_kinfo_of_match[] = {
   165		{ .compatible	= "google,debug-kinfo" },
   166		{},
   167	};
   168	MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
