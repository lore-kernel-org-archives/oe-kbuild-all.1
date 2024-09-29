Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B8224F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727624437; cv=none; b=jV4a++SscUE9Khix0hKy8NgQzsRLSmD1DJAkn6K3pjbzQHpRXvuglZ1Q0wCadBAoYe31fLUPfvLqsvxoodY0enBQgxh7OiuwcGPxJkS74lK8Hss1NWYr9FMUJWWfF5Yu40D4ZrEXSY9bYhDsPr/yRIgUx6N+PoFplsKJupUMNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727624437; c=relaxed/simple;
	bh=7zoxZee6x4zFrq8JY5ofJU8BNUHdp4ELj0yZg3IyV0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJpL7irXfFwTn0nQ6KEAd+Xb11bmcJKVK+BWp20GYbssJR0NfTpq5+E3/sibLo9nhsd/1VY7uRZd7HRbp+Uw8K/UigCMCeJ7eP9G+60oXd7J0gOK0KT6vtxFSC31sRtBPrVOSSZRum7h11eA9NhYZk9rTRj4571WVOpD+GvtgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNABjWcn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNABjWcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727624436; x=1759160436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7zoxZee6x4zFrq8JY5ofJU8BNUHdp4ELj0yZg3IyV0c=;
  b=SNABjWcnwNvjOnCU92d8RGj8gnVmn+P2eW1fSzQFzTCSlI4KFtemlqNn
   GvVMEIJRpnysFnV8BX02EX7aypU+U5Dfp+2L4oFJbmz4EzfVXvwUr5KVE
   GHbPJdnAvAZmgA5jG68WkzUwKQru9JAJkz+73bTHR9vs5GM6J2h+NJpTH
   DZPfNZTuBsxS3dKzJY7nwZ+9jT7a/KzyWAtbj1hxDcq/ui2LPKQWgMYkc
   vHV3AQ2nwIKxCScfbC/z95Ov3V+d7V5mP7QO2megebfk4MkPjzCrZCtu8
   t/tjPwBoZcaLOIHosN+Y3L9ido3eODJGPrNoaiId3MXQP7qr5F92rbXwG
   g==;
X-CSE-ConnectionGUID: OzM8uWFTT5WbuGTaEpJBsw==
X-CSE-MsgGUID: 2XXOwcglREezuecwznr6nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30597591"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="30597591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:40:35 -0700
X-CSE-ConnectionGUID: 8vFBtbFISgWPZRi/YqZ4TA==
X-CSE-MsgGUID: FFw4aHu2S5K81b3Xxk41SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77813207"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2024 08:40:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suw2B-000OOl-1q;
	Sun, 29 Sep 2024 15:40:31 +0000
Date: Sun, 29 Sep 2024 23:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/14244] loongson3-acpi-cpufreq.c:undefined
 reference to `acpi_processor_unregister_performance'
Message-ID: <202409292322.d2VPFaNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/14244] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409292322.d2VPFaNL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292322.d2VPFaNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292322.d2VPFaNL-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `loongson3_cpufreq_cpu_exit':
>> loongson3-acpi-cpufreq.c:(.text+0x6f8): undefined reference to `acpi_processor_unregister_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L333':
>> loongson3-acpi-cpufreq.c:(.text+0x2a20): undefined reference to `acpi_processor_register_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L372':
   loongson3-acpi-cpufreq.c:(.text+0x3390): undefined reference to `acpi_processor_unregister_performance'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
