Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87A17BA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 03:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725593045; cv=none; b=lqmoEbiRbHtbubtExY9icQfkjFZtgiMXDGLaL7yAt9zCvEVov+uZdeEuscGsosEU+MlBugviAyanim3rLAnOOxDQeHj8MjOytlIiurv6J9VcPRebAxm5urCqbElJ6wzyXFsJe2X6C4Kju8Hcaoxq346EhalC9rWInpbRN4zDpVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725593045; c=relaxed/simple;
	bh=7CBDtjfjxfRFJVY+Fy64TTXcf5IVaNVNNTGVHMl9cNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RG7/0ZRTmrWRnqJ8djXapCVeRq2h8gZGQ6yK+C0Tp6eDjZQ87/OEp8ouq6zGb9ULJMPp5NjWuukM2tIx4X50Re+f0Brfs6jXCZkiM6eAjG+cDkYEfmuB/0bjUrRfxYi9NhhWuvBUtD2E3dlfusBsmyyTO5u37NfqGeeldMjI54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDU6ej+8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDU6ej+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725593044; x=1757129044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7CBDtjfjxfRFJVY+Fy64TTXcf5IVaNVNNTGVHMl9cNo=;
  b=HDU6ej+8H6/j5x6Kz0KOgKnwXcTKS98wVht5H1+cm7Fy8QSIPe7zu0Mr
   LmzU3o1AHZEnZ3+8GoI7Z1rlB+ZRoZdZ5KiwQewtOCcxLiNzXIm5zyQQQ
   BXD30jddfAnNWZjdmvNNeYjxYOEZwBTKW/zu2QNdKO+3cFGvICrUO+SyO
   RbxgUXirFGgFUzG84sz7G3clmDD7iBd8w0D7dhguQ2Xl7dRjKv/ceKU6Y
   Sogi6dq6iM0D9KMbIJt07CxBjo9nelTyO1GKDhg/3waLyjruXhkuLZtTR
   6vNNCiOLgAXzb3zMmUGr0IDPjldVmm9eQyRY8q8rxDJfORLc2V6BEvlAL
   A==;
X-CSE-ConnectionGUID: M0984zTCQQCEJ8dPRijAPw==
X-CSE-MsgGUID: DVYZxOGtSKupW/Cixa0Hjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35012705"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="35012705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:24:02 -0700
X-CSE-ConnectionGUID: 4xeFldRxRfKi/jvzt353oA==
X-CSE-MsgGUID: hYeDsjQ0RqyqgIF7/zSCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70393844"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 20:24:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smPZm-000AYx-1s;
	Fri, 06 Sep 2024 03:23:58 +0000
Date: Fri, 6 Sep 2024 11:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-TDM-spit-2024-09-05 8/15]
 drivers/video/fbdev/omap2/omapfb/dss/dss.c:954:23: error: lvalue required as
 left operand of assignment
Message-ID: <202409061145.Uo6OnWLs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-TDM-spit-2024-09-05
head:   f2dc6deeba0553cf79ecb30e76e88ea593f3124b
commit: 1c1a800fff8c02ad62ff43ab15e3c14bfa9366d4 [8/15] fbdev: omapfb: use new of_graph functions
config: arc-randconfig-001-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061145.Uo6OnWLs-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061145.Uo6OnWLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061145.Uo6OnWLs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/video/fbdev/omap2/omapfb/dss/dss.c: In function 'dss_init_ports':
>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:954:23: error: lvalue required as left operand of assignment
     954 |                  port = of_graph_get_next_port(parent, port));
         |                       ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.c: In function 'dss_uninit_ports':
>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:998:18: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
     998 |         } while (port = of_graph_get_next_port(parent, port));
         |                  ^~~~


vim +954 drivers/video/fbdev/omap2/omapfb/dss/dss.c

   916	
   917	static int dss_init_ports(struct platform_device *pdev)
   918	{
   919		struct device_node *parent = pdev->dev.of_node;
   920		struct device_node *port;
   921		int r, ret = 0;
   922	
   923		port = of_graph_get_next_port(parent, NULL);
   924		if (!port)
   925			return 0;
   926	
   927		if (dss.feat->num_ports == 0)
   928			return 0;
   929	
   930		do {
   931			enum omap_display_type port_type;
   932			u32 reg;
   933	
   934			r = of_property_read_u32(port, "reg", &reg);
   935			if (r)
   936				reg = 0;
   937	
   938			if (reg >= dss.feat->num_ports)
   939				continue;
   940	
   941			port_type = dss.feat->ports[reg];
   942	
   943			switch (port_type) {
   944			case OMAP_DISPLAY_TYPE_DPI:
   945				ret = dpi_init_port(pdev, port);
   946				break;
   947			case OMAP_DISPLAY_TYPE_SDI:
   948				ret = sdi_init_port(pdev, port);
   949				break;
   950			default:
   951				break;
   952			}
   953		} while (!ret &&
 > 954			 port = of_graph_get_next_port(parent, port));
   955	
   956		if (ret)
   957			dss_uninit_ports(pdev);
   958	
   959		return ret;
   960	}
   961	
   962	static void dss_uninit_ports(struct platform_device *pdev)
   963	{
   964		struct device_node *parent = pdev->dev.of_node;
   965		struct device_node *port;
   966	
   967		port = of_graph_get_next_port(parent, NULL);
   968		if (!port)
   969			return;
   970	
   971		if (dss.feat->num_ports == 0)
   972			return;
   973	
   974		do {
   975			enum omap_display_type port_type;
   976			u32 reg;
   977			int r;
   978	
   979			r = of_property_read_u32(port, "reg", &reg);
   980			if (r)
   981				reg = 0;
   982	
   983			if (reg >= dss.feat->num_ports)
   984				continue;
   985	
   986			port_type = dss.feat->ports[reg];
   987	
   988			switch (port_type) {
   989			case OMAP_DISPLAY_TYPE_DPI:
   990				dpi_uninit_port(port);
   991				break;
   992			case OMAP_DISPLAY_TYPE_SDI:
   993				sdi_uninit_port(port);
   994				break;
   995			default:
   996				break;
   997			}
 > 998		} while (port = of_graph_get_next_port(parent, port));
   999	}
  1000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
