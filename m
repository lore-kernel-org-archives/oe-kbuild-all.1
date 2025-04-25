Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0870D1A08AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 12:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584778; cv=none; b=crMvC7bIP+MzJU4ekm/+YMu3y45XKKakd7uZGilE2GLjb2Z56wLdcYKMRC58DcRaGQJ/bnql03KVbMPIlRU3Al+DNwlEGko3+9GVSt3/iLC6vSTtj4XDJy9rUElKDkf3SRI6OR/4RBQMG+/rQw2167QBjJ1AdW6/7gKOG+K/qQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584778; c=relaxed/simple;
	bh=77HLPWlArx96irJ9aBZtSCgiVkUN/Dujxw7Tp7DPxMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ry5u+Qx3SWEnYKMZ/XKCDr7EsoIzQId0Eb+O3zJZHcIgJ03AcjEy9mingmTELX+h/O4RubH6748/yOJnmp38tVNwoTy213gAIfdFOzf6EMC9xRp7dBXNo+UQTAsT3xYLFqVYVDNI6wAKBRNlT6pa3OvU1djdf6TcxZIydODf5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hN762KOc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hN762KOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745584776; x=1777120776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77HLPWlArx96irJ9aBZtSCgiVkUN/Dujxw7Tp7DPxMo=;
  b=hN762KOcjAHer5YSF8UVNT3/9Sgb32XRWWoAjqnXXLbyJRz+FvXj75wi
   ug3hqLpq8eW9mf9w5lrvF5km6tsocQSrYAUCy6xrceBUbYqKwgO4a3VZg
   9et1UjdIgX1VoU8Y9Z1m+JX0+JQGl2YUGodoH/lkoE4+o2APnLSV8Dz4I
   xi1HtdC8V0uEwB62gJAdYgrBBg4i1wGkzphEC9tSLIrgXJ4YcrsLaVadu
   VotrE3bwU/+5HeILdJ0AXl6U+iyvDSHq544z1VB6BBlz9TXdaWhTFGzhu
   ef4j1gB2eeqHVBZG0RiEJ1maWMIhq5Ac3O5X/icujJ4UhlvD9mlcJxExZ
   g==;
X-CSE-ConnectionGUID: AEth3fv+RxKIGSxUrgPp4Q==
X-CSE-MsgGUID: I7wVLqS2QHyNwkOl7aVI5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58616716"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="58616716"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 05:39:15 -0700
X-CSE-ConnectionGUID: Y/1pXCHxR9m6lKfvWHyjcA==
X-CSE-MsgGUID: lku3sNovSZ6LbDx1orflRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132640452"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2025 05:39:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8IKl-0005BN-2S;
	Fri, 25 Apr 2025 12:39:11 +0000
Date: Fri, 25 Apr 2025 20:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 56/56] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
Message-ID: <202504252006.DRG6IQzd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9fb5fea579257fb19f731bbb7f8ba84bbd468485
commit: 6a8fe61cbbefb4383f34fafac84ff6b6faec30a4 [56/56] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20250425/202504252006.DRG6IQzd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250425/202504252006.DRG6IQzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504252006.DRG6IQzd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
