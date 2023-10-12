Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AEC7EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFs0KClO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697076670; x=1728612670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncaSt/NfT+C3x4ykTN8ca5hoEfe3jzf+O6sermVDduc=;
  b=nFs0KClOa/55tEFROIVOFGDzs9lsi3Sf6eKUcYiFi4kEvo71qEshluxK
   PGPnj9aRcN9fa9nDWXcSnMQoFmVTxjww4k6qIuedgnpnE7Q/5vq96nmvo
   owW30thwak8XbheGlCI9rDcY432bIC9/UwdWeE53qc18R56LNvVdneW0K
   gZrM+KnekFq6wIkDrhfKkNXKnlRtWuKYOWjPG9+u1pUnJryh30Okk6a2s
   z9Q7OrQXA5WivHpFm7Tefy2kxh1r/5jnkTfAcRP9tJsjSucJtsN5LvPJ/
   hegyviukW61gj7OIahTiSyGnTMLaDAg0b+2/djUydUKhK/8xy13zz/wyy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471066347"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="471066347"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 19:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927796386"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="927796386"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Oct 2023 19:11:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqlAH-00030p-1u;
	Thu, 12 Oct 2023 02:11:05 +0000
Date: Thu, 12 Oct 2023 10:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 11884/30000] arc-elf-ld:
 phy-fsl-imx8mq-usb.c:undefined reference to `power_supply_get_property'
Message-ID: <202310121022.yAqIcvjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 11ff6daad15c3cf0bd0b75cbf8498ae0912c5cbd [11884/30000] MLK-24507-2 phy: freescale: imx8mq-usb: add usb charger detect support
config: arc-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231012/202310121022.yAqIcvjw-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121022.yAqIcvjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121022.yAqIcvjw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_phy_usb_vbus_notify':
   phy-fsl-imx8mq-usb.c:(.text+0x48): undefined reference to `power_supply_get_property'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x48): undefined reference to `power_supply_get_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x66): undefined reference to `devm_power_supply_get_by_phandle'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x66): undefined reference to `devm_power_supply_get_by_phandle'
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_usb_phy_probe':
>> phy-fsl-imx8mq-usb.c:(.text+0x220): undefined reference to `power_supply_reg_notifier'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x220): undefined reference to `power_supply_reg_notifier'
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_phy_charger_detect':
   phy-fsl-imx8mq-usb.c:(.text+0x3c2): undefined reference to `power_supply_get_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x3c2): undefined reference to `power_supply_get_property'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x4ba): undefined reference to `power_supply_set_property'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x4ba): undefined reference to `power_supply_set_property'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
