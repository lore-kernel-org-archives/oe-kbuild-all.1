Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38EE37E5F1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 23:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143656; cv=none; b=AG55AhCRB7JMnaCJwpqlPEOJ3KvaRPwbGi0ZIGEwe7O3CayAWxkZGpW/gylLe/Yh0szSMjCOS8ahMtx6vQS/7p91Cx2qwH7OjOh+V+cyTsPCdBaTAhQBSkvWVcVDSbrXzVs9Pm9l/JywRCAsIcrLld6pZkle+6nmxv1SqNoJqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143656; c=relaxed/simple;
	bh=1vm/0xY6d41Ju4TEvG5bB1N/k+A/H3xENeGnwrv+5cE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KIIruxYCfO2IALgUTKa4gGzVfh3VlltEAk+G4ZDKjhbFKDjPEOE1unn95I/p2zPurzblKAPwHS9HOoH1tENYRO4NjXWo6AcWhEmz5If961ljpir51kbrLx2+gfXDh/2qLMUolRPoPug7PuQK3iKXBlf02AnrHVGByBCQfHVT3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRqcCkri; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRqcCkri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786143655; x=1817679655;
  h=date:from:to:cc:subject:message-id;
  bh=1vm/0xY6d41Ju4TEvG5bB1N/k+A/H3xENeGnwrv+5cE=;
  b=ZRqcCkribkrYFtK8fxCFcO6fHCY0Xt5Ba7vLciMMjYJnk3soigH8fbWV
   eYc1MYv918qcr1pOkNrFUBPB2e6zy3jjYXlM2WkrTKB9mHDqK88inBeCK
   kxZEKE84xlBEUBCyKcyoEAL9K8ugcMs9fgTm7qY7Vjr2ML+PZZS2Z6ML6
   FUKmezkdLGjM46lKmv7+bT5B2plKn3IR0izs8BewdIZC2yGK8aKvHfT06
   1wwuHXhnnuf2MTe45m4GkvgwRvwj2fi4GI78FA868nemisj7hn1dkP1r5
   g/47GILVUHALVTtSh96XTOizaSXm8mw40epCsGqbT9Awe+Tjv3TSDdJlw
   w==;
X-CSE-ConnectionGUID: ug+Emf7YQx+9sxH7ocqNoA==
X-CSE-MsgGUID: 5KCGKU09Snq2TY/rZcCVAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90438261"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90438261"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 16:00:55 -0700
X-CSE-ConnectionGUID: u1cHLhDqTFqUc6SDRxWYMw==
X-CSE-MsgGUID: W/sAFBz7SyOjHimQpN3Okg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="267676538"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2026 16:00:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsTYX-00000000JRq-3AHR;
	Fri, 07 Aug 2026 23:00:49 +0000
Date: Sat, 08 Aug 2026 07:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan B. Lima" <bblima@usp.br>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Gustavo S. Correa" <gustavoscorrea@usp.br>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [thermal:thermal/linux-next 2/26]
 drivers/thermal/armada_thermal.c:137:9: error: implicit declaration of
 function 'FIELD_MODIFY'
Message-ID: <202608080649.pJYD31yg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   55c16e15ff9f91bc994a20124b83faf27f0e3690
commit: cbe31d5ce49873a2a5a3ca5decb4935672396e77 [2/26] thermal/drivers/armada: Use bitfield and bitmask macros
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260808/202608080649.pJYD31yg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080649.pJYD31yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080649.pJYD31yg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/armada_thermal.c: In function 'armadaxp_init':
>> drivers/thermal/armada_thermal.c:137:9: error: implicit declaration of function 'FIELD_MODIFY' [-Wimplicit-function-declaration]
     137 |         FIELD_MODIFY(PMU_TDC0_OTF_CAL_MASK, &reg, 1);
         |         ^~~~~~~~~~~~
   drivers/thermal/armada_thermal.c: In function 'armada_ap80x_init':
>> drivers/thermal/armada_thermal.c:43:41: error: implicit declaration of function 'FIELD_MAX' [-Wimplicit-function-declaration]
      43 | #define CONTROL0_TSEN_OSR_MAX           FIELD_MAX(CONTROL0_TSEN_OSR_MASK)
         |                                         ^~~~~~~~~
   drivers/thermal/armada_thermal.c:236:52: note: in expansion of macro 'CONTROL0_TSEN_OSR_MAX'
     236 |         FIELD_MODIFY(CONTROL0_TSEN_OSR_MASK, &reg, CONTROL0_TSEN_OSR_MAX);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_MODIFY +137 drivers/thermal/armada_thermal.c

    36	
    37	#define CONTROL0_TSEN_START		BIT(0)
    38	#define CONTROL0_TSEN_RESET		BIT(1)
    39	#define CONTROL0_TSEN_ENABLE		BIT(2)
    40	#define CONTROL0_TSEN_AVG_BYPASS	BIT(6)
    41	#define CONTROL0_TSEN_CHAN_MASK		GENMASK(16, 13)
    42	#define CONTROL0_TSEN_OSR_MASK		GENMASK(25, 24)
  > 43	#define CONTROL0_TSEN_OSR_MAX		FIELD_MAX(CONTROL0_TSEN_OSR_MASK)
    44	#define CONTROL0_TSEN_MODE_MASK		GENMASK(31, 30)
    45	#define CONTROL0_TSEN_MODE_EXTERNAL	0x2
    46	
    47	#define CONTROL1_TSEN_AVG_MASK		GENMASK(2, 0)
    48	#define CONTROL1_EXT_TSEN_SW_RESET	BIT(7)
    49	#define CONTROL1_EXT_TSEN_HW_RESETn	BIT(8)
    50	#define CONTROL1_TSEN_INT_EN		BIT(25)
    51	#define CONTROL1_TSEN_SELECT_MASK	GENMASK(22, 21)
    52	
    53	#define STATUS_POLL_PERIOD_US		1000
    54	#define STATUS_POLL_TIMEOUT_US		100000
    55	#define OVERHEAT_INT_POLL_DELAY_MS	1000
    56	
    57	struct armada_thermal_data;
    58	
    59	/* Marvell EBU Thermal Sensor Dev Structure */
    60	struct armada_thermal_priv {
    61		struct device *dev;
    62		struct regmap *syscon;
    63		char zone_name[THERMAL_NAME_LENGTH];
    64		/* serialize temperature reads/updates */
    65		struct mutex update_lock;
    66		struct armada_thermal_data *data;
    67		struct thermal_zone_device *overheat_sensor;
    68		int interrupt_source;
    69		int current_channel;
    70		long current_threshold;
    71		long current_hysteresis;
    72	};
    73	
    74	struct armada_thermal_data {
    75		/* Initialize the thermal IC */
    76		void (*init)(struct platform_device *pdev,
    77			     struct armada_thermal_priv *priv);
    78	
    79		/* Formula coeficients: temp = (b - m * reg) / div */
    80		s64 coef_b;
    81		s64 coef_m;
    82		u32 coef_div;
    83		bool inverted;
    84		bool signed_sample;
    85	
    86		/* Register shift and mask to access the sensor temperature */
    87		unsigned int temp_shift;
    88		unsigned int temp_mask;
    89		unsigned int thresh_shift;
    90		unsigned int hyst_shift;
    91		unsigned int hyst_mask;
    92		u32 is_valid_bit;
    93	
    94		/* Syscon access */
    95		unsigned int syscon_control0_off;
    96		unsigned int syscon_control1_off;
    97		unsigned int syscon_status_off;
    98		unsigned int dfx_irq_cause_off;
    99		unsigned int dfx_irq_mask_off;
   100		unsigned int dfx_overheat_irq;
   101		unsigned int dfx_server_irq_mask_off;
   102		unsigned int dfx_server_irq_en;
   103	
   104		/* One sensor is in the thermal IC, the others are in the CPUs if any */
   105		unsigned int cpu_nr;
   106	};
   107	
   108	struct armada_drvdata {
   109		enum drvtype {
   110			LEGACY,
   111			SYSCON
   112		} type;
   113		union {
   114			struct armada_thermal_priv *priv;
   115			struct thermal_zone_device *tz;
   116		} data;
   117	};
   118	
   119	/*
   120	 * struct armada_thermal_sensor - hold the information of one thermal sensor
   121	 * @thermal: pointer to the local private structure
   122	 * @tzd: pointer to the thermal zone device
   123	 * @id: identifier of the thermal sensor
   124	 */
   125	struct armada_thermal_sensor {
   126		struct armada_thermal_priv *priv;
   127		int id;
   128	};
   129	
   130	static void armadaxp_init(struct platform_device *pdev,
   131				  struct armada_thermal_priv *priv)
   132	{
   133		struct armada_thermal_data *data = priv->data;
   134		u32 reg;
   135	
   136		regmap_read(priv->syscon, data->syscon_control1_off, &reg);
 > 137		FIELD_MODIFY(PMU_TDC0_OTF_CAL_MASK, &reg, 1);
   138	
   139		/* Reference calibration value */
   140		FIELD_MODIFY(PMU_TDC0_REF_CAL_CNT_MASK, &reg, 0xf1);
   141	
   142		/* Reset the sensor */
   143		FIELD_MODIFY(PMU_TDC0_SW_RST_MASK, &reg, 1);
   144		regmap_write(priv->syscon, data->syscon_control1_off, reg);
   145	
   146		FIELD_MODIFY(PMU_TDC0_SW_RST_MASK, &reg, 0);
   147		regmap_write(priv->syscon, data->syscon_control1_off, reg);
   148	
   149		/* Enable the sensor */
   150		regmap_read(priv->syscon, data->syscon_status_off, &reg);
   151		FIELD_MODIFY(PMU_TM_DISABLE_MASK, &reg, 0);
   152		regmap_write(priv->syscon, data->syscon_status_off, reg);
   153	}
   154	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
