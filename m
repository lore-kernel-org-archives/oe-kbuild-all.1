Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37AC8D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695824591; x=1727360591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUT749PpcnVmmx3qHv5UIWQPZbo6RO+koDeFGDz+ZfE=;
  b=HPfjYR5Xt8RO3d6FF/YLw78ds27Ov+KiIwjLiGuPCPMWQBZXag/SnG/R
   jEeWYfeQ+iFxp+bPDK9YQzH9YWGo4Kvim9u+sQzCtNVBv7WUCwWBcV3ts
   nuOb4NpPYPPOxIZqNBgwnyFR4ad07RfDt5z7WL5mhDpgMQLEJTy99TDsE
   SwTD0vjSVgDro8SdoH8DR+3CcgZgvT1rHbHU2PsXqx3NgX4vWdrdDtrOO
   c6qs1q+EyQHMJQtcI1+rrR5LM7APtqNjeMZOi/nLBfOeTwfFX3JXKEKyK
   C9P7Mh75KmPK/vCCiYTDAzO6HlQwTFj6FbXvySY9mWDIhfVFq8kxlpGC+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380716218"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="380716218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 07:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752613370"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="752613370"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2023 07:21:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlVPP-0000In-0r;
	Wed, 27 Sep 2023 14:20:59 +0000
Date: Wed, 27 Sep 2023 22:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 105/1370] dtbs_check:
 Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep
 learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309272257.HI1vHzGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 95fe76af74b9ae7d1ca00cada06ae5cacb732174 [105/1370] dt-bindings: misc: xlnx_dpu: Add DPUCZDX8G v3.4 documentation
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309272257.HI1vHzGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309272257.HI1vHzGM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/misc/xlnx,tmr-manager.yaml: title: 'Xilinx TMR Microblaze Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: title: 'Toshiba TC358775 DSI to LVDS bridge bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/ethernet-controller.yaml: title: 'Ethernet Controller Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml: title: 'Freescale i.MX8qm/qxp Control and Status Registers Module Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/dma-common.yaml: title: 'DMA Engine Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
