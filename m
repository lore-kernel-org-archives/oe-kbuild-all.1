Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCA81D63C2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746963879; cv=none; b=YN/zL/MVpf4vP1E1j1QPIe6Ift3LJL1rFGRw2GpK4LARyUIjcAkm3mc6O01QFSsmeluAmYC0pP0SlD0si2fUp5m5b0M6ohj/45j1lYQlG1IkR3b9qXDuteW23xf8Q9kLqDu753ju+QkNGR7XndZOtsPReAxayn6pHMKtjtE217g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746963879; c=relaxed/simple;
	bh=Hvs0+1QVo+bB6NnOnGcS61or33tgxrgJtQc+nt7V2As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rdx2CP2tM1+HeXnf/rUw/TkgDd+FGmKCSWPqH4dr9eF428YyFdzj6IsjpFFpqge6p3Vw3fmPmYio0lI8XJ6aRb90n3+XvgBOzBgOIFAcpC2/cX/dPXwNx1e+6s35brNQ/4Xpbiqw4wLbMcUHBp0FiAZHK2ZQJznnScyGXBxiO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZNOm7o5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZNOm7o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746963876; x=1778499876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hvs0+1QVo+bB6NnOnGcS61or33tgxrgJtQc+nt7V2As=;
  b=VZNOm7o53LoYP7+gWWT8B6qW9wYkqotj9ekK0Uy27nha0X0msTf3V9MK
   o9NBW97WdPbgBuO4TEVmmVN8FmWt+1us/jgQrhKHUReuUDaZxA7I4Xyxh
   DhoHsHtCsxPUbLpjyZuKhXKCocY5cbpo1ZPxNli8MLvO4uJx1elk7g8Aq
   qeAJZgvNL8cKRD4+E/Q7EfhjUeqhJD37FC88pVXFHsfIlMjDgVZbk5P+u
   4wnO6QRil++GnKwkkulQnogl3t/OIfCI75OzXpszTZSHIJO3/7w/kMj/m
   /T1yeVHwfCAkh5Cc9lSonpZZoyEdCx0/9jLmLgGo3InP3/hwI46rwwPld
   g==;
X-CSE-ConnectionGUID: ExR1U98XST2QGz3yIM8mPg==
X-CSE-MsgGUID: vci53kBpQQymDr33KqAHwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="52571439"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="52571439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 04:44:36 -0700
X-CSE-ConnectionGUID: +CP2vwfzTpqpUZvezL9qNA==
X-CSE-MsgGUID: S2h9vFG9TpuIH1j0tqdXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="142072721"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2025 04:44:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE56e-000DkB-2N;
	Sun, 11 May 2025 11:44:32 +0000
Date: Sun, 11 May 2025 19:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] fs/resctrl/monitor.c:629:6:
 warning: no previous prototype for function 'is_rdt_domain_valid'
Message-ID: <202505111912.KsbfF9qq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5b7daba404993131fe0d699e5acdccaa5bc3a017
commit: 31ced9c393b10eae279272746b7a8cc783c9e0d1 [0/94] anolis: resctrl: fix UAF when domain offline
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505111912.KsbfF9qq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111912.KsbfF9qq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111912.KsbfF9qq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:629:6: warning: no previous prototype for function 'is_rdt_domain_valid' [-Wmissing-prototypes]
     629 | bool is_rdt_domain_valid(struct rdt_resource *r, struct rdt_domain *d)
         |      ^
   fs/resctrl/monitor.c:629:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     629 | bool is_rdt_domain_valid(struct rdt_resource *r, struct rdt_domain *d)
         | ^
         | static 
   1 warning generated.


vim +/is_rdt_domain_valid +629 fs/resctrl/monitor.c

   628	
 > 629	bool is_rdt_domain_valid(struct rdt_resource *r, struct rdt_domain *d)
   630	{
   631		int i;
   632	
   633		for (i = 0; i < NR_CPUS; i++)
   634			if (r->rdt_domain_list[i] == d)
   635				return true;
   636		return false;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
