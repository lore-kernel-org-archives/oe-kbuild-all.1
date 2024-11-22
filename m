Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8082582
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732247623; cv=none; b=utZDIH6lReLP5Y6A3i0KrEvdugX6JJq1RmPMHLb+NCuewLVrKO09EpdZBFf3H7nwQFm95PXK4GFxmrbagwc0IGJU0GwAPlpJsJ9/unAF8en7KbA57M95msk37wC/jza/wJBngSyU5B0MFLig7w6q+OvzpQwh2A3zFH0F0ttKIqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732247623; c=relaxed/simple;
	bh=LddERMmKQ3Ekb9Z578Eujhemmb0J4PdKop3dKxcj1xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rM+DxLZH8zT8j/mLhqbmhAAlqlJ7yNNOff+iijaBehAtuZey55MTFQCOdcC6ZEwN8fMSnK276EZsDD7SvOD5fPqgDnyLPAMvPMcTzmjNf8ew5PCK+ErYOOyhT1K9rN79XMnDB5FbiFZMytIJVouLr/UpS9uwsengT6pujBCH21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cERQgwwA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cERQgwwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732247621; x=1763783621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LddERMmKQ3Ekb9Z578Eujhemmb0J4PdKop3dKxcj1xM=;
  b=cERQgwwAbNxJM384CJXzFjJ3un8nRYrlH0PibheL/04AYxcG2M+FkbJt
   TGx17oSRujX3Z1YamOYMYE/SfmxU7Et3mKhH7h6CLKQwskLnxPyRcpodG
   BfVPpDqDXQbndsduazNbbc1GEWxKY2OSuPMBcRng4VzugyGvvu17Y58Wz
   haWOHRPVhubAHB8vHj8JaHGWPAaztXe/v3s5jr0CkOod4YO7K81zphu0G
   XB6Mp8FxVrL1eZN83GOhpM4bTiKOFeBm0nopkuNHoTNZyzmLkl9SJU9qr
   Bs2HB82yMw7ngTdHSpZFr3bIK/qs3VxQEyklIJo8LfJtpv7/cwYyN6sOU
   Q==;
X-CSE-ConnectionGUID: ypzkkBLHS5m/HfqBqmVQDw==
X-CSE-MsgGUID: BljOMnaFTl2woVRul+l5zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54898074"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="54898074"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 19:53:41 -0800
X-CSE-ConnectionGUID: B1gdMbWvTJaWZp33M02bXQ==
X-CSE-MsgGUID: g6205inKSmuO5fbaK+8EnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="121324488"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2024 19:53:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEKjh-0003eB-0L;
	Fri, 22 Nov 2024 03:53:37 +0000
Date: Fri, 22 Nov 2024 11:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1304/1304]
 drivers/regulator/qcom-rpmh-regulator.c:742:34: warning:
 'rpmh_regulator_match_table' defined but not used
Message-ID: <202411221130.VOHt3QyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 46fc033eba42f5a4fb583b2ab53f0a9918468452 [1304/1304] regulator: add QCOM RPMh regulator driver
config: x86_64-buildonly-randconfig-004-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221130.VOHt3QyY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221130.VOHt3QyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221130.VOHt3QyY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/qcom-rpmh-regulator.c:742:34: warning: 'rpmh_regulator_match_table' defined but not used [-Wunused-const-variable=]
     742 | static const struct of_device_id rpmh_regulator_match_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom-rpmh-regulator.c:33: warning: Enum value 'VRM' not described in enum 'rpmh_regulator_type'
   drivers/regulator/qcom-rpmh-regulator.c:33: warning: Enum value 'XOB' not described in enum 'rpmh_regulator_type'
   drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'vreg' not described in 'rpmh_regulator_init_vreg'
   drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'dev' not described in 'rpmh_regulator_init_vreg'
   drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'node' not described in 'rpmh_regulator_init_vreg'
   drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'pmic_id' not described in 'rpmh_regulator_init_vreg'
   drivers/regulator/qcom-rpmh-regulator.c:402: warning: Function parameter or member 'pmic_rpmh_data' not described in 'rpmh_regulator_init_vreg'


vim +/rpmh_regulator_match_table +742 drivers/regulator/qcom-rpmh-regulator.c

   741	
 > 742	static const struct of_device_id rpmh_regulator_match_table[] = {
   743		{
   744			.compatible = "qcom,pm8998-rpmh-regulators",
   745			.data = pm8998_vreg_data,
   746		},
   747		{
   748			.compatible = "qcom,pmi8998-rpmh-regulators",
   749			.data = pmi8998_vreg_data,
   750		},
   751		{
   752			.compatible = "qcom,pm8005-rpmh-regulators",
   753			.data = pm8005_vreg_data,
   754		},
   755		{}
   756	};
   757	MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
   758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
