Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF9126F2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728716700; cv=none; b=Ad6jZ8moIh62Bc7K3daq55I88QlyffEnv2Y4sJe3LC5/x0vH9vT+p8v5f+XFWcAM6rNe+E1nJNQScMkSTFYK9LEZpUoR5hvQkXKt8N0WBzfgx3oUNTQPMwvUh/uw/aZjnCTuElSxD8zpU9HpaSvduv2sLCOfpJkcJ9DEfdvkVPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728716700; c=relaxed/simple;
	bh=e1Mt5yR7oohqxqTLZosUrzNeuujUm0/s9TnZHPWbrKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WGj3Vt0tKV/+h6hWKujUbCHPCCizmx8WHs5JuSudDoh2f1nIyONgwJfuV4lQunLQL7fgFtD6eDjngAMJlAvjdoqNOn55B5TaKkZBWAtKYFFfUUWnwqKYWbYJR53ZwOSlyERipXoUBAvO9Wj9r+vcgrv7vgLHrINTeVySCUYibZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Flr4jNGw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Flr4jNGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728716697; x=1760252697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e1Mt5yR7oohqxqTLZosUrzNeuujUm0/s9TnZHPWbrKU=;
  b=Flr4jNGwl/WuYo4xZSW9WjBl0J5wLyY68a9iJY9O0hcxiFXczsK+uwdo
   VRLFDN44qODHuSldI4PCczzBQORZsDnyQgmldVtjFwESf94bMOmz+l8JR
   Mwr+lFYTPpekQCvvHiq/Qfi2MBf/2ZEkiKa0eX+V0G8rKrpFu8CO+wWQe
   zyVQ/EeMvr2yHg5Ge6zc6B3WctmyRCWQfKzp6FjAieWbimH+MYtPbeZ3n
   Cz0Nv9W3UOPiKSfxzwT6xAcbJIYHEpY0x3BAC3CeflfNVhWjWewHpSgWQ
   ygsJmmQuBXY2PjgbQkB6620QIKPhMnC9IQnXH6Yqih8LGXLH7GGxT6ZDt
   w==;
X-CSE-ConnectionGUID: bhCzUO9bRvm0lGdlFByhWg==
X-CSE-MsgGUID: UWp86utiSrCRhQcVI23QWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39244642"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="39244642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 00:04:57 -0700
X-CSE-ConnectionGUID: k+oA2UVTQ1+jT7o52fQBrA==
X-CSE-MsgGUID: mT1OeQ9eRwe6mwgsja/u7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="81930546"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2024 00:04:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szWBJ-000D8j-1N;
	Sat, 12 Oct 2024 07:04:53 +0000
Date: Sat, 12 Oct 2024 15:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 33/75] kismet: WARNING: unmet direct
 dependencies detected for ARCH_HAS_VDSO_ARCH_DATA when selected by RISCV
Message-ID: <202410121410.00CNnQWO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   79c4677efae9ab2e20e0ff126c6528160f57b5eb
commit: fbdbefdc7725f8943d92046a37201622ecf3c9d2 [33/75] riscv: vdso: Switch to generic storage implementation
config: riscv-kismet-CONFIG_ARCH_HAS_VDSO_ARCH_DATA-CONFIG_RISCV-0-0 (https://download.01.org/0day-ci/archive/20241012/202410121410.00CNnQWO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241012/202410121410.00CNnQWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121410.00CNnQWO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARCH_HAS_VDSO_ARCH_DATA when selected by RISCV
   WARNING: unmet direct dependencies detected for ARCH_HAS_VDSO_ARCH_DATA
     Depends on [n]: GENERIC_VDSO_DATA_STORE [=n]
     Selected by [y]:
     - RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
