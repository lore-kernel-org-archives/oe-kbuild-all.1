Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA9381B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeJwvBL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697488652; x=1729024652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HW12jXAtjBJoAOz878qx2DLGh/6f73mUA94ba0KTpKw=;
  b=NeJwvBL1NmZIMRIQUeACDZTwfdBpUVTbTQYVil4PTYlZFVuV+yCt03Mf
   R03Hsjy4qb4FSWmceesu2eY2PkjJSDQpMEYscsS0VrVBUBFdeSrhZz9kf
   Q6CH78Fq5gQXbp5vM8MJhBnNkAJWTY47ksDpWKhXua4Q6/kEBWIZe2H15
   fnq4CvAIQq/jkc8v9L086UjDvf8a2K4sS+LPdQOTWMRyJgS3c61AqQPAj
   luK08ECH5MNyHtjqzOQp/fxKkkFeMO9TOOzOg8btYzMAtBlGlW5/h8MB2
   2t0pK01HKGu9qYtCjtF/Lbv/w+vHimYX2TnUzPStzQ6RMqj3kVj6J7bz2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388494852"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="388494852"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 13:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="759526156"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="759526156"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Oct 2023 13:37:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsULA-0008f1-1P;
	Mon, 16 Oct 2023 20:37:28 +0000
Date: Tue, 17 Oct 2023 04:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 607/15768] dtbs_check:
 Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml:64:6: [warning]
 wrong indentation: expected 4 but found 5 (indentation)
Message-ID: <202310170431.jJl4uDs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 03a07c82a9d63a753359a7f32cd2146c0d632e61 [607/15768] MLK-25558-02 dt-bindings: clock: imx8ulp-clock: Add the #reset-cells property
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170431.jJl4uDs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170431.jJl4uDs2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml:64:6: [warning] wrong indentation: expected 4 but found 5 (indentation)

vim +64 Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml

     8	
     9	maintainers:
    10	  - Jacky Bai <ping.bai@nxp.com>
    11	
    12	description: |
    13	  On i.MX8ULP, The clock sources generation, distribution and management is
    14	  under the control of several CGCs & PCCs modules. The CGC modules generate
    15	  and distribute clocks on the device. PCC modules control clock selection,
    16	  optional division and clock gating mode for peripherals
    17	
    18	properties:
    19	  compatible:
    20	    enum:
    21	      - fsl,imx8ulp-cgc1
    22	      - fsl,imx8ulp-cgc2
    23	      - fsl,imx8ulp-pcc3
    24	      - fsl,imx8ulp-pcc4
    25	      - fsl,imx8ulp-pcc5
    26	
    27	  reg:
    28	    maxItems: 1
    29	
    30	  clocks:
    31	    description:
    32	      specify the external clocks used by the CGC module, the clocks
    33	      are rosc, sosc, frosc, lposc
    34	    maxItems: 4
    35	
    36	  clock-names:
    37	    description:
    38	      specify the external clocks names used by the CGC module. the valid
    39	      clock names should rosc, sosc, frosc, lposc.
    40	    maxItems: 4
    41	
    42	  '#clock-cells':
    43	    const: 1
    44	    description:
    45	      The clock consumer should specify the desired clock by having the clock
    46	      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8ulp-clock.h
    47	      for the full list of i.MX8ULP clock IDs.
    48	
    49	  '#reset-cells':
    50	    const: 1
    51	    description:
    52	      The reset consumer should specify the desired clock by having the reset
    53	      ID in its "resets" phandle cell. See include/dt-bindings/reset/imx8ulp-pcc-reset.h
    54	      for the full list of i.MX8ULP reset IDs. Only PCC3, PCC4 and PCC5 should specify
    55	      this property.
    56	
    57	required:
    58	  - compatible
    59	  - reg
    60	  - '#clock-cells'
    61	
    62	if:
    63	  properties:
  > 64	     compatible:
    65	       contains:
    66	         enum:
    67	           - fsl,imx8ulp-pcc3
    68	           - fsl,imx8ulp-pcc4
    69	           - fsl,imx8ulp-pcc5
    70	then:
    71	  required:
    72	    - '#reset-cells'
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
