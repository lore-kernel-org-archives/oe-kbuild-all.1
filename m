Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D08198E60
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317955; cv=none; b=COZO5DAVV3ibXvxzh0jEzbPzwkXVMn+OXEPRdwjKAqz9SKzTR0MpkR/dU8y+4dVxPfZiUe09Aft82vZZzoIzxDwd8AGLXkWpO672RVmq7bGGmk94gT3j70UUFTORW62zEdOaa0jJprOU4RQqY1cae+mSxjeJFXr/tH9AaPn5t/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317955; c=relaxed/simple;
	bh=A6+QVViWxA7Is60DKD16BwGzTPSsv0EGoGd2GyHT5Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OxWr4/yU7AaOlQC9jmDNAP4ZF3JqJAymTPRq4Krvbcw+WEsQ2ufHpor5sdpOpn0MONBIQKgmsKvQWcRuoiQpitcRvcAUPucCXT8bJ6FOxis1YW0GFVRH0rFOFuZxpWvQ4EOhMXP5NmbC6Z0OQxZMd3S+ZoBwkkJ/Jxj3YI07Isc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHnmK2qR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHnmK2qR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317954; x=1778853954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6+QVViWxA7Is60DKD16BwGzTPSsv0EGoGd2GyHT5Kw=;
  b=QHnmK2qRO050p+PE4YNPVgK4dMZsNipNuYyzzV9CWmZiudIwltAS2ww3
   JFvAZkK1TKyzL1yDEolxOiisrJwOlG/8AZkk634zynuGTbELtV9AJRXQj
   KkWnFhg3Zw4O/nQ1owxbkxep+JSloQbpm/D5e2c3UafqHzJ8f/1DMPfy3
   A11PaKyBCy9fyTrQBIvrrP3n2UgMvb+5a2DB+ULHJ40It3GiZBP5+idjF
   XQKqwzRiOTRvja61mCimb5LlftOETYUE0CVFqzhV0x+Af/zSJ1bsOJL34
   ppyXs3ASn2Cl/UXdNZC1KxM6r6WfZKSC9w+8vp69bOiDRFC4f+eg9lCj6
   A==;
X-CSE-ConnectionGUID: RfxEOEdsRcqiPF0zV/h11A==
X-CSE-MsgGUID: iw782pFhSrKAdibUnbH8qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943817"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943817"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:05:52 -0700
X-CSE-ConnectionGUID: /qo5RL1hQX6MmaD2y4Dsaw==
X-CSE-MsgGUID: f/7FqZnmSJK7vyFvQHrbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138261405"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2025 07:05:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZDY-0000Fe-2J;
	Thu, 15 May 2025 14:05:48 +0000
Date: Thu, 15 May 2025 22:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] security/integrity/ima/ima_tpm.c:19:6:
 warning: no previous prototype for function 'ima_pcrread'
Message-ID: <202505152125.1bUF0zIv-lkp@intel.com>
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
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: 40151ef24c1a0f35c5e0442834eb776877e66683 [2229/2229] ima: rot: Prepare TPM as an RoT
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505152125.1bUF0zIv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152125.1bUF0zIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152125.1bUF0zIv-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   5 warnings generated.


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
