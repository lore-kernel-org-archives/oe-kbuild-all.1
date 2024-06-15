Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FEA179AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 08:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718440134; cv=none; b=c4uCZLW0Kc0ktPLWoHr499Pn98jARXti/28+8FeWlp0nprwyJkcJlf4x11c97yFTaWncfY6phgo9PRHI3Mf6/tERFL5Aw7htr+7MF79ShXxa/SEwOPRSCO3Z3580IEPGo0ceM7e0N5LjPy5i/SJjAVE6mYRr+oYHU/mrVZBjfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718440134; c=relaxed/simple;
	bh=+NMD3AB2gRo4fOJAxwNR/km09x7thoPmJpIfHTcNx8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elTRe+/VZyerY3Dni5Ss8Fw5YtC0flOxhpO860Kqn6G0PZ/R5+GkBrLVlqNk2D1i5fso8UT7G6j8UEkbCSnTIEk0HHxqZVue0prh0mSCGiEXgUD5Zy/PhGuMHCk2leOxNbo/++3KfU/sQrm5B84kU1hmN5dzgtDAyr0lzAu8p4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8QbDbF+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8QbDbF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718440132; x=1749976132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+NMD3AB2gRo4fOJAxwNR/km09x7thoPmJpIfHTcNx8w=;
  b=X8QbDbF+L65tzeZoR1nTIwjO0sgOwLmExJutLNQF4dv54C1JOB917mzH
   /hEM4O02pwwNxune6rpbVEPs7yNgGraEk4FexW8BLsGBt8IF+Na6OlMyx
   TLV6e/njL1tRv6xrmb/AvOOssBwT/JQFMV1nRxujsurxxT9EpLvxHNaNe
   WZEUWYWY/UhDAe8NtVNmvpHVgzBcVP1vO0V5XBLuDzXY3l/tpZF+H3LK/
   Xmg7vjVVX2U1JuxuJVuXINtZGkJQ+kD7QijlfaHiCS2il7qaTDMM+OwMe
   X7TAggdCZ+sKS1cwx7rsza7IbNcqgLttj5bCQYcXitcULx9Vym4GWTg8c
   A==;
X-CSE-ConnectionGUID: tA4IqUv9Q7G0qKBJn3+oFw==
X-CSE-MsgGUID: K8YyM5GwQsGwtDEc/pxVaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26449538"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="26449538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 01:28:51 -0700
X-CSE-ConnectionGUID: ZhAbc6dVRnG2vF7LVzMdHA==
X-CSE-MsgGUID: Wd2rgCoWS3y/SqpyfLknHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40880354"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jun 2024 01:28:50 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIOmG-0002Nd-1F;
	Sat, 15 Jun 2024 08:28:48 +0000
Date: Sat, 15 Jun 2024 16:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.10-rc1 61/114] drivers/acpi/pptt.c:478:5:
 sparse: sparse: symbol 'num_repainted_cache_ids' was not declared. Should it
 be static?
Message-ID: <202406151647.s3fUsF0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.10-rc1
head:   d9ba67a1a8dc6551a0b3254a8f2ee9993ad17957
commit: 05c8de8ab35ff351c69806553124e6d2b44a6d98 [61/114] ACPI / PPTT: Repainted cache ids from firmware to be less ugly
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151647.s3fUsF0u-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce: (https://download.01.org/0day-ci/archive/20240615/202406151647.s3fUsF0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151647.s3fUsF0u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/pptt.c:478:5: sparse: sparse: symbol 'num_repainted_cache_ids' was not declared. Should it be static?
>> drivers/acpi/pptt.c:479:27: sparse: sparse: symbol 'repainted_cache_ids' was not declared. Should it be static?
   drivers/acpi/pptt.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +/num_repainted_cache_ids +478 drivers/acpi/pptt.c

   477	
 > 478	u32 num_repainted_cache_ids;
 > 479	struct repainted_cache_id *repainted_cache_ids;
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
