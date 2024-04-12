Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6114F9F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712950151; cv=none; b=s4gc6QJoThG+E0c3sP+zFg7vqNAc9wXz2Qz9ge/FCsoVPgLrYB3C6mPyMxIdTGQOYdCFgIq2nvLZ8fnTIyC/cGrCbpdB3ZfTQz2hHqV1oF8fUAL0G1O+2R0xkvNZKa/WIU+WItHydKmwXvypNbvwvmMPVFNpWGZ3wMcAEMHI5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712950151; c=relaxed/simple;
	bh=2lUF72WZEsh20sPA9Ggu/B798WZ2pzB4MwDv82oWflk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQydCAsg61KddrNLMjRF2jYKWfvXXqEYFK1eG+dpN37ro4oMc+zPhcMJJu5XG6+cKm58FIsZP+nIxVM4+VTDGlVVyIHwCRdgjqNjBzCfPkESvdDxeYM20AetYp2aa6WarOIri3RgJklasMTtEpovrahU3K4Bb7qBg9F2hxQ8AU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CA7Cj8/E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CA7Cj8/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712950149; x=1744486149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2lUF72WZEsh20sPA9Ggu/B798WZ2pzB4MwDv82oWflk=;
  b=CA7Cj8/ERt1RH3kzYbcZPC0W7dmE2OLc0L9irYJHpud4ghy4PJNCiO7b
   3814B0O3wj1P6YrkMISaTbJEVTNSOgAayAK5/03kvlQYbYLnb7+gR5eAM
   QC2K3XoME2S9wURkEQ1zTOb3ApMyytyI4Crp5eLZCa6E1AdMBc83hDt+d
   YRv7NKo4Y1GjWTBB4BwSH8FD4KRJ44rzKVVW1ZJZOtF/FC5eLNT1Jdnmu
   mEjDCQPEo63DuXZZ1/kFleKhRYLkJQWNL4pv6uKcjHC5MULbyf9Rfe+zU
   Z3DzBz295Cnz0VdQluo5AKpw1cYHtnZWwNtygYtR3HmaXOUxqUn2W5aGm
   Q==;
X-CSE-ConnectionGUID: 8zarB7cwThmSskNIcTd1dA==
X-CSE-MsgGUID: R28Ueq6vRx6vuxwQd9brdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="18976633"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="18976633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 12:29:08 -0700
X-CSE-ConnectionGUID: WK9E3kXDRHmjkr19jhrskw==
X-CSE-MsgGUID: YGhH8jdMQgO7JttDfGBJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21309891"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Apr 2024 12:29:05 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvMa6-0000fE-2n;
	Fri, 12 Apr 2024 19:29:02 +0000
Date: Sat, 13 Apr 2024 03:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24875/30000]
 drivers/ub/urma/ubcore/ubcore_umem.c:183:21: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202404130314.iS4dMbbM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   30b94f5b7f90893f07314da68de8bdafb68bc2b8
commit: aeda8188894b2ed9ecf04dabaf5e147bce811725 [24875/30000] ub: change name in kconfig, and kconfig content of ub
config: x86_64-randconfig-121-20240413 (https://download.01.org/0day-ci/archive/20240413/202404130314.iS4dMbbM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130314.iS4dMbbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130314.iS4dMbbM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_umem.c:183:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ub/urma/ubcore/ubcore_umem.c:238:26: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/ub/urma/ubcore/ubcore_main.c:63:5: sparse: sparse: symbol 'ubcore_open' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcore_main.c:120:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:120:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:120:44: sparse:     got void [noderef] __user *
>> drivers/ub/urma/ubcore/ubcore_main.c:132:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:132:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:132:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:145:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:145:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:145:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:178:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:178:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:178:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:210:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:210:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:210:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:244:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:244:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:244:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:271:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:271:37: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:271:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:410:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:410:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:410:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:417:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:417:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:417:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:423:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:423:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:423:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:429:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:429:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:429:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:435:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:435:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:435:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:441:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:441:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:441:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:448:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:448:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:448:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:454:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:454:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:454:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:460:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:460:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:460:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:508:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:508:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:508:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:525:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:525:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:525:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:541:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:541:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:541:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:570:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:570:37: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:570:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:684:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] resv2 @@     got restricted __be32 [usertype] @@
   drivers/ub/urma/ubcore/ubcore_main.c:684:37: sparse:     expected unsigned int [usertype] resv2
   drivers/ub/urma/ubcore/ubcore_main.c:684:37: sparse:     got restricted __be32 [usertype]
>> drivers/ub/urma/ubcore/ubcore_main.c:685:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __be32 [usertype] ipv4 @@
   drivers/ub/urma/ubcore/ubcore_main.c:685:36: sparse:     expected unsigned int [usertype] addr
   drivers/ub/urma/ubcore/ubcore_main.c:685:36: sparse:     got restricted __be32 [usertype] ipv4
   drivers/ub/urma/ubcore/ubcore_main.c:88:17: sparse: sparse: context imbalance in 'ubcore_uasid_alloc' - unexpected unlock
   drivers/ub/urma/ubcore/ubcore_main.c: note: in included file:
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:130:37: sparse:     got void *args_addr
>> drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:120:45: sparse:     got void const *args_addr
--
   drivers/ub/urma/ubcore/ubcore_netlink.c:33:13: sparse: sparse: symbol 'nl_sock' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcore_netlink.c:36:10: sparse: sparse: symbol 'g_nlmsg_seq' was not declared. Should it be static?
--
>> drivers/ub/urma/uburma/uburma_cdev_file.c:59:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cdev_file.c:59:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cdev_file.c:59:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_cdev_file.c:80:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cdev_file.c:80:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cdev_file.c:80:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_cdev_file.c:628:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cdev_file.c:628:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cdev_file.c:628:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_cdev_file.c:796:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cdev_file.c:796:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cdev_file.c:796:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_cdev_file.c:821:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cdev_file.c:821:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cdev_file.c:821:19: sparse:    struct ubcore_device *
--
>> drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:50:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_dev_ops.c:71:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:71:9: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:71:9: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:19: sparse:    struct ubcore_device *
>> drivers/ub/urma/uburma/uburma_dev_ops.c:143:42: sparse: sparse: dereference of noderef expression
--
>> drivers/ub/urma/uburma/uburma_event.c:102:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_event.c:102:20: sparse:    void [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_event.c:102:20: sparse:    void *
>> drivers/ub/urma/uburma/uburma_event.c:291:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/ub/urma/uburma/uburma_event.c:291:51: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/uburma/uburma_event.c:291:51: sparse:     got void *
   drivers/ub/urma/uburma/uburma_event.c:384:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/ub/urma/uburma/uburma_event.c:384:44: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/uburma/uburma_event.c:384:44: sparse:     got void *
--
>> drivers/ub/urma/uburma/uburma_cmd.c:68:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:68:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:68:44: sparse:     got void [noderef] __user *
>> drivers/ub/urma/uburma/uburma_cmd.c:94:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:94:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:94:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:147:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:147:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:147:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:169:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:169:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:169:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:190:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:190:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:190:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:217:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:217:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:217:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:246:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:246:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:246:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:273:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:273:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:273:44: sparse:     got void [noderef] __user *
>> drivers/ub/urma/uburma/uburma_cmd.c:296:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cmd.c:296:16: sparse:    void [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cmd.c:296:16: sparse:    void *
>> drivers/ub/urma/uburma/uburma_cmd.c:305:6: sparse: sparse: symbol 'uburma_jfc_event_cb' was not declared. Should it be static?
>> drivers/ub/urma/uburma/uburma_cmd.c:317:6: sparse: sparse: symbol 'uburma_jfs_event_cb' was not declared. Should it be static?
>> drivers/ub/urma/uburma/uburma_cmd.c:329:6: sparse: sparse: symbol 'uburma_jfr_event_cb' was not declared. Should it be static?
>> drivers/ub/urma/uburma/uburma_cmd.c:341:6: sparse: sparse: symbol 'uburma_jetty_event_cb' was not declared. Should it be static?
   drivers/ub/urma/uburma/uburma_cmd.c:364:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:364:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:364:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:419:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:419:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:419:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:447:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:447:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:447:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:471:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:471:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:471:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:485:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:485:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:485:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:514:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:514:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:514:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:532:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:532:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:532:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:560:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:560:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:560:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:610:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:610:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:610:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:640:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:640:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:640:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:663:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:663:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:663:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:677:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:677:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:677:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:701:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:701:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:701:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:716:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:716:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:716:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:764:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:764:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:764:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:794:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:794:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:794:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:818:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:818:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:818:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:832:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:832:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:832:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:857:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:857:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:857:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:905:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:905:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:905:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:959:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:959:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:959:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:996:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:996:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:996:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1019:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1019:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1019:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1033:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1033:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1033:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1057:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1057:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1057:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1069:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1069:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1069:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1082:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1082:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1082:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1103:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1103:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1103:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1137:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1137:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1137:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1155:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1155:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1155:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1181:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1181:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1181:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1215:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1215:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1215:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1233:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1233:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1233:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1309:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
--
>> drivers/ub/urma/uburma/uburma_main.c:215:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_main.c:215:9: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_main.c:215:9: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_main.c:239:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_main.c:239:9: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_main.c:239:9: sparse:    struct ubcore_device *
>> drivers/ub/urma/uburma/uburma_main.c:321:19: sparse: sparse: dereference of noderef expression
--
>> drivers/ub/urma/uburma/uburma_uobj.c:95:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_uobj.c:95:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_uobj.c:95:19: sparse:    struct ubcore_device *
   drivers/ub/urma/uburma/uburma_uobj.c:396:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_uobj.c:396:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_uobj.c:396:19: sparse:    struct ubcore_device *

vim +183 drivers/ub/urma/ubcore/ubcore_umem.c

f6206cf05e28a7 Yizhen Fan 2023-09-11  170  
f6206cf05e28a7 Yizhen Fan 2023-09-11  171  static struct ubcore_umem *ubcore_get_target_umem(struct ubcore_device *dev, uint64_t va,
f6206cf05e28a7 Yizhen Fan 2023-09-11  172  						  uint64_t len, union ubcore_umem_flag flag,
f6206cf05e28a7 Yizhen Fan 2023-09-11  173  						  struct page **page_list)
f6206cf05e28a7 Yizhen Fan 2023-09-11  174  {
f6206cf05e28a7 Yizhen Fan 2023-09-11  175  	uint32_t gup_flags = (flag.bs.writable == 1) ? FOLL_WRITE : (FOLL_WRITE | FOLL_FORCE);
f6206cf05e28a7 Yizhen Fan 2023-09-11  176  	unsigned long dma_attrs = 0;
f6206cf05e28a7 Yizhen Fan 2023-09-11  177  	struct ubcore_umem *umem;
f6206cf05e28a7 Yizhen Fan 2023-09-11  178  	uint64_t npages;
f6206cf05e28a7 Yizhen Fan 2023-09-11  179  	uint64_t pinned;
f6206cf05e28a7 Yizhen Fan 2023-09-11  180  	int ret = 0;
f6206cf05e28a7 Yizhen Fan 2023-09-11  181  
f6206cf05e28a7 Yizhen Fan 2023-09-11  182  	umem = kzalloc(sizeof(*umem), GFP_KERNEL);
f6206cf05e28a7 Yizhen Fan 2023-09-11 @183  	if (umem == 0) {
f6206cf05e28a7 Yizhen Fan 2023-09-11  184  		ret = -ENOMEM;
f6206cf05e28a7 Yizhen Fan 2023-09-11  185  		goto out;
f6206cf05e28a7 Yizhen Fan 2023-09-11  186  	}
f6206cf05e28a7 Yizhen Fan 2023-09-11  187  
f6206cf05e28a7 Yizhen Fan 2023-09-11  188  	ubcore_fill_umem(umem, dev, va, len, flag);
f6206cf05e28a7 Yizhen Fan 2023-09-11  189  	npages = umem_cal_npages(umem->va, umem->length);
f6206cf05e28a7 Yizhen Fan 2023-09-11  190  	if (npages == 0 || npages > UINT_MAX) {
f6206cf05e28a7 Yizhen Fan 2023-09-11  191  		ret = -EINVAL;
f6206cf05e28a7 Yizhen Fan 2023-09-11  192  		goto umem_kfree;
f6206cf05e28a7 Yizhen Fan 2023-09-11  193  	}
f6206cf05e28a7 Yizhen Fan 2023-09-11  194  
f6206cf05e28a7 Yizhen Fan 2023-09-11  195  	ret = umem_add_new_pinned(umem, npages);
f6206cf05e28a7 Yizhen Fan 2023-09-11  196  	if (ret != 0)
f6206cf05e28a7 Yizhen Fan 2023-09-11  197  		goto sub_pinned_vm;
f6206cf05e28a7 Yizhen Fan 2023-09-11  198  
f6206cf05e28a7 Yizhen Fan 2023-09-11  199  	ret = sg_alloc_table(&umem->sg_head, (unsigned int)npages, GFP_KERNEL);
f6206cf05e28a7 Yizhen Fan 2023-09-11  200  	if (ret != 0)
f6206cf05e28a7 Yizhen Fan 2023-09-11  201  		goto sub_pinned_vm;
f6206cf05e28a7 Yizhen Fan 2023-09-11  202  
f6206cf05e28a7 Yizhen Fan 2023-09-11  203  	pinned = umem_pin_all_pages(umem, npages, gup_flags, page_list);
f6206cf05e28a7 Yizhen Fan 2023-09-11  204  	if (pinned != npages) {
f6206cf05e28a7 Yizhen Fan 2023-09-11  205  		ret = -ENOMEM;
f6206cf05e28a7 Yizhen Fan 2023-09-11  206  		goto umem_release;
f6206cf05e28a7 Yizhen Fan 2023-09-11  207  	}
f6206cf05e28a7 Yizhen Fan 2023-09-11  208  
f6206cf05e28a7 Yizhen Fan 2023-09-11  209  	ret = umem_dma_map(umem, npages, dma_attrs);
f6206cf05e28a7 Yizhen Fan 2023-09-11  210  	if (ret != 0)
f6206cf05e28a7 Yizhen Fan 2023-09-11  211  		goto umem_release;
f6206cf05e28a7 Yizhen Fan 2023-09-11  212  
f6206cf05e28a7 Yizhen Fan 2023-09-11  213  	goto out;
f6206cf05e28a7 Yizhen Fan 2023-09-11  214  
f6206cf05e28a7 Yizhen Fan 2023-09-11  215  umem_release:
f6206cf05e28a7 Yizhen Fan 2023-09-11  216  	umem_unpin_pages(umem, pinned);
f6206cf05e28a7 Yizhen Fan 2023-09-11  217  sub_pinned_vm:
f6206cf05e28a7 Yizhen Fan 2023-09-11  218  	umem_atomic_sub(npages, umem->owning_mm);
f6206cf05e28a7 Yizhen Fan 2023-09-11  219  umem_kfree:
f6206cf05e28a7 Yizhen Fan 2023-09-11  220  	mmdrop(umem->owning_mm);
f6206cf05e28a7 Yizhen Fan 2023-09-11  221  	kfree(umem);
f6206cf05e28a7 Yizhen Fan 2023-09-11  222  out:
f6206cf05e28a7 Yizhen Fan 2023-09-11  223  	free_page((unsigned long)page_list);
f6206cf05e28a7 Yizhen Fan 2023-09-11  224  	return ret != 0 ? ERR_PTR(ret) : umem;
f6206cf05e28a7 Yizhen Fan 2023-09-11  225  }
f6206cf05e28a7 Yizhen Fan 2023-09-11  226  

:::::: The code at line 183 was first introduced by commit
:::::: f6206cf05e28a7f455850a4e2de8162890f50073 ub: add memory map api in ubcore

:::::: TO: Yizhen Fan <fanyizhen@huawei.com>
:::::: CC: fanyizhen1995 <en_0015767@163.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
