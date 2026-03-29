Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD01C862F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774811303; cv=none; b=cCYICUJ2R3IhXsKHUP2m3LkYteMux5NY4icW8tn/s5qYlBzUIMKdZMmNCvFwDQJFhZ4itF5Dy1CcYu7PAw62koCBOudHZetl0ro4QqDXIlh2J5KtAsKDXHNG+f5VVPlpqBfCE7HI5uQ4L7BzrxF5/JZu5UYkeLZyy5hIsk5e2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774811303; c=relaxed/simple;
	bh=7iAbeWd05FViDT021lVwNUub4J5v+RSz+7wHvoh1CyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DWRYfgdUgjb84adytRuXhH7LijeFJtAyexXnHXrvt0eLEOs4v+ebV2OZ5IdbofaNlzTIUyjvLlNWqec1n5cbFt2X4U3y8scnN9eaBeg/FCWOz/Sa1roiVbZuXuplsSHpP4/EVO+wTwGZAymEf83mAh9/7hUUA2lOt8JVChJ0CiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQ+ME4Bq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQ+ME4Bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774811302; x=1806347302;
  h=date:from:to:cc:subject:message-id;
  bh=7iAbeWd05FViDT021lVwNUub4J5v+RSz+7wHvoh1CyE=;
  b=EQ+ME4BqCgDr52ucQZk5zfXnEEYJeadFLgONvuINDCMzyy/eHFT4eqdN
   zhGqEDy0jysM7cgLczfpHSaLoLRKPbjbyc0CuY2Ewxcu5xFDEFSIidKG7
   xlPlylkIOafZac/gn7JrlD9Qg/Wt5jHgj0gkymgy1m6Kqn43NzVW2eFhK
   Y2ZkXH5cPsntTUV3XedAPXWSKH8V0O4u2eIMAoJAFDJ1g6JyugDyMvYt1
   DyLfMNi0fTtB4EtbNMsQFaDQOxQyx4dFc1fkyanPcywRKGCKpnsVKxxf4
   3WOskUgeD2Ab8tAlv5SpDUsbQgkoJM1uLm1kZXaU4FyA/OhUoZgGi9hiR
   Q==;
X-CSE-ConnectionGUID: tus1MCq1S7majN2DP59NHw==
X-CSE-MsgGUID: Ql9YqBC3To+4JTDvFu3LWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75698448"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75698448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 12:08:21 -0700
X-CSE-ConnectionGUID: KH+AsikkSoGNtEutyx7ROQ==
X-CSE-MsgGUID: dOAPKaFKQE2No3/xqLxvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="225853427"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Mar 2026 12:08:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6vUf-000000007xL-1FAm;
	Sun, 29 Mar 2026 19:08:17 +0000
Date: Sun, 29 Mar 2026 21:07:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1] htmldocs:
 Documentation/virt/kvm/arm/hypercalls.rst:328: WARNING: Title underline too
 short.
Message-ID: <202603292017.RG0J0piu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d36fd08818dc78f214d13bede4b8ae4d43848a08
commit: 158046088d380c3b32cd353344d544ab6b8c94e1 [0/1] ANDROID: KVM: arm64: Document pvIOMMU guest HVCs
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260329/202603292017.RG0J0piu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603292017.RG0J0piu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "tracer". [docutils]
   Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitution referenced: "tracer". [docutils]
   Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitution referenced: "actionsperf". [docutils]
   Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substitution referenced: "tool". [docutils]
   Documentation/virt/kvm/arm/hypercalls.rst:288: ERROR: Unexpected indentation. [docutils]
>> Documentation/virt/kvm/arm/hypercalls.rst:328: WARNING: Title underline too short.
--
   ``ARM_SMCCC_VENDOR_HYP_KVM_PVIOMMU_OP_FUNC_ID``
   -------------------------------------- [docutils]
   Documentation/virt/kvm/arm/mmio-guard.rst:94: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/incfs.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/virt/kvm/arm/pviommu.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +328 Documentation/virt/kvm/arm/hypercalls.rst

   326	
   327	``ARM_SMCCC_VENDOR_HYP_KVM_PVIOMMU_OP_FUNC_ID``
 > 328	--------------------------------------
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
