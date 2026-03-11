Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9537C3E4C9F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253611; cv=none; b=QJvfw/su+P8sQqgpMzO64xnR+S+1dV09jnkvN4oVqM1JGj0hfo5VDe4RNXlJzLVL2cBxjV0K4MZgNzSaTl7VH0Zjvu8v/+WgNKlNQhXE8VffZJu9mSqkdiiORnR0DhQpHJ/lhgtsMCkhk6rMdROVYocwV+sEmZx0zetm9bKtiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253611; c=relaxed/simple;
	bh=cDeWJeIYdUqm1WB5oWtw1Sre+cCyZwe2OXxy4ajcLZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWND4v5pSA2xvamXCQabbSzINTlOgCF2NJs7N61kH6nb6GAp5ClFgNqWZLpJcaqF4hFeexGMRU6R28dPjxZYJLsr/e+5+C4eI0MA13CAUvMiCvheVfkbhS/DF5btnV32RCL2lhVJ8t1O9nHeOIuoE7sgRQ6AjvZqM6Bde6qpxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA6KmeVU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA6KmeVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773253610; x=1804789610;
  h=date:from:to:cc:subject:message-id;
  bh=cDeWJeIYdUqm1WB5oWtw1Sre+cCyZwe2OXxy4ajcLZI=;
  b=hA6KmeVU5MQazYehmPw8x3Kwyqj8/2zblb4tJzxHg6pjYfAGBn+04SnR
   MtMvFl0opFssnzArCudkGm1yrLK2JSeOJAHj/bHf1Ryvt3BiEEBh5y3Pl
   gGN6/duOXJjS/VdREgPTvulb1+vfDm3W3+aFB+dZ/eidvsdBf3sSyDNXI
   q9mJ2fdCahqp5kFWuKkKad3ZteY5cArIc69fN+tfbUyqA4RRFDaXRta6+
   EV8K+5t7u1T6Hwjludhhna0q9xkSimqrB2fLcINmAT1YPQUes1EtX4ukk
   FW25GDQWvvYFQWwv049LBbQqkRRh1TxMgz2nIJMlIobWkDcJ+tpJFs4uh
   w==;
X-CSE-ConnectionGUID: S9nWhU6FRX29ptvePeSihA==
X-CSE-MsgGUID: u+lLhmbkQbuK6rQhdJUxyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74414701"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74414701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:26:50 -0700
X-CSE-ConnectionGUID: yxeDpDTJRf+8MvNh4LnrWA==
X-CSE-MsgGUID: LI/GpimgQrq+2qkOpITATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218030618"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 11:26:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0OGc-000000001a3-3LB2;
	Wed, 11 Mar 2026 18:26:46 +0000
Date: Thu, 12 Mar 2026 02:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/syzbot 3/3] Warning: fs/f2fs/segment.c:1883
 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'
Message-ID: <202603120204.iD2QhSxJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   17fdc33a1b6d3096e7f1788c4c45e412f3919dc6
commit: 17fdc33a1b6d3096e7f1788c4c45e412f3919dc6 [3/3] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260312/202603120204.iD2QhSxJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120204.iD2QhSxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120204.iD2QhSxJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/f2fs/segment.c:1883 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'
>> Warning: fs/f2fs/segment.c:1883 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
