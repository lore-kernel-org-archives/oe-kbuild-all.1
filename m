Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A781990A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731785587; cv=none; b=lXOybCwSHqtmydaVE7YQtMBGrJPgGlpP/5Jj/ITG9NriFiF9+I77QACWnmL6CCxEb8IekA9horbwV3Nk5jj1FrlcDiedCTTTA0jkoFl2F0tve8tTAmY7Nq73SJ+yLDTwr8TlJL/mykQFaVVc9zxw4vN6kTue5DQ5s0BufPVx8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731785587; c=relaxed/simple;
	bh=wYxYzWLS+wHnAp1LZu8wWgo1KsgvElL3JcwQTAg4BA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UphPhNPF7fy/LokS0IM8tj98sGA07EgOlT5YxlFISxV/zR2v4ov1Dh7MPsbhFaBUs6P0wVYXdHx/EOnYLKjEnSwOIdadhQbo5pbUKQ58RJ0hl+aCaUBkm9zYXJk/3FU9aI603Ix5LVvQ5SO9lYbwL3y33YuGfTTN8KM8HXyzxTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMchVAB8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMchVAB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731785585; x=1763321585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYxYzWLS+wHnAp1LZu8wWgo1KsgvElL3JcwQTAg4BA0=;
  b=UMchVAB8eEodlEucoVnD1bnnDUSxtM7HrCGuszh8jgrsar1z9TWUjyjC
   KCtWWjuondV3OjIZ66dgWo0jCB8MpfkDbYEWNY3oCBDsGu2bMmWksQds9
   EXJqBOW9H/fDWhok4ugPD3dV6ugPvTEaOsSHopejizvaQkiHEr2teCJqp
   u5QiDQnw4VG5E4fai0n9djfAoRa9oNM+37X8l8JKvIBGkijWuNuIin2fe
   Qm5h1G5FGqn7Ndihg7JLxlJDbzpPSw5Z4DM9YK/BdFJzEhA2FrgzxOUQg
   C/T5N+Hm9XUVWSevhK+RdYE62z4MpLgpZbPSGcLm2o7Ydk65c768QB+Vk
   Q==;
X-CSE-ConnectionGUID: CAsE4BePRuiQgLDpZ1CWDg==
X-CSE-MsgGUID: mXlcvX/kRUWmnQt15yhzRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42421051"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42421051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 11:33:03 -0800
X-CSE-ConnectionGUID: ZcASEWJwRqixLkUFdov6Ag==
X-CSE-MsgGUID: eESejrsuSUuMgp5ALAG35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="112140900"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2024 11:33:01 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCOXT-00013y-1r;
	Sat, 16 Nov 2024 19:32:59 +0000
Date: Sun, 17 Nov 2024 03:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 security/integrity/ima/ima_virtcca.c:30:5: warning: no previous prototype
 for function 'ima_virtcca_init'
Message-ID: <202411170355.mew4P3B3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 24ac42fb86c6acfcb89b76d3b2fd6fba9bfd89de [1474/1474] ima: rot: Adapt VirtCCA into Rot
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170355.mew4P3B3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170355.mew4P3B3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170355.mew4P3B3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_virtcca.c:7:
   In file included from security/integrity/ima/ima.h:19:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> security/integrity/ima/ima_virtcca.c:30:5: warning: no previous prototype for function 'ima_virtcca_init' [-Wmissing-prototypes]
      30 | int ima_virtcca_init(struct ima_rot *rot)
         |     ^
   security/integrity/ima/ima_virtcca.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int ima_virtcca_init(struct ima_rot *rot)
         | ^
         | static 
>> security/integrity/ima/ima_virtcca.c:59:5: warning: no previous prototype for function 'ima_calc_virtcca_boot_aggregate' [-Wmissing-prototypes]
      59 | int ima_calc_virtcca_boot_aggregate(struct ima_digest_data *hash)
         |     ^
   security/integrity/ima/ima_virtcca.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | int ima_calc_virtcca_boot_aggregate(struct ima_digest_data *hash)
         | ^
         | static 
>> security/integrity/ima/ima_virtcca.c:81:5: warning: no previous prototype for function 'ima_virtcca_extend' [-Wmissing-prototypes]
      81 | int ima_virtcca_extend(struct tpm_digest *digests_arg, const void *args)
         |     ^
   security/integrity/ima/ima_virtcca.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | int ima_virtcca_extend(struct tpm_digest *digests_arg, const void *args)
         | ^
         | static 
   8 warnings generated.


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
