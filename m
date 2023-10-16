Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93682B779
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fepwU3V0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697489973; x=1729025973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNUtcAS6gj88VE938U6htgbJvM3lb6MbbndNLOVJgZw=;
  b=fepwU3V0B1E4MwZ2n/YDXQjCXj3BFUMWl4yKStGVRW4tpjXCil2kFCkt
   ZagTcFEz89UBkpNj+qtkZknmgugUSjRYyPbQkse5S/q/7puhbI1Ai2DnW
   sP2gwz2DyyU//l5Cfrwl8c/zhord7DYBKw9Clppkzd6/po3aYj3dl+SeL
   JaHJN5NyVJja2921A6HA2vl9fqMTnys+7SdM6JBQ7lAZ3jYcdmN7+UIl4
   Nbc4qajpkcF+9UZxr1zktE7ch1PSbvfounsdADhZWd9UeXIJJaGvyFsHI
   /KOdyRnZBvseOZuFyKvJhaI2X6hZWVmr00RdrKg7Gf5PdxOkg2gaqK9r9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452118663"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="452118663"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 13:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="790947575"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="790947575"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Oct 2023 13:59:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsUgT-0008g7-0H;
	Mon, 16 Oct 2023 20:59:29 +0000
Date: Tue, 17 Oct 2023 04:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 29/232] checkpatch: WARNING: Prefer using
 '"%s...", __func__' to using 'usage', this function's name, in a string
Message-ID: <202310170459.F7vOooEh-lkp@intel.com>
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
commit: aada297e5e372fe9cf4f275e40d013ddcb16e181 [29/232] KVM: selftests: Add x86-only selftest for private memory conversions
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170459.F7vOooEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170459.F7vOooEh-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'usage', this function's name, in a string
#419: FILE: tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c:365:
+	printf("usage: %s [-h] [-m] [-s mem_type] [-n nr_vcpus]\n", cmd);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
