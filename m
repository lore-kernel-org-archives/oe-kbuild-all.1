Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37D5F575
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707840422; cv=none; b=usfClYU28I0lIKTYls5T4zFhwbNPam74t1ISbZQStkCLpAeyk/9zbQWkT1827jus8vLlLBtUylIEHDr501NQNVnCINENjABOZU2QZNLhXg6obUz9vas7Jncywgd3wBNmQRGDKiOKNdzXCWgytoLb7pW2rLyarC1i0X0PfjH3EP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707840422; c=relaxed/simple;
	bh=h+gkLdefHzj2UcaLGpsV7HJKRkcnpdqDDW6GDRTJjoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3frBEgnQ2wNNqG1xaIs+0TzaWPlNNmQ5T1BE54FdwDU8X6VS1vEYIB8AxH2nqN3614AyrkNm76MMcaZW5ImR/hfCx6y7XR1/WnR/lnEwm0UHXrti4xTA7JVTM6EEMuyKEJncEjVYK7m1QCIGyefJKfQ05xlBXZrf/aWtaBrsdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb1pAZah; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb1pAZah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707840421; x=1739376421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+gkLdefHzj2UcaLGpsV7HJKRkcnpdqDDW6GDRTJjoQ=;
  b=Lb1pAZah5nARZ3YUMGFurYB+rUzASkos/npG4jBh+8gJgltKjpF8JFvF
   xUetzFP22IyDchtVinNDVlbCQ61AubU+Vn6RUGFXbdHb+U2xQ6c3TxuNk
   tzNLB6pCIzXkpjYQaCTPK0QbMsaCT+iPMVMvkQmUHZoj24EXxgIRf4mKX
   iBVRrK8LjAEru35SZ+lYBxExm1gG4Z3CrOqPgDKMk0AXy1GUarOBb4PlG
   QMxu/V1zmezL21uIO/x85PB9xUQTH2Yl1gvqv5T5f5Hty3oxAlr8mqZ4O
   vpQ37rZAlsnkQlnBeD7i6n1LjRhbrWVLEOYmt3qGWeXQQDorguzo86Mu5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1997393"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1997393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 08:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3290092"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2024 08:06:58 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZvJ9-0007rK-2T;
	Tue, 13 Feb 2024 16:06:55 +0000
Date: Wed, 14 Feb 2024 00:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 569/572] fs/xfs/xfs_healthmon.c:318:2:
 warning: label at end of compound statement is a C2x extension
Message-ID: <202402132354.z5WWflOq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   9f39f2084cebe475618d869d62b32230a7729b0d
commit: 54d827a535b03f718b188ecd3a79abebe47fa20e [569/572] xfs: report metadata health events through healthmon
config: i386-buildonly-randconfig-004-20240213 (https://download.01.org/0day-ci/archive/20240213/202402132354.z5WWflOq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402132354.z5WWflOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402132354.z5WWflOq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_healthmon.c:318:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
     318 |         }
         |         ^
   1 warning generated.


vim +318 fs/xfs/xfs_healthmon.c

   302	
   303	static inline enum xfs_healthmon_domain
   304	health_update_to_domain(
   305		enum xfs_health_update_domain	domain)
   306	{
   307		switch (domain) {
   308		case XFS_HEALTHUP_FS:
   309			return XFS_HEALTHMON_FS;
   310		case XFS_HEALTHUP_RT:
   311			return XFS_HEALTHMON_RT;
   312		case XFS_HEALTHUP_AG:
   313			return XFS_HEALTHMON_AG;
   314		case XFS_HEALTHUP_INODE:
   315			return XFS_HEALTHMON_INODE;
   316		case XFS_HEALTHUP_RTGROUP:
   317			/* static checking */
 > 318		}
   319		return XFS_HEALTHMON_RTGROUP;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
