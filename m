Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE073C8CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 05:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtYxl+gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697087087; x=1728623087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0tKoGDNwjR/6HTNC4OExQZsIuCdCo+yuUHxL9nqra4=;
  b=VtYxl+gdv/aCBHhmFTkL/KRw4rHKNdUQ1yPEPLnHanKQO8CYLjynpHVM
   O6/Nh49VVVkrFR0xl7pgDRaRQGhoH7m/d+bGg4slp4kOawuR8+Iiorrgi
   Syu7DweDDRYEUebPanB2ymbp1g+G3ydJ+k/Loq1BoM3P1UGfhhjHUUJkJ
   aXVZ70H7QZY4TUs6emVae5rWHgVVtfKNXxdrA4X4kT/QBkzFAnjS8fveh
   WA+rnJxt/ArIeo+BgcRp0iFBCTg9JVQ7pm526R7xNJmNHHrqY1qyTkgxc
   q+oQg7vs6P/e916MaP4malSkGGqWhek0520Hl8hUr01m6QRLwaUNNXOjs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388694900"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="388694900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 22:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="789246218"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="789246218"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Oct 2023 22:04:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqnsF-0003CS-26;
	Thu, 12 Oct 2023 05:04:40 +0000
Date: Thu, 12 Oct 2023 13:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 11914/30000] phy-fsl-imx8mq-usb.c:undefined
 reference to `power_supply_unreg_notifier'
Message-ID: <202310121202.v3PrJUew-lkp@intel.com>
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
commit: 2f73efb5fc11c0ef40e7ae1532ccf442ac4cd2ff [11914/30000] MLK-24530 phy: freescale: imx8mq-usb: balance power supply use count
config: arc-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231012/202310121202.v3PrJUew-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121202.v3PrJUew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121202.v3PrJUew-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_usb_phy_remove':
>> phy-fsl-imx8mq-usb.c:(.text+0x20): undefined reference to `power_supply_unreg_notifier'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x20): undefined reference to `power_supply_unreg_notifier'
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_phy_usb_vbus_notify':
>> phy-fsl-imx8mq-usb.c:(.text+0x64): undefined reference to `power_supply_get_by_phandle'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x64): undefined reference to `power_supply_get_by_phandle'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x7e): undefined reference to `power_supply_put'
>> arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x7e): undefined reference to `power_supply_put'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x9a): undefined reference to `power_supply_get_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x9a): undefined reference to `power_supply_get_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0xb0): undefined reference to `power_supply_put'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0xb0): undefined reference to `power_supply_put'
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_usb_phy_probe':
   phy-fsl-imx8mq-usb.c:(.text+0x25c): undefined reference to `power_supply_reg_notifier'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x25c): undefined reference to `power_supply_reg_notifier'
   arc-elf-ld: drivers/phy/freescale/phy-fsl-imx8mq-usb.o: in function `imx8mq_phy_charger_detect':
   phy-fsl-imx8mq-usb.c:(.text+0x3f6): undefined reference to `power_supply_get_by_phandle'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x3f6): undefined reference to `power_supply_get_by_phandle'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x414): undefined reference to `power_supply_put'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x414): undefined reference to `power_supply_put'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x42e): undefined reference to `power_supply_get_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x42e): undefined reference to `power_supply_get_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x500): undefined reference to `power_supply_set_property'
   arc-elf-ld: phy-fsl-imx8mq-usb.c:(.text+0x500): undefined reference to `power_supply_set_property'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
