Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE991611A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 03:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709608538; cv=none; b=bc9oSUQnUu9ALulh+NlvDNB90zds9Y17P+KBnaUWB3Fps50CVoyC0gjecaM+o0JBSIqdyt0Sw5kSPMZCwMBmqw2YUkis3+MqFw8bVt9k5W/WuJKF3+0XxqY/mA77kX05NHIW0rLOgbS3VJXz61QtJ6B5vwviMilniLkDDpPEVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709608538; c=relaxed/simple;
	bh=9E6IJu+SCnaKt6HecP1OYfSeKwb2nRWaScjG/WOMaS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+2A9lwG77c0UGJGPvEiB+iWNP37E14s/QXlOzybp3zdaWGrXoTKtx1bVLmkArvcAdduJAfXY0kxQYDcdoYUbyLJ4OxTPK+5xpNaiu/gG3GDbCRNrll52zSrdG11LVHN+moRp+EJS70UMYgdnQpzOdF8gub0N+gsKHjpLCQRmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4ZIRXUd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4ZIRXUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709608536; x=1741144536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9E6IJu+SCnaKt6HecP1OYfSeKwb2nRWaScjG/WOMaS8=;
  b=S4ZIRXUdMF8JJqUiHIkwWZzmv33Pf7t6s99OjFMyWeexgQ+UGJfdEMDp
   bq7qOCbD07a0aZCv37GpM5GPbVv+2/DfcydaoV1i9+hUAmT1bLG8qrrWv
   mXofV1cuUL+TcTBcHAaRb6hjBjPw+hfOZRsRc5fYzL6bq/66/UEkaU1Lk
   FikFYFoLZJK5Ob8TxZVrFPG8wzxqy8b4rOfwQHeaJNJHBYjeAZ/4JVhKA
   NKhyPMUpMj5CSCM04ZQHUp/3/5VfbZXP2sK6Jr+RyFWe2GGjh0lA9vSjz
   o+uDqObDycarhQpZ+r90M7N0ThdJuV5Zxf7nMW4zerdBKhdJq30j1lnWa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14780340"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14780340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 19:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9289053"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2024 19:15:29 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhLH5-0002z1-0t;
	Tue, 05 Mar 2024 03:15:27 +0000
Date: Tue, 5 Mar 2024 11:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1009] htmldocs:
 Warning: Documentation/userspace-api/ioasid.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202403051156.A0LS850Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 68f6eca763fd041d1ffc0587aa41e82dce4977d7 [1/1009] ioasid: Add /dev/ioasid for userspace
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403051156.A0LS850Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051156.A0LS850Y-lkp@intel.com/

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
