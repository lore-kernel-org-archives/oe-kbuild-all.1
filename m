Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364B1AC450
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840684; cv=none; b=qAEZWwMsuRXvYy/6ZEQhQGz/RzIg8mEnLTrayW7boxLnoYG4PCs05S2jLAUxYS2M/fyAfm+DO5V8z3Ji4etZXPq4jyeQR9FfkbgjK00T3jrdLmtngZ18M1uWEntJDhFkv96ztBS+VAdWtpK1tEMqlph+gry1k1/sFlB6tZIlJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840684; c=relaxed/simple;
	bh=5CIznSrwG9yRVStowAUtJ/zYJteqxdnf7Xa86dYZwEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fO/qSBJtHxD8Ouq5/GBD1HqwemNtBf8b4b/p0UJ+hYKDro27BUl672MadIUtysP0Pg6nC8197gZhMJniXmLjwo1Y8TlgrBZg6LLLYhlhqCswIX8tX9fp+IY/RoRwgJb6N1GF2l21I9MmGOZNYedUsAPTdaEWfZ39jm8eEea7smM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYEs3BQU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYEs3BQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733840683; x=1765376683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5CIznSrwG9yRVStowAUtJ/zYJteqxdnf7Xa86dYZwEE=;
  b=SYEs3BQUPB0YVNbJzcML6azJjOdshEGJiM/muQ/Am+ZFSOCj6qeKYsXM
   Pfp0L87DAuPr7cHqQh3TfvrWeiahd3mRxrpaeJnu+Xju4WxFDqraaWu+I
   h1ub2iukQqQzwSsQvl2pVVlCaZGU+jKT5TmDPBMTpNtEwxci/pj0bJIhc
   hv8c6mAPD1zP8SRMJLTh6AZrC5xLsN95/ZtFtkvWWkzKTSBoiKJjL8sOn
   OBNAK6qDCoHQpbo3o9Kqh82VkpCANi5Uj3pLrlclHSELptq5ZUlWxKAM/
   9CLVHb2/mx9roGE5gwwjSg9Ea4i6pPyTEiC2bV4rOFZiy1hpUTy1Lj9M9
   w==;
X-CSE-ConnectionGUID: 62CfFrnhTRiiQwdFoRjPSg==
X-CSE-MsgGUID: PcacOiZwRKutmUWxXmlmFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="21769364"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="21769364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:24:42 -0800
X-CSE-ConnectionGUID: 4Yx9cAgaQqWxSTXFBs7hRw==
X-CSE-MsgGUID: O0d8Utp9QCyqe5VpeTRJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="132817112"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2024 06:24:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1AE-0005dm-08;
	Tue, 10 Dec 2024 14:24:38 +0000
Date: Tue, 10 Dec 2024 22:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 20/20]
 kernel/trace/bpf_trace.c:1073:22: warning: 'ftrace_get_entry_ip' defined but
 not used
Message-ID: <202412102200.VxJ5XyTL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   67c5c1e927ddfd83fc95b6a446a54e19c25d13c2
commit: 431c8568e77d5ddd4acb63eb650893998f35beb2 [20/20] bpf: Use ftrace_get_symaddr() for kprobe_multi probes
config: i386-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102200.VxJ5XyTL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102200.VxJ5XyTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102200.VxJ5XyTL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:1073:22: warning: 'ftrace_get_entry_ip' defined but not used [-Wunused-function]
    1073 | static unsigned long ftrace_get_entry_ip(unsigned long fentry_ip)
         |                      ^~~~~~~~~~~~~~~~~~~


vim +/ftrace_get_entry_ip +1073 kernel/trace/bpf_trace.c

  1072	
> 1073	static unsigned long ftrace_get_entry_ip(unsigned long fentry_ip)
  1074	{
  1075		unsigned long ip = ftrace_get_symaddr(fentry_ip);
  1076	
  1077		return ip ? : fentry_ip;
  1078	}
  1079	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
