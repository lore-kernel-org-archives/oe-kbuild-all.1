Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923A14F6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elZOog5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704970975; x=1736506975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzrhvXflEqNNqDMm3bM14HYXJZ8yGHIGLq0P72kkiiA=;
  b=elZOog5KHg3mjkC2WLv66nfmY2KMmvWmodcONL9lsghv+yZDk7mAxqQA
   BSUAyZH/h7Mwr82qnqDhQgzZRLxCsC4NLrMTOVl82nnwUMVSZm/GR6Gwz
   x6jor2pXsbNloRxEjn6S+mtSiyxTg0s93S3fehhQGnqYrqp8N2m+kKoWC
   5fp7eCMwEgMXd1Csr/Ca02P16AzrTFNMjZkT0d85+T2NFszs8ZKTA+dcN
   70lg8PDhyEJJDt6CJnuOr5sg4q6SBvXLa3fexohj+ImfnM6vPotFmUIVR
   f4friF7nVHEz+DAjVACW3oSZW7F1ZEpoZQ0t7p/3kUjSYAVZim5ODU/Qc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="20294492"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="20294492"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 03:02:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="17008090"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2024 03:02:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNspT-0008Aa-0M;
	Thu, 11 Jan 2024 11:02:31 +0000
Date: Thu, 11 Jan 2024 19:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [ls-zhu:v6.7-rc6-tdx 254/264] x86_64/tdx_upm_test.c:355:58: error:
 'KVM_MEM_PRIVATE' undeclared
Message-ID: <202401111839.FmqmYwep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ls-zhu/linux v6.7-rc6-tdx
head:   ffe2774ac14a3b9d7cc50ad2a6f9a549755dc245
commit: 974a675bdb73fc3b07c7f05322792e7437185d38 [254/264] KVM: selftests: TDX: Add TDX UPM selftest
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111839.FmqmYwep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111839.FmqmYwep-lkp@intel.com/

All errors (new ones prefixed by >>):

   x86_64/tdx_upm_test.c: In function 'run_selftest':
   x86_64/tdx_upm_test.c:253:9: warning: implicit declaration of function 'ASSERT_EQ'; did you mean 'TEST_ASSERT_EQ'? [-Wimplicit-function-declaration]
     253 |         ASSERT_EQ(*(uint32_t *)((void *)vcpu->run + vcpu->run->io.data_offset),
         |         ^~~~~~~~~
         |         TEST_ASSERT_EQ
   x86_64/tdx_upm_test.c: In function 'verify_upm_test':
>> x86_64/tdx_upm_test.c:355:58: error: 'KVM_MEM_PRIVATE' undeclared (first use in this function)
     355 |                                     3, test_area_npages, KVM_MEM_PRIVATE);
         |                                                          ^~~~~~~~~~~~~~~
   x86_64/tdx_upm_test.c:355:58: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
