Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91643167DB9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717831350; cv=none; b=QQSSSWiA++Vqxqhu7higXuO0iSJjZiFEJD217LhlCA7z+LFrktkGrIT3VJEXGpzmIJPAwl0R1doA0TgvlgoG0tqTV5cwmcmb2tTXbFrPJ12NDAh8n0tJcGtCcXC7i8CeNXU9MnqjYsd6dWKuC3tKZQsKxmiykiRMvXO2fVQHHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717831350; c=relaxed/simple;
	bh=E8ZhG7hb4VhljXV3lA6ZDA+j2kSOek3EO6dxz87UhE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZVyN61qPtxEbwnES+1dfBaRJigmzvmgE1nrVIOTUHhpCp83Zr97MaELZ8JolkZgpC3iFUXywQ3rFyZlElmmhTyfbjrk7E9QwMMoiSS7G8ZepxGt6cFcVots5Ux7VEG+GrDiGjlsOA9nRAynV2V7vln6Jbmhi+9KrW9Bqx3LcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJon+gjv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJon+gjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717831344; x=1749367344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8ZhG7hb4VhljXV3lA6ZDA+j2kSOek3EO6dxz87UhE0=;
  b=dJon+gjvA+Myhe03J1XewEPmu+IcXF8ByYzXreM4pVhdrf3ItT4Feh7N
   JRH9xO0QYDXujGqeWawlSmjXor1rmUDH54EGcmOPwKMEvQBNoslrXkUZ9
   lb0Y1zt4IOTZw8nb5tNTWViIj6m0rxJqcYj/QczIP+Fnrxeh6FBSvWJil
   wslPGnk7rl7sI28DN75YPzCWosHuEcW668Lgg6tJdGqKFBfGeaGIJZ3RW
   BiSgTAHWpuUKrpnvm/PPQ5UDqxWGvty7710ekGsX6LCRwVXpbm1aDmqrO
   FtShrv7gghCV4DxVE268hAaDSV2Ulxe5chnZrdrDzL6vK/oX5gGGAFg2D
   g==;
X-CSE-ConnectionGUID: I0AwJv0QS1+pEv0aVjpMXA==
X-CSE-MsgGUID: 8duux+q/TtCNuWhEmrnmOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39961902"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="39961902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:22:24 -0700
X-CSE-ConnectionGUID: kB6lDJ5tQRi3ATY+D+uIig==
X-CSE-MsgGUID: BhSnqPMiS0inoPcwDu8j8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="43105680"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 00:22:22 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqP5-0001Dw-36;
	Sat, 08 Jun 2024 07:22:19 +0000
Date: Sat, 8 Jun 2024 15:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5926/11738]
 arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning
 (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node
 has single child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202406081528.bREcjcCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   d8b0bac40433ce7ef0a7493948bad27a6e223c08
commit: 98948b331198d829fc01c86c9fb49e437dba533d [5926/11738] LF-10676-4 arm64: dts: imx: fix simple_bus_reg build warnings
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081528.bREcjcCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081528.bREcjcCW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-hdmi-rx.dts:104.13-107.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-hdmi.dts:102.7-108.3
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-hdmi-rx-ov5640.dts:105.13-108.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-hdmi.dts:102.7-108.3
--
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:94.40-97.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:351.26-370.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:398.26-417.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ddr4-val.dts:55.40-58.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:196.10-210.6: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:388.10-402.6: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:94.40-97.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi:112.23-128.4: Warning (avoid_unnecessary_addr_size): /bus@5a000000/spi@5a030000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val-lpspi.dts:49.9-60.3
     also defined at arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val-lpspi-slave.dts:19.9-24.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:351.26-370.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:398.26-417.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:137.28-151.5: Warning (avoid_unnecessary_addr_size): /bus@56220000/i2c@56226000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:698.13-726.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:329.28-343.5: Warning (avoid_unnecessary_addr_size): /bus@57220000/i2c@57226000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:745.13-773.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek-dsi-rm67191.dts:22.10-42.4: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/panel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek-dsi-rm67191.dts:65.10-83.4: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/panel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:137.28-151.5: Warning (avoid_unnecessary_addr_size): /bus@56220000/i2c@56226000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:698.13-726.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:329.28-343.5: Warning (avoid_unnecessary_addr_size): /bus@57220000/i2c@57226000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:745.13-773.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek-dsi-rm67191.dts:22.10-42.4: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/panel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-dsi-rm67199.dts:12.10-14.4
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek-dsi-rm67191.dts:65.10-83.4: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/panel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-dsi-rm67199.dts:18.10-20.4
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:94.40-97.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:351.26-370.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val.dts:398.26-417.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-lpddr4-val-dp.dts:99.7-105.3
--
   arch/arm64/boot/dts/freescale/imx8q-val.dtsi:51.40-54.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8q-val.dtsi:822.13-836.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:196.10-210.6: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:388.10-402.6: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-cockpit-a72.dts:1221.13-1235.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek-cockpit-a72.dts:630.26-649.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:329.28-343.5: Warning (avoid_unnecessary_addr_size): /bus@57220000/i2c@57226000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:745.13-773.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-gpu.dtsi:13.37-28.4: Warning (simple_bus_reg): /bus@54100000/imx8_gpu1_ss@80000000: simple-bus unit address format error, expected "a8000000"
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1864.14-1867.3
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-dom0.dts:416.14-420.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-dom0.dts:514.15-516.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:119.40-122.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:196.13-201.4: Warning (unit_address_vs_reg): /hypervisor: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:241.26-246.5: Warning (simple_bus_reg): /passthrough/clock-dummy: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:248.26-253.5: Warning (simple_bus_reg): /passthrough/clock-xtal32k: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:255.26-260.5: Warning (simple_bus_reg): /passthrough/clock-xtal24m: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:262.21-291.5: Warning (simple_bus_reg): /passthrough/system-controller: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:10.30-15.3: Warning (simple_bus_reg): /passthrough/clock-conn-axi: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:17.30-22.3: Warning (simple_bus_reg): /passthrough/clock-conn-ahb: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:24.30-29.3: Warning (simple_bus_reg): /passthrough/clock-conn-ipg: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:31.30-36.3: Warning (simple_bus_reg): /passthrough/clock-conn-bch: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi:10.30-15.3: Warning (simple_bus_reg): /passthrough/clock-lsio-mem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi:17.30-22.3: Warning (simple_bus_reg): /passthrough/clock-lsio-bus: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:299.22-305.5: Warning (simple_bus_reg): /passthrough/brcmfmac: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:307.37-323.5: Warning (simple_bus_reg): /passthrough/lvds_backlight-0: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:477.35-491.4: Warning (simple_bus_reg): /bus@5a000000/dma-controller@5a2e0000: simple-bus unit address format error, expected "5a1f0000"
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:1365.13-1379.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:355.18-370.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:1203.26-1222.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7
   arch/arm64/boot/dts/freescale/imx8qm-mek-domu.dts:1250.26-1269.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8
--
>> arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi:343.33-423.4: Warning (simple_bus_reg): /bus@59000000/dma-controller@591f0000: simple-bus unit address format error, expected "59280000"
     also defined at arch/arm64/boot/dts/freescale/imx8qxp-mek-sof-cs42888.dts:60.8-99.3
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:114.38-117.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56221000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56221000)
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:228.38-231.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1249.13-1263.3
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:540.31-554.5: Warning (graph_child_address): /bus@58000000/camera/pcsi@58261000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1270.15-1280.3
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:574.26-593.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:201.22-210.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:661.26-680.4: Warning (graph_child_address): /bus@56220000/i2c@56246000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi:343.33-423.4: Warning (simple_bus_reg): /bus@59000000/dma-controller@591f0000: simple-bus unit address format error, expected "59280000"
     also defined at arch/arm64/boot/dts/freescale/imx8qxp-mek-sof.dts:92.8-123.3
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:114.38-117.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56221000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56221000)
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:228.38-231.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1249.13-1263.3
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:540.31-554.5: Warning (graph_child_address): /bus@58000000/camera/pcsi@58261000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1270.15-1280.3
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:574.26-593.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:201.22-210.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:661.26-680.4: Warning (graph_child_address): /bus@56220000/i2c@56246000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:171.18-186.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:355.18-370.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:196.10-210.6: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:388.10-402.6: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1398.36-1426.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1398.36-1426.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1398.36-1426.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ov2775.dts:101.13-111.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ov2775-ov5640.dts:95.13-105.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler-ov5640.dts:43.13-53.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler.dts:42.13-52.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler-ov2775.dts:90.13-100.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-dual-basler.dts:97.13-111.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-dual-ov2775.dts:106.13-119.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1398.36-1426.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-os08a20-ov5640.dts:91.13-101.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-os08a20.dts:72.13-82.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-dual-os08a20.dts:98.13-111.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:235.40-238.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1391.12-1395.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1375.32-1396.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:674.34-679.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts:39.25-41.5: Warning (sound_dai_property): /sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /soc@0/bus@30c00000/spba-bus@30c00000/sai@30c20000 or bad phandle (referred from sound-dai[0])
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1398.36-1426.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2298.18-2313.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ab2.dts:31.18-35.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:674.34-679.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1398.36-1426.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1428.36-1463.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ab2.dts:420.9-422.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ab2.dts:412.7-414.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2298.18-2313.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts:139.9-147.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts:172.13-176.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts:149.9-158.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts:121.9-129.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1688.30-1707.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts:154.13-158.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2000.36-2026.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:749.9-754.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts:131.9-140.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2028.24-2057.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:733.7-735.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2315.18-2330.5: Warning (graph_child_address): /ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640.dts:74.13-86.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:88.38-91.5: Warning (unique_unit_address_if_enabled): /bus@56240000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56240000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:117.40-120.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:272.38-275.5: Warning (unique_unit_address_if_enabled): /bus@57240000/lvds_region@57241000: duplicate unit-address (also used in node /bus@57240000/ldb_phy@57241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:508.28-522.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek.dts:1341.13-1355.3
   arch/arm64/boot/dts/freescale/imx8qm-ss-dc.dtsi:46.21-56.4: Warning (graph_child_address): /bus@57000000/dpu@57180000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:188.18-203.5: Warning (graph_child_address): /ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi:372.18-387.5: Warning (graph_child_address): /ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:706.26-725.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:200.22-209.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-mek.dts:753.26-772.4: Warning (graph_child_address): /bus@57220000/i2c@57226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi:392.22-401.7: Warning (graph_child_address): /bus@57220000/dsi_host@57228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qm-ss-hdmi.dtsi:173.22-224.8: Warning (graph_child_address): /bus@56260000/hdmi@56268000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8qm-mek-hdmi.dts:102.7-108.3

vim +372 arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi

340f47878cbbf0 Liu Ying        2019-08-07    2  
340f47878cbbf0 Liu Ying        2019-08-07    3  /*
340f47878cbbf0 Liu Ying        2019-08-07    4   * Copyright 2019 NXP
340f47878cbbf0 Liu Ying        2019-08-07    5   */
340f47878cbbf0 Liu Ying        2019-08-07    6  
340f47878cbbf0 Liu Ying        2019-08-07    7  / {
98948b331198d8 Dong Aisheng    2023-10-23    8  	lvds0_ipg_clk: clock-lvds0-ipg {
340f47878cbbf0 Liu Ying        2019-08-07    9  		compatible = "fixed-clock";
340f47878cbbf0 Liu Ying        2019-08-07   10  		#clock-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07   11  		clock-frequency = <24000000>;
d13f1dd0451537 Liu Ying        2020-03-13   12  		clock-output-names = "lvds0_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07   13  	};
340f47878cbbf0 Liu Ying        2019-08-07   14  
98948b331198d8 Dong Aisheng    2023-10-23   15  	lvds1_ipg_clk: clock-lvds1-ipg {
98948b331198d8 Dong Aisheng    2023-10-23   16  		compatible = "fixed-clock";
98948b331198d8 Dong Aisheng    2023-10-23   17  		#clock-cells = <0>;
98948b331198d8 Dong Aisheng    2023-10-23   18  		clock-frequency = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23   19  		clock-output-names = "lvds1_ipg_clk";
98948b331198d8 Dong Aisheng    2023-10-23   20  	};
98948b331198d8 Dong Aisheng    2023-10-23   21  
98948b331198d8 Dong Aisheng    2023-10-23   22  	lvds1_subsys: bus@56240000 {
98948b331198d8 Dong Aisheng    2023-10-23   23  		compatible = "simple-bus";
98948b331198d8 Dong Aisheng    2023-10-23   24  		#address-cells = <1>;
98948b331198d8 Dong Aisheng    2023-10-23   25  		#size-cells = <1>;
98948b331198d8 Dong Aisheng    2023-10-23   26  		ranges = <0x56240000 0x0 0x56240000 0x10000>;
98948b331198d8 Dong Aisheng    2023-10-23   27  
340f47878cbbf0 Liu Ying        2019-08-07   28  		lvds0_lis_lpcg: clock-controller@56243000 {
340f47878cbbf0 Liu Ying        2019-08-07   29  			compatible = "fsl,imx8qxp-lpcg";
340f47878cbbf0 Liu Ying        2019-08-07   30  			reg = <0x56243000 0x4>;
340f47878cbbf0 Liu Ying        2019-08-07   31  			#clock-cells = <1>;
d13f1dd0451537 Liu Ying        2020-03-13   32  			clocks = <&lvds0_ipg_clk>;
340f47878cbbf0 Liu Ying        2019-08-07   33  			bit-offset = <16>;
340f47878cbbf0 Liu Ying        2019-08-07   34  			clock-output-names = "lvds0_lis_lpcg_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07   35  			power-domains = <&pd IMX_SC_R_LVDS_0>;
340f47878cbbf0 Liu Ying        2019-08-07   36  		};
340f47878cbbf0 Liu Ying        2019-08-07   37  
032dc033463b88 Liu Ying        2019-11-14   38  		lvds0_pwm_lpcg: clock-controller@5624300c {
032dc033463b88 Liu Ying        2019-11-14   39  			compatible = "fsl,imx8qxp-lpcg";
032dc033463b88 Liu Ying        2019-11-14   40  			reg = <0x5624300c 0x4>;
032dc033463b88 Liu Ying        2019-11-14   41  			#clock-cells = <1>;
032dc033463b88 Liu Ying        2019-11-14   42  			clocks = <&clk IMX_SC_R_LVDS_0_PWM_0 IMX_SC_PM_CLK_PER>,
d13f1dd0451537 Liu Ying        2020-03-13   43  				 <&lvds0_ipg_clk>;
032dc033463b88 Liu Ying        2019-11-14   44  			bit-offset = <0 16>;
032dc033463b88 Liu Ying        2019-11-14   45  			clock-output-names = "lvds0_pwm_lpcg_clk",
032dc033463b88 Liu Ying        2019-11-14   46  					     "lvds0_pwm_lpcg_ipg_clk";
032dc033463b88 Liu Ying        2019-11-14   47  			power-domains = <&pd IMX_SC_R_LVDS_0_PWM_0>;
032dc033463b88 Liu Ying        2019-11-14   48  		};
032dc033463b88 Liu Ying        2019-11-14   49  
340f47878cbbf0 Liu Ying        2019-08-07   50  		lvds0_i2c0_lpcg: clock-controller@56243010 {
340f47878cbbf0 Liu Ying        2019-08-07   51  			compatible = "fsl,imx8qxp-lpcg";
340f47878cbbf0 Liu Ying        2019-08-07   52  			reg = <0x56243010 0x4>;
340f47878cbbf0 Liu Ying        2019-08-07   53  			#clock-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07   54  			clocks = <&clk IMX_SC_R_LVDS_0_I2C_0 IMX_SC_PM_CLK_PER>,
d13f1dd0451537 Liu Ying        2020-03-13   55  				 <&lvds0_ipg_clk>;
340f47878cbbf0 Liu Ying        2019-08-07   56  			bit-offset = <0 16>;
340f47878cbbf0 Liu Ying        2019-08-07   57  			clock-output-names = "lvds0_i2c0_lpcg_clk",
340f47878cbbf0 Liu Ying        2019-08-07   58  					     "lvds0_i2c0_lpcg_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07   59  			power-domains = <&pd IMX_SC_R_LVDS_0_I2C_0>;
340f47878cbbf0 Liu Ying        2019-08-07   60  		};
340f47878cbbf0 Liu Ying        2019-08-07   61  
340f47878cbbf0 Liu Ying        2019-08-07   62  		lvds0_i2c1_lpcg: clock-controller@56243014 {
340f47878cbbf0 Liu Ying        2019-08-07   63  			compatible = "fsl,imx8qxp-lpcg";
340f47878cbbf0 Liu Ying        2019-08-07   64  			reg = <0x56243014 0x4>;
340f47878cbbf0 Liu Ying        2019-08-07   65  			#clock-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07   66  			clocks = <&clk IMX_SC_R_LVDS_0_I2C_0 IMX_SC_PM_CLK_PER>,
d13f1dd0451537 Liu Ying        2020-03-13   67  				 <&lvds0_ipg_clk>;
340f47878cbbf0 Liu Ying        2019-08-07   68  			bit-offset = <0 16>;
340f47878cbbf0 Liu Ying        2019-08-07   69  			clock-output-names = "lvds0_i2c1_lpcg_clk",
340f47878cbbf0 Liu Ying        2019-08-07   70  					     "lvds0_i2c1_lpcg_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07   71  			power-domains = <&pd IMX_SC_R_LVDS_0_I2C_0>;
340f47878cbbf0 Liu Ying        2019-08-07   72  		};
340f47878cbbf0 Liu Ying        2019-08-07   73  
340f47878cbbf0 Liu Ying        2019-08-07   74  		irqsteer_lvds0: irqsteer@56240000 {
340f47878cbbf0 Liu Ying        2019-08-07   75  			compatible = "fsl,imx-irqsteer";
340f47878cbbf0 Liu Ying        2019-08-07   76  			reg = <0x56240000 0x1000>;
340f47878cbbf0 Liu Ying        2019-08-07   77  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
340f47878cbbf0 Liu Ying        2019-08-07   78  			interrupt-controller;
340f47878cbbf0 Liu Ying        2019-08-07   79  			interrupt-parent = <&gic>;
340f47878cbbf0 Liu Ying        2019-08-07   80  			#interrupt-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07   81  			fsl,channel = <0>;
340f47878cbbf0 Liu Ying        2019-08-07   82  			fsl,num-irqs = <32>;
340f47878cbbf0 Liu Ying        2019-08-07   83  			clocks = <&lvds0_lis_lpcg 0>;
340f47878cbbf0 Liu Ying        2019-08-07   84  			clock-names = "ipg";
340f47878cbbf0 Liu Ying        2019-08-07   85  			power-domains = <&pd IMX_SC_R_LVDS_0>;
340f47878cbbf0 Liu Ying        2019-08-07   86  		};
340f47878cbbf0 Liu Ying        2019-08-07   87  
abe388344689d5 Liu Ying        2019-12-03   88  		lvds0_region: lvds_region@56241000 {
340f47878cbbf0 Liu Ying        2019-08-07   89  			compatible = "syscon";
abe388344689d5 Liu Ying        2019-12-03   90  			reg = <0x56241000 0xf0>;
340f47878cbbf0 Liu Ying        2019-08-07   91  		};
340f47878cbbf0 Liu Ying        2019-08-07   92  
340f47878cbbf0 Liu Ying        2019-08-07   93  		ldb1_phy: ldb_phy@56241000 {
340f47878cbbf0 Liu Ying        2019-08-07   94  			compatible = "mixel,lvds-phy";
340f47878cbbf0 Liu Ying        2019-08-07   95  			reg = <0x56241000 0x100>;
340f47878cbbf0 Liu Ying        2019-08-07   96  			#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07   97  			#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07   98  			clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
340f47878cbbf0 Liu Ying        2019-08-07   99  			clock-names = "phy";
dcc24206fd8501 Oliver F. Brown 2022-09-16  100  			assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
dcc24206fd8501 Oliver F. Brown 2022-09-16  101  			assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
340f47878cbbf0 Liu Ying        2019-08-07  102  			power-domains = <&pd IMX_SC_R_LVDS_0>;
340f47878cbbf0 Liu Ying        2019-08-07  103  			status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  104  
340f47878cbbf0 Liu Ying        2019-08-07  105  			ldb1_phy1: port@0 {
340f47878cbbf0 Liu Ying        2019-08-07  106  				reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  107  				#phy-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  108  			};
340f47878cbbf0 Liu Ying        2019-08-07  109  
340f47878cbbf0 Liu Ying        2019-08-07  110  			ldb1_phy2: port@1 {
340f47878cbbf0 Liu Ying        2019-08-07  111  				reg = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  112  				#phy-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  113  			};
340f47878cbbf0 Liu Ying        2019-08-07  114  		};
340f47878cbbf0 Liu Ying        2019-08-07  115  
98948b331198d8 Dong Aisheng    2023-10-23  116  		pwm_lvds0: pwm@56244000 {
98948b331198d8 Dong Aisheng    2023-10-23  117  			compatible = "fsl,imx8qm-pwm", "fsl,imx27-pwm";
98948b331198d8 Dong Aisheng    2023-10-23  118  			reg = <0x56244000 0x1000>;
98948b331198d8 Dong Aisheng    2023-10-23  119  			clocks = <&lvds0_pwm_lpcg 0>,
98948b331198d8 Dong Aisheng    2023-10-23  120  				 <&lvds0_pwm_lpcg 1>;
98948b331198d8 Dong Aisheng    2023-10-23  121  			clock-names = "per", "ipg";
98948b331198d8 Dong Aisheng    2023-10-23  122  			assigned-clocks = <&clk IMX_SC_R_LVDS_0_PWM_0 IMX_SC_PM_CLK_PER>;
98948b331198d8 Dong Aisheng    2023-10-23  123  			assigned-clock-rates = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23  124  			#pwm-cells = <2>;
98948b331198d8 Dong Aisheng    2023-10-23  125  			power-domains = <&pd IMX_SC_R_LVDS_0_PWM_0>;
98948b331198d8 Dong Aisheng    2023-10-23  126  			status = "disabled";
98948b331198d8 Dong Aisheng    2023-10-23  127  		};
98948b331198d8 Dong Aisheng    2023-10-23  128  
98948b331198d8 Dong Aisheng    2023-10-23  129  		i2c0_lvds0: i2c@56246000 {
98948b331198d8 Dong Aisheng    2023-10-23  130  			compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
98948b331198d8 Dong Aisheng    2023-10-23  131  			reg = <0x56246000 0x1000>;
98948b331198d8 Dong Aisheng    2023-10-23  132  			interrupts = <8>;
98948b331198d8 Dong Aisheng    2023-10-23  133  			interrupt-parent = <&irqsteer_lvds0>;
98948b331198d8 Dong Aisheng    2023-10-23  134  			clocks = <&lvds0_i2c0_lpcg 0>,
98948b331198d8 Dong Aisheng    2023-10-23  135  				 <&lvds0_i2c0_lpcg 1>;
98948b331198d8 Dong Aisheng    2023-10-23  136  			clock-names = "per", "ipg";
98948b331198d8 Dong Aisheng    2023-10-23  137  			assigned-clocks = <&clk IMX_SC_R_LVDS_0_I2C_0 IMX_SC_PM_CLK_PER>;
98948b331198d8 Dong Aisheng    2023-10-23  138  			assigned-clock-rates = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23  139  			power-domains = <&pd IMX_SC_R_LVDS_0_I2C_0>;
98948b331198d8 Dong Aisheng    2023-10-23  140  			status = "disabled";
98948b331198d8 Dong Aisheng    2023-10-23  141  		};
98948b331198d8 Dong Aisheng    2023-10-23  142  
98948b331198d8 Dong Aisheng    2023-10-23  143  		i2c1_lvds0: i2c@56247000 {
98948b331198d8 Dong Aisheng    2023-10-23  144  			compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
98948b331198d8 Dong Aisheng    2023-10-23  145  			reg = <0x56247000 0x1000>;
98948b331198d8 Dong Aisheng    2023-10-23  146  			interrupts = <9>;
98948b331198d8 Dong Aisheng    2023-10-23  147  			interrupt-parent = <&irqsteer_lvds0>;
98948b331198d8 Dong Aisheng    2023-10-23  148  			clocks = <&lvds0_i2c0_lpcg 0>,
98948b331198d8 Dong Aisheng    2023-10-23  149  				 <&lvds0_i2c0_lpcg 1>;
98948b331198d8 Dong Aisheng    2023-10-23  150  			clock-names = "per", "ipg";
98948b331198d8 Dong Aisheng    2023-10-23  151  			assigned-clocks = <&clk IMX_SC_R_LVDS_0_I2C_0 IMX_SC_PM_CLK_PER>;
98948b331198d8 Dong Aisheng    2023-10-23  152  			assigned-clock-rates = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23  153  			power-domains = <&pd IMX_SC_R_LVDS_0_I2C_0>;
98948b331198d8 Dong Aisheng    2023-10-23  154  			status = "disabled";
98948b331198d8 Dong Aisheng    2023-10-23  155  		};
98948b331198d8 Dong Aisheng    2023-10-23  156  	};
98948b331198d8 Dong Aisheng    2023-10-23  157  
2d4c0fc8fd40c9 Dong Aisheng    2023-09-11  158  	ldb1: ldb1-display-controller {
340f47878cbbf0 Liu Ying        2019-08-07  159  		#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  160  		#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  161  		compatible = "fsl,imx8qm-ldb";
340f47878cbbf0 Liu Ying        2019-08-07  162  		clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
340f47878cbbf0 Liu Ying        2019-08-07  163  			 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
340f47878cbbf0 Liu Ying        2019-08-07  164  		clock-names = "pixel", "bypass";
dcc24206fd8501 Oliver F. Brown 2022-09-16  165  		assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
dcc24206fd8501 Oliver F. Brown 2022-09-16  166  		assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
340f47878cbbf0 Liu Ying        2019-08-07  167  		power-domains = <&pd IMX_SC_R_LVDS_0>;
340f47878cbbf0 Liu Ying        2019-08-07  168  		gpr = <&lvds0_region>;
340f47878cbbf0 Liu Ying        2019-08-07  169  		status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  170  
340f47878cbbf0 Liu Ying        2019-08-07  171  		lvds-channel@0 {
340f47878cbbf0 Liu Ying        2019-08-07  172  			#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  173  			#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  174  			reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  175  			phys = <&ldb1_phy1>;
340f47878cbbf0 Liu Ying        2019-08-07  176  			phy-names = "ldb_phy";
340f47878cbbf0 Liu Ying        2019-08-07  177  			status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  178  
340f47878cbbf0 Liu Ying        2019-08-07  179  			port@0 {
340f47878cbbf0 Liu Ying        2019-08-07  180  				reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  181  
340f47878cbbf0 Liu Ying        2019-08-07  182  				ldb1_ch0: endpoint {
340f47878cbbf0 Liu Ying        2019-08-07  183  					remote-endpoint = <&dpu1_disp1_ldb1_ch0>;
340f47878cbbf0 Liu Ying        2019-08-07  184  				};
340f47878cbbf0 Liu Ying        2019-08-07  185  			};
340f47878cbbf0 Liu Ying        2019-08-07  186  		};
340f47878cbbf0 Liu Ying        2019-08-07  187  
340f47878cbbf0 Liu Ying        2019-08-07  188  		lvds-channel@1 {
340f47878cbbf0 Liu Ying        2019-08-07  189  			#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  190  			#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  191  			reg = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  192  			phys = <&ldb1_phy2>;
340f47878cbbf0 Liu Ying        2019-08-07  193  			phy-names = "ldb_phy";
340f47878cbbf0 Liu Ying        2019-08-07  194  			status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  195  
340f47878cbbf0 Liu Ying        2019-08-07  196  			port@0 {
340f47878cbbf0 Liu Ying        2019-08-07  197  				reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  198  
340f47878cbbf0 Liu Ying        2019-08-07  199  				ldb1_ch1: endpoint {
340f47878cbbf0 Liu Ying        2019-08-07  200  					remote-endpoint = <&dpu1_disp1_ldb1_ch1>;
340f47878cbbf0 Liu Ying        2019-08-07  201  				};
340f47878cbbf0 Liu Ying        2019-08-07  202  			};
340f47878cbbf0 Liu Ying        2019-08-07  203  		};
340f47878cbbf0 Liu Ying        2019-08-07  204  	};
340f47878cbbf0 Liu Ying        2019-08-07  205  
340f47878cbbf0 Liu Ying        2019-08-07  206  	lvds2_subsys: bus@57240000 {
340f47878cbbf0 Liu Ying        2019-08-07  207  		compatible = "simple-bus";
340f47878cbbf0 Liu Ying        2019-08-07  208  		#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  209  		#size-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  210  		ranges = <0x57240000 0x0 0x57240000 0x10000>;
340f47878cbbf0 Liu Ying        2019-08-07  211  
340f47878cbbf0 Liu Ying        2019-08-07  212  		lvds1_lis_lpcg: clock-controller@57243000 {
340f47878cbbf0 Liu Ying        2019-08-07  213  			compatible = "fsl,imx8qxp-lpcg";
340f47878cbbf0 Liu Ying        2019-08-07  214  			reg = <0x57243000 0x4>;
340f47878cbbf0 Liu Ying        2019-08-07  215  			#clock-cells = <1>;
d13f1dd0451537 Liu Ying        2020-03-13  216  			clocks = <&lvds1_ipg_clk>;
340f47878cbbf0 Liu Ying        2019-08-07  217  			bit-offset = <16>;
340f47878cbbf0 Liu Ying        2019-08-07  218  			clock-output-names = "lvds1_lis_lpcg_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07  219  			power-domains = <&pd IMX_SC_R_LVDS_1>;
340f47878cbbf0 Liu Ying        2019-08-07  220  		};
340f47878cbbf0 Liu Ying        2019-08-07  221  
032dc033463b88 Liu Ying        2019-11-14  222  		lvds1_pwm_lpcg: clock-controller@5724300c {
032dc033463b88 Liu Ying        2019-11-14  223  			compatible = "fsl,imx8qxp-lpcg";
032dc033463b88 Liu Ying        2019-11-14  224  			reg = <0x5724300c 0x4>;
032dc033463b88 Liu Ying        2019-11-14  225  			#clock-cells = <1>;
032dc033463b88 Liu Ying        2019-11-14  226  			clocks = <&clk IMX_SC_R_LVDS_1_PWM_0 IMX_SC_PM_CLK_PER>,
d13f1dd0451537 Liu Ying        2020-03-13  227  				 <&lvds1_ipg_clk>;
032dc033463b88 Liu Ying        2019-11-14  228  			bit-offset = <0 16>;
032dc033463b88 Liu Ying        2019-11-14  229  			clock-output-names = "lvds1_pwm_lpcg_clk",
032dc033463b88 Liu Ying        2019-11-14  230  					     "lvds1_pwm_lpcg_ipg_clk";
032dc033463b88 Liu Ying        2019-11-14  231  			power-domains = <&pd IMX_SC_R_LVDS_1_PWM_0>;
032dc033463b88 Liu Ying        2019-11-14  232  		};
032dc033463b88 Liu Ying        2019-11-14  233  
340f47878cbbf0 Liu Ying        2019-08-07  234  		lvds1_i2c0_lpcg: clock-controller@57243010 {
340f47878cbbf0 Liu Ying        2019-08-07  235  			compatible = "fsl,imx8qxp-lpcg";
340f47878cbbf0 Liu Ying        2019-08-07  236  			reg = <0x57243010 0x4>;
340f47878cbbf0 Liu Ying        2019-08-07  237  			#clock-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  238  			clocks = <&clk IMX_SC_R_LVDS_1_I2C_0 IMX_SC_PM_CLK_PER>,
d13f1dd0451537 Liu Ying        2020-03-13  239  				 <&lvds1_ipg_clk>;
340f47878cbbf0 Liu Ying        2019-08-07  240  			bit-offset = <0 16>;
340f47878cbbf0 Liu Ying        2019-08-07  241  			clock-output-names = "lvds1_i2c0_lpcg_clk",
340f47878cbbf0 Liu Ying        2019-08-07  242  					     "lvds1_i2c0_lpcg_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07  243  			power-domains = <&pd IMX_SC_R_LVDS_1_I2C_0>;
340f47878cbbf0 Liu Ying        2019-08-07  244  		};
340f47878cbbf0 Liu Ying        2019-08-07  245  
340f47878cbbf0 Liu Ying        2019-08-07  246  		lvds1_i2c1_lpcg: clock-controller@57243014 {
340f47878cbbf0 Liu Ying        2019-08-07  247  			compatible = "fsl,imx8qxp-lpcg";
340f47878cbbf0 Liu Ying        2019-08-07  248  			reg = <0x57243014 0x4>;
340f47878cbbf0 Liu Ying        2019-08-07  249  			#clock-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  250  			clocks = <&clk IMX_SC_R_LVDS_1_I2C_0 IMX_SC_PM_CLK_PER>,
d13f1dd0451537 Liu Ying        2020-03-13  251  				 <&lvds1_ipg_clk>;
340f47878cbbf0 Liu Ying        2019-08-07  252  			bit-offset = <0 16>;
340f47878cbbf0 Liu Ying        2019-08-07  253  			clock-output-names = "lvds1_i2c1_lpcg_clk",
340f47878cbbf0 Liu Ying        2019-08-07  254  					     "lvds1_i2c1_lpcg_ipg_clk";
340f47878cbbf0 Liu Ying        2019-08-07  255  			power-domains = <&pd IMX_SC_R_LVDS_1_I2C_0>;
340f47878cbbf0 Liu Ying        2019-08-07  256  		};
340f47878cbbf0 Liu Ying        2019-08-07  257  
340f47878cbbf0 Liu Ying        2019-08-07  258  		irqsteer_lvds1: irqsteer@57240000 {
340f47878cbbf0 Liu Ying        2019-08-07  259  			compatible = "fsl,imx-irqsteer";
340f47878cbbf0 Liu Ying        2019-08-07  260  			reg = <0x57240000 0x1000>;
340f47878cbbf0 Liu Ying        2019-08-07  261  			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
340f47878cbbf0 Liu Ying        2019-08-07  262  			interrupt-controller;
340f47878cbbf0 Liu Ying        2019-08-07  263  			interrupt-parent = <&gic>;
340f47878cbbf0 Liu Ying        2019-08-07  264  			#interrupt-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  265  			fsl,channel = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  266  			fsl,num-irqs = <32>;
49b7c1e3a5ee4a Liu Ying        2020-03-13  267  			clocks = <&lvds1_lis_lpcg 0>;
340f47878cbbf0 Liu Ying        2019-08-07  268  			clock-names = "ipg";
340f47878cbbf0 Liu Ying        2019-08-07  269  			power-domains = <&pd IMX_SC_R_LVDS_1>;
340f47878cbbf0 Liu Ying        2019-08-07  270  		};
340f47878cbbf0 Liu Ying        2019-08-07  271  
abe388344689d5 Liu Ying        2019-12-03  272  		lvds1_region: lvds_region@57241000 {
340f47878cbbf0 Liu Ying        2019-08-07  273  			compatible = "syscon";
abe388344689d5 Liu Ying        2019-12-03  274  			reg = <0x57241000 0xf0>;
340f47878cbbf0 Liu Ying        2019-08-07  275  		};
340f47878cbbf0 Liu Ying        2019-08-07  276  
340f47878cbbf0 Liu Ying        2019-08-07  277  		ldb2_phy: ldb_phy@57241000 {
340f47878cbbf0 Liu Ying        2019-08-07  278  			compatible = "mixel,lvds-phy";
340f47878cbbf0 Liu Ying        2019-08-07  279  			reg = <0x57241000 0x100>;
340f47878cbbf0 Liu Ying        2019-08-07  280  			#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  281  			#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  282  			clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
340f47878cbbf0 Liu Ying        2019-08-07  283  			clock-names = "phy";
dcc24206fd8501 Oliver F. Brown 2022-09-16  284  			assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
dcc24206fd8501 Oliver F. Brown 2022-09-16  285  			assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
340f47878cbbf0 Liu Ying        2019-08-07  286  			power-domains = <&pd IMX_SC_R_LVDS_1>;
340f47878cbbf0 Liu Ying        2019-08-07  287  			status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  288  
340f47878cbbf0 Liu Ying        2019-08-07  289  			ldb2_phy1: port@0 {
340f47878cbbf0 Liu Ying        2019-08-07  290  				reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  291  				#phy-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  292  			};
340f47878cbbf0 Liu Ying        2019-08-07  293  
340f47878cbbf0 Liu Ying        2019-08-07  294  			ldb2_phy2: port@1 {
340f47878cbbf0 Liu Ying        2019-08-07  295  				reg = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  296  				#phy-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  297  			};
340f47878cbbf0 Liu Ying        2019-08-07  298  		};
340f47878cbbf0 Liu Ying        2019-08-07  299  
98948b331198d8 Dong Aisheng    2023-10-23  300  		pwm_lvds1: pwm@57244000 {
98948b331198d8 Dong Aisheng    2023-10-23  301  			compatible = "fsl,imx8qm-pwm", "fsl,imx27-pwm";
98948b331198d8 Dong Aisheng    2023-10-23  302  			reg = <0x57244000 0x1000>;
98948b331198d8 Dong Aisheng    2023-10-23  303  			clocks = <&lvds1_pwm_lpcg 0>,
98948b331198d8 Dong Aisheng    2023-10-23  304  				 <&lvds1_pwm_lpcg 1>;
98948b331198d8 Dong Aisheng    2023-10-23  305  			clock-names = "per", "ipg";
98948b331198d8 Dong Aisheng    2023-10-23  306  			assigned-clocks = <&clk IMX_SC_R_LVDS_1_PWM_0 IMX_SC_PM_CLK_PER>;
98948b331198d8 Dong Aisheng    2023-10-23  307  			assigned-clock-rates = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23  308  			#pwm-cells = <2>;
98948b331198d8 Dong Aisheng    2023-10-23  309  			power-domains = <&pd IMX_SC_R_LVDS_1_PWM_0>;
98948b331198d8 Dong Aisheng    2023-10-23  310  			status = "disabled";
98948b331198d8 Dong Aisheng    2023-10-23  311  		};
98948b331198d8 Dong Aisheng    2023-10-23  312  
98948b331198d8 Dong Aisheng    2023-10-23  313  		i2c0_lvds1: i2c@57246000 {
98948b331198d8 Dong Aisheng    2023-10-23  314  			compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
98948b331198d8 Dong Aisheng    2023-10-23  315  			reg = <0x57246000 0x1000>;
98948b331198d8 Dong Aisheng    2023-10-23  316  			interrupts = <8>;
98948b331198d8 Dong Aisheng    2023-10-23  317  			interrupt-parent = <&irqsteer_lvds1>;
98948b331198d8 Dong Aisheng    2023-10-23  318  			clocks = <&lvds1_i2c0_lpcg 0>,
98948b331198d8 Dong Aisheng    2023-10-23  319  				 <&lvds1_i2c0_lpcg 1>;
98948b331198d8 Dong Aisheng    2023-10-23  320  			clock-names = "per", "ipg";
98948b331198d8 Dong Aisheng    2023-10-23  321  			assigned-clocks = <&clk IMX_SC_R_LVDS_1_I2C_0 IMX_SC_PM_CLK_PER>;
98948b331198d8 Dong Aisheng    2023-10-23  322  			assigned-clock-rates = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23  323  			power-domains = <&pd IMX_SC_R_LVDS_1_I2C_0>;
98948b331198d8 Dong Aisheng    2023-10-23  324  			status = "disabled";
98948b331198d8 Dong Aisheng    2023-10-23  325  		};
98948b331198d8 Dong Aisheng    2023-10-23  326  
98948b331198d8 Dong Aisheng    2023-10-23  327  		i2c1_lvds1: i2c@57247000 {
98948b331198d8 Dong Aisheng    2023-10-23  328  			compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
98948b331198d8 Dong Aisheng    2023-10-23  329  			reg = <0x57247000 0x1000>;
98948b331198d8 Dong Aisheng    2023-10-23  330  			interrupts = <9>;
98948b331198d8 Dong Aisheng    2023-10-23  331  			interrupt-parent = <&irqsteer_lvds1>;
98948b331198d8 Dong Aisheng    2023-10-23  332  			clocks = <&lvds1_i2c0_lpcg 0>,
98948b331198d8 Dong Aisheng    2023-10-23  333  				 <&lvds1_i2c0_lpcg 1>;
98948b331198d8 Dong Aisheng    2023-10-23  334  			clock-names = "per", "ipg";
98948b331198d8 Dong Aisheng    2023-10-23  335  			assigned-clocks = <&clk IMX_SC_R_LVDS_1_I2C_0 IMX_SC_PM_CLK_PER>;
98948b331198d8 Dong Aisheng    2023-10-23  336  			assigned-clock-rates = <24000000>;
98948b331198d8 Dong Aisheng    2023-10-23  337  			power-domains = <&pd IMX_SC_R_LVDS_1_I2C_0>;
98948b331198d8 Dong Aisheng    2023-10-23  338  			status = "disabled";
98948b331198d8 Dong Aisheng    2023-10-23  339  		};
98948b331198d8 Dong Aisheng    2023-10-23  340  	};
98948b331198d8 Dong Aisheng    2023-10-23  341  
2d4c0fc8fd40c9 Dong Aisheng    2023-09-11  342  	ldb2: ldb2-display-controller {
340f47878cbbf0 Liu Ying        2019-08-07  343  		#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  344  		#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  345  		compatible = "fsl,imx8qm-ldb";
340f47878cbbf0 Liu Ying        2019-08-07  346  		clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>,
340f47878cbbf0 Liu Ying        2019-08-07  347  			 <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
340f47878cbbf0 Liu Ying        2019-08-07  348  		clock-names = "pixel", "bypass";
dcc24206fd8501 Oliver F. Brown 2022-09-16  349  		assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>;
dcc24206fd8501 Oliver F. Brown 2022-09-16  350  		assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
340f47878cbbf0 Liu Ying        2019-08-07  351  		power-domains = <&pd IMX_SC_R_LVDS_1>;
340f47878cbbf0 Liu Ying        2019-08-07  352  		gpr = <&lvds1_region>;
340f47878cbbf0 Liu Ying        2019-08-07  353  		status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  354  
340f47878cbbf0 Liu Ying        2019-08-07  355  		lvds-channel@0 {
340f47878cbbf0 Liu Ying        2019-08-07  356  			#address-cells = <1>;
340f47878cbbf0 Liu Ying        2019-08-07  357  			#size-cells = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  358  			reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  359  			phys = <&ldb2_phy1>;
340f47878cbbf0 Liu Ying        2019-08-07  360  			phy-names = "ldb_phy";
340f47878cbbf0 Liu Ying        2019-08-07  361  			status = "disabled";
340f47878cbbf0 Liu Ying        2019-08-07  362  
340f47878cbbf0 Liu Ying        2019-08-07  363  			port@0 {
340f47878cbbf0 Liu Ying        2019-08-07  364  				reg = <0>;
340f47878cbbf0 Liu Ying        2019-08-07  365  
340f47878cbbf0 Liu Ying        2019-08-07  366  				ldb2_ch0: endpoint {
340f47878cbbf0 Liu Ying        2019-08-07  367  					remote-endpoint = <&dpu2_disp1_ldb2_ch0>;
340f47878cbbf0 Liu Ying        2019-08-07  368  				};
340f47878cbbf0 Liu Ying        2019-08-07  369  			};
340f47878cbbf0 Liu Ying        2019-08-07  370  		};
340f47878cbbf0 Liu Ying        2019-08-07  371  
340f47878cbbf0 Liu Ying        2019-08-07 @372  		lvds-channel@1 {

:::::: The code at line 372 was first introduced by commit
:::::: 340f47878cbbf00158d91e345e2bdd6b868d8aa6 arm64: imx8qm.dtsi: Add LVDS0/1 subsystems support

:::::: TO: Liu Ying <victor.liu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
