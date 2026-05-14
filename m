Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01543E4C71
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 14:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767922; cv=none; b=X5cJ+7TFTqf8gWu9sPTMGXwzDnuarIbuJ2cRwrOWfjjBn1VOHrC1iaeclnQkmlbc7JUlrrw15HJlLVTLpErEX0T/mkkP8TbT2YBKrQ9nhVvca/lrBKnrF7ZMLdmBxJ/lcAnneOwmJeM0Reh8LQJjDOmQpOGz678TTDZskW/5gdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767922; c=relaxed/simple;
	bh=16GsCn8iZ2QE+30IhE5sehXr4ToZLmVOLyaKm4FwjV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pzSkpTCfiBbn+maQs8VKtSX3/k7X59Ja6VFezjXHhEOYhQwHDEkYWquZAKvo/Di0MJpLrxyfmg+7BUFqbLnsPkaUjNWwgDQWbFn/vtygczNrInHRcHEyyW248x3e39TojxQl223GtNngYw+OsBXdY0bU964w9Iigijtj8I5J98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vib1XpVm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vib1XpVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778767921; x=1810303921;
  h=date:from:to:cc:subject:message-id;
  bh=16GsCn8iZ2QE+30IhE5sehXr4ToZLmVOLyaKm4FwjV4=;
  b=Vib1XpVmiy/mmcyxu7bCCldf6dtvU0rnFEUkOj4dMaOstpT+nXFfMbeF
   8yGcdZNemiSyx0NqSHlMW0lk9fFl78VElq62+hkx6j0iXj35RkqonAqiu
   B6yJ6dhct4NGFTwLg2vCoR9+XBQrumNIVFJI0UYdBTu/YWlwJHmVCh4u9
   aWqVXeKGw8vwi8/ZxfnfPC9rIotq/LT+wSCexiT1OJNLKHQ0UfNfbGfoh
   rjvKT1cOt+qjafpcLlt9gM+lDxoGcwnrjisTgMXJHiYddVKlM+qZQpYkm
   FP0URDdSMVhIarSgVt2JNOFnz3ZknRzMjGjRtsMtt7nN5d6Qp7OoIg93y
   Q==;
X-CSE-ConnectionGUID: 0vF4RJApRlu/E9DZkszdOQ==
X-CSE-MsgGUID: Z4/WxZRVT1u3me6Wl7tXyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78851087"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="78851087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:12:00 -0700
X-CSE-ConnectionGUID: AvhwZaJWSFmwSu+VPGa45Q==
X-CSE-MsgGUID: c0/9eL3iToK7Qgi67ttpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242390455"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 07:11:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNWn6-000000008on-1LHr;
	Thu, 14 May 2026 14:11:56 +0000
Date: Thu, 14 May 2026 16:11:43 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/printk/sysctl.c:11:18: warning: 'ten_thousand'
 defined but not used
Message-ID: <202605141615.ckL2UO2K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Murray/printk-remove-BOOT_PRINTK_DELAY/20260514-132813
head:   fa13da135c46ed95604a44c0723b4abeddd5eb7f
commit: fa13da135c46ed95604a44c0723b4abeddd5eb7f printk: remove BOOT_PRINTK_DELAY
date:   9 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260514/202605141615.ckL2UO2K-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141615.ckL2UO2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141615.ckL2UO2K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/sysctl.c:11:18: warning: 'ten_thousand' defined but not used [-Wunused-const-variable=]
      11 | static const int ten_thousand = 10000;
         |                  ^~~~~~~~~~~~


vim +/ten_thousand +11 kernel/printk/sysctl.c

faaa357a55e034 Xiaoming Ni 2022-01-21  10  
faaa357a55e034 Xiaoming Ni 2022-01-21 @11  static const int ten_thousand = 10000;
faaa357a55e034 Xiaoming Ni 2022-01-21  12  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
