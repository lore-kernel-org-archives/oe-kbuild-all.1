Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B4F7B3E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733357944; cv=none; b=GWPzZa+tmiCjohReaGfF6oOFlQXRUorPE7iJNBcq4jjh5ZHZFsNT6ybMcBl7/dUomy0pCVIPCy27BAt2ufhe3lF/rd6evJpzgDt4RAl31epYYFSSXFGp2Zzwr+yNackOarzOGPkD/CpXK35NDprnx3oToqzkJ2uvteLgzDr5iRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733357944; c=relaxed/simple;
	bh=BVR+VNy8tlcSzHxDEFIzzGzDqBzaofu9NVNNrYVN3zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rMjvSbsPPJkBusQWAblVV/ThZ1ESj9DBlxO5ftP1rzzt94azb9bi3eFj0QPdIxTULiVh5hGmOR0OI3d7j1vd7sxP8K4fA8ADMe8B2HpWujxKl2bVIEHeOcTr+GW37JuC/cmwy7HZ2ZGhHS95DEP5hegwTujMcQJDPMXQT2q1ByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxZ8SwST; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxZ8SwST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733357943; x=1764893943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVR+VNy8tlcSzHxDEFIzzGzDqBzaofu9NVNNrYVN3zo=;
  b=TxZ8SwSTnC7DIsfrO/vRczDqJrT1t8b72OUD20xH/hXQGtdDCF3GrZsg
   LROAYxygWcukUQTANhnYMBtjR7fU+DP+HI1rIrv4gd57sLh4Td7E4WM9E
   JG1CltUYCB4UnVTPBhdNjh7UL967SYkLYuvrIk05XBqI7Tvf4j0DoXFX1
   ZlDOpqbLCn6zYa810OHB+f4GUSGAOuS6XSX2rOAArpGhk2O94SyhYsynf
   rI0pEYF9vnb0dqjke63LhPqfZJZucMxcjPl+KtVqVHmPs29520l2GqEJi
   R/UpEPw5YgAOmJKEsk/ItnBFwnd3wbFtwZ24Szpv02gYP/2cMQzUJVryL
   A==;
X-CSE-ConnectionGUID: h3fiSQ25S3iM32ziR30Peg==
X-CSE-MsgGUID: n1Y2jjZCShCW7nmPQy6/0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33391591"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33391591"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 16:19:02 -0800
X-CSE-ConnectionGUID: UHXYQ6ZmSUal2lcuGhV0Hw==
X-CSE-MsgGUID: DO9PZz3iTC+PQOga7gdPmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="124846003"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 16:19:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIza6-0003bh-1R;
	Thu, 05 Dec 2024 00:18:58 +0000
Date: Thu, 5 Dec 2024 08:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishusen <lishusen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1590/1590] kismet: WARNING: unmet direct
 dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
Message-ID: <202412050801.pbrkJ2UJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a2c7a5a53b2787fa56e28a271e9d3894f70e8374
commit: 6df2e969a6de3481167ace4fe42f69812a6c7fc8 [1590/1590] arm64: add config for cpuidle-haltpoll
config: arm64-kismet-CONFIG_HALTPOLL_CPUIDLE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20241205/202412050801.pbrkJ2UJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412050801.pbrkJ2UJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050801.pbrkJ2UJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
