Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7EC33506E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615402; cv=none; b=Vmr5r22y0Fd5/rHr0Px4H3wAHj37n+v/ZLHFn6o6V9bJZkS8saP7WAJM8DKjPzuK7wNYA8SAtwzcEXuqTFhwWuzXswgLO6bJS9TdVZuxsVLKDffqoX1SznY+bxDC2CK0hOZQH9QEzNQa91+7Fw1IouFknvVDC6puZnsJ38KPUIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615402; c=relaxed/simple;
	bh=6EZ7s4U5fZb6m4DHfRe2YZ01qgoCTuqTyDnWJLf4wl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AWsGuNXxCm6QnTvEjtOfEDMQV9G3X7NLFnC6XsZRalqzXsGS2TBrKHTujt55WusgrOtJYMrqXwKCoIpuWcb37M7wNcoZ9N8C+ulrqzuw7ZUTJjdf0vMm9ZRser2/11wZyozOPPPw/phmvLq0SF4lnz+wibtECFuM6Z1+/5mjQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW+DaCUE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW+DaCUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767615400; x=1799151400;
  h=date:from:to:cc:subject:message-id;
  bh=6EZ7s4U5fZb6m4DHfRe2YZ01qgoCTuqTyDnWJLf4wl8=;
  b=hW+DaCUETXrjxw5drXWIgrjIOWfdYn05zOcsMezOOawlOOCGrMaMhoqo
   5k9Yw+qaguMPMMcGnV0aZhmrhjlIe7ALOVR6jfFZ27Oc4QVURVMXINgPU
   IDy0cVkfqosj6dOR97A3D7Xtq8zW5EYZK6Iyd58pgW06oUwHz3ksUayz/
   QdUKYcShuN3v/AQUQ08oqz28beMhDJYRHAkpR7NKXbxg2RDVJtM6GFuHN
   bfrGId0TKmbCLC4Jn/XJenZkEXsnU0j/OrSgXDsO0gF895clmsl0jcz5+
   Xwmi3bS69yCsOsUPKKtcPZaFuRuHiAtXK8oDlwN7Zjy6BBf9aBSe3lPrH
   Q==;
X-CSE-ConnectionGUID: rNTu0jgySz6mXEZ5HPZb4w==
X-CSE-MsgGUID: 0oadexdsSZmFW23N8x3m9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72826104"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="72826104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 04:16:40 -0800
X-CSE-ConnectionGUID: FvsSgSXvRKa5qN0Y6FrsXg==
X-CSE-MsgGUID: L13O9KrjSISDSaVi1Ppj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201613764"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jan 2026 04:16:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcjVk-0000000019V-2Y4b;
	Mon, 05 Jan 2026 12:16:36 +0000
Date: Mon, 05 Jan 2026 20:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/pcp-blkd-v4 1/19] kernel/rcu/tree.c:228:12:
 warning: 'rcu_exp_gp_in_progress' defined but not used
Message-ID: <202601052055.AnnQJO3J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/pcp-blkd-v4
head:   965239d9158d7653f792ada5ba9ee7e77db0bb78
commit: 2bc54c8a681557d17dc1ad9b0824067d1534242f [1/19] rcu: Add rcu_exp_gp_in_progress() to check expedited GP state
config: riscv-randconfig-002-20260105 (https://download.01.org/0day-ci/archive/20260105/202601052055.AnnQJO3J-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601052055.AnnQJO3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601052055.AnnQJO3J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.c:228:12: warning: 'rcu_exp_gp_in_progress' defined but not used [-Wunused-function]
     228 | static int rcu_exp_gp_in_progress(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/rcu_exp_gp_in_progress +228 kernel/rcu/tree.c

   223	
   224	/*
   225	 * Return true if an expedited RCU grace period is in progress.
   226	 * Similar to rcu_gp_in_progress() but checks the expedited sequence.
   227	 */
 > 228	static int rcu_exp_gp_in_progress(void)
   229	{
   230		return rcu_seq_state(rcu_seq_current(&rcu_state.expedited_sequence));
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
