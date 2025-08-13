Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7A2F60DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 23:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755129204; cv=none; b=SLCLCRZtc4kKvDHhqiupXuEL18YbIWm55ks2ZDXwF6FIi4MCT1FwnaZ8EqpHaKTXan226pmbmdLIvIH4Bh81LfShUSjP12cGPPPhjJPYEbQXoEuWPsqSM8RtdRtkVqA9+mc5jzmkaH+Pd4pJ5DrkOT9e+uAqP3vVBhb5WinGVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755129204; c=relaxed/simple;
	bh=ZZnS5JzilK+4H49kNKSO9PxwJOpXmzdt3G+XyxxTx2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZHyAlcNf1iqq0XjhR7J9gGoPn/p9jCKpvDxJiZ/HiD9dK/tCbNbyorLgp2a7wgxu6OI9YwEvkxb5STwaC2a3DnDlD4Y8gMhDytUoU87dzrOPsLPDH59NPGIuwcMgfV1f08INbDzUueLX63wuEfXnplPG0V0n4gA/VVpCgIVd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZSlM57s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZSlM57s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755129203; x=1786665203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZnS5JzilK+4H49kNKSO9PxwJOpXmzdt3G+XyxxTx2Q=;
  b=NZSlM57sDl3asNzN6T5AbkcjiUboGaB4N5oWhegbEL+MTG6+MGnTo5lN
   5JBQmg7RRDHi7uGyIWo8KdaZju90kkxwA1VnZ3xBfV4PFuPOHBrJdNcAD
   t+Dc/8d0b//goQjjmfjqm89aDWLE2Pntcaa6rCNPLpMo3qcwQUQAe8clY
   zh0eIsPX4UzHZjB6rlmSj8cA0hsiy0TnBKAUxULoePsWf8Yqp7krBNni/
   Nb8lAMalgbR23EFVv6o3W3JgMQWZNiGad6qJS3ggwSHrb1VrO/mPYtRw3
   SxZ6d0SyUEeZEKmAalZAKYy6ih1zYhf+K96iFIAQ05KG7zXk61jpekg9e
   Q==;
X-CSE-ConnectionGUID: jLFzAJACTq6EaeEblR6lxw==
X-CSE-MsgGUID: NBu4ADTZQGOONIfdwxXBlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56650311"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56650311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:53:22 -0700
X-CSE-ConnectionGUID: 3zDQC2OiTgCjDmPvp9aeRQ==
X-CSE-MsgGUID: ZizX9WK8TD6et50VdYUs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165828963"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2025 16:53:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLHT-000APg-0A;
	Wed, 13 Aug 2025 23:53:19 +0000
Date: Thu, 14 Aug 2025 07:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_trace_support_v1 58/59]
 drivers/hwtracing/rvtrace/rvtrace-core.c:110:23: sparse: sparse: symbol
 'rvtrace_bustype' was not declared. Should it be static?
Message-ID: <202508140703.ldawM9FB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   a186d4c58325610367072323cfc9a7d5cccc2fb9
commit: 104110a961b85c44d345281031f8ffd908b09724 [58/59] hwtracing/rvtrace: Initial implementation of driver framework
config: riscv-randconfig-r112-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140703.ldawM9FB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508140703.ldawM9FB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140703.ldawM9FB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/rvtrace/rvtrace-core.c:110:23: sparse: sparse: symbol 'rvtrace_bustype' was not declared. Should it be static?

vim +/rvtrace_bustype +110 drivers/hwtracing/rvtrace/rvtrace-core.c

   109	
 > 110	const struct bus_type rvtrace_bustype = {
   111		.name	= "rvtrace",
   112		.match	= rvtrace_match_device,
   113		.probe	= rvtrace_probe,
   114		.remove	= rvtrace_remove,
   115	};
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
