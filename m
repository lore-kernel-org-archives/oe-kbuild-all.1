Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D0C2C6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457809; cv=none; b=omih9D+MRU9Grn7xb+OoFEUZtHTd5iCn5Q4Dj5+T8fx1e5ZELCo5QqGxMn+U3R4YmPET+jk/7HmPxi4LB1MhwHlGEibaLksZP8MHNnLigFGaQR1Q1vQlb6t8i9lwcMhU/fe+O9DNbNsxfxPiWvike/cjFMnN6GMCG66S64nagCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457809; c=relaxed/simple;
	bh=nZrJ7Jzyiw4c55/I+6vJw89Kae+bMqaj/qEpcWs+W0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPLLuc+42wYvaysh7blXXVZfca+hAU1ZewPm8aKJHLAnz7JcCajaf+GnFCkqh62HFcAc1kHCKfZNwz/0NbrjnmLwRWZomqqaUx8+2HYYwSszBe5bl1uFcZKhzKkRiueHzbVDal2B26iSHU0mCuLMPGnHQ2ajH6a8JOIaO/Z0+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbdZO2z7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbdZO2z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729457807; x=1760993807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZrJ7Jzyiw4c55/I+6vJw89Kae+bMqaj/qEpcWs+W0c=;
  b=EbdZO2z7oMqlQcnysObsA1fj63NRZmYH7B5I7tJvw1QOFUpOutAMazEx
   wqzTl/KLlIQ7WePwqGCPay+0pHK7YhlntWNJPkmPT9iSmKPyJj6SuhRHs
   CzCD82KWi3NcueRuywFbT/FYZHARPgSiWnxxfvtIY+1wA6ZZOF8fttlx1
   8GH4dTfcFKiNRKE/99pRNTnYvRiAYE1x+hbwscIHPHP9iPsdlHBr8nD+d
   PeZq7UwU9UwLSqetAUS/iwhbKMnN5J9Zzmc/XZGpgjgyA2Ztnta1MYhEI
   KcZo7rOmZYFAgMeEwr9uQ5l58NzIlW4RzDox7/RUuJvWeel2QjpQGuROW
   Q==;
X-CSE-ConnectionGUID: LeVlPxkmRP+WIOMO6BFOxg==
X-CSE-MsgGUID: U+gbWB89RK+FZ3OA934CRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="39518559"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="39518559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 13:56:47 -0700
X-CSE-ConnectionGUID: aLI3QVvpT7evHhCX3R1oxQ==
X-CSE-MsgGUID: lzz9ZD/MT2631fw+MJNPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="80154115"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Oct 2024 13:56:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2cyh-000QnZ-1C;
	Sun, 20 Oct 2024 20:56:43 +0000
Date: Mon, 21 Oct 2024 04:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 18/19] ERROR: modpost: "netdev_rx_queue_restart"
 [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] undefined!
Message-ID: <202410210457.DKnfK8QQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   2ddeede97bba995798be3e7a1ae9ac3340bec129
commit: e57d0662fc5083983efa9dcade6c992836a88cce [18/19] [NOT-FOR-UPSTREAM] bnxt_en: add debugfs file for restarting rx queues
config: i386-randconfig-061-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210457.DKnfK8QQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210457.DKnfK8QQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210457.DKnfK8QQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "netdev_rx_queue_restart" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
