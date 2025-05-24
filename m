Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505A367
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748117976; cv=none; b=OhEfuY/yBO8lPlT3VEDXWqezX9EiRxxHNx9VVsA3RjWFsgsyiHCbJrM+YH5CfitPVV6EbrQI2Iig54c1hbZ7rnK5cyyZEJtN+OX6r7UKuYwwY1WHumhuHUXZicjE2aOHWuI25Zf6CfBJr8xbSdPKxGPoTBJssSpaI4TsAwySd4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748117976; c=relaxed/simple;
	bh=6rpOzHjp3wjBi/0FmtxYbTMiTMqf7fCAb9wXI3q0/eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9nwtzyYjBlP0j/SyTJOQQsH3ZLReBErksOsrXJuqe/Djl8p3e05tHFFSE11avqPBTLk6lVDh7PnmZAARqxx8ht3G3/uSdf/Jx65NT0Fmh1JWn79SVO/ZqdVnyuILYJZVT6nNXmyw6OooSdhasSyDKgSYxl3AnVc7tzsoMuXWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHl+CfeT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHl+CfeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748117974; x=1779653974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rpOzHjp3wjBi/0FmtxYbTMiTMqf7fCAb9wXI3q0/eo=;
  b=mHl+CfeT47lQLi7RXWV+vGip73rU2SDryYPx9jzg44sHS+cmfJkljLoK
   oRQlYSSrLXku1ABmCWqGNDHeRoYu42URT1S9jtz49EsQ69a0qyrZbtvbA
   S/DEu+1GHWP9UAKoRewWUAezAKPI5c85GtL7vlajwG4LCZA0rh2/C+Vfs
   YhLGk11D1UPFB+siXvbBdcXi3ZxEQLhnM4pDhMkprDSwdq0/oBcVyDUi1
   WLDdw1bZqw3nuHkVxWDsr2WUduG+1TjszxH5JnnYxJUpFvTs8FTIB44ow
   qsstYATM9Ujrs55gDDE2jfXAurFtAQzxthA8S9MnujleazVhULDfrn1rh
   w==;
X-CSE-ConnectionGUID: LVl6HQJEQVemUaa5hWtLCw==
X-CSE-MsgGUID: 0Czn82IbRRCXsNjTi2ROCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50253294"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50253294"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 13:19:34 -0700
X-CSE-ConnectionGUID: FHnw9DSsS96yYFjSApp7Ng==
X-CSE-MsgGUID: AtE/4fqbR1i3GbZ3IOri+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142240598"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 May 2025 13:19:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIvL8-000RRQ-0Y;
	Sat, 24 May 2025 20:19:30 +0000
Date: Sun, 25 May 2025 04:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Libo Chen <libo.chen@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Chris Hyser <chris.hyser@oracle.com>
Subject: [jlayton:uek-localio 2189/2262] smp.c:undefined reference to
 `cls_enabled'
Message-ID: <202505250418.WCQBJB5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 19b7754dad593f79958d21837b6b9ee626eb8ba4 [2189/2262] arm64/uek-misc: add a new boot parameter uek=cls to turn on CLS at boot time
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250525/202505250418.WCQBJB5j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250418.WCQBJB5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250418.WCQBJB5j-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/smp.o: in function `smp_cpus_done':
>> smp.c:(.init.text+0xac): undefined reference to `cls_enabled'
   aarch64-linux-ld: arch/arm64/kernel/smp.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `cls_enabled' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> smp.c:(.init.text+0xac): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: smp.c:(.init.text+0xb0): undefined reference to `cls_enabled'
   aarch64-linux-ld: drivers/char/random.o: in function `get_random_bytes_user.constprop.0':
   random.c:(.text+0x1b80): undefined reference to `crypto_alloc_rng'
   aarch64-linux-ld: random.c:(.text+0x1b98): undefined reference to `crypto_rng_reset'
   aarch64-linux-ld: random.c:(.text+0x1bb4): undefined reference to `crypto_destroy_tfm'
   aarch64-linux-ld: kernel/sched/fair.o: in function `wake_affine':
   fair.c:(.text+0x164): undefined reference to `on_exadata'
   aarch64-linux-ld: kernel/sched/fair.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `on_exadata' which may bind externally can not be used when making a shared object; recompile with -fPIC
   fair.c:(.text+0x164): dangerous relocation: unsupported relocation
   aarch64-linux-ld: fair.c:(.text+0x168): undefined reference to `on_exadata'
   aarch64-linux-ld: block/blk-core.o: in function `blk_dev_init':
   blk-core.c:(.init.text+0x6c): undefined reference to `on_exadata'
   aarch64-linux-ld: block/blk-core.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `on_exadata' which may bind externally can not be used when making a shared object; recompile with -fPIC
   blk-core.c:(.init.text+0x6c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: blk-core.c:(.init.text+0x7c): undefined reference to `on_exadata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
