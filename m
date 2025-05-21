Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E11C8613
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813533; cv=none; b=cr4Ut5KNOI2mS4cBSwY/cyD6zBQId7IpVqoCo26vEMNNKdq/p8GTvbKOKZl4fyf6XPqlkiq5WX6wc4WdhtN7OaXgF6I66YZ+HLUbnZlKmLE0XzrpIT/SOiXBxqEDiootrxp9dTs6yDsqI3wdQ4lRJvRBJV4PFqhWSL0HMcUk9TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813533; c=relaxed/simple;
	bh=5QdVJzCnqU2vMERkxnZj65gFF6gZ0dYHzDGDkDREFgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2OhVbZ8SCuJ/Vaj9kMZHXOWjtanqyMK5tdlkLCPLaIeWj7pkVBEg/uVcNLjRdV/WkApMWkUv/RVzuLOFOpRySvfuTp/rGthKvAKRlt8xnAalR+hu3g+e2C6EjP0vuvRm+HkiRIqmosaG+tXdipBjyu+Hk9eq9193v0YGIfEwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJicHz/h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJicHz/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747813532; x=1779349532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QdVJzCnqU2vMERkxnZj65gFF6gZ0dYHzDGDkDREFgg=;
  b=bJicHz/heF1DGgw4PPQdutxVkB7KsEjyLZ0fzVVZtGUCHjxFLMTc/mE0
   Yt40H/GqS0BJNQ8U3Qh/7DUOWjZr1CJESaVKYO+xXTJeARM2ZpcIU+yQ5
   AnqJW5ObUheay7ofhmVErj9chwe1QhsRARC1njHCcQ3Cky1ma2U83JvG9
   23Hg1SEdNy5JbhssKVdL0BRihy6S88EXiry4PmvnrGoUvXcpU8zLQjEIG
   c85SIS3S9bKzH4F+nmHfK5MznPaLe1BVTGpYyaLg1fRpO8GrjcSmphOgT
   m7DJz3+Am8EWK2GXk+mp7KlQob+XrwndqfJbCb139O3+QVkAcybk5D+iz
   A==;
X-CSE-ConnectionGUID: Uq1W1i6NTUysnTYg42HuTQ==
X-CSE-MsgGUID: CzyMucJ6TziM8e/mRSU+jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60419185"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60419185"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 00:45:32 -0700
X-CSE-ConnectionGUID: 5ze5yM9ARAaQT0pgDfFoxA==
X-CSE-MsgGUID: A5sv8AZdS/+juU98K83VaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139840969"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 00:45:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHe8m-000O00-2G;
	Wed, 21 May 2025 07:45:28 +0000
Date: Wed, 21 May 2025 15:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] include/vdso/bits.h:7:33:
 warning: overflow in conversion from 'long unsigned int' to 'u8' {aka
 'unsigned char'} changes value from '(long unsigned int)((int)vf_id << 8 |
 128)' to '128'
Message-ID: <202505211542.ZxUBwuGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincenzo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   e0a30b8f9550000cfde7b0292e76fcb23e358060
commit: 2da9d9c34b030b3b550f218515a8349995b706b4 [1/1] UPSTREAM: linux/bits.h: Extract common header for vDSO
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505211542.ZxUBwuGE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211542.ZxUBwuGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211542.ZxUBwuGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/net/ethernet/qlogic/qed/qed_debug.c:6:
   drivers/net/ethernet/qlogic/qed/qed_debug.c: In function 'qed_grc_dump_addr_range':
>> include/vdso/bits.h:7:33: warning: overflow in conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '(long unsigned int)((int)vf_id << 8 | 128)' to '128' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2572:31: note: in expansion of macro 'BIT'
    2572 |                         fid = BIT(PXP_PRETEND_CONCRETE_FID_VFVALID_SHIFT) |
         |                               ^~~
   In file included from drivers/net/ethernet/qlogic/qed/qed.h:51,
                    from drivers/net/ethernet/qlogic/qed/qed_debug.c:9:
   drivers/net/ethernet/qlogic/qed/qed_hsi.h: At top level:
   drivers/net/ethernet/qlogic/qed/qed_hsi.h:4543:25: warning: 'iro_arr' defined but not used [-Wunused-const-variable=]
    4543 | static const struct iro iro_arr[60] = {
         |                         ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_RPMHPD
   Depends on [n]: QCOM_RPMH [=n] && QCOM_COMMAND_DB [=y]
   Selected by [y]:
   - GKI_QCOM_CLKS_CONFIGS [=y] && ARCH_QCOM [=y]


vim +7 include/vdso/bits.h

     6	
   > 7	#define BIT(nr)			(UL(1) << (nr))
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
