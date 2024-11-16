Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FEDB666
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731779876; cv=none; b=gsiF5ZTixnoNrXyGAMW6KitQ4A+w5E/4/c/OYxTL1bT+kMHn77SrCJ3hOVPVcODLpevY3OU542zMa+gz+fJ/45FwQAgI/EnO2/QZecNKoeNVt7bU0r09HdwlMJ/AxsAuq7TDKydO6WZU/KwREMqd14VJLuVYh5h/a7IGUTuYtPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731779876; c=relaxed/simple;
	bh=i4YYqizoyWVhhEc/qVBrAKAazsUX3C0OBxygnTIoP18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cabqwdG0YbrlJixC+ctPv0Ykv8UYqMUGaQhYqKkrR+kLu1qeayBFaqI8phqH52iEq7j5S3FYVEubqlmBK7v98Ec466Q0hMUPFK3nWPvgaMbny9O2jg3I3cntLORCNEoX7JRMRSMb8mGzpqe08nriZl5v//vmB4xyfmKkI8VEtRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjeNZ7as; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjeNZ7as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731779874; x=1763315874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i4YYqizoyWVhhEc/qVBrAKAazsUX3C0OBxygnTIoP18=;
  b=NjeNZ7asQHNsOvqwAGC8K+OecQQa80p0X3fRYvnUvGKK8lTG7poSMyWC
   t434QJNPJa/8IGWTX8pnF5V5Ew2UaJOoAt6IXbuv2acvJERs3N5lYP1Yw
   R4siZ1EBY/c6+Ka7sXxSlnUIzQADF9dNPX2PDLexunbDkGD9LwFqX151r
   UvLSs2kzTNfxXpauwKG+x9yqi7TIJ69MBh87B9/FzaQFYfnOa1BFWkjcd
   Dt1drAxiMMXGxHVoeKe6fQrttMQFXv8fljKv1iAOSiZAshliBq13Y9YWu
   R2w5U/ksBoyQPe+vLanwf/A7yqTYxEJkPJRebHmM66EYliOzp8fC4wsCc
   A==;
X-CSE-ConnectionGUID: MFTPynLKRSmscVygWirv2g==
X-CSE-MsgGUID: VIRbUxEzTwmp7QZfXRWKmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42299748"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42299748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:57:54 -0800
X-CSE-ConnectionGUID: GYf136tLSaiVbNCC9yU1MQ==
X-CSE-MsgGUID: X/k9uKYRQ5uNugkDse316A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="126386316"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2024 09:57:53 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCN3O-000113-1P;
	Sat, 16 Nov 2024 17:57:50 +0000
Date: Sun, 17 Nov 2024 01:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] security/integrity/ima/ima_tpm.c:19:6:
 warning: no previous prototype for function 'ima_pcrread'
Message-ID: <202411170123.vN1EUOxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi GONG,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 40151ef24c1a0f35c5e0442834eb776877e66683 [1474/1474] ima: rot: Prepare TPM as an RoT
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241117/202411170123.vN1EUOxu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170123.vN1EUOxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170123.vN1EUOxu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_tpm.c:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
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
>> security/integrity/ima/ima_tpm.c:19:6: warning: no previous prototype for function 'ima_pcrread' [-Wmissing-prototypes]
      19 | void ima_pcrread(u32 idx, struct tpm_digest *d)
         |      ^
   security/integrity/ima/ima_tpm.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      19 | void ima_pcrread(u32 idx, struct tpm_digest *d)
         | ^
         | static 
   security/integrity/ima/ima_tpm.c:28:5: warning: no previous prototype for function 'ima_pcr_extend' [-Wmissing-prototypes]
      28 | int ima_pcr_extend(struct tpm_digest *digests_arg, int pcr)
         |     ^
   security/integrity/ima/ima_tpm.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | int ima_pcr_extend(struct tpm_digest *digests_arg, int pcr)
         | ^
         | static 
>> security/integrity/ima/ima_tpm.c:41:5: warning: no previous prototype for function 'ima_tpm_init' [-Wmissing-prototypes]
      41 | int ima_tpm_init(struct ima_rot *rot)
         |     ^
   security/integrity/ima/ima_tpm.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | int ima_tpm_init(struct ima_rot *rot)
         | ^
         | static 
>> security/integrity/ima/ima_tpm.c:53:5: warning: no previous prototype for function 'ima_tpm_extend' [-Wmissing-prototypes]
      53 | int ima_tpm_extend(struct tpm_digest *digests_arg, const void *args)
         |     ^
   security/integrity/ima/ima_tpm.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | int ima_tpm_extend(struct tpm_digest *digests_arg, const void *args)
         | ^
         | static 
>> security/integrity/ima/ima_tpm.c:60:5: warning: no previous prototype for function 'ima_tpm_calc_boot_aggregate' [-Wmissing-prototypes]
      60 | int ima_tpm_calc_boot_aggregate(struct ima_digest_data *hash)
         |     ^
   security/integrity/ima/ima_tpm.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | int ima_tpm_calc_boot_aggregate(struct ima_digest_data *hash)
         | ^
         | static 
   10 warnings generated.


vim +/ima_pcrread +19 security/integrity/ima/ima_tpm.c

    18	
  > 19	void ima_pcrread(u32 idx, struct tpm_digest *d)
    20	{
    21		if (!ima_tpm_chip)
    22			return;
    23	
    24		if (tpm_pcr_read(ima_tpm_chip, idx, d) != 0)
    25			pr_err("Error Communicating to TPM chip\n");
    26	}
    27	
  > 28	int ima_pcr_extend(struct tpm_digest *digests_arg, int pcr)
    29	{
    30		int result = 0;
    31	
    32		if (!ima_tpm_chip)
    33			return result;
    34	
    35		result = tpm_pcr_extend(ima_tpm_chip, pcr, digests_arg);
    36		if (result != 0)
    37			pr_err("Error Communicating to TPM chip, result: %d\n", result);
    38		return result;
    39	}
    40	
  > 41	int ima_tpm_init(struct ima_rot *rot)
    42	{
    43		ima_tpm_chip = tpm_default_chip();
    44		if (!ima_tpm_chip)
    45			return -ENODEV;
    46	
    47		rot->nr_allocated_banks = ima_tpm_chip->nr_allocated_banks;
    48		rot->allocated_banks = ima_tpm_chip->allocated_banks;
    49	
    50		return 0;
    51	}
    52	
  > 53	int ima_tpm_extend(struct tpm_digest *digests_arg, const void *args)
    54	{
    55		const int pcr = *(const int *)args;
    56	
    57		return ima_pcr_extend(digests_arg, pcr);
    58	}
    59	
  > 60	int ima_tpm_calc_boot_aggregate(struct ima_digest_data *hash)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
