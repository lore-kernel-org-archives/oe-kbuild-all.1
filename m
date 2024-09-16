Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62B17BBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726502538; cv=none; b=eMdU+zAvRi4zTSx8zWcFOM3IsIeaWyMW52dj0WDYQXHLguTiJET7f/88fKSkHra3xhECR6iHPJtQSR5cV9U+IRUGJuViPOiVAlI9ZL6YgVhtVs5FhGJvYACIpHVSUlWeyMNVFq76eqBs7fIinWc67IB6gS5FccWhsmy5TB8IlKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726502538; c=relaxed/simple;
	bh=Rzp2C/mqmUZzL7ve9Mpb0ov1pPsRwO+nOUm1lCTPoZY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1TeLkLEfAb3pfPcoQfKTeaWmwC9UdOa5lzqZqir0dNMr4ldtdGEcWOpZVci7uJPeETw/alYUygQK4UpknL4+rPlKGDMU713c4TbRIVQbaIiOB7LNkA19I2hk1QlhQxEQNP2Dj45iTXLWAQO8cxpHG1zUZcUBmCYZ2bFTG/BOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAbUqx4g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAbUqx4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726502536; x=1758038536;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Rzp2C/mqmUZzL7ve9Mpb0ov1pPsRwO+nOUm1lCTPoZY=;
  b=DAbUqx4gwXES6BEGQCe+p3W4SNbtJG3Ze+I+mGK/BX5mhVi8d36Xds38
   weFiUYG9jEvWdcAThxP6o/JFmbVbFt3Ibc5Xs1RbkxBoZme/1fxjzfnDU
   vcNouNdrzqaGMsrwHarIKbd1DfE3fX7cq7iumTU/jYs2HJrY1/WmjcmtR
   QlT1qkFhbLCSfGqOO/NkCM5tfXKXuyEkDL0hz2qJ6aKOsnm9cNFXRsh1V
   5BfcpSMLd1IMz7W3EIXHZs08ipkdJ7Y2Ih4Qv+ooONeppL5lsU1a1klHH
   k2eX2opwnc3STFAryRQgmP9R0ObLttpLsoAhkuDmK9MfDpQj4sQGY6Q8h
   g==;
X-CSE-ConnectionGUID: s5c1ET15S9CBHW6TiOmurg==
X-CSE-MsgGUID: Ncj53N05Q3qBDqH61DCqkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24817912"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24817912"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 09:02:15 -0700
X-CSE-ConnectionGUID: KaVzg6m2TXy7luQE9m9siw==
X-CSE-MsgGUID: QKaMhwTcSYGiFOOrVHjCZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69212669"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Sep 2024 09:02:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqEB1-000AEc-0f;
	Mon, 16 Sep 2024 16:02:11 +0000
Date: Tue, 17 Sep 2024 00:01:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_IPROC_GPIO
Message-ID: <202409162328.GZFTsGZQ-lkp@intel.com>
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
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_IPROC_GPIO-0-0 (https://download.01.org/0day-ci/archive/20240916/202409162328.GZFTsGZQ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409162328.GZFTsGZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409162328.GZFTsGZQ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_IPROC_GPIO
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_IPROC_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_IPROC || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
