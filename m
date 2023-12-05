Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A88DDDF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwTGWqCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701757506; x=1733293506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W3BpawDFA6kDzksuoNoOR8v+DZw+lF/GY/JkBFsGruQ=;
  b=hwTGWqCy6D/PSiiTTDSHJ4Lrx6AJ+cT1A7UyoRAemPn4K84jtiBNjCiF
   3/C0v93avJl4qaLebdGGD4oUlSr85CMEaz7wVqsEe1qJ4ieIvFB9C7/Mu
   pzeGBD9DvKGJrofSrFR0FnuEUG9NKGNe+bMt6wzrYVRIBiJdaUF7l/x7p
   uy7gEwu4/5Lv4k2WOLqNdSY79yE3qhZHuDjTR4D2lVumlnWNAt5PbdJtX
   /i9//QMiF8xMaxWrIoWqpfeQUXI78CoTJXNE36tajoqJB8b7IfgM8zPhZ
   g6UQNa6TszLVvjsjRMZhqv3Az5GHqcI3UYK+LxMFrOVrqLHmdDpD4c01N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458169284"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="458169284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:25:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836868658"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="836868658"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2023 22:25:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAOrd-0008Qw-0H;
	Tue, 05 Dec 2023 06:25:01 +0000
Date: Tue, 5 Dec 2023 14:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 13/14] dt-bindings: gpu: mali-valhall-csf: Add support
 for Arm Mali CSF GPUs
Message-ID: <202312051422.34Daas7w-lkp@intel.com>
References: <20231204173313.2098733-14-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204173313.2098733-14-boris.brezillon@collabora.com>

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-panthor-Add-GPU-register-definitions/20231205-023301
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231204173313.2098733-14-boris.brezillon%40collabora.com
patch subject: [PATCH v3 13/14] dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051422.34Daas7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051422.34Daas7w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: found a tab character that violates indentation
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
--
>> Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml: ignoring, error parsing file

vim +108 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml

    97	
    98	allOf:
    99	  - if:
   100	      properties:
   101	        compatible:
   102	          contains:
   103	            const: rockchip,rk3588-mali
   104	    then:
   105	      properties:
   106	        clocks:
   107	          minItems: 3
 > 108		power-domains:
   109		  maxItems: 1
   110		power-domain-names: false
   111	
   112	examples:
   113	  - |
   114	    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
   115	    #include <dt-bindings/interrupt-controller/irq.h>
   116	    #include <dt-bindings/interrupt-controller/arm-gic.h>
   117	    #include <dt-bindings/power/rk3588-power.h>
   118	
   119	    gpu: gpu@fb000000 {
   120	        compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
   121	        reg = <0xfb000000 0x200000>;
   122	        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
   123	                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
   124	                     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
   125	        interrupt-names = "job", "mmu", "gpu";
   126	        clock-names = "core", "coregroup", "stacks";
   127	        clocks = <&cru CLK_GPU>, <&cru CLK_GPU_COREGROUP>,
   128	                 <&cru CLK_GPU_STACKS>;
   129	        power-domains = <&power RK3588_PD_GPU>;
   130	        operating-points-v2 = <&gpu_opp_table>;
   131	        mali-supply = <&vdd_gpu_s0>;
   132	        sram-supply = <&vdd_gpu_mem_s0>;
   133	    };
   134	
   135	    gpu_opp_table: opp-table {
   136	        compatible = "operating-points-v2";
   137	        opp-300000000 {
   138	            opp-hz = /bits/ 64 <300000000>;
   139	            opp-microvolt = <675000 675000 850000>;
   140	        };
   141	        opp-400000000 {
   142	            opp-hz = /bits/ 64 <400000000>;
   143	            opp-microvolt = <675000 675000 850000>;
   144	        };
   145	    };
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
