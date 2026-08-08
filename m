Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF541BA7F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786201159; cv=none; b=HWbmYS7ryHZg70zUGnGS9CZnf8sqwdNaKwnOaOWzhicKLvYvKYujA4LF9xjH/eVC0hVWhFftt1reqMdDxpzKzBZ/nEpT4PRwjZjIYFT+NdX0ao6T9G1RcM0pe1oa9nXkbr/eqwtCCtnvjdljsAOSufOdm+e7i3C19D78VLm/25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786201159; c=relaxed/simple;
	bh=mHWcIi+UZixNazYpOyO81DPEuZ10MTpnm5migqIG2w0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W9698LG//+otuxl+RVPkQb/aKvlBFlsi9nfRGUiev/HsGf1TQLFVmkVEUqRA+i7OjSe0zbmuQ6BypInCJnyjB5b6TosihSMDm56uetMYjRNxFSy3T5hmElkFUBPP+MpPjzyYsGOaYwvsF3ibHLUDelkEBV0cGJM2h5Pd2wD1MTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE3DX59w; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE3DX59w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786201155; x=1817737155;
  h=date:from:to:cc:subject:message-id;
  bh=mHWcIi+UZixNazYpOyO81DPEuZ10MTpnm5migqIG2w0=;
  b=ZE3DX59wa2uYftgDUJrPjeBWeYIM9xa+oIpSi2iahVoeVBjmfXHM2zUO
   SGdzvhRixwzBZqfJpnCI1vyJm/NsAlnk8Q4qfL4H7QWQPTtBFC9W0ZNst
   NQaN+t17Mrk17mXYauI4V4HomP17j7RRcvieabgoyPVK2YrX8pdTjsdiA
   pwQk9R0qh3h/HSwjaUvb/IiM8ozjoxdcB8iOwQleuK6WpgrjGc2SRqds9
   xc+iuDXiggUsLbmZIQcJZfROIXAmn2X2ulLPyS2c06QMQ/C4MU/ChHixz
   3fgysOL7OvdACDVkQGIdmFR0QyJrxUdDt3ohilkIxn3/OMda/2XxTequz
   Q==;
X-CSE-ConnectionGUID: acQuFI00RPmRAQI0rIPvEA==
X-CSE-MsgGUID: sdEsW28gSpmyFt51w8y/2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86545057"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86545057"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 07:59:12 -0700
X-CSE-ConnectionGUID: MiwBw9JKR9in8CD+iMzWHw==
X-CSE-MsgGUID: nzshkfZKRV+4fiLNMpFbWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="258344894"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Aug 2026 07:59:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsiVv-00000000KKn-3tmG;
	Sat, 08 Aug 2026 14:59:07 +0000
Date: Sat, 08 Aug 2026 22:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan B. Lima" <bblima@usp.br>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Gustavo S. Correa" <gustavoscorrea@usp.br>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [thermal:thermal/linux-next 2/26]
 drivers/thermal/armada_thermal.c:137:2: error: call to undeclared function
 'FIELD_MODIFY'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608082242.drjXuzsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   55c16e15ff9f91bc994a20124b83faf27f0e3690
commit: cbe31d5ce49873a2a5a3ca5decb4935672396e77 [2/26] thermal/drivers/armada: Use bitfield and bitmask macros
config: hexagon-randconfig-r071-20260808 (https://download.01.org/0day-ci/archive/20260808/202608082242.drjXuzsN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608082242.drjXuzsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608082242.drjXuzsN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/armada_thermal.c:137:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |         FIELD_MODIFY(PMU_TDC0_OTF_CAL_MASK, &reg, 1);
         |         ^
   drivers/thermal/armada_thermal.c:162:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |         FIELD_MODIFY(PMU_TDC0_OTF_CAL_MASK, &reg, 1);
         |         ^
   drivers/thermal/armada_thermal.c:182:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |         FIELD_MODIFY(A375_UNIT_CONTROL_MASK, &reg, 0);
         |         ^
   drivers/thermal/armada_thermal.c:214:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     214 |         FIELD_MODIFY(CONTROL1_EXT_TSEN_HW_RESETn, &reg, 1);
         |         ^
   drivers/thermal/armada_thermal.c:231:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |         FIELD_MODIFY(CONTROL0_TSEN_RESET, &reg, 0);
         |         ^
>> drivers/thermal/armada_thermal.c:236:45: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |         FIELD_MODIFY(CONTROL0_TSEN_OSR_MASK, &reg, CONTROL0_TSEN_OSR_MAX);
         |                                                    ^
   drivers/thermal/armada_thermal.c:43:32: note: expanded from macro 'CONTROL0_TSEN_OSR_MAX'
      43 | #define CONTROL0_TSEN_OSR_MAX           FIELD_MAX(CONTROL0_TSEN_OSR_MASK)
         |                                         ^
   drivers/thermal/armada_thermal.c:254:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     254 |         FIELD_MODIFY(CONTROL0_TSEN_OSR_MASK, &reg, CONTROL0_TSEN_OSR_MAX);
         |         ^
   drivers/thermal/armada_thermal.c:254:45: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     254 |         FIELD_MODIFY(CONTROL0_TSEN_OSR_MASK, &reg, CONTROL0_TSEN_OSR_MAX);
         |                                                    ^
   drivers/thermal/armada_thermal.c:43:32: note: expanded from macro 'CONTROL0_TSEN_OSR_MAX'
      43 | #define CONTROL0_TSEN_OSR_MAX           FIELD_MAX(CONTROL0_TSEN_OSR_MASK)
         |                                         ^
   drivers/thermal/armada_thermal.c:306:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     306 |         FIELD_MODIFY(CONTROL1_TSEN_INT_EN, &reg, 0);
         |         ^
   drivers/thermal/armada_thermal.c:324:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     324 |         FIELD_MODIFY(CONTROL0_TSEN_START, &ctrl0, 0);
         |         ^
   10 errors generated.


vim +/FIELD_MODIFY +137 drivers/thermal/armada_thermal.c

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
   155	static void armada370_init(struct platform_device *pdev,
   156				   struct armada_thermal_priv *priv)
   157	{
   158		struct armada_thermal_data *data = priv->data;
   159		u32 reg;
   160	
   161		regmap_read(priv->syscon, data->syscon_control1_off, &reg);
   162		FIELD_MODIFY(PMU_TDC0_OTF_CAL_MASK, &reg, 1);
   163	
   164		/* Reference calibration value */
   165		FIELD_MODIFY(PMU_TDC0_REF_CAL_CNT_MASK, &reg, 0xf1);
   166	
   167		/* Reset the sensor */
   168		FIELD_MODIFY(PMU_TDC0_START_CAL_MASK, &reg, 0);
   169	
   170		regmap_write(priv->syscon, data->syscon_control1_off, reg);
   171	
   172		msleep(10);
   173	}
   174	
   175	static void armada375_init(struct platform_device *pdev,
   176				   struct armada_thermal_priv *priv)
   177	{
   178		struct armada_thermal_data *data = priv->data;
   179		u32 reg;
   180	
   181		regmap_read(priv->syscon, data->syscon_control1_off, &reg);
   182		FIELD_MODIFY(A375_UNIT_CONTROL_MASK, &reg, 0);
   183		FIELD_MODIFY(A375_READOUT_INVERT, &reg, 0);
   184		FIELD_MODIFY(A375_HW_RESETn, &reg, 0);
   185		regmap_write(priv->syscon, data->syscon_control1_off, reg);
   186	
   187		msleep(20);
   188	
   189		FIELD_MODIFY(A375_HW_RESETn, &reg, 1);
   190		regmap_write(priv->syscon, data->syscon_control1_off, reg);
   191	
   192		msleep(50);
   193	}
   194	
   195	static int armada_wait_sensor_validity(struct armada_thermal_priv *priv)
   196	{
   197		u32 reg;
   198	
   199		return regmap_read_poll_timeout(priv->syscon,
   200						priv->data->syscon_status_off, reg,
   201						reg & priv->data->is_valid_bit,
   202						STATUS_POLL_PERIOD_US,
   203						STATUS_POLL_TIMEOUT_US);
   204	}
   205	
   206	static void armada380_init(struct platform_device *pdev,
   207				   struct armada_thermal_priv *priv)
   208	{
   209		struct armada_thermal_data *data = priv->data;
   210		u32 reg;
   211	
   212		/* Disable the HW/SW reset */
   213		regmap_read(priv->syscon, data->syscon_control1_off, &reg);
   214		FIELD_MODIFY(CONTROL1_EXT_TSEN_HW_RESETn, &reg, 1);
   215		FIELD_MODIFY(CONTROL1_EXT_TSEN_SW_RESET, &reg, 0);
   216		regmap_write(priv->syscon, data->syscon_control1_off, reg);
   217	
   218		/* Set Tsen Tc Trim to correct default value (errata #132698) */
   219		regmap_read(priv->syscon, data->syscon_control0_off, &reg);
   220		FIELD_MODIFY(CONTROL0_TSEN_TC_TRIM_MASK, &reg, CONTROL0_TSEN_TC_TRIM_VAL);
   221		regmap_write(priv->syscon, data->syscon_control0_off, reg);
   222	}
   223	
   224	static void armada_ap80x_init(struct platform_device *pdev,
   225				      struct armada_thermal_priv *priv)
   226	{
   227		struct armada_thermal_data *data = priv->data;
   228		u32 reg;
   229	
   230		regmap_read(priv->syscon, data->syscon_control0_off, &reg);
   231		FIELD_MODIFY(CONTROL0_TSEN_RESET, &reg, 0);
   232		FIELD_MODIFY(CONTROL0_TSEN_START, &reg, 1);
   233		FIELD_MODIFY(CONTROL0_TSEN_ENABLE, &reg, 1);
   234	
   235		/* Sample every ~2ms */
 > 236		FIELD_MODIFY(CONTROL0_TSEN_OSR_MASK, &reg, CONTROL0_TSEN_OSR_MAX);
   237	
   238		/* Enable average (2 samples by default) */
   239		FIELD_MODIFY(CONTROL0_TSEN_AVG_BYPASS, &reg, 0);
   240	
   241		regmap_write(priv->syscon, data->syscon_control0_off, reg);
   242	}
   243	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
