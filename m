Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF92F53A7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 01:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731116909; cv=none; b=V0ddHxi4dV+/wxE/GTpzCq8oZCdboAsN/FTYDk/DI7sr5UadcYFqh1/tVcg4/OGlREpNvof4EYrihYp/AeWsTj3r9HBkjkyuRXNHRrZiDp3iNero+bT2FZ4oAkA+Oh8A5roSW5yFqJNSFPx5KKKjfkW6KJTIdEvtYXetL6m53z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731116909; c=relaxed/simple;
	bh=bhIZYjfTnxlmYXINCmQsNlM7kYmBOiQHvYXpdgM02uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2lJOAyTKvWKTZL6v2KwiD7lF0E6+yVcqNXzt4Um+/21jf1SmjUpMF4cU1h9LBzCU224XveuTE5DzLiv8Mz8rQEGCF2EJDSJOZvzQSWpj1iVXBPAk55VwvlmpPtgYJzGiqP1iAUD1V66Hj4MilRZQHxBPdp2MM//25TaDyNhE/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQdrntBj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQdrntBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731116907; x=1762652907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bhIZYjfTnxlmYXINCmQsNlM7kYmBOiQHvYXpdgM02uw=;
  b=OQdrntBjPE31KL/b0F0Uuzid5z0bQFUUUYMsNxbWjGUvyeX3GjwECLMS
   MZ5+cjk9/TLBJ4AFyOZhp0/HbWGdIBbpAF59MuFrdOZ7eN7l9XTaJEkB3
   edhTd/DorXsMotwiGYmPomBsTueuZcCguVvc3BLGWMQNV7jgAyL96q7Mg
   spRqGygHobTiasu+bWG+b50CuiLgTQ5KghKaIBfLeMNs3SeSo8Fh726Gv
   sX06COiL48M+KYfD32NISNubBHhy2UNAz2ylBNM57LjNUrNzO3+TjC4QW
   R39gyWQVAqjyRY/1dldi6mPoGhvJKtHzIdus2/4ykFm8iOJ8qVFjLqlK2
   w==;
X-CSE-ConnectionGUID: xYrO5RldSSiS8GQMUsVPOg==
X-CSE-MsgGUID: T/F6FU7DTMK643pnvvxuiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799005"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="34799005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:48:27 -0800
X-CSE-ConnectionGUID: XebozMhCQXagNBlGSMC4BQ==
X-CSE-MsgGUID: fXRWAJOPQKSj3am0wp29FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="85894010"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2024 17:48:25 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9aaN-000rxe-1B;
	Sat, 09 Nov 2024 01:48:23 +0000
Date: Sat, 9 Nov 2024 09:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [robh:for-kernelci 32/35] make[5]: *** No rule to make target
 'drivers/of/kunit_overlay_test.dtbo.o', needed by 'drivers/of/built-in.a'.
Message-ID: <202411090953.6qxjUlHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   07900b9108a8ef999f7a015d6bd766b9885ca593
commit: 027af8c26fdc064260a08c0d6dac64d5dc2c25d4 [32/35] of: Allow overlay kunit tests to run CONFIG_OF_OVERLAY=n
config: sparc64-randconfig-r132-20241108 (https://download.01.org/0day-ci/archive/20241109/202411090953.6qxjUlHH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241109/202411090953.6qxjUlHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090953.6qxjUlHH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/of/kunit_overlay_test.dtbo.o', needed by 'drivers/of/built-in.a'.
   make[5]: Target 'drivers/of/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
