Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A121F4623
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751798441; cv=none; b=HZzYCQrMEyxq2oP8Iec4mnZss76qEvR7llSLlw2FVRNE7mq8Rcx3Zjw8RHoQRUaqrwoP5TW+2U2dMdLjrjJauoBMF97uss5ohJx8WY/N0di4+Kh84SOYQOiBaeKtnQhHh8SPE6xlFgYwsKgpAyidrGQhgoHHF+hpuJWM/CGYywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751798441; c=relaxed/simple;
	bh=Ha3cBAetSFp1n20gXmPWNfxPU7OL7cwSCkEL5FGcuUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CEIfIqwwzY/dSsb+QpUdf5b8VIvh7Q/yklK+t74GDeSzHfe9GYbER686oRsDeSpaEWGLjB7WyE08cIEP31suUABAXubTGEfIU+DCDqV8D1HvQSRKskYgjYtXm+7nHMAVs235PKbNfnrqItPIUg6vMtSIJatXZZFBLLCYJdOSob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGDMCa+w; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGDMCa+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751798439; x=1783334439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ha3cBAetSFp1n20gXmPWNfxPU7OL7cwSCkEL5FGcuUw=;
  b=SGDMCa+wZ1vKyMrgXzgCKWZneFS3ReiiiKoezt5uD7qMyi6QQ16iis+A
   e98tU7XLUTbGKyI++Gzar28Qhe2RSffAQ0P4ZpJxmYkBIh5BxGezYo87W
   viE9VmF6+Hu8ZnKAazLA5DijuMW1Cc3DoJsKjt5KudntepfNCE7fkEdGj
   TkO4cEtJynoxtn6jKcTobX++o2EyXJ/krSZq9Abx6dWq4yKqATAXRVl4J
   V6oYg5sIqOJml6Dc8YF5Wq9yGuCh4igS588dObDyXDi7qrlhslBFoLRxA
   EeNU9JN5UFID5HN+EEDsKXmXZV9Kgcy64/bcORq9rlaTqrrDnVZRrsHht
   A==;
X-CSE-ConnectionGUID: BQdJvgebSm2IEmddOp6yIw==
X-CSE-MsgGUID: W9+RCbRFSYmKW3bhX2AMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="65102171"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="65102171"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 03:40:39 -0700
X-CSE-ConnectionGUID: Cq8OAvCdQYer0Vao1/TuKg==
X-CSE-MsgGUID: II2HO66RRaKIIoavsEhuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="185984316"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2025 03:40:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYMnT-00051Z-2k;
	Sun, 06 Jul 2025 10:40:35 +0000
Date: Sun, 6 Jul 2025 18:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2467/2467]
 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:141:12: warning:
 'ne6x_aq_get_vf_link_status' defined but not used
Message-ID: <202507061805.cRYKvKJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9f7917e90ec872036160e2cb3a1d3c1856cb406
commit: a1d4d5a14d92c0c50418884e3bd132383989b67d [2467/2467] drivers: Fix BUILD REGRESSION warnings in bzwx N5/N6 series NIC drivers
config: x86_64-randconfig-102-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061805.cRYKvKJL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061805.cRYKvKJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061805.cRYKvKJL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2188:27: warning: initialized field overwritten [-Woverride-init]
    2188 |         .ndo_tx_timeout = ne6x_tx_timeout,
         |                           ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2188:27: note: (near initialization for 'ne6x_netdev_ops.ndo_tx_timeout')
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2192:29: warning: initialized field overwritten [-Woverride-init]
    2192 |         .ndo_set_features = ne6x_set_features,
         |                             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2192:29: note: (near initialization for 'ne6x_netdev_ops.ndo_set_features')
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:141:12: warning: 'ne6x_aq_get_vf_link_status' defined but not used [-Wunused-function]
     141 | static int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: In function 'ne6x_config_netdev':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2353:43: warning: '%d' directive writing between 1 and 5 bytes into a region of size between 1 and 7 [-Wformat-overflow=]
    2353 |                 sprintf(name, "enP%dp%ds0f%d",
         |                                           ^~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2353:31: note: directive argument in the range [0, 65535]
    2353 |                 sprintf(name, "enP%dp%ds0f%d",
         |                               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2353:17: note: 'sprintf' output between 11 and 21 bytes into a destination of size 16
    2353 |                 sprintf(name, "enP%dp%ds0f%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2354 |                         pf->hw.bus.domain_num, pf->hw.bus.bus_num, adpt->idx);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


vim +/ne6x_aq_get_vf_link_status +141 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c

   140	
 > 141	static int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
   142	{
   143		struct ne6x_pf *pf = adpt->back;
   144		struct ne6x_adapter *pf_adpt = pf->adpt[(adpt->port_info->lport >= pf->hw.pf_port) ?
   145						 (pf->hw.pf_port - 1) : adpt->port_info->lport];
   146		struct ne6x_link_info *pf_link_status = &pf_adpt->port_info->link_status;
   147		struct ne6x_port_info *vf_port_info = adpt->port_info;
   148	
   149		if (is_up) {
   150			if (pf_link_status->link) {
   151				vf_port_info->phy.link_info.link_info |= NE6X_AQ_LINK_UP;
   152	
   153				switch (pf_link_status->speed) {
   154				case NE6X_LINK_SPEED_10GB:
   155					vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_10GBASE;
   156					vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_10GB;
   157					break;
   158				case NE6X_LINK_SPEED_25GB:
   159					vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_25GBASE;
   160					vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_25GB;
   161					break;
   162				case NE6X_LINK_SPEED_40GB:
   163					vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_40GBASE;
   164					vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_40GB;
   165					break;
   166				case NE6X_LINK_SPEED_100GB:
   167					vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_100GBASE;
   168					vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_100GB;
   169					break;
   170				case NE6X_LINK_SPEED_200GB:
   171					vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_200GBASE;
   172					vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_200GB;
   173					break;
   174				default:
   175					dev_info(&adpt->back->pdev->dev, "WARNING: Unrecognized link_speed (0x%x).\n",
   176						 NE6X_LINK_SPEED_UNKNOWN);
   177					break;
   178				}
   179	
   180				vf_port_info->phy.media_type = NE6X_MEDIA_FIBER;
   181				return 0;
   182			}
   183		}
   184	
   185		vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_UNKNOWN;
   186		vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_UNKNOWN;
   187		vf_port_info->phy.media_type             = NE6X_MEDIA_UNKNOWN;
   188		vf_port_info->phy.link_info.link_info   &= ~NE6X_AQ_LINK_UP;
   189	
   190		return 0;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
