Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F628DDBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOgRfi4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697093950; x=1728629950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YIl6ex1ylYCVVGyAI3uin5bT1EgPinG24ehj2AXoe2E=;
  b=fOgRfi4iQuPU1ddpJEQOjJSHFEAwrIoa5GVGyfYrq9XPoGvubP/zAHnh
   hqi2QUJ7nl+LoEXtjY19XzUlN4caHqUIPFD//ee6A4+Vf1wHNapFALV+v
   MdViMZG7ibXVTWOH8o9mm/o2kiSD4PDi8uj7I5MnYrBmBGzP8d7mvHhM7
   lsnLInafpydp82jizKfbcOofHYKKZo8YmArw3Azh1IdoXSsGa/PhZsJRX
   A02RJCfpjiMm5X/HjMVrVV73d83MC30avbt38l2/83H7d/3ELrwuaIwls
   CXPrIasu4cxL2QtPiiu4IUCjHA1DcyDAOtMGQ7uW7qtjs2fWqmuOp78od
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471104285"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="471104285"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897969000"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="897969000"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 23:57:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqpex-0003Hv-2G;
	Thu, 12 Oct 2023 06:59:04 +0000
Date: Thu, 12 Oct 2023 14:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 29/235] checkpatch: WARNING: Prefer using
 '"%s...", __func__' to using 'usage', this function's name, in a string
Message-ID: <202310121440.RbSv6TnB-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121440.RbSv6TnB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121440.RbSv6TnB-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'usage', this function's name, in a string
#419: FILE: tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c:365:
+	printf("usage: %s [-h] [-m] [-s mem_type] [-n nr_vcpus]\n", cmd);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
