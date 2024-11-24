Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44013163
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 20:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732479852; cv=none; b=maRhBSdNUNNRDf/mLlisDtlqR97oKdBi3TwGQWlch+I37FHabaI7z0r0BDhO58YTpcP/pOBlmJrzK6qluqCds16mrDm1CbNNsIelyCpaX3P7ueqYAUhaFwsGgbKb5O7A6fe43R1coiiCVYQ4pX4+0Szij7luB7ljJnrCFV4w1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732479852; c=relaxed/simple;
	bh=9oHFMgBxq8ao2OVTUB4LbgC0p/AspHJgW4lJAhsRFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4TAjLGp5mjGlBbdvYzFlV9CSP/glRxRmfXiHxJvEsOSNhkIrI7Y93PBsuUm8KdJBTC9D7AxV8EToSIsN7OOfU6GVQwwyTCgE7xtQ6lQvCLo1H7QI0OpXdLkzIXkTaJcM2uZusKWfKclN6473zgsdDqX872VUX3w/toLU3ykZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7RNCSr9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7RNCSr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732479850; x=1764015850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9oHFMgBxq8ao2OVTUB4LbgC0p/AspHJgW4lJAhsRFqA=;
  b=R7RNCSr9fSSCyt0QC7C7+P1fX3DtyJgoPiSm2fnjKZSikAu3Bo7nfw/t
   qzfddlMaqtQUKSSmqr8CfDcSzAxvYPXVzDlIZheP4DNx5pOFiAwFY/nKa
   zDBvE5RlVWC4FeAnVQx9CKgx4kWRfNlKXThC48a7loUN3XF777aXhh7Rd
   ssmnW2ARUBh7P8/TPwqI+xT9gddsVCPSe/N0fw7b1LsCSSFNep/nZK+v2
   w6ddejS0DLCNYyOSGlOzslDAKM3nKfkqJ9JHka2wuLeQ+KsbtT17KBREy
   4dBBBLGEpdT+KsxJhlKvBIf5gjG1h0ALVISyiAUQvP9KHEIy6ZjLvTrp/
   g==;
X-CSE-ConnectionGUID: foRy5FP1Tgu+Jpglcjp3Fg==
X-CSE-MsgGUID: 6wNmqaHlSA2PEB4OJwVipg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43636290"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43636290"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 12:24:10 -0800
X-CSE-ConnectionGUID: xjkIlcoQTeGPK9pPJo5QuA==
X-CSE-MsgGUID: AC7BYKcQSrGemk1KkJM1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="90705900"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2024 12:24:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFJ9K-0005DH-2i;
	Sun, 24 Nov 2024 20:24:06 +0000
Date: Mon, 25 Nov 2024 04:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] ERROR: modpost:
 "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device13genphy_resume"
 [drivers/net/phy/ax88796b_rust.ko] undefined!
Message-ID: <202411250432.Wjyl9Jnn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4eae42c42e2773cd7e592a771aea1fbb6230fb76
commit: 9d239c3200382bec6f609d9dd52709ff15b88e6a [2/2] ANDROID: Allow MODVERSIONS + Rust with no symbol export
config: x86_64-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241125/202411250432.Wjyl9Jnn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250432.Wjyl9Jnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250432.Wjyl9Jnn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device13genphy_resume" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device14genphy_suspend" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvXs0_NtNtNtCs1cdwasc6FUb_6kernel3net3phy3regNtB5_3C22NtB5_8Register5write" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device17genphy_soft_reset" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device5state" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device7init_hw" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device10start_aneg" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMs3_NtNtCs1cdwasc6FUb_6kernel3net3phyNtB5_12Registration8register" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvXs4_NtNtCs1cdwasc6FUb_6kernel3net3phyNtB5_12RegistrationNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop" [drivers/net/phy/ax88796b_rust.ko] undefined!
>> ERROR: modpost: "_RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device18genphy_update_link" [drivers/net/phy/ax88796b_rust.ko] undefined!
WARNING: modpost: suppressed 8 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
