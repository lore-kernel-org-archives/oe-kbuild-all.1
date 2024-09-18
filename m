Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605451CB316
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726703160; cv=none; b=d2FPhJv+VUidCWsUM4CXvQxFbqHXwV8wTvUeuW0UBHn/sDhtZzIse4iVhYuAMQrDhqNsw4Mxhz+CcXPElsQwc/nrE55JyXUBlYUvT/bkO7GAt78/nz+15t35ZZ6QuKdKfawiQ5gZJ4xjv1OHwyk1t0aS1Ndn62aG/c+PACitIys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726703160; c=relaxed/simple;
	bh=cp7OCcQ0JDVLSi+ACDp3KaG8xgnuy6nUSI1jZE/TbQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieoQEywo7HkcYxc+2AhnhEAxPmoRMsJqKJx4G0+Y022LFf2fVfvEnOm509y9bwZcj+v1ZwE5QJOjGgI8JRmjcma/qfVjpvgjjf/zv7/0TG5tzXjskO7hFBGw1BH8HCrDRdbu/EzmoqSFN4TncdQTFlwOqda8Iy6jf/jGRDc4w8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifuWZPCQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifuWZPCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726703157; x=1758239157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cp7OCcQ0JDVLSi+ACDp3KaG8xgnuy6nUSI1jZE/TbQQ=;
  b=ifuWZPCQW8+h96n8ovkXRY49XvhbcNgECkULKE+rTQEygkE0yHduhccl
   9UbQfpZdn56f3MCIG9MCIbcEkdqpMCWal5xflbF5+6yhAInh8mhKp1td3
   x0pjvbGtl4yEqpYd81mDUUo9NVxk3khMVUrkoKGthD3UzDZFeercLJ1F7
   +fEz3+u5ZcdEFi47Y7YEolnlHU0JrU5IYP5EB/3VrUnmT/u2u90d7Lz17
   YAU3F8n28tFF1kxVvhZd1SSVM13gGxcm+nkNQ791YZy2glDihxiXUC/8y
   0jR2KWvB57OMkMrvkEP0wlfR8uFhmvpO3McnWlk/WbhGQmg9aQ9tstIA2
   g==;
X-CSE-ConnectionGUID: gDeQLHC2SbKpy4YsgbrEMg==
X-CSE-MsgGUID: KiYMBfK2SHqqOqaSOE/JxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36310204"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="36310204"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 16:45:56 -0700
X-CSE-ConnectionGUID: IuZ5b8ohT8edp78ZxqFerQ==
X-CSE-MsgGUID: e73t12IkRY2Ey2E+Jrgcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="100559315"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2024 16:45:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr4Mr-000CkK-0L;
	Wed, 18 Sep 2024 23:45:53 +0000
Date: Thu, 19 Sep 2024 07:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Trevor Gross <tmgross@umich.edu>, Andrew Lunn <andrew@lunn.ch>
Subject: warning: unused import: `DeviceId`
Message-ID: <202409190717.i135rfVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
commit: fd3eaad826daf4774835599e264b216a30129c32 net: phy: add Applied Micro QT2025 PHY driver
date:   3 weeks ago
config: riscv-randconfig-r072-20240918 (https://download.01.org/0day-ci/archive/20240919/202409190717.i135rfVo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190717.i135rfVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190717.i135rfVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `DeviceId`
   --> drivers/net/phy/qt2025.rs:18:5
   |
   18 |     DeviceId, Driver,
   |     ^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
