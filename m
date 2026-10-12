Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEAD4AD4AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837411; cv=none; b=eoaSA9WnhEVe2xVt9Hc8TMqZIVYumQC9Rq8R4eXQL4cFXzuwXj70vIYj4GP/c/QNwAcjtjrBctmWeeBjzPqeqzsZo5OJ3EtrLs+BMG+kvGI5c4VMg07gXydmkvW8qOuUcvOIlPlbU/7NCW9cNl1iz2Oz4Nt72T7riIP5v7dYYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837411; c=relaxed/simple;
	bh=npoMKd4MDV7Se2/rOHtjAC8k/1sbW/5IkGJmb02TTqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UY3lXDDlomoenKvZoujwK/7FjVQ7tNujP9Yk00Ru2IT9hdrszuKYk8MiZgkfFvd8AP5rpmTaURWCXnsFK47cqXlYNpuMkTQQBPZpeP8SZSjuhZvMQgR1ypzmpNX8wmScWpdkcF9wOBJgZlNeQllEVzZWZP79VAGC+ze9utdoepE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlL2NMSO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlL2NMSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791837407; x=1823373407;
  h=date:from:to:cc:subject:message-id;
  bh=npoMKd4MDV7Se2/rOHtjAC8k/1sbW/5IkGJmb02TTqk=;
  b=hlL2NMSO9oAXe136NcHj0m0otLZbx8Z6uBeSI1unhP+lHzI1fburwq8g
   ZGaLnv51DFunwTCC8FJw+8ePfltXB2MGyQNLKzvVsudnTv0pDnSdJIp7v
   1LWHTAKmhjv690qbV2V3okAWNjrwUR9xygkY+qO8kc2PwD1Wc6h9SLkMH
   X3HxSiZfLAGmr8JEqVU1oRrvSlfkf/3ORACx7jwn5vYpFr4SiaStQOEYB
   s1MOXoxclveMS3rPGfbsbfb+ynZiLrXH5gYWqnzxppUT2OfwS/xi4XfV5
   c+XNkJSakkXcMPZfO+eeIUni8FwdfgOsewcWAQ6+TO5RpWSnn3ZUUqnRm
   Q==;
X-CSE-ConnectionGUID: SrrJYJodQ/qiWtNFSw2lxQ==
X-CSE-MsgGUID: 63aMzGVdRfu85E7iD2GyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="451630"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="451630"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:36:47 -0700
X-CSE-ConnectionGUID: 209D+qRTT0qidDcAL13Cag==
X-CSE-MsgGUID: W5lfoPCSTjSBSAXSdgfLvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1098568"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 13:36:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGMlG-00000000ABi-1s6G;
	Mon, 12 Oct 2026 20:36:42 +0000
Date: Mon, 12 Oct 2026 22:35:48 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Salter <msalter@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Justin M. Forbes" <jforbes@fedoraproject.org>,
 Jeremy Cline <jeremycline@linux.microsoft.com>
Subject: [snitzer:kernel-7.3/nfsd-next 5821/7489]
 arch/arm64/kernel/setup.c:220:22: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <202610122226.pFSeaYyf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/nfsd-next
head:   d0660c25145667e7336fb6b935e06d93841daa90
commit: 10f592edc6b4ce30ca4b2edd412198afdd2b6cd6 [5821/7489] arm64: add early lockdown for secure boot
config: arm64-randconfig-r2305-20261012 (https://download.01.org/0day-ci/archive/20261012/202610122226.pFSeaYyf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122226.pFSeaYyf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122226.pFSeaYyf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/setup.c:64:5: sparse: sparse: symbol 'mmu_enabled_at_boot' was not declared. Should it be static?
>> arch/arm64/kernel/setup.c:220:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/arm64/kernel/setup.c:219:39: sparse: signed value source

vim +220 arch/arm64/kernel/setup.c

   211	
   212	static void __init init_secureboot_mode(void)
   213	{
   214		void *fdt = initial_boot_params;
   215		u64 chosen;
   216		const __be32 *prop;
   217		int len;
   218	
   219		chosen = fdt_path_offset(fdt, "/chosen");
 > 220		if (chosen < 0)
   221			return;
   222	
   223		prop = fdt_getprop(fdt, chosen, "secure-boot-mode", &len);
   224		if (!prop || len != sizeof(u32))
   225			return;
   226	
   227		efi_set_secure_boot((enum efi_secureboot_mode)fdt32_to_cpu(*prop));
   228	}
   229	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
