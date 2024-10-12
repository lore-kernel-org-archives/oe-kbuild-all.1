Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589C513B58E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728772165; cv=none; b=gV7PIwCHrUBsWATUUoBw0SP83W9qpdSUC37ZPKfBikxGoOhzDFRHTPyLLx7+Bhc12EFNk5mJuLFv6LO0bjZusVHKYE44PWgyocJS/T9uzwlFe+9x/YhInsjk8moWQ+pWovn+RLxy4rOF754xzB/sErnnmMtMAI/eP6a9KhC85vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728772165; c=relaxed/simple;
	bh=1NlzgpRomt1XbBQ3WEnrccQ62UxQDKMy2IColoCcJ2Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3r7pt6Fv2UwvDZe/c4zqviA2tmnj6PKffN0poM1AgeQIh7KWnxwbKvf0kLfr0L8/YiWIoIyMA/uK7JjqY63Chg+FOJ4rhFfwMtVL6Qcv2ZO9pZs13Yb/2+ZMmO+bxKAzxtnM6gqY7u+yUP1jDwBWGyd637eOAqOPV/HuUNMohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta+Ens+/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta+Ens+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728772163; x=1760308163;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1NlzgpRomt1XbBQ3WEnrccQ62UxQDKMy2IColoCcJ2Y=;
  b=Ta+Ens+/bedMNtV2w+Tgzr//rfBuP4hOLB6jC5h/wgG61qKusqYbRC/N
   siEYZ66w83/+XJClTBRrOwWxYPKVTNZqxTySV4HnHxObCyrjs8O+26qmd
   wNnvIJlCu0T+3+DZkD5UeAYAeLnv6oKZaJ/rk9XoYluuBDbftqH0u0wIb
   skgGkHFvJEQzqGFJdaV8vluq0VJ5GiRIs378sfeVUP1sayDMYEJQy1YU+
   r/P+XmyRA6Mw/XU0Va+IJ1LwXWtwPZzLEwZkN+6E5y8eUe1VJkOt8MJ97
   zGNS928wiIRME+ORfPojXt9r4FWe9MFCBsdcLhgud30VTdVfWnnVXTl5l
   w==;
X-CSE-ConnectionGUID: J7nHTB6JTamSLSywGE7jdg==
X-CSE-MsgGUID: lVbe7U4XQMSBEPBHDk3S3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28241138"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28241138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 15:29:23 -0700
X-CSE-ConnectionGUID: 5bfI9An2TZuAmM0cbZf6pg==
X-CSE-MsgGUID: azU1Ot6CTGq1Mogd6b93PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="76873202"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Oct 2024 15:29:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szkbv-000Dnn-1L;
	Sat, 12 Oct 2024 22:29:19 +0000
Date: Sun, 13 Oct 2024 06:28:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
Message-ID: <202410130614.3YcQJfmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_NSP_GPIO-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130614.3YcQJfmO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130614.3YcQJfmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130614.3YcQJfmO-lkp@intel.com/

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
