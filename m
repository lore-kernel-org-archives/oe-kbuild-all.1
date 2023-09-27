Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724130FA0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 20:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695847777; x=1727383777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8ypVAYzotEw1gNhx4vkGpFW2qkXxbVAxXaz9C4dNYo=;
  b=U0P+sdBapB2OBZe1Pq6pZeAJ+rIZ7lIazpTKsnoHCEoasomG6iApLuIs
   Up8s7XB5Kxl6UnG539wrsbRm2DU4vMIv3mnC5fU4CJM8QTJ8cDeMSHHsj
   oJwFpJUwWdtzrhgZX/9W3cC4AvzL24/bxZ+6Ef3FIvbemzUzH4U9fjADc
   tDTyO19V2oQY+QhjKLm5VXd7GHXKSSJPscmooRQksI+BE3Nt18nPsw5TK
   xU91nStqVT4vI+9PDNb3g3FHR+ACOmkHpwl/31J7JrdegMhW8xtqSteky
   iIbrgK30UNJgDhTdnNwoSj61e+GyQ1HUjaW5jzdkDxzHXBVTyL9AJY5/z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384720409"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="384720409"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873045291"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="873045291"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 13:49:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlbTN-0000fH-2s;
	Wed, 27 Sep 2023 20:49:29 +0000
Date: Thu, 28 Sep 2023 04:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Helms <alexander.helms.jy@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 159/1370] dtbs_check:
 Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas
 ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280410.3aZD5DhK-lkp@intel.com>
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
commit: 0b10acac98371cb08db5fdec1490f5a603f80e68 [159/1370] dt-bindings: clock: Add bindings for Renesas ProXO
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280410.3aZD5DhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280410.3aZD5DhK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/ene-kb3930.yaml: title: 'ENE KB3930 Embedded Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for SM8450' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/sprd,sc2720-adc.yaml: title: 'Spreadtrum SC27XX series PMICs ADC binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,videocc.yaml: title: 'Qualcomm Video Clock & Reset Controller Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml: title: 'Marvell Armada 7K/8K Platforms Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/xlnx,versal-sysmon.yaml: properties:xlnx,nodeid:maxItems: False schema does not allow 1
   hint: Scalar properties should not have array keywords

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
