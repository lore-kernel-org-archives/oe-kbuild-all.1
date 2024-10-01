Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8830F1BFE1A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785286; cv=none; b=AnwtqVeMzrqvezf34vcGPJHfA3v4Yi41o2pFYTZ8SCohkbtqx/po/Us/5OGyaXuxcEsmJMC37vRiW5WRWBb1xTFA6IKIa2CvhDcApKb+3nqbVkd1tkwgxD0xuvSw2if5ZeVkR3/2Wkekq158RAigGwcYAJQ6KaswVp2toGKM5Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785286; c=relaxed/simple;
	bh=897I2CI/Q0TamkS/jTHigNxcNL4BebHiWhra+Xxc4E0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eRhm3nUhFKAagGjZnh1zDUyBx78yNwqe/56yT8wFiwEWybyyptymeLklGiMQIhL8p9yfCQMWJt0odCShSmo/6/nVp6cK40P9Gd32y09zzllGUbA5QXcnO91R8Z4UXmnGyyyUmNG8UW4LtL/zzv+cewRknlnTqoCbMVREHsR4hrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPY18zmD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPY18zmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727785284; x=1759321284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=897I2CI/Q0TamkS/jTHigNxcNL4BebHiWhra+Xxc4E0=;
  b=EPY18zmDCUt/MHbhbFr3yK8yxHf05UzwKXqNaYTwF7IS/D0Szq1LVeoy
   +JmvXT/Byo//LXe8lBnfUI1wetpJozowzxY5GPFCUTBece0LvjNxSI5MP
   vGAmLti23yXOHXX+DScflBWYbLyPtboc4YOr5BkhH+ve2EPuBdW09d9mf
   OHYGD+xabSTWM6XwpkoLfIB8wWXpzgyCQ7y1VUtZRiV209KmIIQtGPtRD
   T07Ywu3Mm65FbwR+n9K3cthJGHpHNhA2Qi+uCtIgzyP4X7jZ2mMU2UkDT
   dCLBRXl7AnvOMNHqbcMUbu9QdfdYSwRNKYRxwkJnaBUboClUuo3a3zb9a
   w==;
X-CSE-ConnectionGUID: MOoXZ/rBSba+xU4UYXS2GA==
X-CSE-MsgGUID: rxds4DheSVegCY3e3+1i/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30709726"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30709726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 05:21:19 -0700
X-CSE-ConnectionGUID: BT+wW7c/Ty6wNO/zQBznlA==
X-CSE-MsgGUID: otFvHmFXS4y8KPH3NSESFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="104480747"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2024 05:21:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svbsO-000Qfr-23;
	Tue, 01 Oct 2024 12:21:12 +0000
Date: Tue, 1 Oct 2024 20:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17427/23811]
 drivers/gpio/.tmp_gpio-hisi.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202410012015.7DrvrSEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: f724c4effa231b88b4fd545803f9e7f122ad3efc [17427/23811] gpio: gpio-hisi: Add HiSilicon GPIO support
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241001/202410012015.7DrvrSEM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410012015.7DrvrSEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410012015.7DrvrSEM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/.tmp_gpio-hisi.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
