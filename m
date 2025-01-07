Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2919D8A7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243679; cv=none; b=hdxUti4DWmYnrPMVykA0cZZNf5SbzvWCTyDiCVgHAaMh3YpkNUhoPCgLEcNLuAvmfmP0yAlKlv+CbGqDOqgaz1nQfXonqaDfWbhkCin12Lh6l4BSfRk2qSoGJjR63ta5lApBP2fhHfh4LznNsxl8hBzHm2aYPXciFeefCP1Bz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243679; c=relaxed/simple;
	bh=q90kgAnJMB041lyYzIH0SMLNvnViplVcI3ADo/QF5q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DC4YO78mHdVa4MeFnsNxy30SFX4v1Azq7BD1s1S4l1Xf6PTEniZEXl/QfvBtSfxvTXE62o+tPPOAsPxC6mTaHPmo3WGU6Y7CBG0E+GPu+cStYfj0vLPO0MoBygN53xZsIrTxx+HH/2xYq1moz7Q55ZU0Ae91Q7/FLIMpylO1m3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYzzkN0t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYzzkN0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736243676; x=1767779676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q90kgAnJMB041lyYzIH0SMLNvnViplVcI3ADo/QF5q0=;
  b=KYzzkN0tn33hlYda56zckmR/qqFbDBy7W9rNd9BfhdZr4932rKKhClqL
   LiLLJU0IzDpKT3PFppm+u79he9cFOjjjBUwmJm3r/2Gdqaf1X9pn/cCZk
   Me/KF2PCE+DEc9mfNeJzGZX4VVpsaCCYlyocRxijBTStu7QKhkF8JB/aO
   v5Ur3zwALzA6pM8wFEDB9I/qy0gxNlZdqDUgfQHToMr9ia1m74EJLf7JS
   8Wfu/SlWAsEqr3wFot5LmRJ24VHuImGS28oC2DKnPwyZ7nJSjg654d22U
   ukJptLVWrM9BYKciBKRyDBtSj578balmsWkRZhKFyr9OCykQ3ervok0E/
   Q==;
X-CSE-ConnectionGUID: +GHz6swLSHKpkoWrHPZaAg==
X-CSE-MsgGUID: LnIcE3ISRmeRgXOJw/+iNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="39241859"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="39241859"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 01:54:36 -0800
X-CSE-ConnectionGUID: ftkOhdeGSYOC3ZXJ7aewuw==
X-CSE-MsgGUID: wiz3AR6FQ56a6YoMonf3Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106743761"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 01:54:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV6ID-000EWZ-03;
	Tue, 07 Jan 2025 09:54:33 +0000
Date: Tue, 7 Jan 2025 17:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2656/2656] kernel/rcu/update.o: warning:
 objtool: synchronize_rcu_tasks_trace()+0xde: unreachable instruction
Message-ID: <202501071757.EREnWTHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9be6ae394c896999214be0f875765d2c58d15b13
commit: 2509f2079e7247ed0d695bdb69c3d019a700a4b8 [2656/2656] rcu-tasks: Make rude RCU-Tasks work well with CPU hotplug
config: x86_64-buildonly-randconfig-006-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071757.EREnWTHH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071757.EREnWTHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071757.EREnWTHH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/update.o: warning: objtool: synchronize_rcu_tasks_trace()+0xde: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
