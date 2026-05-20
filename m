Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F73D75C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 17:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297405; cv=none; b=Hh4GJU98QjAiy1SXxlW3dq89RKx2t12fpolLnuNkWsJtJMJPbuv3tP+tDcXKplRksAHMQ2JFoqMVlehs5Ca7jXnC4dbsWEXORMhF+uSeF8FC86OasQvc1rQaczz1b+4jyiv73TuSgkgTmhEZqY2irsBV7Mxsi62laxnBQIAALyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297405; c=relaxed/simple;
	bh=YjqNrr5lMVwQPgPaQbvXVPidegSuty7QKx+Ce9LIYIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lsYz6TbSk9Kdzh9Y5UYMbSaJrYmf5fDDF1yLF97jWKN744ocGInIzwSZy+mvAgnQ2XD7EBtCuFauN35Vh/y8zBgsD3ZjxE6OJspEViH9eSw6PDMAAyHrfFI/em6kS3b+towXmu9O21jHWdwlWv5zTFLhY3hY7J3xHmSFiSEKp5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/EGOppi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/EGOppi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779297401; x=1810833401;
  h=date:from:to:cc:subject:message-id;
  bh=YjqNrr5lMVwQPgPaQbvXVPidegSuty7QKx+Ce9LIYIU=;
  b=R/EGOppi6BV8kGL6r4D/VFgdnsXshtTxUW7mZmeoNG5/oaq1UNkSV8zi
   licPolDPvAf2ZApr20nEJtuW7UepgqLyF72a2YUu7b9d0PccEaFxD8Mk3
   4xBC8oVkVh6PnPqZwO6b+IJVGsY+n/Z+YY7WzldVYgOw1aBHbSew6CBB9
   IGnMqBjxCPrkT7HvUlskUxdzm4EHnhfJdeYORrdEZTTceZgtOiLCOYlvp
   VTdpvnW2R+Yb6LchjNeOxfGVXEW5vkY2t7jIeR2N9SBly8vr5I0rfqWtu
   WNzwlGS+xX+28PRvj7f6pxc+mCCbX/DXtFCvQ5YaWAdkk/cSg42g9Ex7n
   w==;
X-CSE-ConnectionGUID: GYVPmUSySWaqBqvifw5RBQ==
X-CSE-MsgGUID: 7REEnSEaQeWg2cVHNzOPDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80108274"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80108274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 10:16:41 -0700
X-CSE-ConnectionGUID: I8JqDw6vSsWtuZdRYq+s6g==
X-CSE-MsgGUID: vLrQLfWrQ329tEg1qwZzjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="264055303"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2026 10:16:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPkX7-00000000Abd-3AIl;
	Wed, 20 May 2026 17:16:37 +0000
Date: Wed, 20 May 2026 19:16:02 +0200
From: kernel test robot <lkp@intel.com>
To: Alice Guo <alice.guo@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: FATAL ERROR: Unable to parse input tree
Message-ID: <202605201924.kW49enlc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/arm64-dts-freescale-add-bootph-all-to-ULP-watchdog-nodes-for-i-MX-platforms/20260519-191349
head:   6e7cb66ece024d1282d112c147cc5e6137c45b34
commit: 6e7cb66ece024d1282d112c147cc5e6137c45b34 arm64: dts: freescale: add ULP watchdog nodes for i.MX platforms
date:   30 hours ago
config: arm-randconfig-2055-20260519 (https://download.01.org/0day-ci/archive/20260520/202605201924.kW49enlc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201924.kW49enlc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201924.kW49enlc-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:337.14-15 syntax error
>> FATAL ERROR: Unable to parse input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
