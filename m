Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D049624
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723378689; cv=none; b=STAIkNVJXfGAeKZR9Yg4SlB/U0C0/SFMlRpAcAFU+nDFd/DqVkEfFduxpxS1Fwzu6tmY4h7YVDCn49L3rkjg0F0xqcu4qBbxXqfyW6ZH8GkexTtWFUuNdZ4Bm9/Gi8qvj2WBOeu1oQ+TuTTUv3DaucNINM3AJJV/uHXTPkskcxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723378689; c=relaxed/simple;
	bh=FsCdYWLtLdWq61f54s8MkUYQj7TP22MkeHik9pxAsRg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FP3QQgmVcvYhs3CMGBwnWmculaTeNFEltoyWFZUUksowIjVoPPZu54++YKbcikrI5FWB8CwDGKAMBMk8ehx1L2PNRlYPEB3Vm4PRnzYH29QujLtBDbTXxqwAlpZ0CFS7SfZlxVUGwv0F53+JZdUG0jTnQ8cG9s5l0gMotJCOXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abGTyAsh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abGTyAsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723378688; x=1754914688;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FsCdYWLtLdWq61f54s8MkUYQj7TP22MkeHik9pxAsRg=;
  b=abGTyAsh7Gd6vCYCltQHiYQ3gVJs4lj3aySW4cfG3kESo23qj+KdUWEM
   KcoRyr4m7WCeoFzrTFfKLylO/HoXsPgMRxSAcIcTEMq+t7onFxzHFKPMZ
   2+FLfNNL0L/indanNd3su9sfEiSnKG2UVXsbfjnEiIUrLDXNHh6Id0gnJ
   sqzc9D5Ysgkeo4xnqvOi0R5ycn0PDr9DNiGIa4cU+DlEMA/Llf94mcFpa
   8vKe1c3FHRZDs2oO3c9D5E+yKDVGrQkyvFgPds3gtBEtHC+36ppZKj361
   wn7kbiH6qeyPiQP2HV4cQjHpb8SJXuHvTUZRfWovdU2fqBOir6qQYOUDq
   g==;
X-CSE-ConnectionGUID: fOY+lX+MT+Wrlv70Ws5ncw==
X-CSE-MsgGUID: KkQDy54pS4udqbES0izzRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21636594"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21636594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 05:18:05 -0700
X-CSE-ConnectionGUID: OSRSB7RAQpGxhah5B2Q5wg==
X-CSE-MsgGUID: DCEwhKV9S5ib7ul0+8KaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62851896"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Aug 2024 05:18:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd7WL-000AoZ-1M;
	Sun, 11 Aug 2024 12:18:01 +0000
Date: Sun, 11 Aug 2024 20:17:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.6.y-cicd 4/8] WARNING: modpost: EXPORT symbol
 "si_swapinfo" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202408112014.IHx5XADb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.6.y-cicd
head:   2541807a1ef54deb9241788913a930d9558d38fd
commit: b1d0fdf895b6d7a6abe6f217ce7409ce3b4a2af4 [4/8] ANDROID: mm: Export si_swapinfo
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408112014.IHx5XADb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112014.IHx5XADb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408112014.IHx5XADb-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
ERROR: modpost: vmlinux: 'si_swapinfo' exported twice. Previous export was in vmlinux
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-shadow-fix1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-shadow-fix2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-demo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-busymod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/fprobe/fprobe_example.o
>> WARNING: modpost: EXPORT symbol "si_swapinfo" [vmlinux] version generation failed, symbol will not be versioned.
Is "si_swapinfo" prototyped in <asm/asm-prototypes.h>?

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
