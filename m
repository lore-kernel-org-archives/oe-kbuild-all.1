Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EB29428
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MivxE5up"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697489973; x=1729025973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNDTUCmww4v6Tk/H0aec2R/1E6/Vp4Mmohq7kOAdBg8=;
  b=MivxE5upgx4JaOBWF+ZkLoIs70Y8JG9OaDxqzPFuDpHYK+AcLYXi8fOa
   eIKaE6ziRlVnkrKObZ1z7IyzdIovZQh8+ca4nr3xTOLSmaAR+OH/4ZWAq
   HYGlOwtoQa1rsG4i67c1aAMN6yyyWmOICJWhuEiC2JjH5NomKYkUQfJLK
   UOzF+5gMptFD17A0ZXoy79WrzYG6tjEBzPloA25II8V3wYsEP/UnooHA0
   KTJq2Wq5Orpd95780Y2IaRVsdyCikRw2fwRfdmRd/7PIsfy/XjZxl91OL
   XbQ00jy2IZmgFanBPcYSCtav0EmqgV5fcNvN/5AW3MUkLQ/2nLBGrHtgT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416707572"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="416707572"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 13:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929491748"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="929491748"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Oct 2023 13:59:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsUgT-0008g9-0M;
	Mon, 16 Oct 2023 20:59:29 +0000
Date: Tue, 17 Oct 2023 04:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 8/232] checkpatch: WARNING: do not add new
 typedefs
Message-ID: <202310170440.xl5nvpjM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   74d338d77518cf071da9b6ee3676154341830251
commit: 4b5b517fc0d38b3945b6d03df3de4059d7d7f455 [8/232] KVM: Add a dedicated mmu_notifier flag for reclaiming freed memory
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170440.xl5nvpjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170440.xl5nvpjM-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:NEW_TYPEDEFS: do not add new typedefs
#41: FILE: virt/kvm/kvm_main.c:572:
+typedef struct kvm_mmu_notifier_return {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
