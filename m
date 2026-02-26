Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F41D328B75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 04:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772079468; cv=none; b=o9aI3+eSN0GWswQeUTP65xRGDqbi9lzgqsYo+TK1vfndiuQS7d9xddpO2D2Q/2XnbHCd0pLHfp8oHZhPRIIPaORHJdU37krBfPPuK24x5zSQ692NRV+nPAIBKtBHFTZnP3VGuwZiMC5XfSVSDKKHJX+69jZGsgeqpeBcYdjyMO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772079468; c=relaxed/simple;
	bh=bEPQOCy+7PfJKgKSLhAVkzWZgWaikVg1HF2d1Acag0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CVEcmdSBDqGfTYXmzBSNiCaj1ANkoQBt5IXLMzHk+XFRMoZbp66yfdMESYBEO9BrQ+VvDNMv/eWAW+ahrVaAMMgQPz54pQFV4i82dT4S8gQuCvnRnf4P56Hieox3b9I4kaDStPZcgobErl68h2fE1bNbjb75JeiZq41TnBdhqZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNWKkIpt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNWKkIpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772079466; x=1803615466;
  h=date:from:to:cc:subject:message-id;
  bh=bEPQOCy+7PfJKgKSLhAVkzWZgWaikVg1HF2d1Acag0c=;
  b=ZNWKkIptEdHYL7CdTyvoXWncDmkhaRAHfUgzTgtGaJTbtE43VCGYjPpl
   u45+nrcuPhsgZFoKqhOoAyEdlz7xMONTW3PBofKAzHCRpNSojOh0c98tr
   Pc3iQzUv4AGuYV6bQS3Tg11fMJLTfezVF4OUUIGHTqSUmcHlx6MtaNFrk
   caoHJapBxuZcYUgBgBHljeEm19bOcL3e86qCe2X1DsKyP9nrDwOSiPVc+
   nl7NbracWatfrC7uRpfZnRwolpcR4uHCzpxXDpv+Rnc6CNb8iYDT4Lh4W
   dZ5iDr1lI6oNjdySPQBUOx86nI820Y397w+S6b4yjYmLCyvV6MqxotqVR
   A==;
X-CSE-ConnectionGUID: g3RP2mDURJO/LthnIBLMOg==
X-CSE-MsgGUID: K71FBkB7QsigvyfRPmdIVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90713292"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="90713292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 20:17:45 -0800
X-CSE-ConnectionGUID: 4qBmekvcQ0inlIR5sXrybQ==
X-CSE-MsgGUID: kWC2hwWvROCg4NTzuCzOxg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 20:17:45 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvSoo-0000000085t-23mD;
	Thu, 26 Feb 2026 04:17:42 +0000
Date: Thu, 26 Feb 2026 12:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 5/30] xtensa-linux-ld:
 fs/nilfs2/bmap.c:438: undefined reference to `__udivdi3'
Message-ID: <202602261245.KtbEBlcQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   480bdc7694bb061e98f9362a0abe9c805f2c55e2
commit: b0ab3e39dfdd05e99c335685f0d30e0baec16352 [5/30] ext4: update for u64 i_ino
config: xtensa-randconfig-001-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261245.KtbEBlcQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261245.KtbEBlcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261245.KtbEBlcQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: fs/nilfs2/bmap.o: in function `nilfs_bmap_data_get_key':
   fs/nilfs2/bmap.c:438: undefined reference to `__udivdi3'
>> xtensa-linux-ld: fs/nilfs2/bmap.c:438: undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
