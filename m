Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CBD1A59C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695839524; x=1727375524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=conTJgek5nBF5CD4UZGeQ9oACYYpI++wzivsjH9ymws=;
  b=ZB84ft0h8IbI4MSu2Pv6QGIRVHvi/dHfeVPZUJpwrqjyzf6L8zw8gT7d
   ZtCiEr02HtVIHMUrBKBQzI8G0zd8BpkA05Q3RtVoJvg5aEI1zhQBXrh7T
   uPlh/yRA3/weBOu1HwcbtKSIaPEuaBAp/B1CoqsbIQlppqxz/oXn+kB5k
   xQDrDousZA72kGvUfGEEn5M4mquIExgYan/f8cTH1InNeWkVCqBYOUSV+
   yrqAqEnedzfzQ0YsboE2b/ZSCOf4rQvTmHXdfLtkXYthjL4V6+zO0z7UH
   cNBLiDGUI6icnfwQXfc3FdLaIqwwXvv+0fAyZ9EOJM12CR+wBlyz1tlgD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448390884"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448390884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 11:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="922899271"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="922899271"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Sep 2023 11:31:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlZJw-0000XP-0W;
	Wed, 27 Sep 2023 18:31:36 +0000
Date: Thu, 28 Sep 2023 02:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 103/1370] dtbs_check:
 Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx
 TMR Inject Device Tree Bindings' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280256.wqmZekTm-lkp@intel.com>
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
commit: bf683d87efbed83c55992ae43e8b0e57b72e2611 [103/1370] dt-bindings: misc: tmr-inject: Add device-tree binding for TMR Inject
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280256.wqmZekTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280256.wqmZekTm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml: title: 'Cypress CY8CTMA140 series touchscreen controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml: title: 'Freescale SAI bitclock-as-a-clock binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/opp/opp-v2.yaml: title: 'Generic OPP (Operating Performance Points) Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx TMR Inject Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml: title: 'STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
--
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml: title: 'Qualcomm OPP bindings to describe OPP nodes.' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/arm,hdlcd.yaml: title: 'Arm HDLCD display controller binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding Common Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,tmr-manager.yaml: title: 'Xilinx TMR Microblaze Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/usb/realtek,rts5411.yaml: title: 'Binding for the Realtek RTS5411 USB 3.0 hub controller' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml: title: 'Arrow SpeedChips XRS7000 Series Switch Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml: title: 'STMicroelectronics STM32 remote processor controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
