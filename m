Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A13E5EFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966307; cv=none; b=mWtcFC1RkawSACsl8rc50ufkZBL0u2ISdcIFy9/6SryYWlpHJOXb0PQblg2ml/t4jqr++sD0g9v/1c19d8DwEXZoipVfHziuVPeIM0EnGNbjlPZ21bdUgXMhAeNOubd0ohRqQl0OGN3W5aZyphwl7cQtWOUv7NyO/BzWSZj6NS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966307; c=relaxed/simple;
	bh=KnnWXroze7zEfOhh5glujmJQLDrsgd2AaZK8LlrpruM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UJ9+KL1HVy0ubbWkvyvDyAFz3RvDFMWFxIKx9Xj97z9KJ0CmnMDTt4zPf4yitPcyPB1nF0LOQCVEZ92Hz0JNHV1EKnMto92U4Kkg9c9xzwlwAwG8DQ/AXdIyaoRKTzTn81HhKAPE7zvrNP/neKL2Wb5PWKIYKwjeav24eDwAE60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkyiLevK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkyiLevK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966305; x=1806502305;
  h=date:from:to:cc:subject:message-id;
  bh=KnnWXroze7zEfOhh5glujmJQLDrsgd2AaZK8LlrpruM=;
  b=ZkyiLevK3wIFhSMtpSJ787almdT4JTWfFNO4uVfLDLXHAkzWDFz0AyZR
   QAYM+HVpe5nzPa/QLxnMZy7jMVE/jOI7j3iItUvMDhAQ0Wx90rsAa49Pb
   ZkAXpxB58jE+t/IUiqLz0z3nuSZuFvqm2PEhVULL1n8Y1rmn8tuzL+4dj
   MsZujc2nZirII8c4LM7qavwJGC5o2e8R8pK+SAcqQYLW3ihdWNTKEjaQ3
   jQTWZXphuEB0qC2NTkpkoKaWlJXYPqrGSKsGKdOgRlJNymQJ6Ux3RtKWV
   xnpFWpGThsL4ttIjeeGsS6zXLSMQl7Es+W8v0dBJP4W5zdBEGpnh/ltxw
   A==;
X-CSE-ConnectionGUID: OQSy9GMwSIyn8jo2P7ULbg==
X-CSE-MsgGUID: ip11gknSSdWnWqrdiw7IYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87056793"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87056793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:11:42 -0700
X-CSE-ConnectionGUID: RdFR13slR4qEZeuTXfWXQw==
X-CSE-MsgGUID: 8YjuVgjsRrGz5bUdZZAihg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 07:11:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Zog-000000002kN-1RSN;
	Tue, 31 Mar 2026 14:11:38 +0000
Date: Tue, 31 Mar 2026 22:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-11 4/4]
 lib/bootconfig.c:911: warning: Function parameter or member 'early' not
 described in '_xbc_exit'
Message-ID: <202603312227.vQBIxUkt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-11
head:   d22b085f4ab7937b37f585576716883ed5367fca
commit: 1e7feb31a18c197d63a5e606025ed63c762f8918 [4/4] bootconfig: use memblock_free_late to free xbc memory to buddy
config: arm64-randconfig-003-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312227.vQBIxUkt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312227.vQBIxUkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312227.vQBIxUkt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/bootconfig.c:911: warning: Function parameter or member 'early' not described in '_xbc_exit'
>> lib/bootconfig.c:911: warning: expecting prototype for xbc_exit(). Prototype was for _xbc_exit() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]


vim +911 lib/bootconfig.c

f3668cde856299 Masami Hiramatsu 2021-09-17  902  
76db5a27a827c2 Masami Hiramatsu 2020-01-11  903  /**
115d4d08aeb942 Masami Hiramatsu 2021-09-17  904   * xbc_exit() - Clean up all parsed bootconfig
76db5a27a827c2 Masami Hiramatsu 2020-01-11  905   *
76db5a27a827c2 Masami Hiramatsu 2020-01-11  906   * This clears all data structures of parsed bootconfig on memory.
76db5a27a827c2 Masami Hiramatsu 2020-01-11  907   * If you need to reuse xbc_init() with new boot config, you can
76db5a27a827c2 Masami Hiramatsu 2020-01-11  908   * use this.
76db5a27a827c2 Masami Hiramatsu 2020-01-11  909   */
1e7feb31a18c19 Qiang Zhang      2024-04-14  910  void __init _xbc_exit(bool early)
76db5a27a827c2 Masami Hiramatsu 2020-01-11 @911  {
1e7feb31a18c19 Qiang Zhang      2024-04-14  912  	xbc_free_mem(xbc_data, xbc_data_size, early);
76db5a27a827c2 Masami Hiramatsu 2020-01-11  913  	xbc_data = NULL;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  914  	xbc_data_size = 0;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  915  	xbc_node_num = 0;
1e7feb31a18c19 Qiang Zhang      2024-04-14  916  	xbc_free_mem(xbc_nodes, sizeof(struct xbc_node) * XBC_NODE_MAX, early);
a91e4f12ffc42f Masami Hiramatsu 2020-02-07  917  	xbc_nodes = NULL;
ead1e19ad905b9 Masami Hiramatsu 2020-09-21  918  	brace_index = 0;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  919  }
76db5a27a827c2 Masami Hiramatsu 2020-01-11  920  

:::::: The code at line 911 was first introduced by commit
:::::: 76db5a27a827c2c89e5120a3d486472da847863b bootconfig: Add Extra Boot Config support

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
