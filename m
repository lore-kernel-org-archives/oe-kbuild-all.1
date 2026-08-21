Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D43F20FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 19:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787340548; cv=none; b=eUSBtYciYmQNyD+snnGh7L+nfqVDJ3YHpGOMXZnc+xe1uIKMX02HSTXKOuEk6Imvi4A8ojRlpqS0ONgXTiwr2Dr/9P9BjKQz4vZnjClBXVnXIsAX+vc6ZAuF688rpPA3LoidtshIwU6hFoHz19Jene72sZMCZa+QVgrfgTx5seg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787340548; c=relaxed/simple;
	bh=577bFSynvLstBfNvhaW/srkflyCcInjCGEV6bu+Nt8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZK6QHwr+STMkT9E7Sc5+WqL8HWnz/+sFgU8+kXzIhrTHNYH5Sb86PCf+Dsn1X2Jr1lU/VB6pgRWZOvMXwhIQcudBIQs3KQ9gDgATDujEN1YloT4H2CWvFEQVFc1eewcqc2qVqxKAD54qCecQELcCwRGtX45kdVe181R7svaDNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj69Lp8c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj69Lp8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787340546; x=1818876546;
  h=date:from:to:cc:subject:message-id;
  bh=577bFSynvLstBfNvhaW/srkflyCcInjCGEV6bu+Nt8U=;
  b=Qj69Lp8ciqaSR1mK0MqncLvarJcfgkat9eUlYIwQoIvQpP2IgAD6KJYo
   j3gvDARoxebLSf0nAoRtJK4O3I1jPsMtOX2ol8CkkSB2P94uhkJP6g2vF
   GaH35Zjh3Y5HzNGNR8+YeLFwXATmSBY7mEh2fgL4JCiwcnGMl+AuU6/Jk
   lLeD/z6MftdJQXdm162dPbYzr78rwZujfBM1wiuqscadjIj1PROwp8LDo
   kl5Pt+7polnSz/L80P5PYCYa0zchF5uhXOnXygvpvb+1nZ49dqTJZoGmX
   GoWWepdQPBb2kxmadMUrqhMWynYhz8pVI/e/FFmEHam1kLA+Gfcv3A1Qe
   Q==;
X-CSE-ConnectionGUID: R72bV4ywQkCaaxH1KRZ28A==
X-CSE-MsgGUID: 6m1oJPmcQTGwBhZmZgWjKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="98228585"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="98228585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 12:29:05 -0700
X-CSE-ConnectionGUID: JwNFhJOoTWukllHNUcjdLw==
X-CSE-MsgGUID: aEg02Z9BSTiL3nFXRD3miw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="269909677"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2026 12:29:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxUvG-00000000qO9-0Ia3;
	Fri, 21 Aug 2026 19:29:02 +0000
Date: Sat, 22 Aug 2026 03:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/filemap.c:67:6:
 warning: no previous prototype for '_trace_android_vh_unlock_mmap_bypass'
Message-ID: <202608220327.dO124vLq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3ab5872299d5e82b56421f050aee906aa69bce34
commit: 38a6fa97bf2e5dc01ab158ebd3a048bb628103b7 [2/2] ANDROID: mm: add vendor hook to bypass mmap_lock release in page fault
config: arm-randconfig-001-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220327.dO124vLq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220327.dO124vLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220327.dO124vLq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/filemap.c:67:6: warning: no previous prototype for '_trace_android_vh_unlock_mmap_bypass' [-Wmissing-prototypes]
      67 | void _trace_android_vh_unlock_mmap_bypass(struct vm_fault *vmf,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_trace_android_vh_unlock_mmap_bypass +67 mm/filemap.c

    61	
    62	/*
    63	 * trace_android_vh_unlock_mmap_bypass is called in mm/internal.h
    64	 * by including trace/hooks/mm.h directly, which will result in build-err.
    65	 * So we create func: _trace_android_vh_unlock_mmap_bypass.
    66	 */
  > 67	void _trace_android_vh_unlock_mmap_bypass(struct vm_fault *vmf,
    68			struct file *fpin, bool *bypass)
    69	{
    70		trace_android_vh_unlock_mmap_bypass(vmf, fpin, bypass);
    71	}
    72	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
