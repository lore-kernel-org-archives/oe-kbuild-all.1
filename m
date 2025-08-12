Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63B2E7F32
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987716; cv=none; b=Vl26qYIKoDdT1fmcmdf/gYfwT7XwjRIqR9WEI/1McE4FGnzAZ0/tzGFq4uWa8W1RDhFORG0j9kpnw+UIICWcmxfaqiP9wMA3ahq7r/X/bBfYjnEozq0n/QBMSytRpZkhInvirVQ218YAIaS6K4J8ZS6+WaEGSBhOt9faTfYfh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987716; c=relaxed/simple;
	bh=TAKDHyY/e/p0PquuQnCZukor2ml5atHO7Hv/MOkJ6XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZCf7De5Lb23IhpR4P1NIP399cIcLdZ/UWBdjcnovg/eJmiS0ug3xJBCHjQOgrOQpNGzK+bUl7c3tN+kkYjnMhqc7MpO8XtVovlx7YMgCWpw62EEeow5Sma8X2XiKiMJLP4qW/0k80Fhc+IxBL0+5Vg5kbLeaIKAK97gaadk3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq4nRtOU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq4nRtOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754987715; x=1786523715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAKDHyY/e/p0PquuQnCZukor2ml5atHO7Hv/MOkJ6XI=;
  b=gq4nRtOUbR2vVr+IPXue2KIZwdAJ4hr37od/771CVnHwEEjox/ry8f/i
   wxD3nwXpD8X9hXuT9LtsOIewFUpPGhFpJV/QVyvWcpyaxCYJszMgph70o
   EZJgTP6FJ6FjBYYO04LE6qTOSsOXMbLMaxxNUfBc7YnXtuBH+iSSMufSy
   9l0shjN1bCMhJKp9dL8T7HoxX/4nnQM478z6dlKswLjWOliEYGynQSe56
   V1O4OL4nfTl0dQXQpElDsuQhbnj6q1xIo9J5qNmOm1ERmb4SvxBIsNoin
   RNfH2ctt4AdsgBCghcAq75F08qFASQKKEIgOYMEf7w4GVKhswU8JnnUsW
   g==;
X-CSE-ConnectionGUID: 0BJxt8ZcTVm1u0A59FX/yg==
X-CSE-MsgGUID: PJA5CX+oRCSe4h0lhMQmlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57209205"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57209205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:35:15 -0700
X-CSE-ConnectionGUID: kmNOqhhIQo+YiWZMhRpHKg==
X-CSE-MsgGUID: UBr+co/5S9a3eBDx9BHpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166428226"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 12 Aug 2025 01:35:13 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulkTP-0003Gl-13;
	Tue, 12 Aug 2025 08:35:11 +0000
Date: Tue, 12 Aug 2025 10:34:48 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755]
 drivers/regulator/qcom-rpmh-regulator.c:33: warning: Enum value 'VRM' not
 described in enum 'rpmh_regulator_type'
Message-ID: <202508121032.93R4tKQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 46fc033eba42f5a4fb583b2ab53f0a9918468452 [1755/1755] regulator: add QCOM RPMh regulator driver
config: x86_64-buildonly-randconfig-2002-20250811 (https://download.01.org/0day-ci/archive/20250812/202508121032.93R4tKQv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121032.93R4tKQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121032.93R4tKQv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/qcom-rpmh-regulator.c:33: warning: Enum value 'VRM' not described in enum 'rpmh_regulator_type'
>> drivers/regulator/qcom-rpmh-regulator.c:33: warning: Enum value 'XOB' not described in enum 'rpmh_regulator_type'
>> drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'vreg' not described in 'rpmh_regulator_init_vreg'
>> drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'dev' not described in 'rpmh_regulator_init_vreg'
>> drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'node' not described in 'rpmh_regulator_init_vreg'
>> drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'pmic_id' not described in 'rpmh_regulator_init_vreg'
>> drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'pmic_rpmh_data' not described in 'rpmh_regulator_init_vreg'


vim +33 drivers/regulator/qcom-rpmh-regulator.c

    22	
    23	/**
    24	 * enum rpmh_regulator_type - supported RPMh accelerator types
    25	 * %VRM:	RPMh VRM accelerator which supports voting on enable, voltage,
    26	 *		and mode of LDO, SMPS, and BOB type PMIC regulators.
    27	 * %XOB:	RPMh XOB accelerator which supports voting on the enable state
    28	 *		of PMIC regulators.
    29	 */
    30	enum rpmh_regulator_type {
    31		VRM,
    32		XOB,
  > 33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
