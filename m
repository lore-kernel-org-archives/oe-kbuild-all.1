Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74E2C11DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241977; cv=none; b=hLsDuVyLIhRdCbsPb6aJA5bmPeyBkH/c1osvabntUPZ/hAdCddOK+T/y8twPys5ln64E2Q87ThR1VrIAaPTFG5yKM7dCbt1n/RDyA0Jc52rX/ADMyW1Ecv+yD55HKruTSRT0+E4VDtvW4SDbuz4Y9X+wLf5/oZsRIKRbvwqERJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241977; c=relaxed/simple;
	bh=cjgi+FNNTaOAzHUsER0lwpAxdJLdTQE3qlAtSzFSkOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPqUhRzatuvf/o3V7fscRTP6QtyIubfkmuXXGajwaMiTgy6oigZ01zsS/2151rJqU4k6BGCaXcprh+tMqoMfYNgAWSz7LHu2uLy1r5lpkTtNda+Nv+OGSttyd9FuVc6hfWeRqA73cBekqN++y1zQKpxidJnSXUAbYZeEo3rEhp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvDFBiAY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvDFBiAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241975; x=1797777975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjgi+FNNTaOAzHUsER0lwpAxdJLdTQE3qlAtSzFSkOc=;
  b=AvDFBiAYH4oQnkkIsfD4Rj7iFGBheqLxYNcLYqA+4sxguRApm74UAmuO
   aTlLIQGx7Z5/FieQndL0u9NIZhOnvEJI8Cz2y3tt6CFefRvoqovZhrXDZ
   bIDoSWbN0892SnFXjCrvwckGewwNqRxU3etZx1vVAE0Gfv2iCJ6HdZ4gs
   MkRUEnlJ7E8LjP46/WInMZQVeIFAgL94YjjQJG4xGWWkMXz+hAm2Oafbh
   O1NAX1f7CY22mqItLT8vbn+vr1YDHfVVWR6C2kAiYUjblzFn1VhBxIzja
   XpP+xj/zB48RlaqdHPq8yFou2VoG06VbX4wXSlaJsE38QcOa4XDNn8RNp
   Q==;
X-CSE-ConnectionGUID: BaHbUta5SJuwSuVevnnd9w==
X-CSE-MsgGUID: Xb0vQKArQh2AMnlqP5RdHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294960"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: E6yRZytPTGKCXACxIwFntg==
X-CSE-MsgGUID: ahkam4UDTX6Ypwc/kjBMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986993"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004gC-2MqB;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547] security/integrity/ima/ima_tpm.c:19:6:
 warning: no previous prototype for 'ima_pcrread'
Message-ID: <202512202204.7yVczgx9-lkp@intel.com>
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
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 40151ef24c1a0f35c5e0442834eb776877e66683 [3547/3547] ima: rot: Prepare TPM as an RoT
config: x86_64-randconfig-006-20251216 (https://download.01.org/0day-ci/archive/20251220/202512202204.7yVczgx9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202204.7yVczgx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202204.7yVczgx9-lkp@intel.com/

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
