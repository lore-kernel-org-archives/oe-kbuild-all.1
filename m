Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC00176FB6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726593390; cv=none; b=AeeoBCXSHpmIf024wBiLqp/+ZNCX0SwJT9ymRYAgC83gUGulm6ScMKLmvaVWXmSmo4ASzLVBsB8PwwGdPANpaRS0LFB0KDcDg5TvGrl/egfAotAViQ9gVuhRunUbTjAguDnXkLwXz1/EcRV4nIhQYB3Isq8XnFjDyymoxwlXx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726593390; c=relaxed/simple;
	bh=HY9+iCGMj1v2F0tZtnIEUhaVpvnsu/3CK+679tJJbDk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ad14LgIMZEIF3ppyCkLM4ZI0JBMrfOqKZXtXG4Mf/e6MU9a3ueHRbhMzplexOXh+gOOI0rIQTZp1gVnI7S33BT9aDVRS6MBEG6QOMNbs3d1IEyFVmITCJ85NQnyMYwYiIHvtAFx/2NwXr51eXoj5QA5GEsz/uOr72TyfpDD5nX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+HbtLlm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+HbtLlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726593389; x=1758129389;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HY9+iCGMj1v2F0tZtnIEUhaVpvnsu/3CK+679tJJbDk=;
  b=Y+HbtLlm/sCDXJ2n2wsmzAfB+ffgk95dGLRKlvEYTY/TuODtOCD6/BPb
   lKRZzScGjOmJF+/QOEmjw0L5ouudqA+QXS1FqG8RxlWkQpUn1K1076ni6
   kd3qcuZlS3JbWXSY5/dA4KJAji1o2KMsq3skLHDWfmrsHF6lhkuc+bEsJ
   v/lrl9opdbGwyFTfCZPOrkJvXLRrSSxgMbGDAqPmBlL5qpTF6eXn/i18U
   DehVyh2F9yYTU/5s6+Jxh+vmNmtdY3HBo234AkR71ohBc2tyhlPpeHInR
   t/bCb0izfWxVtuxwmGMX+t6oDSd5drBK5KmkHFWjKtahvPZtvy62u+UsD
   A==;
X-CSE-ConnectionGUID: yY3a1hUJRtuJe8tVgesSvw==
X-CSE-MsgGUID: aDuQ4n5CSSSLye/buAPEtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36050519"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36050519"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 10:16:28 -0700
X-CSE-ConnectionGUID: nzCjU4bcTeOMhNcen/Eefw==
X-CSE-MsgGUID: nMxEfNhpRv2gSy7czghIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="74250241"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Sep 2024 10:16:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqboO-000BMl-1X;
	Tue, 17 Sep 2024 17:16:24 +0000
Date: Wed, 18 Sep 2024 01:15:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
Message-ID: <202409180154.j3UHvu8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_NSP_GPIO-0-0 (https://download.01.org/0day-ci/archive/20240918/202409180154.j3UHvu8V-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180154.j3UHvu8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180154.j3UHvu8V-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_NSP_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_NSP || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
