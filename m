Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774501487F8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 21:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712611511; cv=none; b=rewfKO1DIM4uesxtJ7/aKQg7cHmLql8B9+fU3p2GDSVmWp8qPYHbV1WBu4tMj81rWU6spKyzujeM6XmcnKLqbDalt0iTobnFNUHQ1d9IrwYua7VtRFAxkLwOLAPiSmqJaWDgqjK0ogTFP6SRcMuhL6nmGDsUuSat+IO6Ky+3ms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712611511; c=relaxed/simple;
	bh=OtkJqsDRqHxww8gYyHxYwH7UByWcNGjo62aiyrPX3lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy8LA6tmg2o0N1XK0tQjzwbAaiALV+5jr9Km71laBkU/2msuHSFF6rnCKN7bpSf3u5Z+0ffNy4+oUoyLtS4DkQ33QqK7ruq+2TwnUkPv+yB187D5r26yFDv4yHRkFR8TdUCkyF3ue/FUM2oeIBhmVZHCzJAEHd+NIdbLgnMxs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P33d/ZFV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P33d/ZFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712611510; x=1744147510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OtkJqsDRqHxww8gYyHxYwH7UByWcNGjo62aiyrPX3lc=;
  b=P33d/ZFVR/9YdbJR/IHM/azbE/oGZhbSS03VdSg6fFJh1ZK0edi5v2uk
   b6H6kE3/lJrGY146f/ly9xtI1XYdjs7/MhUANrNy+frUc7MIAgk2kz9zm
   TH/Cc336YOG7FYcbjyITfPV06xpgPjShF306kPrI5KQd83xJd4gNtscAv
   oZF1zzIn7Ywa9klGFV0/i62LR5VbfKH1v5OivUKMgoY2qLQtcv4EmBMJ1
   fiDo8IUo4TbXxvixncDa2sz2/R4tPyDDUEEzsso3Vq013NhdtZ4k9hA09
   HDrMn0GzrqeL738yI/ryCpIuN5K0GSOHy283DY08qi7qPsMp1Cm+/Abs1
   A==;
X-CSE-ConnectionGUID: oIbkNCHZSYWZsOVLsppryg==
X-CSE-MsgGUID: OiRUQGyoTMesbgVuFf761g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25354698"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25354698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 14:25:10 -0700
X-CSE-ConnectionGUID: qrO58ha8RyqJHmBfNrQIag==
X-CSE-MsgGUID: cWAhHusrSreh0wQEs4Hnjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19879521"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 14:25:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtwU9-0005VC-2i;
	Mon, 08 Apr 2024 21:25:01 +0000
Date: Tue, 9 Apr 2024 05:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	oxffffaa@gmail.com, kernel@sberdevices.ru,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <202404090420.FyEkmAU9-lkp@intel.com>
References: <20240408085931.456337-2-avkrasnov@salutedevices.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408085931.456337-2-avkrasnov@salutedevices.com>

Hi Arseniy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes mtd/nand/next robh/for-next linus/master v6.9-rc3 next-20240408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Krasnov/dt-bindings-mtd-amlogic-meson-nand-support-fields-for-boot-ROM-code/20240408-171119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20240408085931.456337-2-avkrasnov%40salutedevices.com
patch subject: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090420.FyEkmAU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090420.FyEkmAU9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml:84:61: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml:85:61: [warning] too few spaces after comma (commas)

vim +84 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

     8	
     9	allOf:
    10	  - $ref: nand-controller.yaml
    11	
    12	maintainers:
    13	  - liang.yang@amlogic.com
    14	
    15	properties:
    16	  compatible:
    17	    enum:
    18	      - amlogic,meson-gxl-nfc
    19	      - amlogic,meson-axg-nfc
    20	
    21	  reg:
    22	    maxItems: 2
    23	
    24	  reg-names:
    25	    items:
    26	      - const: nfc
    27	      - const: emmc
    28	
    29	  interrupts:
    30	    maxItems: 1
    31	
    32	  clocks:
    33	    minItems: 2
    34	
    35	  clock-names:
    36	    items:
    37	      - const: core
    38	      - const: device
    39	
    40	patternProperties:
    41	  "^nand@[0-7]$":
    42	    type: object
    43	    $ref: raw-nand-chip.yaml
    44	    properties:
    45	      reg:
    46	        minimum: 0
    47	        maximum: 1
    48	
    49	      nand-ecc-mode:
    50	        const: hw
    51	
    52	      nand-ecc-step-size:
    53	        enum: [512, 1024]
    54	
    55	      nand-ecc-strength:
    56	        enum: [8, 16, 24, 30, 40, 50, 60]
    57	        description: |
    58	          The ECC configurations that can be supported are as follows.
    59	            meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
    60	            meson-axg-nfc 8
    61	
    62	      nand-rb:
    63	        maxItems: 1
    64	        items:
    65	          maximum: 0
    66	
    67	      amlogic,boot-page-last:
    68	        $ref: /schemas/types.yaml#/definitions/uint32
    69	        description:
    70	          The NFC driver needs this information to select ECC
    71	          algorithms supported by the boot ROM.
    72	
    73	      amlogic,boot-page-step:
    74	        $ref: /schemas/types.yaml#/definitions/uint32
    75	        description:
    76	          The NFC driver needs this information to select ECC
    77	          algorithms supported by the boot ROM (in pages).
    78	
    79	    unevaluatedProperties: false
    80	
    81	    dependencies:
    82	      nand-ecc-strength: [nand-ecc-step-size]
    83	      nand-ecc-step-size: [nand-ecc-strength]
  > 84	      amlogic,boot-page-last: [nand-is-boot-medium, amlogic,boot-page-step]
    85	      amlogic,boot-page-step: [nand-is-boot-medium, amlogic,boot-page-last]
    86	
    87	
    88	required:
    89	  - compatible
    90	  - reg
    91	  - interrupts
    92	  - clocks
    93	  - clock-names
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
