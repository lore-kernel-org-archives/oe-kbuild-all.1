Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82145BE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735023048; cv=none; b=SkeuO3dJ3sq8gtVB8u/SyDQF7D0WwmQiapya8rpAjrzg38XGOjIWjMV2u4z//Ew2x8rzxldwH4W8ZTSb9oOFN0tC21CKvgp2XMVji3NJvPSuSGUrVjAUquXfy0MBDUHmyIe8gzCpGHY6KXn1rwyHrE27nGSnvmHRBZXlrL8/Osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735023048; c=relaxed/simple;
	bh=tFlqkDqEPboY6ZwBzVlMFI/Q5yiBRQbDA5WkiTr0RKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sj8Yn6QqKB5o+20zxj63X7J5WVqG3NJB4Mco/pULZmGLXOKkL1W/BIW5uY9NrcHDHe0Sa6/RTstihE87jL4NZcOSqOuKClFtBL/SZbrlPhfskcHBEn1ZQ3hs8fiRJ8xNSyCnmQ4SEt7gATPqY39zNHQDds8PzhmAYKWbmy2r+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkQgjcwK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkQgjcwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735023047; x=1766559047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFlqkDqEPboY6ZwBzVlMFI/Q5yiBRQbDA5WkiTr0RKI=;
  b=YkQgjcwKrLJSuY83EDK26jHUwToTKw7XDlxxP9qzEKRtIX9ITxbvuKFB
   AF7uptQPxLJts/YTM+bcllKQ9OK9a3Gsw6o8uOeWZdrIw0UqCUYthESij
   p2H2D/kMfivph5qdAxmmEirJduAOvUuvnpwdOGwANMkj51wUprr8pEXXB
   DGnvyxlRwshtZR+L9d/qNoKBMz1S1Ysoaj8SZqCPK5hHf7+9Wb3+JNF7t
   iAYtW2+fxtA6Ya5lg53rznzom49gc81XOF1qtrufXXInD2JoYs2gszPiH
   7tyz6KKa4zmBTIuVR/F01iJtMeQuiKyMOZapYYzqQLzt9vpqutNpaJ/N1
   Q==;
X-CSE-ConnectionGUID: sGkEb1o5RjWQjXhcIUZFiw==
X-CSE-MsgGUID: D8PP6Iv4Sz+XMEke18RV2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46089572"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="46089572"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 22:50:46 -0800
X-CSE-ConnectionGUID: 9laQwv3JQ8GC45iik5enwA==
X-CSE-MsgGUID: AffU/dCwQK6iS/Q+qpZ4WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="99164340"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2024 22:50:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPykd-0000vR-1Y;
	Tue, 24 Dec 2024 06:50:43 +0000
Date: Tue, 24 Dec 2024 14:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 drivers/ufs/core/ufshcd.c:2307:26-31: WARNING: conversion to bool not needed
 here
Message-ID: <202412241447.rQWN5ZcN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   57fdd37edf0708de00366c56c656447dadff9c7a
commit: d32533d30e2119b0c0aa17596734f1f842f750df [2/2] scsi: ufs: core: Poll HCS.UCRDY before issuing a UIC command
config: arm64-randconfig-r053-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241447.rQWN5ZcN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241447.rQWN5ZcN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ufs/core/ufshcd.c:2307:26-31: WARNING: conversion to bool not needed here

vim +2307 drivers/ufs/core/ufshcd.c

  2293	
  2294	/**
  2295	 * ufshcd_ready_for_uic_cmd - Check if controller is ready
  2296	 *                            to accept UIC commands
  2297	 * @hba: per adapter instance
  2298	 *
  2299	 * Return: true on success, else false.
  2300	 */
  2301	static inline bool ufshcd_ready_for_uic_cmd(struct ufs_hba *hba)
  2302	{
  2303		u32 val;
  2304		int ret = read_poll_timeout(ufshcd_readl, val, val & UIC_COMMAND_READY,
  2305					    500, UIC_CMD_TIMEOUT * 1000, false, hba,
  2306					    REG_CONTROLLER_STATUS);
> 2307		return ret == 0 ? true : false;
  2308	}
  2309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
