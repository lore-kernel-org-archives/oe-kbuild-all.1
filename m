Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557321773D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765634390; cv=none; b=oz7MJiNItkFrCzbwhrxn2/ACHnXMdcCuvmS7wp1KdypDfpS/IW+dVjTcxfALgc+Xrcguuif3Re5p+Dj6M+MSJdEt4dOybV1W/vOjzGU9LfC/OtH425HXWeEM3boYF2BdL/W25eDHtlj+Y2MMgMPsx5bbnC2N/g90N82kwQE6iVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765634390; c=relaxed/simple;
	bh=b9UW2Jqas/cQ9XwVaAk4l0+k2edk7YGy7jzpwy6Aw1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9wXV8UGugj6P58tTy0v0hyedEPZOUVoryCnZ/TGAVU/Zfuk8cvHG9z/3R81CNKt9AMnjBYua0V1slD/krJD/OVso9y2m2lSweuByOeZ8+1qYRDc7g7wNv0cfNHeeRfE4BG4K5+Qc7kYyjX9iHLPMN5goUOetBeGx0SlGblUb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byZcGFPW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byZcGFPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765634388; x=1797170388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9UW2Jqas/cQ9XwVaAk4l0+k2edk7YGy7jzpwy6Aw1w=;
  b=byZcGFPWumW+w6RBvTJ7L3eMJoR0vRk4WkKiMea1YlOfaNjrq6DQXCPG
   HC7JcjnhOrHZzOTZdnYYgG/sTcxUSLQs1CQnRwZPRq7nT6fjR/Ifj8Uew
   OAbg2AOtpS/i0HP3AlzbXhU4N5kBF5B1gPuabUnBv7I2AVYPUdBNH0Y0B
   W6pQVJnsvrvsP4bj/d5jCwJCzXStQOTn2fHZqHb4s3rPPjTNiOGsoUMBp
   jSe58ogrL93bbAsSUeDGogYikpsJQkquGdp90Zh5qFJ9vTj0NIVOfE+M1
   Llxf3bEp2Y/LLvMmUNWuIfs+vQgxgLd56SwGYmv96tKmBv4/RISb6dKfj
   Q==;
X-CSE-ConnectionGUID: WvXhPux9RHa9NqYE/R/C2g==
X-CSE-MsgGUID: LZ7LyzIIRoKygY2rti1+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67651327"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67651327"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:59:48 -0800
X-CSE-ConnectionGUID: LOEtq2OUS4m71gO7mtUiVA==
X-CSE-MsgGUID: vc7B5EwfQz6xtnHB7QL9RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196600136"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 05:59:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQ9w-000000007iF-0za6;
	Sat, 13 Dec 2025 13:59:44 +0000
Date: Sat, 13 Dec 2025 21:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 42/42]
 arch/x86/platform/efi/memmap.c:94: warning: Excess function parameter 'ctx'
 description in 'efi_memmap_install'
Message-ID: <202512132149.OYZNRiin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 0d01140e921757455730dcb6c00e45a0383f1716 [42/42] efi: memmap: Move manipulation routines into x86 arch tree
config: x86_64-randconfig-015-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132149.OYZNRiin-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132149.OYZNRiin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132149.OYZNRiin-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member 'data' not described in 'efi_memmap_install'
>> arch/x86/platform/efi/memmap.c:94: warning: Excess function parameter 'ctx' description in 'efi_memmap_install'


vim +94 arch/x86/platform/efi/memmap.c

    82	
    83	/**
    84	 * efi_memmap_install - Install a new EFI memory map in efi.memmap
    85	 * @ctx: map allocation parameters (address, size, flags)
    86	 *
    87	 * Unlike efi_memmap_init_*(), this function does not allow the caller
    88	 * to switch from early to late mappings. It simply uses the existing
    89	 * mapping function and installs the new memmap.
    90	 *
    91	 * Returns zero on success, a negative error code on failure.
    92	 */
    93	int __init efi_memmap_install(struct efi_memory_map_data *data)
  > 94	{
    95		efi_memmap_unmap();
    96	
    97		return __efi_memmap_init(data);
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
