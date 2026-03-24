Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F03EFD04
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372318; cv=none; b=dMO9+yBSrUo8xGj+54QNfDon1v+eF03nErqwke/xTUOvj6GJKGZYCjkewAh25iNqYQSW+vFi8Yk3YUSqHNBDUzmpa9eGsJfzKDpXjIrOUjsHiwN0iIX3OeIPkV7X6OsmefamFhCm4SfOLSoWFnjhCPAuWBGbmAMNv/DKJ5Q7h2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372318; c=relaxed/simple;
	bh=JRzF9ic3hieeToNQ3sydzHjA/075uj+yL4MoBvX1jsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ee04L6feCxkYxVghTGVQ9YiV+ZNZ8gJTwDZzs93pcbfNPJ9Cy01szicrgmH3AVnf8AieI4s9rH25CBCQK7q0ANTbsfr9eVmqGSlryhBDtvoGyI2BXZrO88zQHjtB5gII2WZI6NMqYM8Q+jTiIW6PRV6EgOPRXVLoztsGfL/jK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUoqb7QO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUoqb7QO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774372317; x=1805908317;
  h=date:from:to:cc:subject:message-id;
  bh=JRzF9ic3hieeToNQ3sydzHjA/075uj+yL4MoBvX1jsU=;
  b=NUoqb7QOvPkyw6tLNIgwdhQY2gBFDf62ilpZhqVbOh+0NNb6AMO7CL3X
   5Y+RQX+mo0FdscrEx0ZnuJsiQ8jA2T1WlnFjOobWL+fUmPzNZfgQIzPBD
   h2CjjeazWd/Z69geYtaK87KN35nf1ueblA5zeHrWbk+A/gx6l23gCUo71
   2lbiV79KCDColQKMrehEMs0q4o1Z021TNIkhH5YKX+9TaIytG/CgE5UZV
   u9FmnnTBrpMDCZjwAuKPulF0ZjQNW+kQvoarILoMNtOrODmeDgIlKZDIx
   X7TptfGmu6KfhGNmWkRqKvATqBzfoRFOL0ZO0tN1EU3x0y/siXRkqHVn3
   Q==;
X-CSE-ConnectionGUID: fVD4T9BbQeWMA32xahLTjg==
X-CSE-MsgGUID: ptGf1ANnTMOlfohfBrNh7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79255871"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79255871"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:11:56 -0700
X-CSE-ConnectionGUID: IQ9Z6rVpSPiTbkXIXCR9pw==
X-CSE-MsgGUID: pct82hMaSrmKdJBRZM46WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228893877"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2026 10:11:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w55IG-0000000052b-2tDn;
	Tue, 24 Mar 2026 17:11:52 +0000
Date: Wed, 25 Mar 2026 01:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 7/7]
 drivers/char/tpm/tpm_tis_core.c:740:6: warning: variable 'ret' set but not
 used
Message-ID: <202603250155.zLVRSZTF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lino,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c0665c721df9b82c4652604d24aa91456058230b
commit: 71becf3ffea6ff13a2dea17b45f3a38c4174d2a3 [7/7] tpm, tpm_tis: Claim locality before writing interrupt registers
config: arm-randconfig-004-20260323 (https://download.01.org/0day-ci/archive/20260325/202603250155.zLVRSZTF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250155.zLVRSZTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250155.zLVRSZTF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm_tis_core.c: In function 'tpm_tis_gen_interrupt':
>> drivers/char/tpm/tpm_tis_core.c:740:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     740 |  int ret;
         |      ^~~


vim +/ret +740 drivers/char/tpm/tpm_tis_core.c

41a5e1cf1fe151 Christophe Ricard 2016-05-19  734  
12839c326ae5cd Lino Sanfilippo   2022-11-24  735  static void tpm_tis_gen_interrupt(struct tpm_chip *chip)
eb5854e764b91a Jarkko Sakkinen   2016-06-12  736  {
eb5854e764b91a Jarkko Sakkinen   2016-06-12  737  	const char *desc = "attempting to generate an interrupt";
eb5854e764b91a Jarkko Sakkinen   2016-06-12  738  	u32 cap2;
eb5854e764b91a Jarkko Sakkinen   2016-06-12  739  	cap_t cap;
d53a6adfb55396 Lukasz Majczak    2021-02-16 @740  	int ret;
eb5854e764b91a Jarkko Sakkinen   2016-06-12  741  
e630af7dfb450d Jarkko Sakkinen   2021-05-10  742  	if (chip->flags & TPM_CHIP_FLAG_TPM2)
e630af7dfb450d Jarkko Sakkinen   2021-05-10  743  		ret = tpm2_get_tpm_pt(chip, 0x100, &cap2, desc);
e630af7dfb450d Jarkko Sakkinen   2021-05-10  744  	else
d53a6adfb55396 Lukasz Majczak    2021-02-16  745  		ret = tpm1_getcap(chip, TPM_CAP_PROP_TIS_TIMEOUT, &cap, desc, 0);
eb5854e764b91a Jarkko Sakkinen   2016-06-12  746  }
eb5854e764b91a Jarkko Sakkinen   2016-06-12  747  

:::::: The code at line 740 was first introduced by commit
:::::: d53a6adfb553969809eb2b736a976ebb5146cd95 tpm, tpm_tis: Decorate tpm_tis_gen_interrupt() with request_locality()

:::::: TO: Lukasz Majczak <lma@semihalf.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
