Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38784223DEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 06:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634935; cv=none; b=RBzCqqPoQogmMw/95GtYrajLcemYbqF2+sZDZAzU3s+fMAjIOptmlKgK7JcXxm4/o0fDLN6m5ViWNsK8U91DocyKCmfUyxVmSOCQYOuuequKYYziCsIEfJEWau+LO9+ZJCbGBfTQWAbNYu7HuxuEaX0r5d8RhKvfC5iXNpUd1p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634935; c=relaxed/simple;
	bh=y0TT1eKtpcAeaCrSxKtsJq1LKAUbWboNZBsg8eZsy0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WGwQZd8OXx+Q8dDb3+cJTlR5mDzrcMbE1Qj4egYrf7vM+FWAhCkYZiY4ozzmi740fUtGhHLU2ChqSS9kX6MHwriGf+y4PXGmo6UZdDyCa6L6eJOirNWHrgAO9t4rnEz5hb2GqgA9wpdYipSe72UfL6MflJq1YWgQ8WiT0VAjwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qq+7A37F; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qq+7A37F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747634933; x=1779170933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0TT1eKtpcAeaCrSxKtsJq1LKAUbWboNZBsg8eZsy0o=;
  b=Qq+7A37FzDMhGdOhj2TuWsk+49WO6EBbdctw4Gnmsi4enZSZ6roFhXAP
   /be8cB2L75kxF3hww5dp3pOUJ7zUHj9j46DsPLE5utax+aX2SpcEnzMf9
   v3PWnE3/cYjn1BMykVS9HLzgKQInwrKZ/rsbmAjoJT5W6YHo3/b6tKpEY
   XTgevQa4w6X3+/e4t8gqZCIMF90Tncp4SmRBi8MCVMCoaIniRmIrRZOrQ
   kuLTVXcp2eeb+m7yX0+JrOgnIMdNoqGrpNMNjvALGgpL9SZUTtd8AXnCA
   s+8X6XdFLX4lzQRgSkQIAQKc7y4ZJRdtHNZhNLL4KHbpN4JY5/NuUWnRM
   g==;
X-CSE-ConnectionGUID: 4Orh9Ev/TaS5ishKOhQxMw==
X-CSE-MsgGUID: GHxV6gzFTy6qi+4RgoEt0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="48632329"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="48632329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:08:52 -0700
X-CSE-ConnectionGUID: oXeptpShQI+jnv3NoIwlHA==
X-CSE-MsgGUID: bBTCaaUXSAq4u7mZO7A/xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144043008"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 May 2025 23:08:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGtg8-000LBf-1Y;
	Mon, 19 May 2025 06:08:48 +0000
Date: Mon, 19 May 2025 14:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202505191425.Bg0I4iSC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [6/6] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250519/202505191425.Bg0I4iSC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250519/202505191425.Bg0I4iSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191425.Bg0I4iSC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
