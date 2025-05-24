Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE315B546
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748112270; cv=none; b=Im61i8azzi1JoyVWRLMUUGWh8Ol1Akgmb+/79878qYQyAKX4E/R6T1xDa+InQYTR/TQqc04awfKees/YCDcwefnV+Hhn+q8mdHA6zAXzCm74drOC/0ARDzhcjOlMyBB6REBViQUC5JyRn/JQc/hQyBpyHFEjQk3t3RSOyjzr+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748112270; c=relaxed/simple;
	bh=stEZK2lXH+YIcqh0Ixt84/9ha7zQ29gBUewTyDcM9xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2xzdeiTJc2e+YagiFkBXQKq7nx2iuUH+mMoqWjigNg3Y5adztIY/ReZqLX/9K+4t0gaYeV41/SgPsOt6myh82/MOeHMWbMxJHVqdzFGmeWA7t0LWQwRzsp0KFW8QDszPPOSGjmhTWXHOnUiKSFe08MWl44vDDdMDcfkxLAn6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgqH3AWN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgqH3AWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748112269; x=1779648269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=stEZK2lXH+YIcqh0Ixt84/9ha7zQ29gBUewTyDcM9xk=;
  b=XgqH3AWNwkI518oImygzXLGkz0MkbdtV7tyT+8IDcFWtqwchlhGUAK0b
   n0Oy2+sQ8Wxtx/F5ID9UoPlYYXJNWZzgL77itJ2mVd2IsAstkcwQK3gA+
   RcHiRZMOL06uDhpjmBxp3kqpMtd8QDjXRmva6oLTyi+hwWJZRd1AO7ktR
   tgp5qK5TSy6LCsNhDkB5irQfI43GTIEqXZ24gcVcTUd0x9pguBpKthe2f
   mqWRWVSSVSf8bD8Lg9gLIa/L1cMG8GuG2S8fBoSoHHC4BPXwkjF22cqSq
   bdVSaewTr/290M3VNF151E2yawGHOQ/HpiI+BruB/KAjFesFrM+3LLYq0
   g==;
X-CSE-ConnectionGUID: lWYmL04iQqKpfkwMFLy3qA==
X-CSE-MsgGUID: IW22I3DCTQeMt+/HSKdrzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="49840733"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49840733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 11:44:27 -0700
X-CSE-ConnectionGUID: 4ycEnyzLRS+Cd0s8Q5G72Q==
X-CSE-MsgGUID: PnfnD3MbQc67RN/B8oQBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142649261"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2025 11:44:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uItr5-000RP6-1E;
	Sat, 24 May 2025 18:44:23 +0000
Date: Sun, 25 May 2025 02:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gulam Mohamed <gulam.mohamed@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Junxiao Bi <junxiao.bi@oracle.com>
Subject: [jlayton:uek-localio 2163/2262] blk-core.c:undefined reference to
 `on_exadata'
Message-ID: <202505250243.yYMkT0LG-lkp@intel.com>
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
commit: 0b2a76891169239f74aa88cf5865d397d2f60089 [2163/2262] block: sysfs option to change ioticks granularity
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250525/202505250243.yYMkT0LG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250243.yYMkT0LG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250243.yYMkT0LG-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
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
>> blk-core.c:(.init.text+0x6c): undefined reference to `on_exadata'
   aarch64-linux-ld: block/blk-core.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `on_exadata' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> blk-core.c:(.init.text+0x6c): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: blk-core.c:(.init.text+0x7c): undefined reference to `on_exadata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
