Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A6F1802E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0t8mbvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697829268; x=1729365268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68PVms9UhNT3JXzvyKN/TKG+5jEEnsh6KF+Gkr3kbl0=;
  b=m0t8mbvRLmeiRpICPifx1TxHrqINjMGhlgqz1TYPTiZFoHlsEj1i3lKO
   XkwEHFqHmV/12tqWRsjpC5WfmYk2iFTD7eiwl/zMDsuXXMy7WJojsEteC
   dQG63gYa5lZ7xK305XpzcIctZCwVDj0xLc/SHPUsTdvnmTVxcQZvffE95
   WpNektIXOS8GXi5X7tx1bYa5ugdbm40wMrW23RROf4xYf6l4aFiaZ+yfi
   AXs2P0PrhBmOS2cjQ0wOEHfOUzg5kmQZDMnAAlbCT1NCXjUCf7Lgkg6N9
   WREekTMAn29BiyYvx5Nk3QHYwRp47PrEI0mTzt2E70oSGkYMOoGZW9YDi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417691553"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417691553"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 12:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="751028517"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="751028517"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2023 12:14:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtuwy-0003ti-0y;
	Fri, 20 Oct 2023 19:14:24 +0000
Date: Sat, 21 Oct 2023 03:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] perf/arm-cmn: Rework DTC counters (again)
Message-ID: <202310210209.L96I9l6g-lkp@intel.com>
References: <5f6ade76b47f033836d7a36c03555da896dfb4a3.1697824215.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f6ade76b47f033836d7a36c03555da896dfb4a3.1697824215.git.robin.murphy@arm.com>

Hi Robin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/perf-arm-cmn-Fix-DTC-domain-detection/20231021-015305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/5f6ade76b47f033836d7a36c03555da896dfb4a3.1697824215.git.robin.murphy%40arm.com
patch subject: [PATCH 2/3] perf/arm-cmn: Rework DTC counters (again)
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210209.L96I9l6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210209.L96I9l6g-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#80: FILE: drivers/perf/arm-cmn.c:600:
+#define for_each_hw_dtc_idx(hw, i, idx) \
+	for (int i = 0, idx; i < CMN_MAX_DTCS; i++) if ((idx = hw->dtc_idx[i]) >= 0)

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#81: FILE: drivers/perf/arm-cmn.c:601:
+	for (int i = 0, idx; i < CMN_MAX_DTCS; i++) if ((idx = hw->dtc_idx[i]) >= 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
