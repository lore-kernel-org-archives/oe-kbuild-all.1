Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF22B9A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724968; cv=none; b=Ba0E5s+iUFBJaEhYABANn0ojFgYeYBlcp+T3Kew3LqHMpihieeujxxbLPKS1P1hpkjXwaz2Fe8558GS6LCfjNObeSvw2YavNUTbUUpND13BWvlEvE19rNuJZQv1ng7JPlQvNd98aY++Q96nvxk3VSqkHipCSnqPqaIcGU3W30ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724968; c=relaxed/simple;
	bh=V9DCk8G6w4SsBWrUZhKjhvBbGgaGyqptGWHM/uWwQn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPWSUEuL0tvyY6Rxe6/WhG13D/2tCiaM9j9+iJH0050KjZu0Hr/bnwGBpdPtUIaig/umLXHInY7NTBOQziq7/PC0NziPZzSS+TJK7ZJHT6FcCHPeWWnr4fL046yAcaaTz+W2xTBT/xTqnG4Zyq1vBJmnEJ90DE76MO7SidZ8EBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWfGPtBF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWfGPtBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757724966; x=1789260966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9DCk8G6w4SsBWrUZhKjhvBbGgaGyqptGWHM/uWwQn0=;
  b=MWfGPtBF73ec5/tNba7L69NHwv1DVB9LLx7gDkIfIqNIy50eZ7dH0SkE
   K7tw5aGBH9YALEUlYhVyDqmNePldHEvhuRA/qPo8Er9vcfvkQMdkWesfO
   QMLIDD2YKBifirRk9b8UvzgsO+YI2RJHoOAgI8oN4hRmMKPObQZaNBP6E
   7uvmIXn8f/35pYlASpFNFvrvaoH3IR1yMa2FOwJO3UtcCs6UMeYUn1LHy
   vE60BecouApbOB/sfziV//s1VRRW1wt1c6nZGJNXYzKuqQELTvcjIpZGe
   aNXbZ3OPBKa9GXp2J3NtdRGXDkx3zS9oxYQMgJoSDtS+Dcsg7WZWW255T
   w==;
X-CSE-ConnectionGUID: AwPAUJP/TlSy8q6KPeXwTg==
X-CSE-MsgGUID: bOiqvO5tS6mALu6M5ELJBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60145503"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="60145503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 17:56:06 -0700
X-CSE-ConnectionGUID: apMgQPtqQACtacKsTt6IJA==
X-CSE-MsgGUID: gqjp9bUGRfqy7gKCBmS+zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="204911401"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Sep 2025 17:56:05 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxEYW-0001Ho-3B;
	Sat, 13 Sep 2025 00:55:59 +0000
Date: Sat, 13 Sep 2025 08:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 30/34] WARNING: modpost:
 "rhashtable_walk_start_check" [net/sctp/sctp.ko] has no CRC!
Message-ID: <202509130838.7VnCmcpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   3ef29ea9bb447fcd2164b0d944add4b1757343cb
commit: 15458e4681ac411bab9c1b8aa1a0994b3fbf9735 [30/34] rhashtable: Enable capability analysis
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250913/202509130838.7VnCmcpQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130838.7VnCmcpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509130838.7VnCmcpQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/vxlan/vxlan.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/act_ct.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/cls_flower.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netlink/netlink_diag.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_flow_table.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/sctp/sctp.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/rds/rds.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
