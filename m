Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFEE1DFD8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716763918; cv=none; b=BQZ4kW149m/san5HGR0cVDEQIcXmfJot/CVc7A5eWnhrdaR9AVFi3Urp0v2D9Ycu8e+LDE9kEx/cdNVSmgTBGOgNCMC3hpXYESw1EzlLfD3+qfgQrmrkorvfMSUdZKddILdnbK47Clhrw69xaSdNlnc7gGxFjYRHCAfvo0ZotzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716763918; c=relaxed/simple;
	bh=UclcTLmc4F8GRkY9JdlonJd4S/LyrUxaLmDI4IZtvGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJky3tAkx7+ZL3KwkOlJjmk04ApFJeS634UgY5QicpXy9DpBc/XjvGX8qEJjQfvRJNHi578E+l61+nm1PVo9HRM9OHtW65wITZss6vYwBnUIz0ulCEoX+GLT1S4clon1QW620fjCNbct2a6DLZiDJzYf3x8r8RER+8BoBDZtfus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nr078pD3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nr078pD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716763916; x=1748299916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UclcTLmc4F8GRkY9JdlonJd4S/LyrUxaLmDI4IZtvGU=;
  b=Nr078pD3PxEdNJu1YjziDh8uN0YQQcH6P2eM2ALN5bleUaEAGZr2qcD4
   MuaN9UxA/bEaZp9PFqx/7sTqRQhHL34OLG8F9gmgCbcQjRCX2yLlyWBiO
   3dy4gPT2vIMyf2Mqrvhj1UbY7oewURs9aWyNpj7MnrYZmHEG0Bh5+SZBQ
   XEF10AwrKRx6emWGRm7f36+Kdi+4WZn2Yq9uoj7ljjx82rG9NeBqOa57G
   IKM26r9hDOXaVXcLblibIlP5voJ0Z2m2zXiWXpMEXGzuvmBzpi9QGicOT
   SEXlxUA2pb2BSgHiAK4ETjylS6Fy0T9Q+E6h4JOYwHjVA4UeXcq+LpaxA
   g==;
X-CSE-ConnectionGUID: jwQ92RaWQlaJWISwPlOFug==
X-CSE-MsgGUID: Oyw/StewQCmqUpnj5/maiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16900049"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="16900049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 15:51:56 -0700
X-CSE-ConnectionGUID: 589wVklLRXqLjJHWTVnZvA==
X-CSE-MsgGUID: 5PQHxvK1SX6F53a8sYlvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="71972013"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2024 15:51:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBMi4-0008oZ-2I;
	Sun, 26 May 2024 22:51:32 +0000
Date: Mon, 27 May 2024 06:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29946/30000] kismet: WARNING: unmet direct
 dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by
 BPF_SCHED
Message-ID: <202405270631.OoFg4keN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f300accff5478c6324a1c31d0337bc28dda75ba9
commit: f23e7844132b626800d06e42d09e2ffe241c51cc [29946/30000] sched: Introduce CONFIG_TASK_PLACEMENT_BY_CPU_RANGE
config: arm64-kismet-CONFIG_TASK_PLACEMENT_BY_CPU_RANGE-CONFIG_BPF_SCHED-0-0 (https://download.01.org/0day-ci/archive/20240527/202405270631.OoFg4keN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240527/202405270631.OoFg4keN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405270631.OoFg4keN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by BPF_SCHED
   WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE
     Depends on [n]: CGROUPS [=n]
     Selected by [y]:
     - BPF_SCHED [=y] && BPF_EVENTS [=y] && BPF_SYSCALL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
