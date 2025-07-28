Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78C156F4A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697687; cv=none; b=d860sENzB/6PMqLBGXC3qhaGhpt0KBKXWOtEKc5P7sQDK7sHxN/Ts3isRVtb/nj7+PkpND5JEEXT9rTrQ2OXlqvyCv7X25OWoNRg6om4+NgGOBxAd4vMnG17279kGTuWfKD60iDTRd1QYCqdnn8gJjCobwUGo+3dw8CvMftHGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697687; c=relaxed/simple;
	bh=br95dt6I2l4SWMzdWtoMIi0MQHfB48sYcBMhYDfufiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3VijihvzJLfgadC91eqk/RCF75CucgIf9ZArb7Ss03MW54E6MptLecXKP3742asbJAtN33dEj4/O7mgqQoea7nG3vEGlP4/pdMU+A/mfhK21o395DGdJSC39xR7Poyt81x6byEBExh2ov7SUCaV/DtNzPi/FmDHJSZSVucWEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6teumDX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6teumDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753697686; x=1785233686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=br95dt6I2l4SWMzdWtoMIi0MQHfB48sYcBMhYDfufiY=;
  b=J6teumDXfvnK+pEri2KNM2UUuSRNYZJsIgstcll6T83bUnHHt9THKTWs
   DtYWpeophrgh2Rj9XLsFudbPrdOtCrU5opSpoTqdXR6h0+ypElj0WjJLq
   YDjZ/cmnBLFThgOt+7PiX9/dMkoSqCDz8YZQWWP3BQmO3pcmtqV8Miwh+
   1lSicfrDN2N3VInuEFXt7udurTfG0RpfvHr/X2L1lcNB49/q1cZ+BBnd1
   +ZYwETg6rUwG59dIv+A8i2qDGuc+VRW6jUrxCt9lT3hQvKx/3EXz8LqSf
   5ioiyY8DkYuj6pEkRVApyamJjrGOr3siAcjZ6o/7QUS4v6Bz/DujEOZKA
   Q==;
X-CSE-ConnectionGUID: eRyRGOiTSyy7I1dNqHW2zQ==
X-CSE-MsgGUID: eJpX/NzqR9e7t1CChs2z1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56089265"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56089265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:14:46 -0700
X-CSE-ConnectionGUID: YNh+toMRQ1aOkyY44cRQ9g==
X-CSE-MsgGUID: PZ9zn5OOQ0ePB9HAzKxtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193239114"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jul 2025 03:14:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugKsU-0000Nn-1g;
	Mon, 28 Jul 2025 10:14:42 +0000
Date: Mon, 28 Jul 2025 18:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Subject: [gdamjan:v6.16-rc7/ipu7-imx471 2/5] ERROR: modpost: "__udivdi3"
 [drivers/media/pci/intel/ipu7/intel-ipu7-isys.ko] undefined!
Message-ID: <202507281847.F04xqhPm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.16-rc7/ipu7-imx471
head:   2b7add903413b90809ab143b6ef55e986bf5630b
commit: c555d9e3c9bd8c22654cbae8aa9b3a2ab74902d9 [2/5] media: pci: intel: Add IPU7 Kconfig & Makefile
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250728/202507281847.F04xqhPm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507281847.F04xqhPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281847.F04xqhPm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/pci/intel/ipu7/intel-ipu7-isys.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
