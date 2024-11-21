Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE081AA1DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 23:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732231756; cv=none; b=m1+CoIPMc8Oh6ZpLS+dfu1qrI237QADf7uCAYO7tkdCdCy/IjlQXVHgc1mZZc4Mw4g0U0NXotNDdCZw96D2Qs46Xqi/wazHEHRy6sXlL+jkJI/rn5ua9uNqCvme1sQwp/cNuUTPH0us3TXCHXcfsfkDgK3xGYH2SsqHLs6URYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732231756; c=relaxed/simple;
	bh=OAs/CE/bc3kQf34x1eE3CTvyDe9j2QR5TQTfPoR7whY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrCBju8yxJmCpQI/8whVD5eWxlbJpNTr1JlbPkBKZ4qJSJp3L5d5DeCH4d/LzHr00ZTlCVaCYiIJxpCbQf0bfkdErWzblot+gAxR5jNUNgzBKw61dXKPSRoyoCIYatmRBHs93TYng2A3lXCRxKtwRuHvngUboLoUH6WtkP4ewCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg7hCwWc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg7hCwWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732231751; x=1763767751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAs/CE/bc3kQf34x1eE3CTvyDe9j2QR5TQTfPoR7whY=;
  b=Dg7hCwWctoIGAt16DGAGiSaz0dHA/yJBT7gIk4A3weJh3DsRS2Ybchoh
   dU5VFbj08l54NXCPW7zlAbP9wXHVlqRnyI2/PhaqqDVPUcP6R9OVMN7w/
   UtIe3+ojKYoRUhPntp3hM+6DLRMvQKTqR3r047Hnul1SLIsBdELf1Ee2s
   R5CYElEX2+WJ5TdWyAibzgqC6mNqZ9V5vQj79RLAIgujzZW9kWNbHFi7K
   ifDpnsIOWzQeF673B9+t6zgrN3PaHqV0yh3yAWIK/9kVVzQ5nKOTUx4qy
   //RgSlUrRWby8IGRNCcAPdOgwPCUBcPmidGTFoQEX7F+i3dd7Nu4008gX
   Q==;
X-CSE-ConnectionGUID: X7uiw8/AQE6MRNlCpOzqSw==
X-CSE-MsgGUID: FDfgNcfnQ1azrFdvQKEWEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42987328"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="42987328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 15:29:11 -0800
X-CSE-ConnectionGUID: P5IV4KZQSEyJ8uZHaYsp2Q==
X-CSE-MsgGUID: ttjocmitROuHK6Kx88DyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="94490161"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 15:29:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEGbj-0003T7-0I;
	Thu, 21 Nov 2024 23:29:07 +0000
Date: Fri, 22 Nov 2024 07:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1304/1304]
 drivers/regulator/qcom-rpmh-regulator.c:742:34: warning: unused variable
 'rpmh_regulator_match_table'
Message-ID: <202411220702.De8xAify-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 46fc033eba42f5a4fb583b2ab53f0a9918468452 [1304/1304] regulator: add QCOM RPMh regulator driver
config: x86_64-buildonly-randconfig-005-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220702.De8xAify-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220702.De8xAify-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220702.De8xAify-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/qcom-rpmh-regulator.c:742:34: warning: unused variable 'rpmh_regulator_match_table' [-Wunused-const-variable]
     742 | static const struct of_device_id rpmh_regulator_match_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
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
