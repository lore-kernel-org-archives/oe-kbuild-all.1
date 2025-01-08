Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040F1A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325407; cv=none; b=KASbxlzuGb5wvE8Z+Ezm436TF4ypGbjSRav7gSVcFaC/6zqw/qL6U7Nu1xWnEGUhPRohDQCAd/kqTVfkBHQxKp5mp6TsuF5NXPOUr9dTuMZ9MQ6yGKWnuwU/eQbJWfEvfsiYBkKcn0gpADZ/3TP3fH3ySW56SeafzU1WT5OQAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325407; c=relaxed/simple;
	bh=83/vH/mgiwTZhXw6wkYujJEHjHwL2O4w6I9en1b5M9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCvLdUis6lYGdNlcnRK2sOblsBeI+okD0qaEkShzkJdyksM62ngrc8ZLpnLLfKpktN2tftVFx+weceL2XrOmLLi//xnJq6KWY1fGaqV3RYY3yBgP0ej0GH7VuTKw8dU4Y7fTuI+NU1wjwNj5/qsbQlnIBwUcpfaqnxXDTOSHAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Uv7P2h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4Uv7P2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736325404; x=1767861404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83/vH/mgiwTZhXw6wkYujJEHjHwL2O4w6I9en1b5M9s=;
  b=L4Uv7P2hFPP7NbtHzOlLGG1rG9cFPrZuz//rwpvPqdpsW786iGaUERh2
   lHR7HIbzys/f506qFYComC2FdmQq/j+RfbXZ1DG5ej6B0wAFnn5s/WV+G
   EFW55LaV0u4RnVOr3OXi7HSk0VuoAcDDsHPiGdivAi1je6gI41ih8vAJd
   XC0xU2KKGmRIfgsEqwK035cJKaDFDU02fXhreEqvN+wx0zivza6DOxjm+
   LTW7XnGaHLtfKPlvbDPwFAwHz0a8v4nb+rFiclZC9uKsEdMfMTdWWIbap
   hlcQQYPAlvi6Hr2pQOkEW3GBmPdtyxd2p/nVRc+EhPaL8law/LZaF3NML
   Q==;
X-CSE-ConnectionGUID: jfBI9lrGTbu535sJYeh5Sw==
X-CSE-MsgGUID: pWIRPc9ITQK59Pm1j+VBNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47114967"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47114967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:36:42 -0800
X-CSE-ConnectionGUID: mSHwWa2nS9Wte7+9TCKKlQ==
X-CSE-MsgGUID: wykaXV0eSc+DIHuiNlahjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="108010343"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jan 2025 00:36:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVRYL-000Fo4-2x;
	Wed, 08 Jan 2025 08:36:37 +0000
Date: Wed, 8 Jan 2025 16:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [linux-next:master 3442/6768]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:5690
 CalculatePrefetchSchedule() warn: inconsistent indenting
Message-ID: <202501081642.I9VLeMNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
commit: be4e3509314af751f08677f428f93c306aaa2f8e [3442/6768] drm/amd/display: DML21 Reintegration For Various Fixes
config: x86_64-randconfig-161-20250107 (https://download.01.org/0day-ci/archive/20250108/202501081642.I9VLeMNH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081642.I9VLeMNH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:5690 CalculatePrefetchSchedule() warn: inconsistent indenting

vim +5690 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c

be4e3509314af7 Austin Zheng     2024-11-25  5680  
70839da6360500 Aurabindo Pillai 2024-04-19  5681  		} else {
70839da6360500 Aurabindo Pillai 2024-04-19  5682  			*p->dst_y_prefetch = s->dst_y_prefetch_equ;
be4e3509314af7 Austin Zheng     2024-11-25  5683  
be4e3509314af7 Austin Zheng     2024-11-25  5684  			if (s->dst_y_prefetch_equ < s->dst_y_prefetch_equ_impacted)
be4e3509314af7 Austin Zheng     2024-11-25  5685  				*p->dst_y_prefetch = s->dst_y_prefetch_equ_impacted;
be4e3509314af7 Austin Zheng     2024-11-25  5686  
70839da6360500 Aurabindo Pillai 2024-04-19  5687  			s->TimeForFetchingVM = s->Tvm_equ;
70839da6360500 Aurabindo Pillai 2024-04-19  5688  			s->TimeForFetchingRowInVBlank = s->Tr0_equ;
70839da6360500 Aurabindo Pillai 2024-04-19  5689  
70839da6360500 Aurabindo Pillai 2024-04-19 @5690  		*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
70839da6360500 Aurabindo Pillai 2024-04-19  5691  		*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
d07722e1fc749f Austin Zheng     2024-08-15  5692  

:::::: The code at line 5690 was first introduced by commit
:::::: 70839da6360500a82e4d5f78499284474cbed7c1 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
