Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5711953A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 13:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727096780; cv=none; b=OBHR/W2SG4begpueq4oD3kJoPb7jGE89kKsgbT+XST08noPQVki3WxzTU+JsV70BFJyhUOgK472Xjg8Pmg+lrI/NgOkB9Q7aiD2otN5N3qEwi98QhKGIlHahyZwzAD/MnDiK99G6eUc4TSKG/3prxvMCwq4wDxJjUNubW+aw1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727096780; c=relaxed/simple;
	bh=sSXRAJNt20yzlKArsrzXB33efISblQEJx11rog8ZfvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQQgPfnhRNs1jP0JFZn8RaIKc/9l5OEPkkND7MXzMY5Jbi5peyl98DdZ0XbAtJLVNEDHlO7UsvPZJfNeN0HSed1oRb8lHTa32Bb5pqqp19hVbm4pJfoxwnlmE/H8fJ04iyw7G54yTZYZsObMnqKBfnidi1s6Ca4FAS3ku/YRqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhWaS9Td; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhWaS9Td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727096779; x=1758632779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sSXRAJNt20yzlKArsrzXB33efISblQEJx11rog8ZfvM=;
  b=GhWaS9Tdf9fFX7Z33PR6u/vd0UoFQvFSkAjA0u7WrKDDi+sMfIszTghG
   Sa1PSlHLRHZZHAfxBnPyeOnbMSWhJslR1zKT9MayrySQppB5J1PcETVvA
   YkKabvfVzclIS9btAVK2jILGzUmXIDn1Yz6+w7Tu8/MNAFa+P1Yr0A4i6
   5/doqII6US3VyUtpN0WOBCFiNcHUC9X8lyJsE3bSJ8dDz8rOt7V/SrQNs
   BvM8vNOjYiz6bptF3FtyU3NItosR8V8ezy+u/FO2ujsDfcz2KsZPt00Tu
   cKF6ROIxF9Z9na3TxZJWcAmnlJQH1IyWzsu7Ub7/bNpaT/44UfkDGJyhu
   w==;
X-CSE-ConnectionGUID: xgChldVyQ4Cz5qAxLoXP7w==
X-CSE-MsgGUID: B1WTrHG4R9maQbbMlZHUFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25865411"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="25865411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 06:03:29 -0700
X-CSE-ConnectionGUID: dhgYY/ilQ8yrzHFM/dh4CQ==
X-CSE-MsgGUID: ii6o48ynR1ysYHPhuWQq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70648056"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2024 06:03:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssiio-000HCw-2h;
	Mon, 23 Sep 2024 13:03:22 +0000
Date: Mon, 23 Sep 2024 21:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1449/2441] htmldocs:
 Warning: Documentation/userspace-api/ioasid.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202409232036.ZwG90BIz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: b43d7bba276172e21825b705cc9647687991163b [1449/2441] ioasid: Add /dev/ioasid for userspace
reproduce: (https://download.01.org/0day-ci/archive/20240923/202409232036.ZwG90BIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232036.ZwG90BIz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst
   Warning: Documentation/mips/ingenic-tcu.rst references a file that doesn't exist: Documentation/devicetree/bindings/mfd/ingenic,tcu.txt
   Warning: Documentation/networking/device_drivers/mellanox/mlx5.rst references a file that doesn't exist: Documentation/trace/ftrase.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
