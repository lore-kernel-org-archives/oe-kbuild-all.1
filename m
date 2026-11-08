Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794120721;
	b=oiPoAGngaH3/j8p7xQhlF/7fXqPcbf1Q4BPTH8is/YosUzVeKCqM1d1VTezwi0N5ARsT
	 lnZufxMJ/MGyjeYvEW8pF2k+R+Nc9DIY6BT5C7hTIGJhgcFQ0CiN2C5/9LvaMoDzAF3UX
	 Stl0BdMljbO+I1EDDgD/wuAHeeNnUuPYprkDU7pQi7HEG3luXUu8gNVu31vzSrfO/C3tg
	 yqNZlOdfShGZUC/onzdh7mUzSHNEDmOV9Exs07o1Uah1kaNu5GTDnlCtzJsjzwXh8AWX5
	 ZMGZ3Fc+zlH1H2VRtAi1bXN3v4zfUJaVw2Nwdow4QL2++XZLlVUq5UP6dDQ/wE+A8mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794120721;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KRb1bhViL21DbEiIkU3q3undiPnq/SUZBNEEtl74rSo=;
	b=xAJ6F7Llxjjt2BNXnak7hGcNwb/ScZXfwOducqfNEvKsmAiAS9XWQXUet2LpjvQ3TUDO
	 W1TYaJt/pMW4/zEwHDms1Bd1qhjk32Gvv9bs+pwnnGTQh/VVuYxwf5KK0brOaGj+s/mMh
	 jvqP41G54e6wmsllkuvAeaG1oO1YtRd7oroLfjYIY0nI/contw0bnCnoVJ2805Fz60AKM
	 iU3KWrG4mETarGaClwlP/4zmRzLBI34jfwtXNiqlgo+D2MDVYxmrdgRTEIBo4P9wdDBfO
	 x9FlLtRC3c6JQhKA0N/+d4ti8kSy7vPkw8/UCB+DbZzM8YamS3GYPubdSQxaBJiuhsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdoNdDem;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF6F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 06:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF6F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdoNdDem
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794120721; x=1825656721;
  h=date:from:to:cc:subject:message-id;
  bh=f7FRfXPWOe6+Wp5R1LdVrToNc1q8I0CFx+dr66ccmJM=;
  b=EdoNdDemscLBNj8Ud9yWsIDFiBtZcyHzW5MecIi46x9bcc3NXfpht+m5
   FK+YowuwkpQsoS9b8yeM+4gnFoP4BnIz+aqOGkYecZdOPYv3Sy5t+DJRf
   xGtc/oNnJjup1+zOyWublLt7xPG6oAb6SREyHsWLKinQ8UXBC+07A4M1w
   74GHuugXwbUP3bZ3WMXV5BP15ofdtQATVLBCXTiDgT4rg3qLO89CaEd36
   HAn6gjqe7FOsmZqMfUiZhxAi7WKJWrUup+Cr6DvbmBDYnRCuQ3vfhoG7a
   K23VIMaO7quKmZBDqCaaxhnpaR8Xu6sV+Epvc8UZ1J5kXBv5XdgYvtO1U
   w==;
X-CSE-ConnectionGUID: Y3nKICTARZS79laGD01B+w==
X-CSE-MsgGUID: UbSBYGx+QNe1Yp6kA0lw/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2759652"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2759652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 22:52:00 -0800
X-CSE-ConnectionGUID: o5/4JfNOSPWdDvqQQHQJSw==
X-CSE-MsgGUID: l8nr//BsQV+XY6w84Hfufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7941544"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Nov 2026 22:51:59 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPwks-00000000B4G-1mFI;
	Sun, 08 Nov 2026 06:51:54 +0000
Date: Sun, 08 Nov 2026 07:51:23 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 39/154] ld.lld: error: undefined
 symbol: mtk_xfi_tphy_valid_ctle
Message-ID: <202611080729.NuSbXCQX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: 9a052b8df8d2bc4bf7dd144f34dc9aa7d60f0b6b [39/154] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: powerpc64-randconfig-r2107-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080729.NuSbXCQX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080729.NuSbXCQX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080729.NuSbXCQX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mtk_xfi_tphy_valid_ctle
   >>> referenced by pcs-mtk-usxgmii.c:387 (drivers/net/pcs/pcs-mtk-usxgmii.c:387)
   >>>               drivers/net/pcs/pcs-mtk-usxgmii.o:(mtk_usxgmii_pcs_link_up) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
