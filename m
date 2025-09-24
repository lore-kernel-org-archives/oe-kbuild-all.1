Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EB17BA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758677658; cv=none; b=sybNX33S4Q8dh+idqKbwSHsiOR2TW5t2z5heLM/bXlvwkImljmRecjiOSO9CWraNxO9N/lSxQQZik+9D6aqDJebbpc1Q5VvRzd/R+EgTZibLr/P1aMu4A4Gs4vUJsnA3vBi2RcZRWGmkFrm5gVXV8MhUIS008z/LPI4faTQCr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758677658; c=relaxed/simple;
	bh=rlHzZWbap1e8vy+gWON0U7xDQcr87lcXQHivnx0qwVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbljW89sR875x/YKWnpKA1wQZlAOL68jY7IzKv/DtinaXSoMSWj/hAscqwEIeEzndNAhSVgubPzsuUrBgZ1CwlqHagQ9Rh6JRrPREsy/gpLd/sxXl8XMc/uL6DVZU3y7kVoYbE5bo8WDVHn63KVS4IdOk6l3XeARK8vfjE+Woxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpkzW6cG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpkzW6cG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758677657; x=1790213657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlHzZWbap1e8vy+gWON0U7xDQcr87lcXQHivnx0qwVQ=;
  b=RpkzW6cGv6QDzwf/sTRPaG8wHQ2t6++PQzoUjeiaHEVaf6hHeVf6TlO+
   rPIkWdxOfgDsG5j6PuHlIQ8zOwQC77QYgZM4Mi+eXfHsxpY0Pe24Wmqcf
   jevSggwj8a4SjQDxWVb+5uzHAhZ+MtSUBgA8Bq33KpOxBMfrn/cuaWn6f
   msshKEHBpt0zmEV8dl5L5HNSi48cT0t+8qNchDlj5yBq+LWYOjcGOClYb
   q5ZR2HOcGwL7V3REj2lnHrTtl/ZZhJbNqy1fy4tL5TyEDIrnNVrVo2QrM
   /kLDUM80MuJI9dM5RM0WSuPmRus3+J4XhlS7W/3HY1oizHHqrocEc0ZVo
   Q==;
X-CSE-ConnectionGUID: Vldac34+S9iWUtqXws73Jw==
X-CSE-MsgGUID: B76iEY0tR06BzS/3YCJqBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71640572"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="71640572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 18:34:16 -0700
X-CSE-ConnectionGUID: U9P1l4jLRD6WfDpPyuzpIA==
X-CSE-MsgGUID: O/0uNgxYQlSm5N2wzEsL7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176984240"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Sep 2025 18:34:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1EOV-0003hd-3C;
	Wed, 24 Sep 2025 01:34:09 +0000
Date: Wed, 24 Sep 2025 09:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 3/10] include/linux/ftrace.h:563:5: warning: no
 previous prototype for 'unregister_ftrace_direct_hash'
Message-ID: <202509240918.pzLtDzzj-lkp@intel.com>
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
commit: 96622eaa88e4d87dfdd8d16c2fbfc1cb55cdefe2 [3/10] ftrace: Add unregister_ftrace_direct_hash function
config: alpha-randconfig-r073-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240918.pzLtDzzj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240918.pzLtDzzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240918.pzLtDzzj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from init/main.c:22:
   include/linux/ftrace.h:558:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
    int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:563:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
    int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/unregister_ftrace_direct_hash +563 include/linux/ftrace.h

   562	
 > 563	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
