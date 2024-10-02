Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75E17BC9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 05:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847296; cv=none; b=HG3nwpjf/RoqU++PxZTCx0SynbWrv6Iw6oEdcaxPUGWzyEe/a8y5nY/Of/E2syPmYRUVhXCmRsFF1DXIFD9jU/tRWMTuzyRy1bb30LpntmGwpjYQnJLaLlDNPiQPojUdA/xcSfoQn0zk9qe6nK95ZFsZISbBKqHtNuQBPUdEgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847296; c=relaxed/simple;
	bh=hkgPa9uAVJjpCv10EQfHhJlK3HNYdm28RKPzkSYUIeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiM3GvU5YTAAoJtX7Ju74yg0Y3Kxy4wmP3dBq69sHsgidVVvNpj60GR7hfmH9FScMNeOEKSvwOlsJZulxW5vjiTfUNVVVCL8KjUqswi7dbBtVS80LGWDqJrM7kvpB0hnKyLX7C9Vht5ii34Gx9OLrt0hxehSdYViLyzRDkwBnjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP59134+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP59134+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727847294; x=1759383294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkgPa9uAVJjpCv10EQfHhJlK3HNYdm28RKPzkSYUIeA=;
  b=IP59134+D5RCP5pNnVwPqL7PvPqF4LuDcuq+eiqxOIIcVO9DyZE9E2GG
   zs2KBfmnTQp7mNhzaGgEPKnRa8M1L+oKxk0PPcm65qY+HknMB7ZmjNXzH
   I3yCuj5S+zMUoxn09UaiHuazU/XoyKLmaTqvRlg9PMkKVdKzpSFGhXBFf
   y7zctZdW5NQBbnxOjvPvoceoW53kozVo/I2wOEHScgJxfiXf787/22lRO
   exHX7KaCfcbv3YSLE6eRrOe8RgrbCZTT0pp3a8v3IYAOaBh5k6eg56uDb
   ag4UOZ2V4saFBCVpSS4zvzjipmVL/g0H7BSuoFptOyz5SZE/Q6wINv+M7
   A==;
X-CSE-ConnectionGUID: 9Se+7yMsSHem37CI4FuDKg==
X-CSE-MsgGUID: wv1PiQbZRWai6tshbjRepw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30709106"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="30709106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 22:34:54 -0700
X-CSE-ConnectionGUID: KFVtsicUT/mptjQ2QK3vyg==
X-CSE-MsgGUID: iJOCWslvTlOGUlE/d3kJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="74330968"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Oct 2024 22:34:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svs0f-000Rax-1e;
	Wed, 02 Oct 2024 05:34:49 +0000
Date: Wed, 2 Oct 2024 13:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 8/11]
 drivers/platform/x86/amd/hsmp/plat.c:58:37: warning: unused variable
 'hsmp_fops'
Message-ID: <202410021345.okdVjjGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   4360c22c8f071b5e930fdd8f1423ef6dab0f8471
commit: 074a970fbc165bdac7fc39a31b483648e8969a79 [8/11] platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021345.okdVjjGy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021345.okdVjjGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021345.okdVjjGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/amd/hsmp/plat.c:58:37: warning: unused variable 'hsmp_fops' [-Wunused-const-variable]
      58 | static const struct file_operations hsmp_fops = {
         |                                     ^~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/hsmp_fops +58 drivers/platform/x86/amd/hsmp/plat.c

    57	
  > 58	static const struct file_operations hsmp_fops = {
    59		.owner		= THIS_MODULE,
    60		.unlocked_ioctl	= hsmp_ioctl,
    61		.compat_ioctl	= hsmp_ioctl,
    62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
