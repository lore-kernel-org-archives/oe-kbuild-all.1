Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E19133C195
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979950; cv=none; b=CSaCs2B9bjFw/vUnpRyg1zghclQ586O5EoSVhw9mWi3hIyTf/j/qNSCWdFJOWgyo0/np/pcJggCYu18j46rw8JMEAcsSNngSwV0CTb03NVyNu9AhzdTJgqGLmCTojm1deX2V82/Ctj3yLO6+i9GBQ4NgLGIGCIzxylChTXUFlok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979950; c=relaxed/simple;
	bh=omJRiizZk7IqqPIHHaqE/7eK+SnSZ5q1ynP0zpwqfOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AJRFhOVnF5Q8QwED500AFGFwyNrzbkjSZHHLu0s8w0F5Awuqj8Eb4jbaeyG7xTLKuTBfCNhdnh0ERCcVJQBOdb0Pn7kff/rW9Sph+e2W4PAvFCDhzb4GRgho5OJ08vhIUGXvQmsmxuKftSLssBkttj9wCw6Bou2vNfq5weOATXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RockDBmO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RockDBmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788979948; x=1820515948;
  h=date:from:to:cc:subject:message-id;
  bh=omJRiizZk7IqqPIHHaqE/7eK+SnSZ5q1ynP0zpwqfOQ=;
  b=RockDBmOp83cE0P1AKjWIebWcO1d7E3Z5CweNG3u9wTTkPiV7Mvdowhk
   AkaYJgfSdGIIjAhT08z1urVtYORf1mTH8tpGh9TrOckoBxoRJ9XE3Kkk+
   +8RrIul+h6Y3492CoxXWy6Apg87I/82tNYpRF2CzECZJzmSHC82AN/wV0
   aUFnZBX4fvMztH7zLXsnJOTtyG7fOSsMG9fs920OFwRUbyL2hEweI9Emk
   YiCqA/wfg1axf+rXcAUgzoSTvt6rvsnQZ92y0MXGoEQ/E+Dfmh2vKzNJS
   HihayYv/HtpnCLGGBVifeAGsRyMrMJGqHMdOIPt+M+ZO6RJKqx8+f5Cp9
   A==;
X-CSE-ConnectionGUID: O2CyluLBTMO+ury56PQbWQ==
X-CSE-MsgGUID: DSRzBOS6RruU+ti/sq7vVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89347744"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89347744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 11:52:27 -0700
X-CSE-ConnectionGUID: HCpcLcCCRwaDylXl+XYZow==
X-CSE-MsgGUID: MyxYcHmqQEmtho/4bjT2sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268819969"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 11:52:25 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4NPC-000000000oe-3nln;
	Wed, 09 Sep 2026 18:52:22 +0000
Date: Thu, 10 Sep 2026 02:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dgc-xfs:log-verification-1 7/14]
 fs/xfs/xfs_log_recover.c:1863:25: sparse: sparse: cast truncates bits from
 constant value (5452414e becomes 414e)
Message-ID: <202609100240.M1SNKD5p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git log-verification-1
head:   ecf8aa53f5af0d7ca002b1b8c13cff37d71b2e3f
commit: 895f4c5df0ab6b6bceb27b0aa21b4e1680dfdaaa [7/14] xfs: recover the transaction header as a validated item type
config: sparc64-randconfig-r132-20260909 (https://download.01.org/0day-ci/archive/20260910/202609100240.M1SNKD5p-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100240.M1SNKD5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100240.M1SNKD5p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log_recover.c:1863:25: sparse: sparse: cast truncates bits from constant value (5452414e becomes 414e)
   fs/xfs/xfs_log_recover.c:1908:35: sparse: sparse: cast truncates bits from constant value (5452414e becomes 414e)

vim +1863 fs/xfs/xfs_log_recover.c

  1855	
  1856	/* Big endian host: type is the high half, count is the low half. */
  1857	static int
  1858	xlog_recover_trans_hdr_nregions_be(
  1859		struct xlog			*log,
  1860		uint16_t			nregions)
  1861	{
  1862		return xlog_recover_trans_hdr_check_half(log, nregions,
> 1863				XLOG_TRANS_HDR_MAGIC_LO);
  1864	}
  1865	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
