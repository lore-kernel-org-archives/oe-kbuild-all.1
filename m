Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BB2F4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 19:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695843345; x=1727379345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6L5lq3H/pApb/yyhkxihABm+pLW6DPCWReMpmbFe8yU=;
  b=FdpHgpCTMDswNOW1iKaX1AO0BnmCPmZgE8bYJ1sa61eYxdKOlouhT7lO
   BxVHIUIr0U94bXOlOTO2x9NMQOLlkQlsotjBpVoykN+d8fZs1QW8wEzRq
   9G87PVJLvbAIqyQ5JIHT0fEgehdXqlvAw71pmrbs7XMWznYmNazGLpVfr
   a4nDos8QWaaRu7AKjH8v/U6oudhKi2F5GdrAhx0djDKFxssnGUnAu957W
   ZWDTGns4B1lZacwLAVO8P9psuWxTIue3sYIwAii7hYNAMXx/okvqBq0Nz
   jTB5pVrpptMeWX3DWpd0QLKeDhyBESGmhX+6trpoyEnNqxAoyDUe6L04Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381817489"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="381817489"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 12:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819559646"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="819559646"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 12:35:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlaJd-0000a1-1y;
	Wed, 27 Sep 2023 19:35:21 +0000
Date: Thu, 28 Sep 2023 03:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 105/1370] dtbs_check:
 Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep
 learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280344.V326u5xN-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280344.V326u5xN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280344.V326u5xN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/ti,sci-clk.yaml: title: 'TI-SCI clock controller node bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/power/supply/bq25890.yaml: title: 'Binding for bq25890, bq25892, bq25895 and bq25896 Li-Ion Charger' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml: title: 'Pine64 PinePhone keyboard device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,dpu.yaml: title: 'Xilinx Deep learning Processing Unit (DPU) Vivado Flow DT Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml: title: 'STMicroelectronics STM32 Factory-programmed data bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx TMR Inject Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/input.yaml: title: 'Common input schema binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
