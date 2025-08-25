Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A7309DAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145963; cv=none; b=iWa0b0R1dgAfvYIlinDBf3+QgENh+sOCbk+9FRRRMv27k+DbUk8eVq5foPdb4IyeKsySRXlMwhU//wht6QI/pFIcWLnVEJwhlGhNlYSQVctP+6Nx3bVDyTE1AymhWb2EF9Gc2ZUQcCsDawNZC8xG5p+X4I24ty0HuN0lMST5uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145963; c=relaxed/simple;
	bh=lBwE9cr+pudKzDktKWxjsOBQC/vt86mbaPVpo6PA8JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EN/mZuu7baeTj/6+OZpsto5MaI5v7ib0hqmDitvl2ETQ5+TpPd+rUuxk4Egj7U65q2gScjFAg+DSBxEt5gSxe1iGZ1C8d8DoVSWOkP9QziT+H7gYKsM0KLQo8mWsxbSnZd8IsrzahQx//pauirONuj9ObZyUnvHeRfrh3qKEVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvzycHd1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvzycHd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756145961; x=1787681961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBwE9cr+pudKzDktKWxjsOBQC/vt86mbaPVpo6PA8JM=;
  b=mvzycHd1+jnNBaUYNmLjqZ3m1F7xV+mx6UEaCu7Ybd/vnmQUTtfDE1W2
   LX1J19TUIGc8a+WHGMnYoqGhEMzuxPBgz+DCuOMIAKo4EKfSkmXsgOmro
   7kl/uJk10cGYwmu1x/WkutDSvCqpgTFFADZLLQHhPUrx00P5uajwaeyRC
   aFTbe3RrrUvCpJoFmCOTT4gmFM747zHgYjwZRmDgfcAxhJS9L2FRDrwWD
   gTeKYnA3OPtFk9uU6M6ZjXvMcTXbt7g0ll5m/jyIDzqwkAx2G7LxsfH0X
   F1YvDHTcq1Saxn2zwX4Sm7HVBdUKdqTewmk2+jzHRUG+fjgKjhQoycedj
   Q==;
X-CSE-ConnectionGUID: WwvYp+anTd60xtXrZYnESA==
X-CSE-MsgGUID: aqU+HOQGSGyrYRAtjuV/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="80962366"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="80962366"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 11:19:21 -0700
X-CSE-ConnectionGUID: 3teIk4ocQ9eEplnTo9TDVw==
X-CSE-MsgGUID: f2ve3dnsQSOo+BxxeAoXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="174640763"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Aug 2025 11:19:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqbmg-000Nub-1y;
	Mon, 25 Aug 2025 18:19:13 +0000
Date: Tue, 26 Aug 2025 02:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1761/1761] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PLAT
Message-ID: <202508260240.ljnQN4yK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6140b9e22a5c2bec953454ba4737dd9cd2a1f754
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1761/1761] spi: add phytium spi support
config: arm64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20250826/202508260240.ljnQN4yK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508260240.ljnQN4yK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260240.ljnQN4yK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
     Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
     Selected by [y]:
     - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]
   
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
