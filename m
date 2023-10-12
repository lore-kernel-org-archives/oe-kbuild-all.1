Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5B0101C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8GolcX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697095822; x=1728631822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYAAtALl9bYA7RUCTTsU+iBmlSfj4TgJw9vjCyZVCTI=;
  b=W8GolcX/QAR8N80taLaFXNxUf5+IQe3RAloGOoM32R4KVdXQPfXRLHoh
   wSiIa+KSVdzkvl1s+wc9B/e0flruyLuLoJC7qVIQrut6VzNJeF7m3tipm
   49Dv+ZR1M3G5Ks4Opf7LAzqkvtodbJkEI8SSDCCssbqt8xSAQbHIPgSQB
   IcWStygklMfbJUbcIK1U3sZzAD4qtNF+J/u2PtXychRPv5bpGCMyNV23K
   h1K20iOOd8F8YjcN/hYsyrf177ExbQAzLinYmuVumphzNMZD47XBK6KN3
   t9d0vE3ak/Zkz/KIjj+AxNjeukVOly2jMM8+5WEGuHilCNXPD1WPI1bpY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383720282"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="383720282"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 00:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757898518"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="757898518"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 00:30:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqq9C-0003JZ-0f;
	Thu, 12 Oct 2023 07:30:18 +0000
Date: Thu, 12 Oct 2023 15:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 64/235] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310121516.lvr14d9W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   7a3180b27232bff6b95d65874e05272fa0c99b01
commit: c75b0643ca70cecb68211cbc2af561253de2e9a1 [64/235] KVM: selftests: Add FADV_MCE_INJECT and KVM_X86_MCE_INJECT
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121516.lvr14d9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121516.lvr14d9W-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#85: FILE: tools/testing/selftests/kvm/x86_64/private_mem_hwpoison_test.c:186:
+	char *buf = "sw\n";
+	open_write_close(MCE_FLAGS, buf, strlen(buf));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
