Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1C242D87
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 23:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765150059; cv=none; b=BBkxh8IakG7qshtbXA3DMUxScjuAqibwrTyCkVXA/k3IZ3bDzxpjZGd3pJF5CP22a2573iegKNkzLSy7Ms4ih2i2nEMMisOFDt4DoSSO1ZtQDMmOl7IM+adYsKV9KFMJT4qMKL8eQ/5XFT2NQhLIxexZ4OYWZgrm3Un3BWdvh4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765150059; c=relaxed/simple;
	bh=3N8nQ47BbPIIGXT1mQ26RkuMRp7sDM1yWGXy9/9CX1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQBxg9N9/5w/kVN5sG6GEOzvRgBf3JDlQZRxIpQrv/b2sJO3l7PNNsurnvXbFqUwJwVWIs32WMbX2jHOWsoVlNjtqImtI72gFELXMZ7JF1QFguLzkFj1ZrmmxscCadUGfjbskhebST3xh0azoyQHegLLC4HV8Bw2TS5eIRDg+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re7Uz4mq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re7Uz4mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765150057; x=1796686057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3N8nQ47BbPIIGXT1mQ26RkuMRp7sDM1yWGXy9/9CX1I=;
  b=Re7Uz4mqf52eSPubCY20ZWCxnwHnCyXTieP3V7GOBigMfGscrce+7Hpo
   n08r2vHrErKh/cW701E721/3oAVizzDWL5OkukKQon5Jytk3MCJVAkALI
   3CFFFE/TCz8rDS18fps5xrvif3FFhnKnFRcBnez4bh/dT9X2jKBcOSvLR
   ApKrqyG9kP5mY6T4gKT6g5/bLJ7lXJxsGvLZnSB271W4mV8rvGeYJyUtX
   CstHraWiO7ehNZhSO7N1FXFeIb0qBLR6ksHVYJz528pNJvxuNtmdmamiF
   Gt0Fa9VoUq6XY9N10TbIilaJii3EBQXIJQR4d127Ud3JwMRAeJfMe5Zv7
   g==;
X-CSE-ConnectionGUID: ek7bxPYNRxmjgOea4A+PVA==
X-CSE-MsgGUID: xcj/yxmyQFSd5NNuXhbcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77780721"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="77780721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 15:27:36 -0800
X-CSE-ConnectionGUID: 3Qn6gQ6jR/K2xdkhEVAwog==
X-CSE-MsgGUID: OFcT4ENcREGd92Gu+0GY8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="196057729"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Dec 2025 15:27:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSOA9-00000000Jhz-2jzW;
	Sun, 07 Dec 2025 23:27:33 +0000
Date: Mon, 8 Dec 2025 07:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] kernel/xsched/core.c:189:5: sparse:
 sparse: symbol 'xsched_xse_set_class' was not declared. Should it be static?
Message-ID: <202512080744.dk0pGz73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 76c15076abcb100f7c1204bd1ef0ec55128d6546 [3482/3482] xsched: Add basic scheduler core support
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512080744.dk0pGz73-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080744.dk0pGz73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080744.dk0pGz73-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/xsched/core.c:189:5: sparse: sparse: symbol 'xsched_xse_set_class' was not declared. Should it be static?

vim +/xsched_xse_set_class +189 kernel/xsched/core.c

   188	
 > 189	int xsched_xse_set_class(struct xsched_entity *xse)
   190	{
   191		struct xsched_class *sched = xsched_first_class;
   192	
   193		xse->class = sched;
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
