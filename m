Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86438F24F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302060; cv=none; b=Q3Wb8qeoaN7WR8yAiRfhaD2l/i+8bDAz17kpII4xnS7QS4dSHkVY7qWpp06W7pfGp4Ez2GEu9fznxzNuFL0hewJgddSxX8hEfSj9UEvJpo4GIM4PSp6/I1acmg4VNihpp0dboZ/ZwyfxDO7NUau2jaLSCaf9RsqXW9sQR9lhHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302060; c=relaxed/simple;
	bh=N6NwxFL2vqqyyrEoUXLM/03zONXhxNa7Vrxaj0qsBFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b8wyvThXVbqr/pHooHiUlGJoTdICn8fKmKRl9x7yiv3vDfVFadRJcHEJUkiWs3rPu3bPdBuWmFtHhvneeNFYLWNAO+o+w1YWMtyoAPvTiJx+yUz90ZJpNGyaUWFWGpbBjj1vcG5g4DBJllkVmFem4t8XC9MJ6ZX5JmRvBAE5gtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFdB7uD8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFdB7uD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302059; x=1799838059;
  h=date:from:to:cc:subject:message-id;
  bh=N6NwxFL2vqqyyrEoUXLM/03zONXhxNa7Vrxaj0qsBFw=;
  b=TFdB7uD8md6+PZBNsaBK6yIoJ6IjWucL92EAhwEosIKG4W0Bbw2RlEuU
   leGHWJyCU/ED7/prlfGDQyS8p5d+1JRNUxte+0/7L5Zjvj0Yd4jwNylSG
   T1A5163z0ucWf7mlprFCMWUFExurPFL6C18BFMjAO/tRA4UCOvRaJA/XK
   0k7Fg8ZFGYO+VDPzuMfcA8SLxztuX1pSIJQf8bNJsquvPn3Vw6+ZIJlJr
   viqjb53506OPopyO4+MPAZUYwIAuTOZ1UBQuuNVKy9n1TQWELdf2xcixe
   7QI7Gbz+mOSRjgzSKg0nFdWlYFS6WZfOIpt7U9UL3M+JxI2oN48KKjnvB
   Q==;
X-CSE-ConnectionGUID: gWO1BR+xTdahhR73yoEF5w==
X-CSE-MsgGUID: KAf+rpq8Tiu2ZgPvKHt0Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="81036488"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="81036488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:00:57 -0800
X-CSE-ConnectionGUID: VOZSceyaQSmvCv5eNikpXA==
X-CSE-MsgGUID: isJSv7TKQrqg9lMAal/jMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="241870120"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2026 03:00:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfc8r-00000000EdC-1G6N;
	Tue, 13 Jan 2026 11:00:53 +0000
Date: Tue, 13 Jan 2026 19:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260113 15/16]
 kernel/bpf/core.c:2628:22: warning: comparison of distinct pointer types
 ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *')
Message-ID: <202601131800.zpimHAzU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260113
head:   52754522a0ac00706210372e66bc73f60fa759d2
commit: 3d33febc0f4b127981e2da9f1443f584b40c4d6b [15/16] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: powerpc64-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131800.zpimHAzU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131800.zpimHAzU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131800.zpimHAzU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:2628:22: warning: comparison of distinct pointer types ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *') [-Wcompare-distinct-pointer-types]
    2628 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                       ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2628 kernel/bpf/core.c

8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2625  
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2626  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2627  {
8c7dcb84e3b744b Delyan Kratunov 2022-06-14 @2628  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2629  		return;
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2630  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2631  }
8c7dcb84e3b744b Delyan Kratunov 2022-06-14  2632  

:::::: The code at line 2628 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
