Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90F347C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601109; cv=none; b=Bjgz5u5Tfr084ZvAyHYQ455fRDHc6Bup+LO7GM9NcYIY6G8GDV4gTxkqqNRhkCB4NUnYfWaJnzlfZ5IS4PqwUnttLoB5WoCsgUjLYEJTR/A/xtkExeMDRgKALp4PzdaW1Ll2Q6Oxp4z3P3YKsVXc7RE6P3X3+LPKoMog2kcKPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601109; c=relaxed/simple;
	bh=vB/kewlkZmRhbt+P6irAK5GLHCkU2w1fRXGKfss+t20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKKeDgLjaEqVCLNmZIATRQ/xclhuTbGXLzfR41Fn5jbLaw3rlbRSFtKdGIDIXwk9piO9K1fzHqef9fzhgiVib2J25iNQjv9WE4ZZyVjKb4zIJ621ZL+lEY3RB4ukKpy1T4wOCaJY9bUH+85Dt1AycDU5J1U2TmwMmkDUZEiDlQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbUf7Pq2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbUf7Pq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725601108; x=1757137108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vB/kewlkZmRhbt+P6irAK5GLHCkU2w1fRXGKfss+t20=;
  b=LbUf7Pq20QKqMX+L25ivAg9TkOv9i2BmOnyAqpUQ0UjIoUluILs0Ciq5
   6TDY/44BFwTZqrPFhj8v3EewoEwUCN+lLxQzLVVAcoz329MpZk5A711i8
   qogQET5rWMCrMgVsmuwTPEpKxFj0UDOTd2TRDl3/wCqzbWMboYpPHplI4
   cOp0OLDOWP3umQ8txDGlPrMn0AxMoLD5tibpZghpeAiGlQfuQncQK6+8z
   RmPq1RJb3MXklRUprk+pA+cCFaXSJJZWRuYHzrlgkbGpP3Sui5B9dDrop
   XmuUaTPCohzoVRCMzDO9LFwUDCZGOXxdDxb+R+Dnqax3cKjWjIF++NPk3
   A==;
X-CSE-ConnectionGUID: JEvccQcQSuSo9yLN7VBspQ==
X-CSE-MsgGUID: LLWW8TqmQWqxL/WWj6QvgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41830724"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="41830724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 22:38:27 -0700
X-CSE-ConnectionGUID: 2pSwt3V4S1Wb4BaXGOgHaQ==
X-CSE-MsgGUID: ZR2tcet1R5y70GEj/2NSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="96630881"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Sep 2024 22:38:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smRfs-000Ail-0z;
	Fri, 06 Sep 2024 05:38:24 +0000
Date: Fri, 6 Sep 2024 13:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-TDM-spit-2024-09-05 8/15]
 drivers/video/fbdev/omap2/omapfb/dss/dss.c:954:9: error: expression is not
 assignable
Message-ID: <202409061357.nHzHGQJg-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240906/202409061357.nHzHGQJg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061357.nHzHGQJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061357.nHzHGQJg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/omap2/omapfb/dss/dss.c:16:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2202:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:954:9: error: expression is not assignable
     953 |         } while (!ret &&
         |                  ~~~~~~~
     954 |                  port = of_graph_get_next_port(parent, port));
         |                  ~~~~ ^
>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:998:16: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
     998 |         } while (port = of_graph_get_next_port(parent, port));
         |                  ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:998:16: note: place parentheses around the assignment to silence this warning
     998 |         } while (port = of_graph_get_next_port(parent, port));
         |                       ^                                     
         |                  (                                          )
   drivers/video/fbdev/omap2/omapfb/dss/dss.c:998:16: note: use '==' to turn this assignment into an equality comparison
     998 |         } while (port = of_graph_get_next_port(parent, port));
         |                       ^
         |                       ==
   5 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


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
