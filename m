Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB431E51EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747013708; cv=none; b=ghIoRLkqWj24PWHNTIrcnQ1OBWZcHBp1ta1V1NXBWfQb7MQyE4C71F5fyt3eQk2ws+WXts7WsCgI78gjVKQnxSuO0/XdXzc5uA+5wdvsR6p/dMYg7BEF2L10E3yS0mkA1dy8sRDQUhgSVgrdqR6oyuYRG+Pm8tRzN6uaZx4Tzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747013708; c=relaxed/simple;
	bh=Z6m2FfTLzG5mIWCOx063bPfS3lElQkIk8SrjxBd+Gl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hio31+RvRrH53J0sE6tKe9njpCYpBPm4OAOOeWyOJfD1w19d8WmKTIDoPimLpYJ5hyMDRfUu+Ennw0dedaUtBNUDiAkAhQ/pesEbmKTbE2Smzym/WW3JSxA4o/+NZUFExmqCoPCeTwAa/7610NtLFky8Eymrx2fE2mkjeDUNuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDwFVt6g; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDwFVt6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747013706; x=1778549706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6m2FfTLzG5mIWCOx063bPfS3lElQkIk8SrjxBd+Gl8=;
  b=LDwFVt6gmfRsZ1o2dY7XQq1MAvpXu0kN/aeFq5olMe3n8oiiU1Z8dNIO
   r2KIU8bCG7TOflfUtQ8WXiWJKJTmU8OGgC8/u5UXRo06G6Uht8l8h1MYj
   UQq6TAtS93KNZa5h1U9UlD981nVTc8XGQ52kT8koNYMQXvUSaf5gtUvY8
   JLn4NhjqKynGYcT5eKNIjclT/+n5e8VQS12LVGKl3USKtMPayCzwU4LlF
   MbO27GDOPYIxnNgn6YVBAYDrlEUuKBpxU34YZP5w5VvBqq9BQGREyVRiS
   6SlNRxN1CeD4yleo80ZzxYvIupBN2YwQa9tIxnMZryY6erjd08OR0W/43
   w==;
X-CSE-ConnectionGUID: FczPgSPARCWia3z4qpBbAQ==
X-CSE-MsgGUID: cHulpiSmR5GC8VunikvOWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48722210"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48722210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 18:35:05 -0700
X-CSE-ConnectionGUID: k2lKVZyJR1WMstiZY7XhTA==
X-CSE-MsgGUID: dti7sd5AQNCyr6w4vigqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="138195087"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2025 18:35:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEI4L-000E67-1z;
	Mon, 12 May 2025 01:35:01 +0000
Date: Mon, 12 May 2025 09:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [iwlwifi-next:next 147/162]
 drivers/net/wireless/intel/iwlwifi/tests/utils.c:84:undefined reference to
 `iwl_average_neg_dbm'
Message-ID: <202505120905.ceWoI4rO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   2d31285ffbcb5947c50c7c736f00e34321f45243
commit: 1f52f7f0abe235cd6a8c6ad6abfcc84bfcd2cf9f [147/162] wifi: iwlwifi: move dBm averaging function into utils
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505120905.ceWoI4rO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120905.ceWoI4rO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120905.ceWoI4rO-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/wireless/intel/iwlwifi/tests/utils.o: in function `test_average_neg_db':
>> drivers/net/wireless/intel/iwlwifi/tests/utils.c:84:(.text+0xf0): undefined reference to `iwl_average_neg_dbm'
>> loongarch64-linux-ld: drivers/net/wireless/intel/iwlwifi/tests/utils.c:93:(.text+0x1b4): undefined reference to `iwl_average_neg_dbm'


vim +84 drivers/net/wireless/intel/iwlwifi/tests/utils.c

fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  76  
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  77  static void test_average_neg_db(struct kunit *test)
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  78  {
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  79  	const struct average_neg_db_case *params = test->param_value;
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  80  	u8 reversed[ARRAY_SIZE(params->neg_dbm)];
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  81  	int i;
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  82  
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  83  	/* Test the values in the given order */
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06 @84  	KUNIT_ASSERT_EQ(test,
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  85  			iwl_average_neg_dbm(params->neg_dbm,
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  86  					    ARRAY_SIZE(params->neg_dbm)),
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  87  			params->result);
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  88  
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  89  	/* Test in reverse order */
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  90  	for (i = 0; i < ARRAY_SIZE(params->neg_dbm); i++)
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  91  		reversed[ARRAY_SIZE(params->neg_dbm) - i - 1] =
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  92  			params->neg_dbm[i];
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06 @93  	KUNIT_ASSERT_EQ(test,
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  94  			iwl_average_neg_dbm(reversed,
1f52f7f0abe235c drivers/net/wireless/intel/iwlwifi/tests/utils.c    Benjamin Berg 2025-05-09  95  					    ARRAY_SIZE(params->neg_dbm)),
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  96  			params->result);
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  97  }
fc612222416ce20 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c Benjamin Berg 2024-05-06  98  

:::::: The code at line 84 was first introduced by commit
:::::: fc612222416ce206e01d7509b013bad41a051d83 wifi: iwlwifi: mvm: record and return channel survey information

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
