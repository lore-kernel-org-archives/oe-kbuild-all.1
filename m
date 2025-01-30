Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B221AF0D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738228333; cv=none; b=n+nFEZDZP4lbKzLf11VOagzAN5n3J7ngvL75XzbzihAv50WkbObrVCuUWjFb64SUb/HlNtbtE8oI78kOKdNIdjafw77H2Yg26lr7Cz0OuPJvvmvmkBEFwUDi7K7QBBwTYSUIwcVM3YbAA6Ehc4ONe2UyUmBMxkclzd8iyYcBuaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738228333; c=relaxed/simple;
	bh=DQb/Dl56/viw2HDsiH+zqyyyn3rw/y4Qf/kWz5dn9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYzrPdDIdTl2h8Wmc4SgPFdnVSObgXl+Dfv1F+ayCS82DMwE9awDIKyVTvOry9nkf4JO0yMW6q32n8djk3lRZ5HTELsBKFuV5w96HuLMtgmZ+/3F+puUxlNSV+F2pWUEJOK0oyn4x3R4/w5iV/IH2c68/A+hcPjWNmB1jdORswc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miCfw8hi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miCfw8hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738228332; x=1769764332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQb/Dl56/viw2HDsiH+zqyyyn3rw/y4Qf/kWz5dn9yY=;
  b=miCfw8hiCCdyH6K4cMdpbe5+mZl39dRgnLb3lC/HIfchZlFOLc9cDghb
   50jyOMSmnDtYdUR1mHlSF2GBB+G9YZxagNtU/4bCMc0VK4pMARtTV0h54
   SK/L+p/NK814B0VGG0GMkWaSGGtkwo+FqY3RmpbtIoRdJqWTu+ZrnKIWF
   vEyhsEOkWk/CALBE+2JAfs1onOgEwuK6duS3JGsfrJxJvaMx4lR19ctDT
   0VWwRwpIAuo2hCyhD3Iv7WxaagaiDhHOaHao/HN2fxnJS1zkwEumBVlRz
   JmNgM/h+Zwsq+srT5/uVeSF3I4azRbtaKVFwrSEK/DqUgw1JvCAQl95Yq
   g==;
X-CSE-ConnectionGUID: oxfN6o+DSgurujaDMVa9fQ==
X-CSE-MsgGUID: Kvp5ciGaTlCnHxGT5gD6nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42688564"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42688564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 01:12:10 -0800
X-CSE-ConnectionGUID: u5gn07KfRh+P2lBpCzTVvw==
X-CSE-MsgGUID: tscfloYcRQaSiP6pCX94Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109868035"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2025 01:12:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdQal-000jtD-0h;
	Thu, 30 Jan 2025 09:12:07 +0000
Date: Thu, 30 Jan 2025 17:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 17/25] ERROR: modpost: "fwctl_unregister"
 [drivers/cxl/core/cxl_core.ko] undefined!
Message-ID: <202501301756.HqUJnoSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   a94a98755ebe43e2cf8fa8b60eb78c64f9d9bdce
commit: 50bb7ff9edf14d384d8cd902ac40e41abee77651 [17/25] cxl: Add FWCTL support to the CXL memdev driver
config: i386-randconfig-051-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301756.HqUJnoSY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301756.HqUJnoSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301756.HqUJnoSY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fwctl_unregister" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "_fwctl_alloc_device" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "fwctl_register" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
