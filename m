Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF522156D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756586391; cv=none; b=WcnCTfLpKtWiI5Uao/qx3+IRkbnFfDo1rHXU2xUKaiXUxHlAiVi29PmIw4GLe9AADDHWPimJsX0uhn03FCPp9ScFnfYiMQlXpywP9IutJYkYT5eBflcW/+02QTVtfmXLExjQH9VoVS9XlpVhYb05ddAeXvj7kHqxK5OTypEHdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756586391; c=relaxed/simple;
	bh=VRJTdJ7g3sXw0irUjYNDC2vphUhoacpzhjf6br4UAZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3G4sn4a6WyU/em+1noFuYflsi9sf6UE2qzPPyOakF37fICULpB8GywGafiFTDdsW+KsFTPi8/iAH7jr8NwoXMr0ig8uirFnfHfIQ0B+Jit8bWi8ATPXHOSSDYG5H/dx6O3xLq46ndndlqox3fl9hiYLnznWdx6fXFrpGDezNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO+rcpHS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO+rcpHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756586390; x=1788122390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRJTdJ7g3sXw0irUjYNDC2vphUhoacpzhjf6br4UAZY=;
  b=NO+rcpHSfrVwr1+T9s1FUpAjQJEhbqlR3zJIDQAYwT9XHVm0B4vy67kA
   rKEuRf6f9jKn+I+7TDQH6matIOwXVrFtvzWZhIbieYdm8zvG3u0mLS9mX
   TgrZogfijBkdLFFhvJ6VRVbrXAZ6d71N2TmSyVMgMfYyqETo7aGeaEFSM
   SSysYk4Jq2THcMrYzF0CXRu8Yw4bijMjkPJ4CSXQy9O9lQEd82VfH8bwU
   Zp2foRVYlqI595iPDq97ApZFijVcpB6lFTGZiyhJd0w/niuxNyH+yvbl6
   qjHEN41i6M2reVmwqpeF+conNz6cTNDPgKpvEvTpf+tNc4rszcBpYDpkZ
   Q==;
X-CSE-ConnectionGUID: 5LLjlva5ScuX7d33Uwhukw==
X-CSE-MsgGUID: Vq89HSPMS66/ZxXBQboIYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81428391"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81428391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 13:39:50 -0700
X-CSE-ConnectionGUID: AD/B9Eo9Q02L+gQH7ranpg==
X-CSE-MsgGUID: ef4q6m71QgqVQYXfvyHUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="174810950"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2025 13:39:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usSM9-000Vgn-2U;
	Sat, 30 Aug 2025 20:39:45 +0000
Date: Sun, 31 Aug 2025 04:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for LEDS_TRIGGERS when selected by BT_LEDS
Message-ID: <202508310401.kMoxiKv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: arc-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_BT_LEDS-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310401.kMoxiKv9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310401.kMoxiKv9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310401.kMoxiKv9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by BT_LEDS
   WARNING: unmet direct dependencies detected for SND_CTL_LED
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - BT_LEDS [=y] && NET [=y] && BT [=y] && LEDS_CLASS [=y]
   
   WARNING: unmet direct dependencies detected for INPUT_SPARSEKMAP
     Depends on [n]: INPUT [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
