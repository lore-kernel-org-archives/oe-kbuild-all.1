Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9A16F0C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762599; cv=none; b=WNbDb1k8m6QE0T3E5gstGqEo/a7tag10NTfadKBASt7ggOlLQPAAaPxVfZqT/jVUs63gb5vI9juiJ5APejsIJJS+MsdUYTiTHOi1v8tY/UoeEV+f869Hr62EYYDOpCrlmZXFitO5zFGdN2oYXrCL3qZ584bT6z5q/6SRcG4BDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762599; c=relaxed/simple;
	bh=3hCXIbZDjiv6/rjPWUbJxgeSSpR+0ghVHOHyqZ+9c0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=So5RVLvWbAALe+aHYFH/HGGjCOeeDSDpOiCVCzs7wu9rMQA+rLOS5ai6LnwhB7vW+GkX3VJ+a8BICUiCCj72ktcr6Egk7CRrNoGu/T27v3uGa0M2zsNhOhaFw/GoZGLi+93De21W1ZjVw7L5IABOJbzZyj9z/Gov7zMPfNYOshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joiDBGYF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joiDBGYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712762598; x=1744298598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hCXIbZDjiv6/rjPWUbJxgeSSpR+0ghVHOHyqZ+9c0o=;
  b=joiDBGYFUHEfSa1TEkE57gbX4nDZY6TXyCPGwGGkUnK/86j4RaANB+WC
   zcoUCtON2IqHFIlKHySQE5ofLHMC/eXOD2M2j9on3wwD1flkJ0JgB+pea
   eazOseCYa0RwOIxIsK4uIsVCLmacM28mIZltB5SQnqPkv6pgVdp0y4zBF
   511Ygt9n4q+hrzjIUKMJK3+Xz1EfWgtnyQ9+bwx9er4Lgv/EZ99HtinlS
   TWI/iBAabWGHYzr65I7v8FFFtlnWRKbFB3k1TD6Dx06miTpM19ezS7E+I
   12Y/shMKxuxnMsc+L1w23Dj3HQegmNr8EJnsRH8ZxR0qQmwJk2MSnqUYF
   Q==;
X-CSE-ConnectionGUID: rwzZdrY0S6yzzbbJEPT5FA==
X-CSE-MsgGUID: vK/cp2EOSxuwTXEHogEXrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19559858"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19559858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:23:16 -0700
X-CSE-ConnectionGUID: kZwnrxI7QRGUuyjQ8FR86g==
X-CSE-MsgGUID: 4dgMIfNJS+C1zg0rwl4MsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43852844"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 08:23:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruZn5-0007WQ-26;
	Wed, 10 Apr 2024 15:23:11 +0000
Date: Wed, 10 Apr 2024 23:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [linux-next:master 2203/5042] WARNING: modpost: vmlinux: section
 mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Message-ID: <202404102353.Cv1gUjk3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
commit: 991e5583647d33ee3a9c89248974ef98b9f539a8 [2203/5042] lib/test_bitmap: add tests for bitmap_{read,write}()
config: xtensa-randconfig-r012-20230725 (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404102353.Cv1gUjk3-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: bitmap_allocate_region+0xb4 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
