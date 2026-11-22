Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360903;
	b=0IfcIkxBXJhW/ULhhuoiTL9A9x5sXdJEWu7UjUDiuoZDUSgNm3oxbRjHkrgJBBgiOCGC
	 MXeVXkYy+sRv019OcAtE7f4kcNp0YS/zc80SjAvxq5yIznLKJLiaJjh09Cgx8CjhLhldW
	 m/5BbTJkFpT+xXaTdlVCBolmbUkFLI4u5DQ/KiOYxW3DF9AsUXT4z942E1fnjmx0rZjDI
	 FZQOyp3gCG3/J1lh8bIzRE4SPl00QexmOr9c7PiLxBmtWW51C6KFCPsRSCokkIIrUDnC3
	 GIHzWrrfroDC+2hRsrMf35yVFiKu75fdmCWDgAR8lIWx497T7U60cI7rpbmpISx+dbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360903;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jMfdGTZBtxhsc/gm41UU9HyzhaaXIQlls77ZQT2GdSI=;
	b=JqWClPhfV4c4iPrYrhlOl7JHN3X6b7HJVrKiXNK1dLluVhloJ70YvwP/bHGSm3B1ZjvG
	 rV8yxR43W+ubKe/S6ucrwLUsWVUlZCA1h8+xgt5HgVfAIpPSZoCDqe/xwPIJRgRcyBh/j
	 w3mmyDLY0muaPJipDWr9HA7kJtir4qItQ6/kSu5T4GdLqsCVBqh/3fEoEn6qMy4XLSxlg
	 6r5wcCzhMveM/MW4BV/NgB+qmqkYlQ31JwEc2b+w+hw7pbmG1YHgNRX6pShMHqOItCwe1
	 mt1Nlp1dARlvLF7ciepFCW1xA3ieplvWQUh1NVmRl3BBcAMFPcAkBM97WKvN5+IZWZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f7MMm4Hu;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D41606A330
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 15:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D41606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f7MMm4Hu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795360903; x=1826896903;
  h=date:from:to:cc:subject:message-id;
  bh=UE+1Lz8PrV+7adH1qBlIdl9M2F7fmlt//UqL2jKQaSQ=;
  b=f7MMm4HuNCQLWwsSteMcyqtCs5ZnozfbtF1XvbZoF3VvkI0xFtd4a7Aj
   c14BnSy79ZkCAUNElrT+MXS1IAqCwxq/pmdWY6lutCs4rfSIcq8L7mCzP
   EyrC1ucWVeOtiVXPpOZy0aJ+mg2rRk5pZzuGssRiH1BYilKl+qR8gKJSs
   G1t39F2IixaLlEjq/yLyBOFnFEkU7LyAHf7xkQugYVt7f/cQW7yCZSkAF
   U7PY/X8tw0xJsvMqBDdZ4BPuTbGIE7/rNddNC25FZINtz9HgwEhJ8is9z
   Yl2D2gCnwABfrlbKB0s5xjzRVzbwNNjmvAYUtrjihNLZja+1L8U6Zms6/
   Q==;
X-CSE-ConnectionGUID: 7Wqoy32RSUSamR1RPRk+1A==
X-CSE-MsgGUID: 5dlUrloURlS/yKkz2v8OTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4220638"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4220638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 07:21:42 -0800
X-CSE-ConnectionGUID: CWS7Ej0rRbyo6HMx0MlxLQ==
X-CSE-MsgGUID: 4ExGE1N2Qo6aI2KvwGNcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11114223"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2026 07:21:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV9Nq-000000004Zi-31E8;
	Sun, 22 Nov 2026 15:21:38 +0000
Date: Sun, 22 Nov 2026 16:20:45 +0100
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:non-rcu/next 11/37] WARNING: modpost: vmlinux:
 section mismatch in reference: hazptr_torture_do_pending_init+0xa4 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <20261122161756.d8rKLd3s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/paulmckrcu/linux non-rcu/next
head:   393d8a50f7aca1cc5c0ed9d6d7d874dce0572ee8
commit: 8e1c104e58cce1bedbac083d7163d27d1b1c8ff1 [11/37] hazptrtorture: Defer release of hazard pointers
config: xtensa-randconfig-r2306-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122161756.d8rKLd3s-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122161756.d8rKLd3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122161756.d8rKLd3s-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: hazptr_torture_do_pending_init+0xa4 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
