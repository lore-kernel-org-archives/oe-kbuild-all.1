Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42011713
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754318241; cv=none; b=mAk37JsY8OAunw3PVZQZZ0Q0BqRB7SZ8l6PcQUik26QutHa8jKuQRU1N5/X60CMV7qdLGtveX0036Z/k7PLlICnWiqpYyHVvb+3iMfMPnQb/dqLQ4t1ejNvH7GNfW0wJ45YYHir1oYyBj8bohMFTyQuFtkM+SfGCIVuXKoojJ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754318241; c=relaxed/simple;
	bh=S5tV60Ib4MN5IxhKs3KDq1BuLuC+5VuVm9dEO7GfeO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXVXArkceye7PMzfoEGndlGw9Pf0XUW4XI1kdvFzaymY+p63qDNY+EAhpe7thT+P2DhFcG/XZKHvzfOGRyRPFvvu3ycWEhsBHoQKrEzYKF/nm9Zr+6brN8pV9dXAqCZucj0C7Gr1XhJmAm93iLZsEgHE+xevmkCk5wwfcL0Qzss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N252Uogp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N252Uogp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754318238; x=1785854238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5tV60Ib4MN5IxhKs3KDq1BuLuC+5VuVm9dEO7GfeO4=;
  b=N252UogplJwxUQQus6K3BxPma8otKgBai4Ar2Y1YvLCRf7L2hN9+zoA3
   0+JNRf2HdjFwjeyFVWCYa0eS0NGuRIPDMexX66sc8KqHkBMKrJpVk1m73
   W5hx2vimPVX4dvS8ezTskyEt2Mad21KsowxH8sRFki5OB8OJULAW32JtK
   wrcPV+wbD3KT2vSkvSnsm4k2Z/gHMmobS8lkbJwUDhUUk610bQlWjmhXk
   3D4aZrF9fau4nFIt3IrRgxZEA/1lByWD6hXAUIsegID2/j536okrBUZET
   caUadQRpKvGOZwEIaEco8NoVQS2XmDMVLndy2kHKny98GHyUUOm/LRtFb
   Q==;
X-CSE-ConnectionGUID: pTKAiVYKSlmue6pyeh1WSg==
X-CSE-MsgGUID: rubZFXDhSBq3WqH2SA4e/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67283371"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67283371"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 07:37:16 -0700
X-CSE-ConnectionGUID: JZmpWz9CTzaB6KGLF1/oDw==
X-CSE-MsgGUID: FWrN01ZFSAmnr3QqJBmhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169572363"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2025 07:37:15 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiwJM-0001oF-24;
	Mon, 04 Aug 2025 14:37:12 +0000
Date: Mon, 4 Aug 2025 16:36:20 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2635/2635]
 include/linux/virtcca_cvm_domain.h:69:51: warning: declaration of 'struct
 pci_dev' will not be visible outside of this function
Message-ID: <202508041601.9q74wpPL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e46fbbc0ad301c3517340bf966d39b8493a2ebb0
commit: c5161d7e11a7e30755b2ec55aaebfd500193cbbc [2635/2635] virtCCA supports SR-IOV in CoDA scenarios.
config: x86_64-randconfig-2004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041601.9q74wpPL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041601.9q74wpPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041601.9q74wpPL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/sched.c:24:
>> include/linux/virtcca_cvm_domain.h:69:51: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
      69 | static inline int virtcca_add_coda_pci_dev(struct pci_dev *pdev)
         |                                                   ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +69 include/linux/virtcca_cvm_domain.h

    68	
  > 69	static inline int virtcca_add_coda_pci_dev(struct pci_dev *pdev)
    70	{
    71		return 0;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
