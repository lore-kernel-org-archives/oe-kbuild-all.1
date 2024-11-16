Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073641885BD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731780538; cv=none; b=nkSL9rRA3EcqP78OL6X6W8tpfNmjzYmx7jt8bjMFMVwp5r2WkN8g/lwJvlkFzRY8hvbeVTwd8P5YIU/bKgPrnBSVbMVt1jpA6JWKv9fbC1jajGJK3NBB/KkuH+Y9aHg/bWDt64E5W/i6tPiodNrdvfq83q9/owq9M+IPdDXK5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731780538; c=relaxed/simple;
	bh=p2vC9r/3l/hsEqtmA77Z9qtl6nLc9bgj7MH8O/yUi6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZLMZVJkLyCJY8RqXtfIksmMLN1QeiW+laOrbSYvIZdqLJnbHgsmlfU1XCUWtS0m77QCxfmaEGgANAhQ44AmgrQ6hwflb4TCj1QDl7Hk9IhyHlcBebMfD1rUaXpNUpYao6LsOBlioSieBSViXEVRTupwS4Lbk6cM5KEabJa9NAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfLY1ml5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfLY1ml5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731780536; x=1763316536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p2vC9r/3l/hsEqtmA77Z9qtl6nLc9bgj7MH8O/yUi6s=;
  b=GfLY1ml5qLEnBTiSYbT1Yln5bsjSxM9ReGPilObJDbPe19/cQjca0Hy/
   L/a0zIK7sKPmfU+wTCodbXcMxB8tzfEBbvguFLh4V0F4Xx3WOlijU+yya
   ac3gtpw7Psz3Rx5yum2vZd5KcP4G2ch9sdiPkDlYSYxCbxmRmMp9JVoQc
   Manj0ypUj86vGlZduhGRf2k9BITTU3OBcdAcv4tnXaGaApjEKMhyDwJzj
   382cdpzZxrqH6YeeskeL+Y5eB53hrtuuiWvShZADl5tmM/TRGYGYxhHGA
   8nBImXyOVmTe09j5w+tzfIFd3vTEsip25ExYfNQbs0JgTGtiMn2kSQ/R0
   Q==;
X-CSE-ConnectionGUID: Ni3IkF+DRVyCbg2p3XXo+A==
X-CSE-MsgGUID: BKKCXmbATDqplw8r1DCGAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="19379857"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="19379857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 10:08:55 -0800
X-CSE-ConnectionGUID: yvyYBueQR9WHbx4+4x6NxA==
X-CSE-MsgGUID: SOpAUUfkR22HXkEMl0GPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93680633"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Nov 2024 10:08:54 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCNE3-00011J-1k;
	Sat, 16 Nov 2024 18:08:51 +0000
Date: Sun, 17 Nov 2024 02:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] security/integrity/ima/ima_tpm.c:19:6:
 warning: no previous prototype for 'ima_pcrread'
Message-ID: <202411170203.cd5LERnD-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170203.cd5LERnD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170203.cd5LERnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170203.cd5LERnD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_tpm.c:19:6: warning: no previous prototype for 'ima_pcrread' [-Wmissing-prototypes]
      19 | void ima_pcrread(u32 idx, struct tpm_digest *d)
         |      ^~~~~~~~~~~
   security/integrity/ima/ima_tpm.c:28:5: warning: no previous prototype for 'ima_pcr_extend' [-Wmissing-prototypes]
      28 | int ima_pcr_extend(struct tpm_digest *digests_arg, int pcr)
         |     ^~~~~~~~~~~~~~
>> security/integrity/ima/ima_tpm.c:41:5: warning: no previous prototype for 'ima_tpm_init' [-Wmissing-prototypes]
      41 | int ima_tpm_init(struct ima_rot *rot)
         |     ^~~~~~~~~~~~
>> security/integrity/ima/ima_tpm.c:53:5: warning: no previous prototype for 'ima_tpm_extend' [-Wmissing-prototypes]
      53 | int ima_tpm_extend(struct tpm_digest *digests_arg, const void *args)
         |     ^~~~~~~~~~~~~~
>> security/integrity/ima/ima_tpm.c:60:5: warning: no previous prototype for 'ima_tpm_calc_boot_aggregate' [-Wmissing-prototypes]
      60 | int ima_tpm_calc_boot_aggregate(struct ima_digest_data *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


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
    28	int ima_pcr_extend(struct tpm_digest *digests_arg, int pcr)
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
