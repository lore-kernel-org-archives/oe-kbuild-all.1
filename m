Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DAA354AC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762860327; cv=none; b=EeFLehRGzo1xjteF/SQM8holqk4QSxg87PTKH7mOVaYGuckWplx1PMYdKNy9KM84wb1VTegaB11/mMtx0zJNudESfOVXdoWq/Pc2ye1AhzMJalosLsBMLelit4ewuCat3v4GNju7REigCq+u+XKf8b79IYz5uLNqZc+kv01ikJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762860327; c=relaxed/simple;
	bh=3AqwdcWMAH3lipNX0omuSGz4lFu0WtweCdBFJVvBHLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d41/Sy2MZ/MRPaoNHe7DGeqe07dHzXaqc9HC4KiO4W1R7oofRHvDbMZAxBKWtyd3kUGsMqkIprN1/WJtz/+ws/1RIPIAYRB7W3k8mMJ5T68dEzna41H9xoy/61QXPR93f1lECND0/b0DL8n7kwRHJ7qVtyK7IDJ+6ZQzvcLcdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Np0lVq1z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Np0lVq1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762860325; x=1794396325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3AqwdcWMAH3lipNX0omuSGz4lFu0WtweCdBFJVvBHLE=;
  b=Np0lVq1zpYYj7J+swbMeZmqyNcFMFnXc7KiLm5NWIPOVCFxmuE4Izise
   bfdM64NcjhGqBTILBcGwjnArc7YTnM4zovJteu4CM51JtyliHAqiYtzIz
   WdC6lh2sLbV/dtB/8B8X54zxHCLMgVwgTctGvc5qcpAdn8/AfX5clsFnN
   VSvbNqVEbc9npjjCuvgTbgV/EMLHnYPOt5TmHllTvRDoyWgLJux70xVFV
   BLVH3ulj2ddHPgBLr+JQiVADGhp13nOmD9vB0BpiqnS4Gtihi2kALRgkJ
   D9am1UHa8oe2tkA/TWDWK8ujAY2TsSKTWIqOtXsWXiu31+jRuLaImsyi3
   g==;
X-CSE-ConnectionGUID: 8Ah6ByCDTTmQlK93p5vwKw==
X-CSE-MsgGUID: v17HKpYyT56gu1zgGlS1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64125267"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64125267"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:25:25 -0800
X-CSE-ConnectionGUID: ulfRi0vFRkilyenIu2aynw==
X-CSE-MsgGUID: xVbb8MtnR1i++cwatWXQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189203221"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2025 03:25:24 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vImV0-00035f-17;
	Tue, 11 Nov 2025 11:25:22 +0000
Date: Tue, 11 Nov 2025 19:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-upstream-mt7987 16/25] make[4]: *** No
 rule to make target
 'arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-nand.dtbo',
 needed by 'arch/arm64/boot/dts/mediatek/dtbs-list'.
Message-ID: <202511111908.732lWFLy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-upstream-mt7987
head:   ec10f8ba1916a5d0cabad62514f52a11fdc8ac75
commit: 301b4560190acace7a127e52d62738ea7c8da686 [16/25] arm64: dts: add bpi-r4 lite overlays
config: arm64-randconfig-001-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111908.732lWFLy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111908.732lWFLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111908.732lWFLy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-nand.dtbo', needed by 'arch/arm64/boot/dts/mediatek/dtbs-list'.
   make[4]: Target 'arch/arm64/boot/dts/mediatek/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
