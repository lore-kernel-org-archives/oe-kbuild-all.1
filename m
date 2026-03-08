Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397D3783D0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772975738; cv=none; b=BGsPh2Q3XhDi7y0lT+GYZRGZNTv3jqkVPz97ARnuWDFFtwIP6JwLvmYH7b3C0CFavSEj5aS0Hx5JXcCo/5Pd0L7OgjtUIwY9lYqIj/rMEXk2bUeuG2nKkGf3iZYa+AkyxUrRefOwGD0yrlcKyJSBv25JMcVfhc/1DQJtJKrMLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772975738; c=relaxed/simple;
	bh=QFOwJPC4lOS6gREk6J/UlP0uzN+Q2NVjRHrGvM15zvQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UNc34CAjxKokU/MsS8OkhK2jkOWU+PCtpGSqweA9w1zXu/t+F2KuO18xqa5VBc288gYzQsV0KsUkTH1VH5ULstPEU2qFOHMnQcKl3ke2/GyWxfalaHmTw6xGDuey7Ixpu44L0pSWWBMbvYrANOJqHe82TC6wDWxGueysbrixx7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUIwuxgq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUIwuxgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772975735; x=1804511735;
  h=date:from:to:cc:subject:message-id;
  bh=QFOwJPC4lOS6gREk6J/UlP0uzN+Q2NVjRHrGvM15zvQ=;
  b=KUIwuxgq2XXvoC3RTVolP6amFCJhxY4a7o9VQ+6xtmvZtl+arQEsUMut
   pM/RDhkEuTrlts/LIM1WgfG4V5mSrAXgcFZx8hqEQmIcX2E1XKsCNsFQf
   g3m7VR3zR4iom1/bH6uPsdIZSknz6p60oTloHxE0boFX958szA3/3Y8T2
   RxHYl2kMpS4CKcJYWdqb6bw2o6Dry/CxRezA6pBigZA1MMkI1X/18SBls
   lEv6pdhIpsai4+D9HoPNXginAQR4Rx58I2qLKDnfMR//a7MvyWKZ1qwlj
   HhkJmiTyAUAQhGGMzdc3XrtdbupEBIRN9yQ/gtASyE9EPNUg8YGH1uvCx
   g==;
X-CSE-ConnectionGUID: oJJHrWStSIGA9LFXuRoaoQ==
X-CSE-MsgGUID: FOoaquFHRY2z5r7ceC6AJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85492798"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85492798"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 06:15:34 -0700
X-CSE-ConnectionGUID: oVAkjblATV2DW17OnEnCsA==
X-CSE-MsgGUID: aMPitxXUQGGX6wb+849MdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="224432013"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2026 06:15:32 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzDyj-0000000037w-1pSa;
	Sun, 08 Mar 2026 13:15:29 +0000
Date: Sun, 08 Mar 2026 21:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: ld.lld: error: undefined symbol: qcom_mdt_get_size
Message-ID: <202603082108.FNqpYNlG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c23719abc3308df7ed3ad35650ad211fb2d2003d
commit: 2df158047d532d0e2a6b39953656c738872151a3 ipa: fix compile-testing with qcom-mdt=m
date:   7 months ago
config: powerpc64-randconfig-r133-20260307 (https://download.01.org/0day-ci/archive/20260308/202603082108.FNqpYNlG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082108.FNqpYNlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082108.FNqpYNlG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: qcom_mdt_get_size
   >>> referenced by iris_firmware.c:49 (drivers/media/platform/qcom/iris/iris_firmware.c:49)
   >>>               drivers/media/platform/qcom/iris/iris_firmware.o:(iris_fw_load) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: qcom_mdt_load
   >>> referenced by iris_firmware.c:61 (drivers/media/platform/qcom/iris/iris_firmware.c:61)
   >>>               drivers/media/platform/qcom/iris/iris_firmware.o:(iris_fw_load) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
