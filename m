Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1D433E84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 03:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783135542; cv=none; b=SyDmA1yh5Lcv6J3hwbxLXlbNx/KKT4UU83x7ci28ThjkLEF5VajTwAY9vE88Av3mG0hCh9x0PfOmufaNkBXgDlDmYYrGsrCeomJLo9SwST5x+C8dRLt1hBkAGi+EIIZs7u5jEUe+UUkYo1xll1bFRoD/9ezSNgQVlYeNvEyZo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783135542; c=relaxed/simple;
	bh=JQ1VIFGjoJR1aAoq9VMh/OxGq30y53xcjrcvUeEBHM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZZRhM6vcVLyhK9rWDKcTJ+qH3juKun7Pio224ekNX587XCkp4O9hfn/lSC6/42jq9B7Hqow046mZeKnK0bOn37j6i5kdIh4s7pHIn6hN6d90WWj/XamBPVFhOUilb85ztVlGpWMGsMh4g4zFRWmjePfsXZXk533Lg1ndspFdFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhJVky+C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhJVky+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783135541; x=1814671541;
  h=date:from:to:cc:subject:message-id;
  bh=JQ1VIFGjoJR1aAoq9VMh/OxGq30y53xcjrcvUeEBHM4=;
  b=LhJVky+CwPnvvrbYVVw6jzzYfgMth0BeC3tJImqKv5KhsBxqhaCfku/X
   IeHQ/2iMa7PZPJeGTWep+amlHV+MpGJwDhfUb65DOWjBNbT55sCvwOzhK
   aL50hqAJjMb6GQjWI8ERyVYN9EdgcBRvGYA4RpddrVmrUWppsQCws99rI
   YEhl1oKCDd5+N8BAz2f1OHrGp5+b4pDVouIc3BXp9iVBS+qjYzNMy1LSC
   sNaGcpe1oGufonmWLb5tBjUIBIfxTjqhVlbsJZRfKx+PTLrqTAWomFXYV
   AAtTm2LBnoEVa4BpC2wW2YWTO+quJI/nGCu6Lnf2eZJsxsxWUfh/sJ2cD
   w==;
X-CSE-ConnectionGUID: MrvYfoLZQ+Oj4iicPnVFDA==
X-CSE-MsgGUID: /yBkknHkQ4KH2W/XWn8CRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83646911"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83646911"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 20:25:40 -0700
X-CSE-ConnectionGUID: Uk8bJ1F5RK+LuJZXBi26tQ==
X-CSE-MsgGUID: eEBrBpaiRBiPeuq+Ni7+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="250581465"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2026 20:25:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfr0a-00000000Cnz-2wfG;
	Sat, 04 Jul 2026 03:25:36 +0000
Date: Sat, 04 Jul 2026 11:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 21/21] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x3ffc0): cannot reach 0000292c_memcpy+0, recompile
 with -ffunction-sections
Message-ID: <202607041146.h3kuMa0T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   666d1350fc32c85fe18b1d7be662df141b4f9566
commit: 666d1350fc32c85fe18b1d7be662df141b4f9566 [21/21] netfs: Combine prepare and issue ops and grab the buffers on request
config: parisc-randconfig-r111-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041146.h3kuMa0T-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041146.h3kuMa0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041146.h3kuMa0T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffc0): cannot reach 0000292c_memcpy+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffc0): cannot handle R_PARISC_PCREL17F for memcpy
   hppa-linux-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
