Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966813B2AC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944177; cv=none; b=qCl2bWrlYBCXX/pci5hG32PTr9cMs1vwu8/eD/hqnanE8SEPbGkrTpOcO2M82HFbJkgsO1RmAqNBmKluGnq9dS8eDsvOaHcwh7bukFbnn/QxvVqUOLksy/5hmVdXZ09HCjaTA9fzQ0FeksCGgMOn8CwbRRAmB8VKBRfBKCAZryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944177; c=relaxed/simple;
	bh=uYxDJgvxxOCFhoZlC2PSXU4/rQ4qJGjvv6u2cjFmpIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvxO/P8dS4myqQtUfT0yvBZmOq0we6FfZNF93mHHMdIrY7LJjNx0m1PtbMz+bnbL1jubHbhsBojpoc/xzfDlOvOeu7ytyxYl/sBDHI7qCjp0Oab2bq0EGuaPFLHHUQKqC1QW2++51CuwddqBtevMwy0J7RoOBghd4gt8ZVWgnWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1VoPnyG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1VoPnyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722944176; x=1754480176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uYxDJgvxxOCFhoZlC2PSXU4/rQ4qJGjvv6u2cjFmpIk=;
  b=k1VoPnyGTO5B1c1327I2Ti3t0kT2/l6hw0X/hXiCut2iXOrK2Ru+SP0B
   xaEHE7B1N3WRUQJy5A07eVxyrfTUsSTC2B6Ph1lM2FNzF8oo/hYzpj/J/
   766oM0czlgCvsActUxuu2uytVKhk2EwCJr1XZT9JH9YDLFhDQDLrtdxUW
   tyTeVqKtxM0JoTxnIEu18h5sUOy00T2Uc6yXkiQLC/orqeflFQ6AtZMmQ
   LYZr4U4cDkC+w3mzqirJQ+BzVIcKUyJWRo4RGCNVDg2j40+SBrm+xYLyk
   ZKDlz376jXTK7JxxkxrNPPhnsNCUUqkqEEZjmRrIHS4Zmj2MmISwW8Lqz
   w==;
X-CSE-ConnectionGUID: vBXZkAXlTKy+PNM7mpqwtQ==
X-CSE-MsgGUID: tju+3PQdThixhIiKLS1E+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31587118"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="31587118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 04:36:16 -0700
X-CSE-ConnectionGUID: lVEmwPx7QRaHk8fftWmHDQ==
X-CSE-MsgGUID: OCO5f1RuSZ+cMgtFQ/llcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56184284"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2024 04:36:15 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbIU8-0004Rw-2I;
	Tue, 06 Aug 2024 11:36:12 +0000
Date: Tue, 6 Aug 2024 19:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:cpufreq-compile-test 6/6] ERROR: modpost:
 ".pl320_ipc_transmit" [drivers/cpufreq/highbank-cpufreq.ko] undefined!
Message-ID: <202408061918.GFWyQwc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: 51646201e21cdf40aad3925f7742a8d2ac727f43 [6/6] cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
config: powerpc64-randconfig-001-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061918.GFWyQwc4-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061918.GFWyQwc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061918.GFWyQwc4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
>> ERROR: modpost: ".pl320_ipc_transmit" [drivers/cpufreq/highbank-cpufreq.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
