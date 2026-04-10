Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50460317144
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849596; cv=none; b=OLTRHyMli0YnarDNVtr1JG1ngcO3A+6n5SFUtrRJQ3gnXcATF1MxiqfsVept5BWUTzV7jJ6duNfYAuWJFLMurb2R6va8TiyvxoVG+YCjSbnMD9xwcbBSAMkhqyicz8bWG3x+wgDTWvKf4pkE4GL+zgRVvPnJ/knfU0YZH0wtFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849596; c=relaxed/simple;
	bh=83DFVDfbTAkMVEKyJxHHXQGOfjBlnMzOb21MQh9T5T8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VAJiSrTlYfDrpy0z9KV7i/ncFdI6VyC2j1Ie9PW43dEPwRmHry2pLgoqU9cnYbrbm9ayHr9fwN0Yrks6AiBibCZ0bYLYbagjxZim1Bsjc83tqXaqBUN0CRKwHBc9F5W5wFmJlXtz+07lCBtHAGn1N2kRjbKuPOVysTEPWO7a86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuXiY/uB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuXiY/uB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775849595; x=1807385595;
  h=date:from:to:cc:subject:message-id;
  bh=83DFVDfbTAkMVEKyJxHHXQGOfjBlnMzOb21MQh9T5T8=;
  b=nuXiY/uBfbEXv8rRBvF7sxbKnrGRzTvAiYuEJE15ULP6ujisyYOXYS/r
   nPodYJTtkgpMYqzGIAA/VfMtKuAi0ZgdfvhDM7i9pkEGkqMEKR3uodZDO
   vkPS87N8oBFsJLv69QpA2HNB73ER9qIyKDS07M5CL7E1Wo0vVNZIpV93p
   8ZmJlSHss7U+lmDwqN9sW3r7x0dEjltMl5WAcHzSuVKqcqGg9ZMuF0P9N
   T5Cz+uMX4FLgXsXMIlYIs2mqrc6/iSIy+Wml7nGWhDXy6BDrzY1kUn3f8
   wFeKjgAf0Kqzs1sQCsC9E4TGWPp/bqDpQZJ3iP9gHuKyfpTgxfZYpeukm
   w==;
X-CSE-ConnectionGUID: V0lAxfH+S/KNj4g917wA8A==
X-CSE-MsgGUID: rdbaRZ5GSXehDVPOWCcADA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80740395"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="80740395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:33:13 -0700
X-CSE-ConnectionGUID: Ji55n8/GRYuEJTH64BgxCQ==
X-CSE-MsgGUID: l6f3G/jZQR+48+PTQgiiqw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 12:33:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBHbJ-00000000AwM-42s3;
	Fri, 10 Apr 2026 19:33:09 +0000
Date: Fri, 10 Apr 2026 21:32:38 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/scheduler/sched-arch.rst:108:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202604102139.zj1yx5qc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260410-192441
head:   ab0b22aae278e62b46dd1b9bbc54f81d48eb7922
commit: d4c12cd241b1a892722ed07feb9114c23717202e sched/docs: Document cpu_preferred_mask and Preferred CPU concept
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260410/202604102139.zj1yx5qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102139.zj1yx5qc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:495: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +108 Documentation/scheduler/sched-arch.rst

   102	
   103	Notes:
   104	1. This feature is available under CONFIG_PARAVIRT.
   105	2. preferred CPUs is same as online CPUs until STEAL_MONITOR is enabled.
   106	3. A task pinned, which can't be moved to preferred CPUs will continue
   107	   to run based on its affinity. But no load balancing happens
 > 108	4. If needed, steal time based governors/arch dependent method
   109	   could be used to cater to different types of cpu numbers.
   110	5. Decision to use/not use is driven by kernel. Hence it shouldn't
   111	   break user affinities. One of the main reason why CPU hotplug
   112	   or Isolated cpuset partitions was not a solution.
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
