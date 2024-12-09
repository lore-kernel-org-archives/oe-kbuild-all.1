Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5A635956
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733763125; cv=none; b=d4vb5YFQYyhJ9Er52Iim84ge93gYH/43QFlPn5rGaUhZk+BzZwxig4+ywy9EhEuRlLSC7T9caLxN8CbRmojOW1kWKDzPM1sdwxWrka51lbjJP/kutqWaKImJ++cdreXWShJFjnID7FHu8joVGCE9GWQoKy4b4nAUc+Pci82/OPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733763125; c=relaxed/simple;
	bh=jq12/amA8Bkfrvm+ajVXrdqfGy9HDE98rfJfU7znxfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pbT/Uo3p3T3Jm4e+7ZKPnqDudQsp6Y/htd7qX6FhJvvAL/nNLKIzQA8bjxH2LJaXxp1tJFPiULhfE+mFGY91U9SMnb0YiswnH5WdKkDslJHr6WCKwHp4sj3sRG07JPih2PbEacdQXYQG1vQ4nMS1eu2Ya6lIUYNVN0/j+PolLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcERDs3z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcERDs3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733763123; x=1765299123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jq12/amA8Bkfrvm+ajVXrdqfGy9HDE98rfJfU7znxfM=;
  b=ZcERDs3zx+/7L7ArzawZQ1hMFsr/N9I9gqb2lgIyetg97hmkiRq7lrqL
   Ew/1Zi3zeTi5NoQctAUTYn2eMvbggCR2cBoMeHsXnQvKXODHIjp6fILIN
   DW73Ai6+Macq/kN//NjoD0wQrGfY1exc0oBfCi4Fl2VJioCy0I1fSYoB1
   wg/PDzFUeLu+S/OWlm7bT5byC1Qg2Lif1DpDiM7ArcqmeU7tRoKtUB6Jp
   DfGxYST6wW5Ehxnt6UK8FbeGr7fFgEbZ5iAKHgP69WZIYK0QEfMBnHewr
   2AD/Urv9dKB0Re7UXaVGHX2lUoNgaSFsGje954C0DYcA/P9sZRJJohFR/
   g==;
X-CSE-ConnectionGUID: GhVL74iqTba67xuXGDCUng==
X-CSE-MsgGUID: Ger/wRgKTLKW/bBse4yH1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56554074"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="56554074"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 08:52:02 -0800
X-CSE-ConnectionGUID: BL9jY/VWSHepYtvOQNzBPA==
X-CSE-MsgGUID: PgCVCzqyQbS3jmHaJW7dNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="100085027"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2024 08:52:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKgzH-0004cj-00;
	Mon, 09 Dec 2024 16:51:59 +0000
Date: Tue, 10 Dec 2024 00:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.12.06a 51/54] ERROR: modpost:
 "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202412100025.jKNqFVCT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.12.06a
head:   f63522f041948f5f7f0f9720e944e1f62bdab03a
commit: 53d1f60964efe0a700c81ccf72a1094efe279e9e [51/54] rcutorture: Include grace-period sequence numbers in failure/close-call
config: nios2-randconfig-001-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100025.jKNqFVCT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100025.jKNqFVCT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100025.jKNqFVCT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__mulsi3" [kernel/rcu/rcutorture.ko] undefined!
>> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/scftorture.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/fat/fat.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/hfsplus/hfsplus.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/ecryptfs/ecryptfs.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/sysv/sysv.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/affs/affs.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/romfs/romfs.ko] undefined!
WARNING: modpost: suppressed 725 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
