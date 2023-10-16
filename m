Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993C168DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwT0yYOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697476752; x=1729012752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BDzTdVkQwOoukW8+zOzwtH9DWPgxje8XNxB2/G6L2V0=;
  b=jwT0yYOhQJIHuLEOg4vwV/PQ724NiZXbjVxejwN35bfRsOpGbhXULCE1
   eNmsJpQTkUTvA3g5TbsFi4AdMDNRiDYKG+AtGIdWURY73F2wMoorYNSlp
   9SguatnqAFrBkEwLPCCubXx13bGpU0vFMx0mBmIyIMx3tP/9PCJ2jPdmX
   lqgB5jVMgfavR44ieGPK1tqqYPSoztKSP9/ogRKxOirNF5OLzsbuIS1Tl
   dnGfh5D+IvGU9Jj1uXoB+P4K/ILdDsX0CEkQVSBmyRIWEocJAbzdXZmQm
   +AuUMyKTwoNrrQBxwrSea3BlFY4nSEwsALlhdoS9jg8giKywDJmVA0FvZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389458322"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="389458322"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872203917"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="872203917"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 10:14:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRB5-0008X1-1w;
	Mon, 16 Oct 2023 17:14:52 +0000
Date: Tue, 17 Oct 2023 01:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/cpus_have_const_cap 6/38] checkpatch: WARNING:
 Possible repeated word: 'feature'
Message-ID: <202310170137.9v4UZzTK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/cpus_have_const_cap
head:   e8d4006dc24e66105444715d6d5daa244aa2bdec
commit: 075f48c924be9e34816bb808eb66ba9105e75e5b [6/38] arm64: Rework setup_cpu_features()
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170137.9v4UZzTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170137.9v4UZzTK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'feature'
#78: FILE: arch/arm64/kernel/cpufeature.c:3334:
+	 * The system-wide safe feature feature register values have been

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
