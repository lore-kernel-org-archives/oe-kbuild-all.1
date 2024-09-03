Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B031DC731
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725393271; cv=none; b=rhXcb2U6dbhhKasw7t2Wnu0p/MOkwriYrO51G24UPIUMWNKSBnh1l8tODvrYCewrVyu5N5YtQKmxC/PlC/f3kdPmfPVOB6QbpPxWx/e/HSLKK38WZimjYIFqjJCV5DG9x0Skyc6uT3CUTBjoFKCBfCDltEj7CU1B9es/6b7u/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725393271; c=relaxed/simple;
	bh=jrYlo8+GUgVYzuYtYVFjs3OAUbKegCNjKZpyRfcgxdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5lydzlTEsScPC77BZ9qPfIDR9WsZCMsUW7VPhAZWGZGulvZVK9sxRFJLtiUffhbTOdvgqaPpfVyexsSPaftb3NizXYTVtvf8RnkNjV/6C13/rz4gIQYuq8NFEVll0PtMkYMwxXAhSKPME8PDMx3pmMmQeRd3vMEHjqwqs822IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB5L7H98; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB5L7H98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725393269; x=1756929269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrYlo8+GUgVYzuYtYVFjs3OAUbKegCNjKZpyRfcgxdI=;
  b=aB5L7H988zf0UdvT7VFIE7pIMLqj+ALeVZoJEkbQjRtJQaG0ZY1mfE2F
   QGCjmTOOyJdD9pUrPB3TC/s1XrWXXpqrVuiLCxlfQzNuiolXIUl6qxkzn
   /bUPeuq3zLecvsqgni5FIEgdkyVGPO0kd49ndS6KKpOB53z2cKI6cbKq0
   pGwb3GLTnRKjMRXOyVIb7A+CLZMX91VgSFq5EpqhQOWRK4yVkQu9cy1mS
   ZTfbc1DTtAln5raSFXxh0PM6bq0iECrkFktVFgCRhYO4OuG0B4zE8p3Gk
   9TyRWAaxtvt5ZqoimHc/WbTEInjSFLx7j6phC1eBwoSpPCCJR5P32KONV
   w==;
X-CSE-ConnectionGUID: +3B0K8srSPW+ux/CBfI5LA==
X-CSE-MsgGUID: OGlh6s0ZSKGsLEN4yARALA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24155240"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="24155240"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 12:54:29 -0700
X-CSE-ConnectionGUID: Vwq+VQeiSnmqIZZvJKkShw==
X-CSE-MsgGUID: bNYFY7R3T4yufu4BV/Dh0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69412205"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2024 12:54:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slZbd-00076D-37;
	Tue, 03 Sep 2024 19:54:25 +0000
Date: Wed, 4 Sep 2024 03:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 35/37] ERROR: modpost:
 "netfs_crypto_req_done" [fs/afs/kafs.ko] undefined!
Message-ID: <202409040334.zIFdqTbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   3962f4beba4e7ffa6cfab018df8a612902a1d2c8
commit: dcdf0b3f76dfb0a2b11148137d63d0d9076be516 [35/37] afs: [DON'T MERGE] Implement trivial content crypto for testing purposes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240904/202409040334.zIFdqTbe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040334.zIFdqTbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040334.zIFdqTbe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "netfs_crypto_req_done" [fs/afs/kafs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
