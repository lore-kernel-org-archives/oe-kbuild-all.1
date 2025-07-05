Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A24689
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 00:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677082; cv=none; b=aXzgQCJhGpzMKDLrj719s38tdTv4mUpYqYidf5Vnx5wWCEAqUq82pQ6CPFNQUyYys3mRquHotd0TtsJOd6Q77y1FmzCoMhyKSsQshPw+7+CsoQBTizBQzX/xn7Ouq3p5G7lNxpBBDv5nymA8YnIlnnhu65Vi1OMMAHapbaUyOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677082; c=relaxed/simple;
	bh=2HoPGgP5mMFqcZVokL6cg0VhQnGUz/HEXARgK4XDCIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUGyyxqnksYZuZGyJ7P0rVHFblqbQbc8wAIEsz7YSMB1vUDt28z54WOF4+0fyjBTzFg1ZdUOshDDl55fa8Ro87tIsk9yPnXjFHiF9dWHM6vpHp1jcbY0654LCAnrYESsXNvVVXIKfmD6o8yZXfrZ+6LmWpMJa4ixm1gaxB5Hgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZVRSWAg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZVRSWAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751677081; x=1783213081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HoPGgP5mMFqcZVokL6cg0VhQnGUz/HEXARgK4XDCIw=;
  b=aZVRSWAgG1DqOATHaBQj/wAzLSeQF4sBAERtR8LX3mhd4YS4J1QLSRvn
   7JfBWkDq6EaNRZ7KhqowzJkVdTPsJI4LP+fKcFa/tHiA5ejAUm4D+2IA5
   mDacpPde3lkyihNBvLXCa2jWMnHsWSpEsi4AAIAdRdnrviO6rPsWXbrGs
   zMMraEU25yFyqeE9YNJ1yYYtN60SZ+wh65dTHvhwbFKQ0h8AvnQKjkL0R
   kJmL0lfIJB75mSnrK8IqHJxfP8Ax4I296ehs5hVvigajEE2mvAy3X8uvC
   cSZyG/FHuiaC0oQ6T/GiZMUudHrZnnTI/6pm7KzaWtirTIOHODZq6uHoE
   A==;
X-CSE-ConnectionGUID: 1TPi9RZCQzirZ3o+aDVjng==
X-CSE-MsgGUID: 907TKM/2R6GjB79VgIrQeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57667247"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="57667247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 17:58:00 -0700
X-CSE-ConnectionGUID: qC1qlx6JR5OL7ejckVCWkA==
X-CSE-MsgGUID: 6BaNV0oiSPiSTmQWa9/atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="155495719"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jul 2025 17:57:59 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXrE4-0004Al-2y;
	Sat, 05 Jul 2025 00:57:56 +0000
Date: Sat, 5 Jul 2025 08:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3016/3016] kismet: WARNING: unmet direct
 dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE when selected by
 CPU_FREQ_GOV_SEEP
Message-ID: <202507050829.0HqpONGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2a3ac10b13b7c3c9478f021bad33d63cff76b894
commit: c3fe0dc62217d6faa76128ed26d64e421767919e [3016/3016] cpufreq: Add SEEP governor for hardware-managed P-states
config: arm64-kismet-CONFIG_CPPC_CPUFREQ_SYSFS_INTERFACE-CONFIG_CPU_FREQ_GOV_SEEP-0-0 (https://download.01.org/0day-ci/archive/20250705/202507050829.0HqpONGE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507050829.0HqpONGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050829.0HqpONGE-lkp@intel.com/

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
