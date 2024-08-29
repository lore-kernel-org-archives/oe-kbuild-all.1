Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5018C004
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724965722; cv=none; b=h3FPLXj5jxjp6HHJSsoh3VvaV+K8H9Wvjlpn36Ls9oNp5K+wOSK3HsLzjDFZ57z6Rgf5ypVk6B/EYbhv+3ELCyNatQdRIUZ/hemmXvG4J2dVCp365ALPZwdSMjFegO4BjScF5qkrknJmGQ6smvZJjaS1B1ph+B5cEAzazdab+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724965722; c=relaxed/simple;
	bh=jBWRwPJ96QBjGKJ8ydTl6aE0nvHcC6nFPznjno6M77g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jpjA+O8SQhrf1PxiNnc1SEnQp9Ep4sJDdZ6cPmrtc/PwxGC5nPOo4Bc0HhyLQot2tGNfrB08hBMgUBlS4QyFso0IspHwImIqa6XT37Z38itdrK5JH2booc2Z9stNZ7Ef3y1jAh5vXClj1DML/gmcztERSPj+G8q3+9mvnqO0lCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjHbKFPn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjHbKFPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724965721; x=1756501721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBWRwPJ96QBjGKJ8ydTl6aE0nvHcC6nFPznjno6M77g=;
  b=GjHbKFPnJBFewPXBqvcwHJD8hGCUftFPqu/Pav1q7FGBpTGT6OOAdCSJ
   vWJYrhRO5pfuBEUHdvh0FgFmpeHG2YeLElM2r2c1gyo7Z4yt6XgLG6eUY
   IEmoGc0kb93JeHrOPmJHWPjUxXVqq8H/duK0TLusLlW11Vvu6JT9GT+BG
   LGEsDobclMqM3+4pUGxWMl5cXFQsiqGVe4ghZ5b0Dkbh3nGyFpupcccu3
   yVjkUaRYPzCnS/G4w++uUu69XVcA6uP//dGcU5T9rkGZrYYI7eM/syl9l
   dx/Ogm26uT6yoMCuTCK1UNsXWOaYUEDZR3KtnEsQ+8F9n9SI4s1aH481l
   Q==;
X-CSE-ConnectionGUID: Ei9n5jkUSaqk0xpwbUVPbQ==
X-CSE-MsgGUID: qEBMSnZFQp+l4+jMp0vZ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23452473"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="23452473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 14:08:40 -0700
X-CSE-ConnectionGUID: 1ZRQ3oeNTYCBb635M8VHSQ==
X-CSE-MsgGUID: h2HgCiS+QOOI/kHDax+yXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="63694952"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Aug 2024 14:08:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjmNg-0000ja-1w;
	Thu, 29 Aug 2024 21:08:36 +0000
Date: Fri, 30 Aug 2024 05:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6844/7693]
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb:
 scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
Message-ID: <202408300514.63wGUnTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b18bbfc14a38b5234e09c2adcf713e38063a7e6e
commit: dba27d026fc841d28a0ed373f617cc84ec0e4504 [6844/7693] arm64: dts: ti: iot2050: Add overlays for M.2 used by firmware
config: arm64-randconfig-051-20240829 (https://download.01.org/0day-ci/archive/20240830/202408300514.63wGUnTl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300514.63wGUnTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300514.63wGUnTl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
