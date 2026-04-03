Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C51A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206022; cv=none; b=o/wktYyZssN0mUPAf21MoQdEiv/Y5bqfhr0b/2PU9VeAmHuzgXZVdAfx+DibJlx+Z4XmTBdhmmTri+1Fv2cq9ueu35scAund+Rh6KccyqcQrFZ04jRmHMEFn40K/5rtWeBrjy9HHRbMZUQuvr2QPB/51bFuJGig/upNvt8d6FUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206022; c=relaxed/simple;
	bh=k0DlbEPizqqye4S/Vi7gfI7ECC3ugzozB6mhP4cQ9kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TUgio4dx7I2++qqg1LM4x+uvWyQcY/OQM2BC1wjZdoIdnEciyb5NzMlcrYh0pktdC2bmIz/FOEhO8yyxhWltzCC/261j3awQoSU+R5Tk9u7f23lH7Pm+5WhaXhog+7FTeHDCE7jUWkNC1aq6eEYhFUvC95ohwArl9sK/93GYVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7im8+3j; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7im8+3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206021; x=1806742021;
  h=date:from:to:cc:subject:message-id;
  bh=k0DlbEPizqqye4S/Vi7gfI7ECC3ugzozB6mhP4cQ9kc=;
  b=c7im8+3jgA2403jDg6128WJas+qHv5ys5GrsXtp730Jp3E8ox9ZlS4MQ
   c//ZvqeyX2jFeVrBf6LUZS44aox6oNUzerYvQMURyEiap8G/5pRV9VEcm
   BEcF3fDiEm5dzqf0EcrNY/+qpglhRRSEQC5L9H1gX4dTuEgEYsBDeKmby
   d6ErIvJyrYX34VaOl1mZx+8Dm+Qq5QJt22lOD1HS8HgzUl7eRMHK+ulem
   wtPNOcQAH53WHE8Ge7spqG1PALPixNkU5ld2d97a40tCJ0bHlBJ3J7YzB
   oJaPf8k+qCSB4CNMplE1SHTqa/wS1A1+XjB1bP1SDB/HEGVQjP1rUbf8Y
   w==;
X-CSE-ConnectionGUID: cHI/1P23TciXjFs/bGNClQ==
X-CSE-MsgGUID: zRrtk8cVT2aW9NJgHbOK+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889128"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889128"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:00 -0700
X-CSE-ConnectionGUID: o2l/fDCQSJCNeoiYJl5ARg==
X-CSE-MsgGUID: elSojqEqQWumc9Dh0iqn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="231605129"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2026 01:47:00 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016f-2tL1;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/8] kernel/fork.c:1291:18-25:
 WARNING: kzalloc should be used for mm -> abi_extend, instead of
 kmalloc/memset
Message-ID: <202604031422.jy5jLzfV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5e515a3e6a73395e13127a3a8172e77da3d9b30
commit: 5b6cecf56c7250013e532423509fd9aa77e53456 [0/8] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: x86_64-randconfig-102-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031422.jy5jLzfV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031422.jy5jLzfV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/fork.c:1291:18-25: WARNING: kzalloc should be used for mm -> abi_extend, instead of kmalloc/memset

vim +1291 kernel/fork.c

  1277	
  1278	/*
  1279	 * Allocate and initialize an mm_struct.
  1280	 */
  1281	struct mm_struct *mm_alloc(void)
  1282	{
  1283		struct mm_struct *mm;
  1284	
  1285		mm = allocate_mm();
  1286		if (!mm)
  1287			return NULL;
  1288	
  1289		memset(mm, 0, sizeof(*mm));
  1290	
> 1291		mm->abi_extend = kmalloc(sizeof(*mm->abi_extend), GFP_KERNEL);
  1292		if (!mm->abi_extend) {
  1293			free_mm(mm);
  1294			return NULL;
  1295		}
  1296		memset(mm->abi_extend, 0, sizeof(*mm->abi_extend));
  1297	
  1298		return mm_init(mm, current, current_user_ns());
  1299	}
  1300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
