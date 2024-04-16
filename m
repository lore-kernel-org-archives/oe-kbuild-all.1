Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A99112C476
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272011; cv=none; b=DM67sP85L675OPd3urYX/sWZXay2SmKv+HFY7261F7s5GiZMa4Zk6aUBm1OL8q10GHEnXoeiWlsPcPB4UXkvoiObIdoEOfd9IbSgotLelAciGrNXm3maaL4y77Dsurk6h44PEiyU1BLzk8kmhIR79HomfzWRyKE4KhHY93X2+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272011; c=relaxed/simple;
	bh=oUZDtFTiJvy70PE4y1dBgF/R67lGfPneBJ50SXyhBew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7Osu9D7fLlFQ6Nam8M1bTuyolY6i91E+GiORI175iBSPFWvdqSebn/5eVOW0aZK+zyypaIY1wLd1Kt58AYqcQYsPW7C974GxI37oSOgPiM9tFrQaP4RqQ2MaTnYjHJvCVfXQVJY7T45I8EHtGVNxB/T7U2C9oXHuZqfhCqz/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FclcK0tV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FclcK0tV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713272009; x=1744808009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oUZDtFTiJvy70PE4y1dBgF/R67lGfPneBJ50SXyhBew=;
  b=FclcK0tVVBi1qw7BZhbHFxNZHcgBHjkqZvOmZtDJW1G2C6WcXUQbfPnb
   W7XXs50EDdjasglLB2gqLaMPFu7n6cXL76nVcQq9euaQSx78iBIsXJd72
   zWVX0WamuG9XFMR2Vz+xCKnFiZnu+zDFCQKud+oE1a7qjBlX39nN/vPYy
   QlYoJ8RVqzQZbTLeUfVm4ZqMClhNjdWSOXs3wojL/73xtIlftNJDffYtB
   WsbhJRBG36lLQFyF1Yxry6n2y1LQZB3dflbP7Ut9SD2BC2U/3KNP3eKNo
   7kkZMtXiOhJWvq4aZ3ZMEYBza24+0mrvn8CbzXHtRBraXYkp5uG5uFQoi
   w==;
X-CSE-ConnectionGUID: 3myAl6aTSCOV42lERD9OdQ==
X-CSE-MsgGUID: rv+EGlSMRAOQ3GWPi+zwzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8817795"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8817795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:53:27 -0700
X-CSE-ConnectionGUID: G3rkTzrJSpW1yJ74fH773A==
X-CSE-MsgGUID: lsQN5P9FTwCY4Zc43QXlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27046534"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Apr 2024 05:53:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwiJP-0005HN-2i;
	Tue, 16 Apr 2024 12:53:23 +0000
Date: Tue, 16 Apr 2024 20:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenxiang <chenxiang66@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7345/7439]
 arch/arm64/kernel/cpufeature.c:2209:57: error: 'enable_pseudo_nmi'
 undeclared; did you mean 'enable_percpu_nmi'?
Message-ID: <202404162024.n82VbpYr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ba2303cacfdaf39c19a78290c541499b23712f54
commit: b8c8255e1d74937638bca666264404952c60395a [7345/7439] arm64: Decouple KVM from CONFIG_ARM64_NMI
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240416/202404162024.n82VbpYr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162024.n82VbpYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162024.n82VbpYr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c: In function 'use_nmi':
>> arch/arm64/kernel/cpufeature.c:2209:57: error: 'enable_pseudo_nmi' undeclared (first use in this function); did you mean 'enable_percpu_nmi'?
    2209 |         else if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && enable_pseudo_nmi) {
         |                                                         ^~~~~~~~~~~~~~~~~
         |                                                         enable_percpu_nmi
   arch/arm64/kernel/cpufeature.c:2209:57: note: each undeclared identifier is reported only once for each function it appears in


vim +2209 arch/arm64/kernel/cpufeature.c

  2191	
  2192	static bool use_nmi(const struct arm64_cpu_capabilities *entry, int scope)
  2193	{
  2194		if (!has_cpuid_feature(entry, scope))
  2195			return false;
  2196	
  2197		/*
  2198		 * NMI support was not enabled in the kernel, but can still be
  2199		 * used by guests. Let the world know.
  2200		 *
  2201		 * Having both real and pseudo NMIs enabled simultaneously is
  2202		 * likely to cause confusion.  Since pseudo NMIs must be
  2203		 * enabled with an explicit command line option, if the user
  2204		 * has set that option on a system with real NMIs for some
  2205		 * reason assume they know what they're doing.
  2206		 */
  2207		if (!IS_ENABLED(CONFIG_ARM64_NMI))
  2208			pr_info("CONFIG_ARM64_NMI disabled, using NMIs for guests only\n");
> 2209		else if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && enable_pseudo_nmi) {
  2210			pr_info("Pseudo NMI enabled, not using architected NMI\n");
  2211			return false;
  2212		}
  2213	
  2214		return true;
  2215	}
  2216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
