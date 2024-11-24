Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642EAEADC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732457488; cv=none; b=ZXvmjdkaA0H0kdHnhQAdn7FV/KION5+P3mKvVbSGitsuH7DClev3Y+ugC5equ0JMXlVW+myZLpLOjIu3qxa4HaAs63rYtrUd9hl2NsrcWSfJmnkzssFXWHKSo9k0vNC8oZo/HmxpyFlTevDBbmKMoeu9jdCZLC/Y1KXmqccEAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732457488; c=relaxed/simple;
	bh=IuevnuaNs1SpXDbWMkGNa3guaD/djX+YfFZr35OYByE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHW19STSIwpVEWUghoHu64KvkFqXoY193hCdPGPSTyym1yvE3XXMoPf6tBZlytrlK3zju0lad2HLZsEjPM+soe9Fexjz/6GDOA0R8DNEru59mD7xPfojyc22v6WhEx5oDbCyBSov/daBnan7CpFSzaF0PTv1eiTfQPmRC0I0x04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqxlR6ON; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqxlR6ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732457486; x=1763993486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuevnuaNs1SpXDbWMkGNa3guaD/djX+YfFZr35OYByE=;
  b=fqxlR6ONgsRTlJQH/lflvAtRzswvr7DD4kf4Klt9/iGSJhjQSkCYNdoq
   mUOLdcbLAiu6srzLeAbwwkAeamtV2r4s20gr+Z+VfsFuA4PD+7GBkFQQT
   tKFaZ/Nj7eQi7gRqnfxi2E2JWX9wltHufDUdRF0v4BUHDmFPvJJIWkn2q
   7/aI5uKdkpqUJ7CK+cz/sZaMTnKjMcfqJWvxoImu25cePZO0ZHVUncWPd
   JrH1YD/pdSD8wtUPMngGB280tha8blBFgsYn5dEy6to7bSqDuZWfuL3im
   rkfMb1ihWkKIHhgUnwwE7sIK5n2N2z2i3tsVnmSdlvRAr+OFyRpmXJwIr
   g==;
X-CSE-ConnectionGUID: tgdzwP1JSX6E9QrNIAtJVg==
X-CSE-MsgGUID: hVd6dqB6T32R1wKdLoALBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="43064514"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43064514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 06:11:26 -0800
X-CSE-ConnectionGUID: RXm2J/1FSeSd5nPoFhpJZA==
X-CSE-MsgGUID: 2AGTBQSAQ3eTniLmy8dLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="121885058"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2024 06:11:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFDKc-00051R-2T;
	Sun, 24 Nov 2024 14:11:22 +0000
Date: Sun, 24 Nov 2024 22:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 23/26] kernel/locking/lockdep.c:3403:49:
 sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)
Message-ID: <202411242231.mcXqM02w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   a0ecc3ac56bd0ef35d7835eeaa9fc5c0541edc5f
commit: 14a9317ec80c0fd82c74576189b46524fc5abfb1 [23/26] Increase MAX_LOCKDEP_CHAIN_HLOCKS
config: x86_64-randconfig-121-20241123 (https://download.01.org/0day-ci/archive/20241124/202411242231.mcXqM02w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241124/202411242231.mcXqM02w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411242231.mcXqM02w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/lockdep.c:3403:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)
>> kernel/locking/lockdep.c:3403:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)

vim +3403 kernel/locking/lockdep.c

810507fe6fd5ff Waiman Long 2020-02-06  3395  
810507fe6fd5ff Waiman Long 2020-02-06  3396  static inline void init_chain_block(int offset, int next, int bucket, int size)
810507fe6fd5ff Waiman Long 2020-02-06  3397  {
810507fe6fd5ff Waiman Long 2020-02-06  3398  	chain_hlocks[offset] = (next >> 16) | CHAIN_BLK_FLAG;
810507fe6fd5ff Waiman Long 2020-02-06  3399  	chain_hlocks[offset + 1] = (u16)next;
810507fe6fd5ff Waiman Long 2020-02-06  3400  
810507fe6fd5ff Waiman Long 2020-02-06  3401  	if (size && !bucket) {
810507fe6fd5ff Waiman Long 2020-02-06  3402  		chain_hlocks[offset + 2] = size >> 16;
810507fe6fd5ff Waiman Long 2020-02-06 @3403  		chain_hlocks[offset + 3] = (u16)size;
810507fe6fd5ff Waiman Long 2020-02-06  3404  	}
810507fe6fd5ff Waiman Long 2020-02-06  3405  }
810507fe6fd5ff Waiman Long 2020-02-06  3406  

:::::: The code at line 3403 was first introduced by commit
:::::: 810507fe6fd5ff3de429121adff49523fabb643a locking/lockdep: Reuse freed chain_hlocks entries

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
