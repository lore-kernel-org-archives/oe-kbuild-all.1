Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE313002DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 04:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765513684; cv=none; b=EFnR3zUll7G7G2m2D2KOSBtZjG0RXPdYYP1CTirnSoTW4m218Vu7SWB55XDexVnY08AsO+R1bZHIk/Pfs0d2SS5RTFHZWL3zIrfwkROZYB/xX2kOQ9+pFsKRTHF1XvYPtHwtz3PH5ei1/bE/M4DAg35sxnE3Ql6VCoqd6iIPVjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765513684; c=relaxed/simple;
	bh=tli3MgKrfsG9QSxxQ8sHrvOn2GplKIXPxuGu5XCHBk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNaqOlpB2k1n+M+tQJQIZ5zAGyQU1AHGCUZS2gA7aY3jAOfFnw+KuM8nojwiSxgmiI9CtWyVoKP+Uwd11nM8nMSmQc3+n0aRGdeqbio1bYi9O7igGH4uAahXsanNNOVo9/P2QIDDxQJA2xaI2WaTCkHLuqPu06Xw/jU/lTuuG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyVKrxfn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyVKrxfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765513680; x=1797049680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tli3MgKrfsG9QSxxQ8sHrvOn2GplKIXPxuGu5XCHBk8=;
  b=LyVKrxfnjPuRtnDs1NoP6/U+pCKMjWb7njfieCuzcx8enGWTf4ANUYXc
   oK/mZzHGSNVBSMWiKueDqrxp+r5NhBmdG/cvPka39EI0ETwhqCJl6jVBI
   mdRkFCYrU70C4Osx2G96Pzrv7sxJPDhIUsiR4pGRXtetNZhHFEZIvmGve
   YFIm9WrRmmCh7wpEIHRHwM76Y5aBCkQK1JFOFn3iGxf1IVGPZvsacpzPe
   VXfS5BHSx66TQtogd2PK7jbxK1A32LdN2Jn37r7ucBLZ2QclA8OVNO3g4
   C0xrUWscouVynz2CRd4d2/pA1YokIOn2SWbNMBAbmY2YcRO+mtfM5UrEO
   A==;
X-CSE-ConnectionGUID: tsh5poc/TmmzJ634Pz6L+Q==
X-CSE-MsgGUID: 8hZY7OSeRM2XXsNfD1ncBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67389492"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67389492"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 20:27:58 -0800
X-CSE-ConnectionGUID: 3HvB4SqDRB+OzkGZLLFh/A==
X-CSE-MsgGUID: XmetfCxvQfqAyF2SgO8UjA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 20:27:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTul0-000000001I8-2qXC;
	Fri, 12 Dec 2025 04:27:54 +0000
Date: Fri, 12 Dec 2025 05:27:36 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] security/integrity/ima/ima_tpm.c:19:6:
 warning: no previous prototype for 'ima_pcrread'
Message-ID: <202512120507.yBtcWN2k-lkp@intel.com>
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
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 40151ef24c1a0f35c5e0442834eb776877e66683 [3534/3534] ima: rot: Prepare TPM as an RoT
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120507.yBtcWN2k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120507.yBtcWN2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120507.yBtcWN2k-lkp@intel.com/

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
