Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BC628F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760066454; cv=none; b=agLg8wER86NCG6NJZT4caOqc7TtLzLr4MoH3n2t+YqAkLuuAFGZGRdFJwx1SXo5IHEZv6l2sWLxkcbKaqHLf+rh67hRxnDYRhJ8iOVQEbebtcV06hpuixefjBsFRp59jE5Rm/+W66G5Ahj1KJaGaef8XiGYoYlR82AX0J1pMJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760066454; c=relaxed/simple;
	bh=l5olwkuqC11xiAgFibtNCQ+Iqlz+sE7f+DiyGZMXZp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lF9JOM9GB31+6KKOxLe4onWFUl5Y4Eh5fbeoekFbvoCq5tWqAJftB0fGBV+UbUMdPZ1B42sf+u7tM5rxz6NFL9kInriJ7WR1oTXCxK9/MaOcDH+904/GaAih5q5mmj4QUEqtU5LUGoPnwbF9/hN6a45J04owSxEGCoV7rm1D3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5k6tS7U; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5k6tS7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760066453; x=1791602453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5olwkuqC11xiAgFibtNCQ+Iqlz+sE7f+DiyGZMXZp0=;
  b=f5k6tS7UZM2mzXMK6jlH1sqWJNTbQ5rsqFs4UDJWBtHouJVo7qAF89kE
   9CfMe4zyyPFkIyu4trigZrRMb8Iih2SAAf4OWZpD43qSjm+mPGbYhQDmi
   p0ipENq3gsvu1LaoFHcL2qjIl7ZqqyO9DkZ197gz8s8UfXMZVzXvKl6Wp
   pmjijcKQYA3CbdJLuzkruHocpwiw6TD0zojGUx1KaqnA0aeV7emf5/CWu
   +y/gfhoVjfopgPwIEzb6AxzIjsGMlswjpNOUt8vpVn5akIAcLifBgymtr
   FpckWuGjvQfqh8NVc+y5JkmHST3L6gruxYYmi3GnljuKAeU4Q2TNNBmR2
   g==;
X-CSE-ConnectionGUID: MTra5C6JRRmHSjJ+2umjMw==
X-CSE-MsgGUID: vjR6ps8pTY+x9lPmHoyOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62310793"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62310793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 20:20:52 -0700
X-CSE-ConnectionGUID: 1sLN0NGbTKiu/+1Wxc62rw==
X-CSE-MsgGUID: kBwpO4PfTSyObOzDmEyPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="204583741"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2025 20:20:52 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v73gX-000000008HJ-2YKF;
	Fri, 10 Oct 2025 03:20:49 +0000
Date: Fri, 10 Oct 2025 05:20:30 +0200
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 31/31] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202510100516.lvY3jwaq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   e0d906c0ce2d81cc429b4807a71c98f3e6f0253c
commit: e0d906c0ce2d81cc429b4807a71c98f3e6f0253c [31/31] [NOT-FOR-UPSTREAM] Add build instructions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251010/202510100516.lvY3jwaq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100516.lvY3jwaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100516.lvY3jwaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
