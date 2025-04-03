Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8BA14386D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648022; cv=none; b=M1PbQATA6/dF7UzUNdADRtA4/+AdVzeaKFgoNwdGqoRiL2lv3LmgrgutRs5WcA06zVY8Krm2dVWwR5nEVtovxJ75hEuL75RrdCsmeoIRJdAOVYoH2G9rZa9I5ndM2HW7aWasfMeU9fo5R0RxdvNLIZpuc+RKr0fg+3HceYYaS+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648022; c=relaxed/simple;
	bh=PMyCkoDu4MzAoHAnhWO4phIxQBBmZYv3Cf0w+9QGkWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MARYyCBZvQmHqoKKRf27hFyCthxJeKjggeM333mm3w1hZkQ4C/dn1lVtrpNS9YHxaZr1qGNrLXrIZ40e0qFE6asbAnPAEeKp8Ltuf38HJfPGvc6z4ImcTcjmoKnJe1Y10DGOIJ8daX7n+Pm7rarQHSx7HFWCQZydKkg1tYr1gXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHf3zlPP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHf3zlPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743648019; x=1775184019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMyCkoDu4MzAoHAnhWO4phIxQBBmZYv3Cf0w+9QGkWQ=;
  b=GHf3zlPPP9+W3fjsrbsZcfr1s4FjN876bFmGzfKQP4ZI1rMMtmV5ahyf
   ARhqjjANnXSPSDPc1kZQ96l7cXxEghwAATLjifzx07QuP+P/zgIXc8tIi
   cwBy6Hu/GDsH69oWzwk3MZofzGswz9r2z0OS90lEpeu8N8jeV7lXuTXaf
   J9PnWUcaaWDYfhCa5dI/Xy/JIlZ7vTip866600Ky+Vlnk7cfk+rlXe2rv
   c+3GyfXWgLJXNGoq8rQY3WXD+zc3AbjTZKhpSRZ4VHXtX7CB3XTZmazU/
   Va1+vPxokYdz3ux7B87b7Nfau24DpHfg2z2DJYcS0krwlS8SVTSA0ZfKo
   Q==;
X-CSE-ConnectionGUID: rEpJwnqCRCa0LMlf9JFLsQ==
X-CSE-MsgGUID: 30UF+VFPQKyVDp/9CM3rTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44747151"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44747151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:40:16 -0700
X-CSE-ConnectionGUID: a8WvpubfTEG5VfaTnjiFdA==
X-CSE-MsgGUID: 5F0W6HsLSGCBmXNPVaGhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127370073"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2025 19:40:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0AV2-000BBA-2V;
	Thu, 03 Apr 2025 02:40:12 +0000
Date: Thu, 3 Apr 2025 10:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1555/1555] drivers/iommu/dmar.o:
 warning: objtool: dmar_acpi_insert_dev_scope()+0xaf: unreachable instruction
Message-ID: <202504031027.4sVPB11F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ecd01009a68c85a017e3ae2d2189eab81a6272a6
commit: 0f7d0c8b66a415734cbd2c8a7afc586c4a1d61cc [1555/1555] iommu/vt-d:Add support for detecting ACPI device in RMRR
config: x86_64-buildonly-randconfig-005-20250402 (https://download.01.org/0day-ci/archive/20250403/202504031027.4sVPB11F-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031027.4sVPB11F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031027.4sVPB11F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/dmar.c:769:38: warning: arithmetic on a null pointer treated as a cast from integer to pointer is a GNU extension [-Wgnu-null-pointer-arithmetic]
     769 |                         if (!ACPI_SUCCESS(acpi_get_handle(ACPI_ROOT_OBJECT,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     770 |                                                           andd->device_name,
         |                                                           ~~~~~~~~~~~~~~~~~~
     771 |                                                           &h))) {
         |                                                           ~~~~
   include/acpi/actypes.h:458:56: note: expanded from macro 'ACPI_ROOT_OBJECT'
     458 | #define ACPI_ROOT_OBJECT                ((acpi_handle) ACPI_TO_POINTER (ACPI_MAX_PTR))
         |                                                        ^
   include/acpi/actypes.h:509:41: note: expanded from macro 'ACPI_TO_POINTER'
     509 | #define ACPI_TO_POINTER(i)              ACPI_ADD_PTR (void, (void *) 0, (acpi_size) (i))
         |                                         ^
   include/acpi/actypes.h:503:84: note: expanded from macro 'ACPI_ADD_PTR'
     503 | #define ACPI_ADD_PTR(t, a, b)           ACPI_CAST_PTR (t, (ACPI_CAST_PTR (u8, (a)) + (acpi_size)(b)))
         |                                                                                    ^
   include/acpi/actypes.h:501:66: note: expanded from macro 'ACPI_CAST_PTR'
     501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
         |                                                                  ^
   include/acpi/acexcep.h:57:44: note: expanded from macro 'ACPI_SUCCESS'
      57 | #define ACPI_SUCCESS(a)                 (!(a))
         |                                            ^
   1 warning generated.
   drivers/iommu/dmar.c:391: warning: Function parameter or member 'header' not described in 'dmar_parse_one_drhd'
   drivers/iommu/dmar.c:391: warning: Function parameter or member 'arg' not described in 'dmar_parse_one_drhd'
>> drivers/iommu/dmar.o: warning: objtool: dmar_acpi_insert_dev_scope()+0xaf: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
