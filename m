Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACEB1772D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712046892; cv=none; b=k/dkskSqdYUqRmT+J+HfZ4ohyM13Bb/NABJbpqIg7De4yMDoXenOiB+QWJjPvicWPMBvRTA/f8/t3x9upxtE0GLST9j52/4iL7xVWvzEnuP9g7iBImg1QqURoo0vjhyhPMj/OzwZMfnfMxqvW9mA1GnqtxQ+EX0o9RSe9WlQQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712046892; c=relaxed/simple;
	bh=T26b0kDIWBaBj+IJea3mbAhKD2QrAyB/euq7jgIsEYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/YbZM/GBt5Tf0T+sTVwD3+wcbxzjgo/0CpmTXYfFR1v1f3YBEXkGvFoH54ebMnp1+BsNNF4a5jzHOtXmYc+/gBNvcakYNHNE9gYgMQ2HKgrnKu86VhD6lHeIF5aWwIdGBmevLehpU8ovb7aMaszaCSATWY1rsLRYJqTiZrR7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bikjJwZP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bikjJwZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712046890; x=1743582890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T26b0kDIWBaBj+IJea3mbAhKD2QrAyB/euq7jgIsEYg=;
  b=bikjJwZP9Tb5+xems8+BuaoXewyBLeBvaTJJMzRApAugVvCjPsyBRfbm
   Cn5CwSQ7HVfCNZ+C4ZjmNjdAe+uNRAr5Sd7J3wxJCqNc1Sa52xgqq+jpP
   1VCL0e4XFRgbxEkS6IH9fGmchGPD4TixRDs2umDpwDruZiuWidl4O3y1f
   LLRg4Ta3jbcvE7R2Q7iw72JyYPOQYnkB57WWi1MhOM/AHmRBoCamFR9lT
   Bu7M5S48ytg7swGyYJH+1T06wEcQgc43Ye4PSTs7c+9DsmfeokEGcEWfP
   JyhZEcDnxh4WCK+uchfZ0fBLTpMybFi0IEffvteVKXT/afVQBKVqbMdwD
   g==;
X-CSE-ConnectionGUID: pDaGrIZ2QOOg285drtlU6Q==
X-CSE-MsgGUID: HT1QN6FWRqmkBXJJ/n2qYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="29680615"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="29680615"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 01:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="22439171"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2024 01:34:49 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrZbS-00013L-35;
	Tue, 02 Apr 2024 08:34:46 +0000
Date: Tue, 2 Apr 2024 16:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/session_data_2 8/12]
 kernel/trace/bpf_trace.c:3559:5: sparse: sparse: undefined preprocessor
 identifier 'CONFIG_FPROBE'
Message-ID: <202404021633.FEE7uOZT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/session_data_2
head:   5c279b9374cb05aac12c82a7941e61d816d3937e
commit: 99d14a41c1f4eb0ea5c10cf383de9502ff359eae [8/12] bpf: Add bpf_wrapper_is_return kfunc for multi uprobe
config: x86_64-randconfig-123-20240402 (https://download.01.org/0day-ci/archive/20240402/202404021633.FEE7uOZT-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021633.FEE7uOZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021633.FEE7uOZT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:3559:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FPROBE'
   kernel/trace/bpf_trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, kernel/trace/bpf_trace.h):
   kernel/trace/./bpf_trace.h:11:1: sparse: sparse: self-comparison always evaluates to false
   kernel/trace/bpf_trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, kernel/trace/bpf_trace.h):
   kernel/trace/./bpf_trace.h:11:1: sparse: sparse: self-comparison always evaluates to false
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:812:9: sparse: sparse: context imbalance in 'uprobe_prog_run' - unexpected unlock

vim +/CONFIG_FPROBE +3559 kernel/trace/bpf_trace.c

  3558	
> 3559	#if CONFIG_FPROBE || CONFIG_UPROBES
  3560	__bpf_kfunc_start_defs();
  3561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
