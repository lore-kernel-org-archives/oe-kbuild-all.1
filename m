Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B129A326
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768619438; cv=none; b=O9esC/1aHdwbgKpS64lRrmHKhzDkhqN/mogWQypNCoxIBrmZCVo1/2vqNYVoXWpBiF1+3g/UtHV6SXNwqoHErK8jZSbuBFEI9VXXrcLIlD21HzROt5FzaWE4BsdcPL95AVwccy7zU6wAvZdAAJPomsnvMKaH56DzWj1Uej0dO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768619438; c=relaxed/simple;
	bh=1DOGaHVzDohrpFZg5vGhrCcrHs5z5ZhqoyjCV4M84XU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dqv0Id1urgPLW+Lm+Z1LPjGCK9tTOvlGnhuec5hmWhtgH0ZnRUPwdSi5j8p9W+q/QBO3HApF8qMMMDr3SW32tOrbbJ08qNo6/BuNs3+/nE78N6WWAOaz6iqhmXaiyNNLtdg2Pd/AJBvjKdTgYLhvIdKATdUHmwO53+QeamgPVFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVK76AZC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVK76AZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768619437; x=1800155437;
  h=date:from:to:cc:subject:message-id;
  bh=1DOGaHVzDohrpFZg5vGhrCcrHs5z5ZhqoyjCV4M84XU=;
  b=nVK76AZCddLs1uaTx5QWOjheqQChs2fZw/sE2uR4sHzGuiHWMstRmqsH
   IOtyxp2Or3ShrdTMuz6RfBOeouBVWWH/o/sjIYX/ULtqglmRDM9BddydU
   2UxyXCwyore+XgL6CQrg4g1jbQUjVcrGcNcalqU63Jg+2loDr6I+TE98K
   ikNaN3Zm0WrRHwS75A7sCjkHYDS4WZS801Kv+72Wtlcv5fv/ZH+Yive6l
   aXAawhxn6DKoWma7VILmFgkrb9lt741IJXxlh4mZhZkNqPKuQlEWEI/bM
   963VZtHrcODHXN3GzaJgnga+ukRVEQhukp1+5maQjG+Fc2sCL29ZcEcAA
   w==;
X-CSE-ConnectionGUID: nOSpVvI8RGu3SCfgma+O+Q==
X-CSE-MsgGUID: wBmnk1cvSKCMvdd3SuWjQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69828273"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69828273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:10:37 -0800
X-CSE-ConnectionGUID: hd2k3DXPRQGxTNKyujMexA==
X-CSE-MsgGUID: MsPtFyeUStiq2M4CKfkbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210405967"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 19:10:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgwht-00000000LVO-0wdn;
	Sat, 17 Jan 2026 03:10:33 +0000
Date: Sat, 17 Jan 2026 11:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 11/12] cpu.c:undefined
 reference to `cpumap_print_to_pagebuf'
Message-ID: <202601171105.n58mTziA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   90f258135a3e620859dae9d24ec629edb2463803
commit: 12d89d4a90f9460d13e46f85c7aecd290e5e9f1c [11/12] cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260117/202601171105.n58mTziA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171105.n58mTziA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171105.n58mTziA-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/base/cpu.o: in function `show_cpus_attr':
>> cpu.c:(.text+0x398): undefined reference to `cpumap_print_to_pagebuf'
>> cpu.c:(.text+0x398): relocation truncated to fit: R_NIOS2_CALL26 against `cpumap_print_to_pagebuf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
