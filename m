Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443C1A9F85
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408180; cv=none; b=OD/dZ9G0KnaHZlC5rNLbIiSzYOa1kWp3gsbTDCKhSDjU7GRuEf7Xvpsbkfvx90p1LyNbrfanlMCtbXEO5JTvI6iWkF6b3uqIbviFR9gZ87HlHoqICfrBwkA4qj5SEUapUfj2jGSyGIobtf5r2tZkCiA/mkIIxbtT+OqXTm2pRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408180; c=relaxed/simple;
	bh=bMf/r5f0fEssioB+RY9FbwqnL1qSbrH3IgtfEufM5Qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V0SeRqVtMJ4b1zfuNc2vJsMO6V5Ss8ScmmpaNmpVhlc7flA//j3chGRHZO8tNNKMNZtz3q89qzpQMrNXgbwx+9g0IW5a5M4gMshHfM6ZERcyaal7tJaffKmpTAkZUPC7zt7bo+zD62ft4bOXlJnk7Qtc8PzDEmXo1Kk3a/VAAfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOKljDUj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOKljDUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769408180; x=1800944180;
  h=date:from:to:cc:subject:message-id;
  bh=bMf/r5f0fEssioB+RY9FbwqnL1qSbrH3IgtfEufM5Qw=;
  b=jOKljDUj5qLyBlfzhbioBFKHNTRBR8oUFoHxjzmd3yNeeFFefJzEKM4V
   +rqJG9Hf9J9qRhnKpu6HIf0zl5Ke6luhxp0B0wy3KZXKiVEy4+5hadTDQ
   MHknP5cgtJ15iIEUj7RNK96yScKO9JOjTQKDvgrPPl7jiu8SjU5wSHux2
   Hqkz2+mAN8zRwtYRt8ENIoC+xfL6FiBBxXQIaDCcCJNVZca5N4X+2b+jI
   eLkR+HVr4N2SGP26nbwnxVMewQuCperjLcUYxrxAWdbut3dgrfRWMCo9h
   jfqL5dikWBKTuKJm/9TpXDPhFTVrrO+wPMj/LHrChxhrFq9iMyzukgCv1
   g==;
X-CSE-ConnectionGUID: REmIe/s/Tb+eJixJctjCyw==
X-CSE-MsgGUID: qU9YMoxTQ8ablmAJ2Ze1CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96049916"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96049916"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:16:19 -0800
X-CSE-ConnectionGUID: Q9y90IY6QyKBIIue5MnhWw==
X-CSE-MsgGUID: 3mB1Zq9uRMiZGrf92Cz8Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212462777"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2026 22:16:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkFtX-000000001SX-0tb4;
	Mon, 26 Jan 2026 06:16:15 +0000
Date: Mon, 26 Jan 2026 07:15:59 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 7/15] Warning:
 drivers/char/tpm/tpm1-cmd.c:526 function parameter 'chip' not described in
 'tpm1_get_random'
Message-ID: <202601260732.g7TflFr5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fbd9af022416579062d59e206c7f71890d27fc31
commit: 62914cea999a3a9ec0417d0f8d82210c84ca1974 [7/15] tpm: Change tpm_get_random() opportunistic
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260126/202601260732.g7TflFr5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260732.g7TflFr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260732.g7TflFr5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'chip' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'dest' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'max' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'chip' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'dest' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'max' not described in 'tpm1_get_random'
--
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'chip' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'dest' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'max' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'chip' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'dest' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'max' not described in 'tpm2_get_random'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
