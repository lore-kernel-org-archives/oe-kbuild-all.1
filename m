Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471136FB0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071312; cv=none; b=d69fWgfHMrMbvxZmNTKeAJzZEohWvqcpvgjg92Sd9aP4WFH1ptrbkNeQD72YTURXnFYmVYJ2tHQTxaOtnG8gYadNaIUn121JKbfUvCZflyY3S2GWauYcbymmfZV9XXHUQyvcZWtrqHr8LAryIS/hnpIcUCklWNVeIggH+pZUCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071312; c=relaxed/simple;
	bh=skJm19yxFdQK3km09gQ0K+pwsx5JSYdnoMDLyLWan/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZ0epwlpiBxXJpJutFOwpT2Twhr/3XY7yOrHIRF3GsuNxh11igxf/AVBmSWSmG9ionAwqBB1U1ifTE5ed9TAQJWN5KrRJS2JSYBzqaMDp1epFVidP2KNRhzLf8YjkBMXGakUUym5Nv9rzAwUM4oSpcgkKK+f+5SuGnf6+8Qx+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L303fow1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L303fow1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739071310; x=1770607310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skJm19yxFdQK3km09gQ0K+pwsx5JSYdnoMDLyLWan/I=;
  b=L303fow1bCbXrSuwXEF0omDbQfV1sIfoT7ZrWlYJRLfuR3eDzULLVOg2
   Rd6ZXyw5kplsopcbH0rllFgvcZ/MqaOCVPB/kT2SWAQVxyA8RT3kJ2ONE
   uVpj8ZyaBvVO61dvpUIl7ekBuincmTq+ptemKTmQHc2g0c7eyX6bV1glb
   PlavjMgV41ZM31pmpD4CxdP9sIvwfs0x/B90S102P0UqQDdoiFIPXbRXj
   6NqJaJuVVKXvCPXnn23OmOo1U89bx7kOxf8+86A+Rh0Qv4RrbFAdGjOVx
   eU+L7sR/ol2kTMO6GO27PUinRL3ibQZqBfEm6B0NUbMbnm/uaY4Z1zNom
   A==;
X-CSE-ConnectionGUID: QtCrPFSPQaOFJLl1w2e9rw==
X-CSE-MsgGUID: atTzCYofQUq/mosBDDMqsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="65033302"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="65033302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 19:21:50 -0800
X-CSE-ConnectionGUID: lqu+6MlESemXLXfxCZwqsg==
X-CSE-MsgGUID: 4mhXmXmETn+b8JLW0WGvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111704894"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 19:21:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgxtB-00111H-2S;
	Sun, 09 Feb 2025 03:21:45 +0000
Date: Sun, 9 Feb 2025 11:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2732/2732] kismet: WARNING: unmet direct
 dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by
 BPF_SCHED
Message-ID: <202502091108.0W1jorJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   263072f655dcd6fd63f7d5dd1f9c5553134982fa
commit: f23e7844132b626800d06e42d09e2ffe241c51cc [2732/2732] sched: Introduce CONFIG_TASK_PLACEMENT_BY_CPU_RANGE
config: arm64-kismet-CONFIG_TASK_PLACEMENT_BY_CPU_RANGE-CONFIG_BPF_SCHED-0-0 (https://download.01.org/0day-ci/archive/20250209/202502091108.0W1jorJu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091108.0W1jorJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091108.0W1jorJu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by BPF_SCHED
   WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE
     Depends on [n]: CGROUPS [=n]
     Selected by [y]:
     - BPF_SCHED [=y] && BPF_EVENTS [=y] && BPF_SYSCALL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
