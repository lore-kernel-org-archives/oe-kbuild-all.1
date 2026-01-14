Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4B318BA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768420280; cv=none; b=TLRVOOuZjcJQLvhM246iK/EFGUVX1GvgAdvlloAf9FANXWLpfFa/lgWWlR5O6mfBog9Qoq7tj7/V/7apCZOflgoGoYuZFoWVOfCHWlcNa0itehdPRFLdKWkgjCBr+CZC6o3P4WtjtvQEA+LJUPRTwP9eskJYRcLjRMMRVK56uoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768420280; c=relaxed/simple;
	bh=hL1q2kQAOPptBpIYU82Ixk7EXI8IE1NYl5Ka3cWzJ9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GiNip1FYSNmtr+/5NUniGDy0uK4dcMI76RHGntyVM2mPtPq/Kg+aw3seY6rkgTFyL1zNiJdu8MLVn0laldX8yJq9F6GhlV2CdlBTOtuVcbOR7Raxd5ozOoEuR/9/H6fQUMwqnjfHYuWlYXCRUh7AMhtMqeJn9O5mQoZCSuqY+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlugY4zi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlugY4zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768420279; x=1799956279;
  h=date:from:to:cc:subject:message-id;
  bh=hL1q2kQAOPptBpIYU82Ixk7EXI8IE1NYl5Ka3cWzJ9s=;
  b=WlugY4zipEzLoMpAbTSzuDrSIBeUwxPHMKtDlEEIJq55HiYZLmMizKEc
   uOjeevHzyJEq6jD+Fjy7nAxj1bZV7gUzZe02Ife1PfKOmKDgrH7cUN8zh
   qcADOxBXSbgv4gFeBwiEodva8rToUVX4HqqDK2rYOhSCqD7a+akFXRJdY
   35XD5SNBEphglYzlLJnSmIZAYmDrn/NbO0usFdoBzxCzRMe9qRj+FHFyd
   nizv8Ej3FN9jl2jIEsGhZIXrnMMKUWVcfVTf7RBL9TYmfRVQep5YZldfb
   xxAm+WyESkbQv3UKm+pFdIIzh62Y0K5DPL4qrDWoZVyX0tkVZjX48hwpj
   A==;
X-CSE-ConnectionGUID: j8cWrTzjS4GMsZ6f3Z51xg==
X-CSE-MsgGUID: VSGuS9/2SKKgPVznrtvXmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69704276"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69704276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:51:18 -0800
X-CSE-ConnectionGUID: I1nmELAcRdeT8FLDFa16DQ==
X-CSE-MsgGUID: Q7tUP4YRS5CT5Vw4y0JNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204812280"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jan 2026 11:51:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg6te-00000000Gw0-3Lzu;
	Wed, 14 Jan 2026 19:51:14 +0000
Date: Thu, 15 Jan 2026 03:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3] WARNING: modpost:
 "inet_csk_get_port" [net/wireless/cfg80211.ko] has no CRC!
Message-ID: <202601150322.f1wHOMuN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   200e373848c4de44a843ebfe12c8149f15f72d88
commit: 5ce1842cd12dbf6fb8c0373e4b727073ef0d2e3b [3/3] ANDROID: GKI: net: add vendor hook for network quality estimation
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20260115/202601150322.f1wHOMuN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150322.f1wHOMuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150322.f1wHOMuN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cpufreq_frequency_table_verify" [vmlinux] version generation failed, symbol will not be versioned.
Is "cpufreq_frequency_table_verify" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "inet_rcv_saddr_equal" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_rcv_saddr_equal" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_sk_get_local_port_range" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "inet_csk_get_port" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_csk_get_port" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "inet_csk_get_port" [net/wireless/cfg80211.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
