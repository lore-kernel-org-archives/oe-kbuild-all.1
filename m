Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A9613F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVTmfFQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697091068; x=1728627068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aBTf2guKS4Bg/m8eDmDH7692KUESsOXy+5dwB/2+AU0=;
  b=UVTmfFQIP9jrczEypXoRwvZsBIwdVVMamxp958p+4CucT7qinzTlZngd
   fQg1NdCxlHeDivCM4LA/Q+wCyNzo2iIVX7tLeJwZOnzwZIker58gxuf+V
   YtZ023qOioSY3whjWWmJvrj8R0TTqt0PbuuSYM8MeCwJPjswTmFBXQQkV
   2Tr/L0FrxXdCx6yXGzdMaBfI8ZsV0cThqZJIhOO2BIaVU+H6xaUsjjbcf
   kCZp5yBnjWdNGXG9BQoN2FqofM+e0Thos3UwrmjFly6AGIHJlpfCuX0TI
   OEUlmZXelPfqGLsH1nwo16+2jhLOp0oBbtEolMjw0w3DrPf/c/zGznyh/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451334312"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="451334312"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870439368"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870439368"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 23:10:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqouM-0003Fp-0l;
	Thu, 12 Oct 2023 06:10:54 +0000
Date: Thu, 12 Oct 2023 14:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 52/235] checkpatch: WARNING: Symbolic
 permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal
 permissions '0600'.
Message-ID: <202310121407.1Cu6HB5D-lkp@intel.com>
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
commit: 41235cd68205a8d60c149dcea61c288ec6b12608 [52/235] X86/mce/inject: Add mcgstatus for mce-inject debugfs
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121407.1Cu6HB5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121407.1Cu6HB5D-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
#60: FILE: arch/x86/kernel/cpu/mce/inject.c:716:
+						      .perm = S_IRUSR | S_IWUSR },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
