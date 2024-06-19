Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748EF5227
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760035; cv=none; b=RmR4QHhOeRNObirbiHXj+OIQXpHt5fC7qqQZs2gtwwKy61LW24HFpZpg4hDdF0oNGn5BfNKtSUIo9G0sVMPb3dL4vsm0KOUcBSnGCz1HQP2g1gEumsYIpFlX8XvvUtyZkoEsOrKODCsPwvtnzjmgCse0pnoI56W2THMDzG+k5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760035; c=relaxed/simple;
	bh=7YQDFFGgGW5P7jFhyUXzVo21V+URFNxv5cmVwyBOl9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n37CUsMdm3bWUW9e8H2REyGGHt5xHt+q4x9Fsg2VjUJ+opTxbm9ji2ML+QnQbBcmrm+dwQAdVL1HXb/9oVkiwvXs6SQc/ciCJztXn9v58Iire3YUxN6ZmtcDH+ocg8q2vugqDBxqapJzSiQCS83Lku8HLwMucaDx2F+rUTq+Ey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPqat3L1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPqat3L1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718760033; x=1750296033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7YQDFFGgGW5P7jFhyUXzVo21V+URFNxv5cmVwyBOl9w=;
  b=NPqat3L1D9N8bHlJMkFVHAKhnE1gpL2b4Epb3jQEy0FGplSAdJ+DWN2P
   H1aiDMblnGqgr4dkzAq+CD8aDJ2DQozDhWRQ0jBMvvL5H5SgzxBanzpom
   B+8ZkjPUueVztTv1pqW7KU4nBkshXqRolRpuFHFbvzF3AG/AD4w4jULgv
   WeXuxsyE1wyqyL1UZ6FHn/28m3pzDo/Na4Om74xsX4EVDse9TgDAjpMZ3
   7r4wmOtbRiL5OpU6nFjLpxaw83gPxPB0W2xcf+Tp1ZjdnT79T5gJoB5lx
   iyQAos7rU8ADRPpFJ9Pe6yCqY2hlDgcp40AFQtz6Ye7TZbYBgHmfJBglQ
   g==;
X-CSE-ConnectionGUID: FGHyacdqQXe+q3BzkOeD+A==
X-CSE-MsgGUID: avJVXIqwQDuXD6B7tc7TDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15389854"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15389854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 18:20:32 -0700
X-CSE-ConnectionGUID: kQzkPLIUQEyo93yOE1cMSw==
X-CSE-MsgGUID: NbwsrcpQQ760Cib+TCGiuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="79209969"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 18:20:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJjzx-00067e-2W;
	Wed, 19 Jun 2024 01:20:29 +0000
Date: Wed, 19 Jun 2024 09:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/fault-injection-statickeys 4/8]
 kernel/trace/trace_probe.h:228:13: warning:
 'trace_kprobe_error_injection_control' defined but not used
Message-ID: <202406190901.J2sLMspM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/fault-injection-statickeys
head:   4ea5801b207e7fed15b85356fbe26683dab69d73
commit: 17acfebc18b8fa974f2635736fc1bb2399342ee1 [4/8] bpf_trace: add error injection static key control to perf_event attached progs
config: arc-randconfig-001-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190901.J2sLMspM-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190901.J2sLMspM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190901.J2sLMspM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace_event_perf.c:13:
>> kernel/trace/trace_probe.h:228:13: warning: 'trace_kprobe_error_injection_control' defined but not used [-Wunused-function]
     228 | static void trace_kprobe_error_injection_control(struct trace_event_call *call,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/trace_kprobe_error_injection_control +228 kernel/trace/trace_probe.h

   227	
 > 228	static void trace_kprobe_error_injection_control(struct trace_event_call *call,
   229							 bool enabled) { }
   230	#endif /* CONFIG_KPROBE_EVENTS */
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
