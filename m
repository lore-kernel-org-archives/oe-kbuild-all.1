Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8B372B3B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778366559; cv=none; b=KEvH4/VH9KNs/QI1ftdJzsMtXIa6BCM7ZKOKS80IZC7T6f1pS+XRURm+v8Mr6f/u2Q49sySwr/I5WBNZdxtf/LIX7k18UKTs6KE+62w5nzo9pAZQiu7v9rSXcKOE6ePW3+Xy/c5TSGdwsXxuA3OZSdEV2F5IWtNuORzs/k8+Xco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778366559; c=relaxed/simple;
	bh=3qX1XiJfYhWJoClt9rP1kTcFCyJTGGKBXxrLZ7MaSes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ku/MrcidK3jrkUadxjlbby2oRojEQ1Uy7rQ5IHnWghPEzoBhzNSLa8lTUqCZ9eCPDXsxtA2QnKdQsyZ/z+MAeAIhdUbRIPriX23SXjMe797IUIGGwumoH9+2h9NnXSM1v/0e5oTB+0CPQWHYxQEzMhLheGs3HrYlOPL9P8bISic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZje6osk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZje6osk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778366558; x=1809902558;
  h=date:from:to:cc:subject:message-id;
  bh=3qX1XiJfYhWJoClt9rP1kTcFCyJTGGKBXxrLZ7MaSes=;
  b=BZje6oskNQMmVNMh6LV7MVO4k6Z+QvRYLWoS1j4mwO5ZhKlGGY/YehAY
   MqEt2A0D9Pzh/CCn5b+LbL1rrcyc4gUHu6RMLWUc9lDCmg7fQSV+GV3e2
   Vq0c09mF3078kyuRLaMHBsKoSK4pxk0j85CCOdIQWhU8aJWm/z+B1t1Xn
   la2vzG8QKO/FZ2FJvbjJs7mtTQOFvapCJ4TTasCX0mvF4oUmYERCTppwR
   X1h45GPGxSbx0RcxprVIEv9MbEu1n2nJIlwKOJmKWKl7mR2vfdaXWJ5hP
   4QMn4PL0b3oBNcN96nZgRQtrMQKFNmSzsL+Fveh6W054eHB5CFX3+rpjE
   g==;
X-CSE-ConnectionGUID: FijGsP0tQtWeJ/Oh9gXKaQ==
X-CSE-MsgGUID: y2kEdc9jSpW5GAmL3OFstA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79407613"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79407613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 15:42:34 -0700
X-CSE-ConnectionGUID: 3DghKo9tQdml++LIVDIX9w==
X-CSE-MsgGUID: ng+bFR7aRpGIkrQxlGdGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242049608"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 15:42:33 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLqNS-000000001UL-48Cj;
	Sat, 09 May 2026 22:42:30 +0000
Date: Sun, 10 May 2026 06:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 12/16]
 kernel/locking/lockdep.c:3407:49: sparse: sparse: cast truncates bits from
 constant value (a0000 becomes 0)
Message-ID: <202605100659.Q44ovXIS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ba55a7ab0f6380bbedb1480e837abed687c987dd
commit: 033daad0e3013ea11037cd3d33a22d082a8102f3 [12/16] Increase MAX_LOCKDEP_CHAIN_HLOCKS
config: s390-randconfig-r122-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100659.Q44ovXIS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100659.Q44ovXIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100659.Q44ovXIS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/lockdep.c:3407:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)
>> kernel/locking/lockdep.c:3407:49: sparse: sparse: cast truncates bits from constant value (a0000 becomes 0)

vim +3407 kernel/locking/lockdep.c

810507fe6fd5ff Waiman Long 2020-02-06  3399  
810507fe6fd5ff Waiman Long 2020-02-06  3400  static inline void init_chain_block(int offset, int next, int bucket, int size)
810507fe6fd5ff Waiman Long 2020-02-06  3401  {
810507fe6fd5ff Waiman Long 2020-02-06  3402  	chain_hlocks[offset] = (next >> 16) | CHAIN_BLK_FLAG;
810507fe6fd5ff Waiman Long 2020-02-06  3403  	chain_hlocks[offset + 1] = (u16)next;
810507fe6fd5ff Waiman Long 2020-02-06  3404  
810507fe6fd5ff Waiman Long 2020-02-06  3405  	if (size && !bucket) {
810507fe6fd5ff Waiman Long 2020-02-06  3406  		chain_hlocks[offset + 2] = size >> 16;
810507fe6fd5ff Waiman Long 2020-02-06 @3407  		chain_hlocks[offset + 3] = (u16)size;
810507fe6fd5ff Waiman Long 2020-02-06  3408  	}
810507fe6fd5ff Waiman Long 2020-02-06  3409  }
810507fe6fd5ff Waiman Long 2020-02-06  3410  

:::::: The code at line 3407 was first introduced by commit
:::::: 810507fe6fd5ff3de429121adff49523fabb643a locking/lockdep: Reuse freed chain_hlocks entries

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
