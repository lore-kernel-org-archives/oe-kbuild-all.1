Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561152FFF91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761341159; cv=none; b=AbjsfqSgBphlRF41rO0LHP+ovQAUks6N6Za53P53qxCnEFEC/aqmLV/1dw/0gtagfw8l8WY8QfBqzixFQCOhWBOce+vVLVWT6zT23UlMVBc5EI+1zxyEYxOTxAH7xx3901oZ3EOjn6xYsb7kqa/kEMbwWaSgn0cPNUno1rsldJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761341159; c=relaxed/simple;
	bh=3zPOh5wqxEgbCEXKKEbH5sl3BiF2Gmtq2XYoDsNEfQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJjGOO2jOCx1eqauJJWERaGPxO8dsmbD2OIt8kZ4AZgNuTWHL0oKin6diB5+aJPlLpqIWn40BBmZN2ZC8gGOq/MP2kYyCf6+pvhA5qda2+S/WevVIEI35Y4DHTernoZmbqpEffhJWYog902mgU58JgKnhbNXr6b5SKf5+I9VVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMF+DClE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMF+DClE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761341159; x=1792877159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zPOh5wqxEgbCEXKKEbH5sl3BiF2Gmtq2XYoDsNEfQc=;
  b=hMF+DClEGodKP6BJbyzaWywcTtFF5mXFiTLiWm1wq1+YGbJ27gqEcXEH
   AkDBsO0oa/uLLVDMJ7j7e+eSE4eQPEmFArC0XP+elpAtdcOnFGTlG7wdX
   x5KADcKSEr2oqst2asppnfSVy2+skMfZb2UKp22k01Sie2yxptIj0U5/u
   /AI9aCMSQBwPN2VgKx4E6FdOjpM4TfJECb9Y8l8izXkk9GrM7viFUMonh
   92P+CkyG/FCqlfRhIFqA/exiAjhaV6pdb7c9NV5F74/BAfFHLZssR5z+3
   3xbcpQhRPUpWJEvD+tUfcS1mwz70QztiokNxIHHOUxuIh7/esZdfDs0R1
   A==;
X-CSE-ConnectionGUID: CT0ptmTJQ2WnZcbkXmrV3A==
X-CSE-MsgGUID: v/6Bv+43Ra21H3MVCoJERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86157562"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="86157562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 14:25:58 -0700
X-CSE-ConnectionGUID: CqL5zGUgSpazFxb3BTqu7A==
X-CSE-MsgGUID: NsbYYu+PQ32Jf62A7c7GkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="215182989"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2025 14:25:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCPII-000Etp-1V;
	Fri, 24 Oct 2025 21:25:54 +0000
Date: Sat, 25 Oct 2025 05:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 9/11]
 drivers/input/misc/isa1200.c:423:10: error: 'struct i2c_driver' has no
 member named 'probe_new'
Message-ID: <202510250509.rKlq3ySg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
head:   ccd3929e54f44ccae885d803cc472204f661c886
commit: 5e4f8e741997d1d027479597bf5265607888bcb1 [9/11] Input: isa1200 - new driver for Immersion ISA1200
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251025/202510250509.rKlq3ySg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250509.rKlq3ySg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250509.rKlq3ySg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/isa1200.c:423:10: error: 'struct i2c_driver' has no member named 'probe_new'
     423 |         .probe_new = isa1200_probe,
         |          ^~~~~~~~~
>> drivers/input/misc/isa1200.c:423:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
     423 |         .probe_new = isa1200_probe,
         |                      ^~~~~~~~~~~~~
   drivers/input/misc/isa1200.c:423:22: note: (near initialization for 'isa1200_i2c_driver.id_table')
   drivers/input/misc/isa1200.c:283:12: note: 'isa1200_probe' declared here
     283 | static int isa1200_probe(struct i2c_client *client)
         |            ^~~~~~~~~~~~~


vim +423 drivers/input/misc/isa1200.c

   416	
   417	static struct i2c_driver isa1200_i2c_driver = {
   418		.driver = {
   419			.name = "isa1200",
   420			.of_match_table = isa1200_of_match,
   421			.pm = &isa1200_pm,
   422		},
 > 423		.probe_new = isa1200_probe,
   424	};
   425	module_i2c_driver(isa1200_i2c_driver);
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
