Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324B2F12A5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553321; cv=none; b=XLf3Y+IhWTEoRpdU3mckGzQ7nZTRzZvojy3b9sTg6r/KgxJb8G0QuVJr+KCHwMMhtUJlWbLulIjxH8c6riMBKmpltTQZe0hoyTztkMdbuNAgtcG5P7S+FPn5jHVjYzhpWgrPldQjf/0BjD9glm4lTWK60CO75CFDSQY5kb7dUKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553321; c=relaxed/simple;
	bh=wewKDZ5W4gQSn0Dh8GCtBEb6HEdmkWwzI6vUhuzE14Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kts45emSEbV2WVgmpCGmpC5j9Rxxh6mYOVB5vVFMnstw2D3xN+h875Ap0u6HbRmtjLTE5EmrE6/BGcGrLNNphmhDFf61DXWZPmtPGe+a9NLPG/RXD+pWhjJDKglhI3PpND1S5sWJBtfzw3hs3UvxTL+YjeHVvHrbVURb6aTuPkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHYg1raE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHYg1raE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775553319; x=1807089319;
  h=date:from:to:cc:subject:message-id;
  bh=wewKDZ5W4gQSn0Dh8GCtBEb6HEdmkWwzI6vUhuzE14Q=;
  b=aHYg1raEBS6NG/1pJpdGtCcz1NnxBSYPmz2y8YINwAopEpwrMaCJLnWc
   hfFcnTiBm1hnfIieZf4fcl0ijlZ3ICQ/hlrYWFzg7jBIYQl5AI0lAFwmz
   tzDZtKNfCA98cPLW3GrkjsD6mRmzk+kUh7YQpm9NvQFcihQpdgnW6JJDq
   STmMHqHyKax4h+nd32BEzXP52Lj6ari8XZmsTYTBs2c4ZWrvDfJm9perT
   Vj05j/qivS6SSQtf/1N6/TJ0RGV1xss79wJiO51e0g1BD810+uaEXErSF
   1UxdkxGHVQZFzUZv56ZjuSK4NnQUUQ/Q1nuNGWHCSIxcI06eYS76+bYDa
   Q==;
X-CSE-ConnectionGUID: ggMEhA/bS3my483WcjI4Cg==
X-CSE-MsgGUID: Y3hbIVXjTF2zhGPoqyPu8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76633992"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76633992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 02:15:19 -0700
X-CSE-ConnectionGUID: VG10s7/QSgO4ISU8glPDoQ==
X-CSE-MsgGUID: Gjh/M35TT7m4R6NiXMpqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="266097835"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2026 02:15:18 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA2Wh-000000000Pt-2raQ;
	Tue, 07 Apr 2026 09:15:15 +0000
Date: Tue, 07 Apr 2026 17:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:assert 6/6] drivers/acpi/acpi_pad.c:88:8: error: must
 use 'struct' tag to refer to type 'cpumask'
Message-ID: <202604071733.b7ZHQEir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux assert
head:   5e88fbeeb3c7355139ca86067d68ea8c77534b92
commit: 5e88fbeeb3c7355139ca86067d68ea8c77534b92 [6/6] acpi_pad
config: i386-randconfig-003-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071733.b7ZHQEir-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071733.b7ZHQEir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071733.b7ZHQEir-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/acpi_pad.c:88:8: error: must use 'struct' tag to refer to type 'cpumask'
      88 | static cpumask pad_busy_cpus;
         |        ^
         |        struct 
>> drivers/acpi/acpi_pad.c:335:45: error: use of undeclared identifier 'pad_busy_cpus_bits'
     335 |         return cpumap_print_to_pagebuf(false, buf, pad_busy_cpus_bits);
         |                                                    ^
   2 errors generated.


vim +88 drivers/acpi/acpi_pad.c

    85	
    86	static unsigned long cpu_weight[NR_CPUS];
    87	static int tsk_in_cpu[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
  > 88	static cpumask pad_busy_cpus;
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
