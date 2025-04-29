Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B8E2192E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939353; cv=none; b=bHNrUMsKVNteEWky83TMyaix/wjPj8VVgmjNg44OZvFu1gE/QhZu8jFohIZwD/kxoIL7yBFD/FzKdZjGssQ6ANQ3wSdnJtoDx2nUPPY/7h/7KypvuRHsKLtjsAJKl1GmH4tnNTQV0lzRXy+YgVgxb5C8AOkNxJIKHFzz8MDqSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939353; c=relaxed/simple;
	bh=aR1k9FJ2Bs3MpO+shFOIcne6CSL9E2BHGUTm2TSS9tI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5W+3/zhuOIZBIQs0zECmxBe8vcuh/ZK5WOYCcVExQZhMEMgVwm4nfMm5ym0X5fjUF43biFJWDbbXSwr6842WoULKBT8lfkM+o2v5rWNcZcwF0VqCuQxlpRZI/jHPe4uyLcCftqirzPtF0/M/+l7Z+PG8NaQwTUhJEnOzacrRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JljEs+Em; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JljEs+Em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939351; x=1777475351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aR1k9FJ2Bs3MpO+shFOIcne6CSL9E2BHGUTm2TSS9tI=;
  b=JljEs+EmS2KCTTAm+mDSTLakUOFmU2hnGASd5Oc09LZfcKZyQwgqNe9s
   Rl2w4Xur1SKmVbv2Rj/Q40DP0uahyhbF0KimgEmb+e44Ws4FmbB1D/tcY
   oyeoP3svbx/FrCzcdtVnyPIMbqo0JyQRIdaLY08bPsEN/9PvbBpwih4lr
   VoSrGCEu3yLpbrONzvY3nyfGuwHzIlqg7jfb3zU75GWMcJUaIEazP69gT
   f4k1H16dNCTiTj5va/eajF832wO/KX4MQWQM/nZTNuU6tsEQ74PYm7ACj
   9VVP7K56yydpw98oTp22Vd8YjtqlGY6sVPZVD1e5+LtasW4RBJc/Alegh
   Q==;
X-CSE-ConnectionGUID: jTH/Ze/WSwuhViuJ3DL8+w==
X-CSE-MsgGUID: yCDiSK1lSd6T3hG3PdRbyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50228912"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="50228912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:09:09 -0700
X-CSE-ConnectionGUID: 2TxjKuVZTmyEvwucrNBGKw==
X-CSE-MsgGUID: BcQqd7tETJStCgqNZ+U2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138834821"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 08:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ma1-0000o7-0o;
	Tue, 29 Apr 2025 15:09:05 +0000
Date: Tue, 29 Apr 2025 23:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] arch/arm/mm/fault.c:28:6: sparse:
 sparse: symbol 'copy_from_kernel_nofault_allowed' was not declared. Should
 it be static?
Message-ID: <202504292248.4b9Un345-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 11bb05969b19050a0f9baa6bcd1cb23439b267e3 [1/1] ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()
config: arm-randconfig-r111-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292248.4b9Un345-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250429/202504292248.4b9Un345-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292248.4b9Un345-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/fault.c:28:6: sparse: sparse: symbol 'copy_from_kernel_nofault_allowed' was not declared. Should it be static?
   arch/arm/mm/fault.c:217:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] fault @@     got int @@
   arch/arm/mm/fault.c:217:15: sparse:     expected restricted vm_fault_t [usertype] fault
   arch/arm/mm/fault.c:217:15: sparse:     got int
   arch/arm/mm/fault.c:229:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] fault @@     got int @@
   arch/arm/mm/fault.c:229:23: sparse:     expected restricted vm_fault_t [usertype] fault
   arch/arm/mm/fault.c:229:23: sparse:     got int
   arch/arm/mm/fault.c:342:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm/mm/fault.c:342:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm/mm/fault.c:375:24: sparse: sparse: restricted vm_fault_t degrades to integer

vim +/copy_from_kernel_nofault_allowed +28 arch/arm/mm/fault.c

    27	
  > 28	bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
    29	{
    30		unsigned long addr = (unsigned long)unsafe_src;
    31	
    32		return addr >= TASK_SIZE && ULONG_MAX - addr >= size;
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
