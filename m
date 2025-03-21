Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8971D54D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742585114; cv=none; b=Q47vwKEzpiGGwsmhjvzTgYooHTE6sjD23fj0pMuKpbvwa5mfx0I4GNRWWAS14rlsr0WNNPwp+fbRUG/xR3+clbWK9m5noIsYZHC2ACoVn+kVSqi/wUCrYRQv07J7wABdQKy79WBiooeV0+UHG5B1SyIv1fu/GeyTeMhOOT4SOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742585114; c=relaxed/simple;
	bh=LIU1Xjn7NN0r89jZ7qe90/4zhXrWWALcBHyYPKJ1PME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSNsoqjJJSisL7TCBHNI3LKgFTAmDAvl4eV88sMqdkscLD4UdlHF3qDfaF87yjUwOqy9F7uP2NhFi4b2whX0Yyw5EY+vJiVg4MqEX1UKbH6DPF5nOxNv77FCbCvWtxkwLPzLZ079dB+9Gv6Zw08xCKlE6psST9RhHkWj5f7bE8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjLqUmmi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjLqUmmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742585113; x=1774121113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIU1Xjn7NN0r89jZ7qe90/4zhXrWWALcBHyYPKJ1PME=;
  b=TjLqUmmify6oc/h63eWag7oGGLxwnsWNGn4zec1z7vtJA6TuxWyzOGQ6
   Cz9aodoyCGixPKuDp87+MmnIgOkeSFowBcs4qPX+aRERsWRnv6gvoDZ8Y
   6KajRDncl4+xtQtDdORt0t8nn7Rs+G2qssHRqzDHTRAYT6RRfer4Sf19H
   EVBqWxiXrjEu/H9sqiLHQJmzP8r+tpFw+cfEwoZNXOSCj+BnLCXmOEgOK
   MMLsEwCx+FPQdbeV/kSp8OOtLx6X1SZOZIoEz2Bx6orh/3IZRzuJkDhlK
   pwQgUESXv2q1PnQJz59OHzVhpry0NMOOdfHKD3his8tCWFh/5lE7r1jDD
   w==;
X-CSE-ConnectionGUID: t4SUWRKZTz6MXTp4bgUrpA==
X-CSE-MsgGUID: JTZ+x+O/TFmBNHxNZ94FmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61257151"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="61257151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:25:13 -0700
X-CSE-ConnectionGUID: /UX+rXltTZODchNPXzI9lQ==
X-CSE-MsgGUID: VhPMNrdZQUCfeiS5wrjEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123457436"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2025 12:25:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvhzR-0001ct-1y;
	Fri, 21 Mar 2025 19:25:09 +0000
Date: Sat, 22 Mar 2025 03:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818] kismet: WARNING: unmet direct
 dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE when selected by
 CPU_FREQ_GOV_SEEP
Message-ID: <202503220351.uj1q69QX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a7973281031cedabf6c66de13ffc2c313a71695f
commit: c3fe0dc62217d6faa76128ed26d64e421767919e [2818/2818] cpufreq: Add SEEP governor for hardware-managed P-states
config: arm64-kismet-CONFIG_CPPC_CPUFREQ_SYSFS_INTERFACE-CONFIG_CPU_FREQ_GOV_SEEP-0-0 (https://download.01.org/0day-ci/archive/20250322/202503220351.uj1q69QX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503220351.uj1q69QX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220351.uj1q69QX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE when selected by CPU_FREQ_GOV_SEEP
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
     Depends on [n]: AARCH32_EL0 [=n]
     Selected by [y]:
     - ARCH_MXC [=y] && COMPAT [=y]
   
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
     Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
     Selected by [y]:
     - CPU_FREQ_GOV_SEEP [=y] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
