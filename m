Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F511FBEBE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447906; cv=none; b=RJFbUHQug6b+A7XS5Dohn7NpEK0exE2B3jMzB2yisdQrpFaNlVSKXQI8wH8z1GoAkCIZBWoSeV5Fwye5nhT6oZ8TOxhhf8DGcfENIp3quzWGryva7M0Jc+N4nzfOD653IPGIStv/Vn/urwK60GjZ4j1aev0jxXUIq/HyxycTLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447906; c=relaxed/simple;
	bh=+YQ6bFTRShlTr9+AMlnPXr44HmzUXhD3XwTIfe4cEu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDE/2/jFJAFuBN2xYcTKxhR9Uj5qW8JsJSPQXLlw8OjkgT3If5L+Upu3iDfUsRsBKaKYnXtr7NlhRc+rmxbJvoJlAhMrq7uYdDMVQqUnUSXIDgxkefQpLSpUuDpaMv5pUl4yz3K2AHgYBNKRrp8oULeiSsMI+M4XjDpl8APYiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QV/XfXP8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QV/XfXP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748447905; x=1779983905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YQ6bFTRShlTr9+AMlnPXr44HmzUXhD3XwTIfe4cEu0=;
  b=QV/XfXP8JRPLE6daJzuewEgkQyuwBU/k4bRIUgjZ+wjFx8pQGwk8r5Im
   IOT47JCRoxAlhWZk3Dnk2W5M3EDTRMHT9MkmMFzQ12WmU8BgKpLsNGid7
   B0WW/xSIKh92AR9bc8kWS2TsNUUawjIIPSvubIvkoJFDEh96PZ9MLgkFb
   NBd2R2Z5G4KovM5OfPPlUlBRf1H5guOKDSJF9z8ec2xI4XKDoI1zskgCf
   Db6xwiVL1dVVRgE+HvN7v6fof0qKKsFn047ujloIGsuKjNLdejRrZ3Nr6
   g4K5gCDYTDQJIAp8/WYD8H4P7FDAY6/2GviTFJP2UQQG1w2Ms5APLuJR5
   w==;
X-CSE-ConnectionGUID: vAzm2vrMR0+8EFe5GiPHUw==
X-CSE-MsgGUID: tR4hSK3GSDuJlsD+cWXtww==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67897060"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="67897060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:58:24 -0700
X-CSE-ConnectionGUID: +RdJimNWTnuYrEXN11zjrg==
X-CSE-MsgGUID: sKPbBqrBR9OkWP5V64lQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="144248094"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 08:58:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKJAZ-000Vp0-2q;
	Wed, 28 May 2025 15:58:19 +0000
Date: Wed, 28 May 2025 23:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2329/2329]
 security/integrity/ima/ima_virtcca.c:30:5: warning: no previous prototype
 for 'ima_virtcca_init'
Message-ID: <202505282351.rMVzfHVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ecedb4219f373697a260948e7bfe781c40318682
commit: 24ac42fb86c6acfcb89b76d3b2fd6fba9bfd89de [2329/2329] ima: rot: Adapt VirtCCA into Rot
config: arm64-randconfig-003-20250529 (https://download.01.org/0day-ci/archive/20250528/202505282351.rMVzfHVV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282351.rMVzfHVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282351.rMVzfHVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_virtcca.c:30:5: warning: no previous prototype for 'ima_virtcca_init' [-Wmissing-prototypes]
    int ima_virtcca_init(struct ima_rot *rot)
        ^~~~~~~~~~~~~~~~
>> security/integrity/ima/ima_virtcca.c:59:5: warning: no previous prototype for 'ima_calc_virtcca_boot_aggregate' [-Wmissing-prototypes]
    int ima_calc_virtcca_boot_aggregate(struct ima_digest_data *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/integrity/ima/ima_virtcca.c:81:5: warning: no previous prototype for 'ima_virtcca_extend' [-Wmissing-prototypes]
    int ima_virtcca_extend(struct tpm_digest *digests_arg, const void *args)
        ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/ima_virtcca_init +30 security/integrity/ima/ima_virtcca.c

    29	
  > 30	int ima_virtcca_init(struct ima_rot *rot)
    31	{
    32		int rc;
    33	
    34		if (!is_virtcca_cvm_world() || tsi_get_version() == SMCCC_RET_NOT_SUPPORTED)
    35			return -ENODEV;
    36	
    37		rc = ima_virtcca_init_algo();
    38		if (rc)
    39			return rc;
    40	
    41		if (virtcca_algo != ima_hash_algo) {
    42			pr_info("VirtCCA's algo (%s) is different from ima_hash_algo (%s)\n",
    43					hash_algo_name[virtcca_algo], hash_algo_name[ima_hash_algo]);
    44	
    45			rot->allocated_banks = kcalloc(1, sizeof(*rot->allocated_banks), GFP_KERNEL);
    46			if (!rot->allocated_banks)
    47				return -ENOMEM;
    48	
    49			rot->nr_allocated_banks = 1;
    50			rot->allocated_banks[0].alg_id = (virtcca_algo == HASH_ALGO_SHA512) ?
    51							 TPM_ALG_SHA512 : TPM_ALG_SHA256;
    52			rot->allocated_banks[0].digest_size = hash_digest_size[virtcca_algo];
    53			rot->allocated_banks[0].crypto_id = virtcca_algo;
    54		}
    55	
    56		return 0;
    57	}
    58	
  > 59	int ima_calc_virtcca_boot_aggregate(struct ima_digest_data *hash)
    60	{
    61		unsigned long result;
    62		struct virtcca_cvm_measurement cm = { 0 };
    63	
    64		hash->algo = virtcca_algo;
    65		hash->length = hash_digest_size[virtcca_algo];
    66	
    67		/* Read the measurement result of RIM as the boot aggregate */
    68		cm.index = RIM_MEASUREMENT_SLOT;
    69	
    70		result = tsi_measurement_read(&cm);
    71		if (result != TSI_SUCCESS) {
    72			pr_err("Error reading cvm measurement 0 for boot aggregate\n");
    73			return -EFAULT;
    74		}
    75	
    76		memcpy(hash->digest, cm.value, hash->length);
    77	
    78		return 0;
    79	}
    80	
  > 81	int ima_virtcca_extend(struct tpm_digest *digests_arg, const void *args)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
