Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9203164CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014759; cv=none; b=MZDZS8geEM72QnTXM35ApkM4fAm6gHZLkl1J//XIN62Lt5fTzUPFTefVZO1jDSWJdHSCfM9pIGzSiAZ8lMV6vG2aqFWzzpuoFWR18YD24RUQBK2tpdyNcjwc3Yq3KmgrEck9PCVJnpACm9pArkSvZC7UIi9E2A72nfQ+PBVLOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014759; c=relaxed/simple;
	bh=w+0xVTyscufnQlm3/9j1d/7cQmu5kEhzIlYkSoEw5fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CEnmsojvVjQIfzXj8+Z0R7RLbsX3gZDtQ7C9Rv5tKYFHLoJn+ZQLDDaY7bCSCYIYeC53O6ZnjW9vZtXoeTWDvHgw+V5NXpDXutL7hawcmb6xFhm0EHtUP0BCcAi/sBdTpbidGhoTxFSZpYUBdzWLtN5mi3VRGO5epYkdoYo5/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lE8UUe63; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lE8UUe63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767014758; x=1798550758;
  h=date:from:to:cc:subject:message-id;
  bh=w+0xVTyscufnQlm3/9j1d/7cQmu5kEhzIlYkSoEw5fg=;
  b=lE8UUe633BN3BNXwHAmR+p4VkYbKurjRMqt045MgHaWpOZt6unmv/M+h
   5GNjavYVmmZ21opQSlalKl/U4FwdpJd0gNpB3uucsnFjocKqmHV5fKrVs
   beXgEV7kJ8zYruwsfePzvxYgwNchbMWt78qpqAG52rkmjkkFsrqgZeqgW
   KPjKyNKS8ccjWhcQ1sU0oybzWk4nczHB++MI/LYjLj5PjjI0MopA3Seye
   1opMS9lj7HaJY+KfX7hL/U4qJbGzla7ZUY+mwHPxl+KOBqn3n0ij1qu/v
   pCLnBx83Lzdq3QYsW4HEwfTrVeV9PGZ4lEsOPDNzmkx8RVL3LwnY88ZfX
   g==;
X-CSE-ConnectionGUID: 6LvnuOJlQWyooaSh2Cg7tA==
X-CSE-MsgGUID: Lgz2iIUMQU2B2wZtRvF8IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="56194040"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="56194040"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:25:57 -0800
X-CSE-ConnectionGUID: /3KF+KZPTmedBkvPLnvjuQ==
X-CSE-MsgGUID: lRt/qFv/TGWaVYQckoA/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205820425"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2025 05:25:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaDFx-000000007Fh-35fK;
	Mon, 29 Dec 2025 13:25:53 +0000
Date: Mon, 29 Dec 2025 21:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/12] checkpoint.c:undefined
 reference to `__udivdi3'
Message-ID: <202512292152.SLZV8J6g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   38316221f39afd9be305c1a9d7de368ac7d10a74
commit: c9ba65c570f4537bc2afbb66eebe7f04022bf71f [1/12] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
config: powerpc-randconfig-001-20251229 (https://download.01.org/0day-ci/archive/20251229/202512292152.SLZV8J6g-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512292152.SLZV8J6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512292152.SLZV8J6g-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/f2fs/checkpoint.o: in function `trace_lock_elapsed_time_end':
>> checkpoint.c:(.text+0x2558): undefined reference to `__udivdi3'
>> powerpc-linux-ld: checkpoint.c:(.text+0x2594): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
