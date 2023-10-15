Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3507917CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awzzBIId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338345; x=1728874345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7x08TjBCw4zvIkdqOvLeg3PIQEZDSwpfyOxjjZjW8vc=;
  b=awzzBIIdgplZZHQJCZvTFcH1iN36zwpVk8imeOyk+ZB04mTUq+DIRnxl
   liu21uC8lNS7uYTNaJyAq1kGxot7/JP1MHqjvJkasiBDSXyyBlK0svJjg
   N4ufF45ZVMxVjZlkklKFWJo2LksflK3JimCjkw6JcQ0YaoZ7SCMBC5Le4
   J/sOOVLueINJQeXnKnTDj3ZbNDAWZ81xHJhbSfSoX9NzDyjp7BsPr/acC
   ZNDlWZcYHxf5PQhSlNFkZsUr8wnFZlYE1ZWvqp5RRNmquDAtb78CgZUBx
   MIQECsxMM2d5chqizT9bB2VLK208DmIR/+cELNRfYu37FcpHLcIlSAmxJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6925457"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6925457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790353028"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790353028"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006xR-1P;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 17/102] checkpatch: WARNING: else is
 not generally useful after a break or return
Message-ID: <202310151022.PBhCfYSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   8f794ba7e970f5144ad374c5b40f7ce015a03563
commit: 9bb5b1474f4b6624d71864a5bc86883734024c16 [17/102] resctrl2: Initialize/update the architecture control ID allocator
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151022.PBhCfYSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151022.PBhCfYSD-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#223: FILE: fs/resctrl2/arch/x86/alloc.c:70:
+		return 0;
+	} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
