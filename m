Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3444F30F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837411; cv=none; b=gCNF7KWcCQSaB9dTOq7YJqcqCtT7cbM1p9TSfG10agDWm84dbEZJubWc8GlJVHXuFTaxVeW97siW9JtMKQMyAshEpa4ZD0PWVUjj4C5NZMIsgeUGWpQCN5TM+daFiXUMWyMPmEk4cJfzJCRmVsi6ermoe2Vzwr0B786BFLSh2SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837411; c=relaxed/simple;
	bh=gmxyG1Nv+I4nT1Go+T1NiC6up5PL6JM+2LifYOnbuCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L1MRuk1Z6NkiX4r+Ez7v6aPBtgLTwwrpRh3oIMx+1JYCYaKy61MCpn9yAZjHrY/VlYqUmOU5Ciw+CVJv1RllJaMqQXZz1djpRciYCQjPw1Uv7eQZyD9W5nIH8UP40gp7/TEg30UM6/vfjhvNQLx3F1YXVu0uvt9ipgA7Q0x5cfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1sdtfWb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1sdtfWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791837407; x=1823373407;
  h=date:from:to:cc:subject:message-id;
  bh=gmxyG1Nv+I4nT1Go+T1NiC6up5PL6JM+2LifYOnbuCU=;
  b=f1sdtfWbvNWl5Q2fOv7IqYQyvzaBc2+atlRCfSzuFI/R9Zm2TYyersj6
   xiFrllsNdSNK11vngeP8u1YJJmlVBi4nmzb5fX8oI6M43eyNJBFmcB62U
   KIxEWhImw1VtVkTluP9PvWiJ0H5V2z2JmhS2QfoDFgHZ20NFBzneVUFHP
   4ggIgmTOMSarF2PylrDP6+sqnveCyW+kL10HsINzjLsFrRMS46P1IwTET
   4b53Qo+xhFVol1emcaiwkmQomH4lDCYqdedon/jNtEvdSsa2A/hHBh7QQ
   bTIE8SOAA2ActB9TCoZyomyBoQdaD2GvhcM0SFr5PIjNpplwiVs0Hg8LO
   Q==;
X-CSE-ConnectionGUID: wV7nv84DTney4vPzPlQF6g==
X-CSE-MsgGUID: XJENkcGaRkKv3/KyA4EFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="439420"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="439420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:36:46 -0700
X-CSE-ConnectionGUID: 7GSRtqZpS+atbvbrcZAvIA==
X-CSE-MsgGUID: l6e9KGx1TpSYO6mLOynKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1462265"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Oct 2026 13:36:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGMlG-00000000ABf-0f8e;
	Mon, 12 Oct 2026 20:36:42 +0000
Date: Mon, 12 Oct 2026 22:35:50 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 fs/proc/task_mmu.c:2899:8: warning: no previous prototype for function
 '__pagemap_lseek'
Message-ID: <202610122226.33RZj2bY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f2c26311c21cf60ea5bf9ac15c3242139e210689
commit: 669f0c4355a55a5e909d44d8d688cd46b874bcd5 [0/3] ANDROID: 16K: Emulate /proc/pid/pagemap
config: i386-randconfig-2302-20261012 (https://download.01.org/0day-ci/archive/20261012/202610122226.33RZj2bY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122226.33RZj2bY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122226.33RZj2bY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:2899:8: warning: no previous prototype for function '__pagemap_lseek' [-Wmissing-prototypes]
    2899 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         |        ^
   fs/proc/task_mmu.c:2899:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2899 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         | ^
         | static 
   1 warning generated.


vim +/__pagemap_lseek +2899 fs/proc/task_mmu.c

  2898	
> 2899	loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
  2900	{
  2901		unsigned long nr_subpages = __PAGE_SIZE / PAGE_SIZE;
  2902		loff_t ret;
  2903	
  2904		/*
  2905		 * Userspace thinks the pages are larger than they actually are, so adjust the
  2906		 * offset to compensate.
  2907		 */
  2908		offset *= nr_subpages;
  2909	
  2910		ret = mem_lseek(file, offset, orig);  /* borrow this */
  2911		if (ret < 0)
  2912			return offset;
  2913	
  2914		/* Re-adjust the offset to reflect the larger userspace page size. */
  2915		return ret / nr_subpages;
  2916	}
  2917	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
