Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9344E055
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945949; cv=none; b=tlvQziJH5oNnjPn7HMj5gP9tLvBxPIaJqz9qBIqLaTAoRsbMzwlkelUHJF6oNwxuNnZU4idT/U1eZehPVzpp8Cf+aO+QTX86Qm+BbyXf9Dfg/gHkjVizziC/1CP/Brt4xaghmT8+AGbUrVmY6cGAxi5F+S546fbNI7jlm082v0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945949; c=relaxed/simple;
	bh=fDwQq1PoLtYTk3UCJrF6sH+OWHWFsprQXXBSS+guMbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tsSk0UrEOJcu6lsZffddtXBk14NUmvm7scQzJb+Zo9aJd2c43GnCS6M8NnbcmCnOqSHt6a8GJ/tS97NgxYlakdhHS635izAxnTtEf97R/NxIhvVf+cDGCA9Xzblgzto7BzHkWAdT5KPMn4Vlff2O5Y3ART9aZwqUs+K2UnYj4GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2Oovoe8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2Oovoe8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790945948; x=1822481948;
  h=date:from:to:cc:subject:message-id;
  bh=fDwQq1PoLtYTk3UCJrF6sH+OWHWFsprQXXBSS+guMbA=;
  b=i2Oovoe8uekz1+Hvdc/ScT6pj/ewovwGJzLoMIV2czWA5yiLeAOMChtF
   E3Dksw5WeBfwd133prFNEGj+HxFNqye9gk0xHuA6pdFJjQRoI/JXaCps5
   pA61VdXAntMsq9AVNAsss2aWTrlZL70wurX6DhyxDRGsCldTeaLsGkFCQ
   2yvN7vRcMEAuI98gEMYUvBPlqFgD5wZWfSMIhO0/Ck1r7j8Nu+gfM57Ia
   xc6v5Tv21H+99ZBEoVXJuirJbv2YuOgOLOBYv5OVXndDcAKjUCWUtzJSV
   EzQWHdHUclfq7hxRB7hUd9GBi97we8bc+qsv/W2jkzIKwN1s1k6Y+9HXg
   A==;
X-CSE-ConnectionGUID: WQUi8lgaQP2XzUpNRWw8nw==
X-CSE-MsgGUID: qRVG9JYiS7KavnDpCReEcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90766033"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90766033"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 05:59:07 -0700
X-CSE-ConnectionGUID: FPsc68sqS/S3afFFxmYfQw==
X-CSE-MsgGUID: zw63ZRBtRGuHBGh/GMxoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="272645234"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2026 05:59:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCcqt-00000000T3M-29le;
	Fri, 02 Oct 2026 12:59:03 +0000
Date: Fri, 02 Oct 2026 20:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 7/7]
 kernel/locking/rwsem.c:1651:9: error: implicit declaration of function
 'trace_android_vh_rwsem_write_finished'; did you mean
 'trace_android_vh_rwsem_write_wait_finish'?
Message-ID: <202610022054.FIim50VX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   46c9dcf34122090162fe8bdaf2c9f5c17fc95448
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [7/7] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: i386-buildonly-randconfig-1005-20261002 (https://download.01.org/0day-ci/archive/20261002/202610022054.FIim50VX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022054.FIim50VX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022054.FIim50VX-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'up_write':
>> kernel/locking/rwsem.c:1651:9: error: implicit declaration of function 'trace_android_vh_rwsem_write_finished'; did you mean 'trace_android_vh_rwsem_write_wait_finish'? [-Wimplicit-function-declaration]
    1651 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_android_vh_rwsem_write_wait_finish


vim +1651 kernel/locking/rwsem.c

  1644	
  1645	/*
  1646	 * release a write lock
  1647	 */
  1648	void up_write(struct rw_semaphore *sem)
  1649	{
  1650		rwsem_release(&sem->dep_map, _RET_IP_);
> 1651		trace_android_vh_rwsem_write_finished(sem);
  1652		__up_write(sem);
  1653	}
  1654	EXPORT_SYMBOL(up_write);
  1655	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
