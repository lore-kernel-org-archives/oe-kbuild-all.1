Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2220EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 04:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dnqsj4mG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697083245; x=1728619245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1iCqHp/+8aMfg+o/UOScI+bfQxUxyto5ms70xUfuO4=;
  b=Dnqsj4mG3pb4d89haHiLyQBb6IszrlZ/2G7qdRFuLzlxhuEc7xoj3Md0
   vqoMD+CJa0fqxZAXyLuO0vu17EMOT2LVhUEy/eFMOHyprATVkcELJIMv+
   7m7YKcF+sSO6cf7C+bMUxePPtBLHtUUUB7r9TRmzDBJZD73lGJDITO+OM
   StCycBYif2J3mTW1mO91WF0fcwmgIZfVUqqdiRYMf4swpqzHPcp9nBJlR
   1x1RNG0T0J8zkxOEppHYld1ipiEzrhAAarOZRPAn6uBkJkwjobzk1/7IF
   s/8t4M5CECZxPZ9QvfYI1qImCm/s+TfWjhQjS/XtqBj1/QJYRjY34etYL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3411548"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3411548"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 21:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="877960722"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="877960722"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Oct 2023 21:00:42 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqms1-00037p-0q;
	Thu, 12 Oct 2023 04:00:28 +0000
Date: Thu, 12 Oct 2023 12:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 29/235] checkpatch: WARNING: Prefer using
 '"%s...", __func__' to using 'usage', this function's name, in a string
Message-ID: <202310121119.vA11057f-lkp@intel.com>
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
commit: aada297e5e372fe9cf4f275e40d013ddcb16e181 [29/235] KVM: selftests: Add x86-only selftest for private memory conversions
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121119.vA11057f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121119.vA11057f-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'usage', this function's name, in a string
#419: FILE: tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c:365:
+	printf("usage: %s [-h] [-m] [-s mem_type] [-n nr_vcpus]\n", cmd);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
