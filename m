Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 20:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EB6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TVR8cGyP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793219101; x=1824755101;
  h=date:from:to:cc:subject:message-id;
  bh=/tsFmMB2BlLmFLAv2b3TKl5XLMl6iIYYP79ZNF2eoDc=;
  b=TVR8cGyPwQibfVZB+BXtSJK3Pypbt7Pjop1XB7Sf461gzoBdG6GpptMw
   /foxzklu23YVhbSLywyfv59LL6yv3SzF7insBGbF4mipcU29MIShDISbF
   cc56y2NnbtfnwRJJ0QdM4SZFfsA/HKsF4CYoAP/WcMSjwEkKZD6y+mECS
   pWcEIEQY+DZ2R9vJe/yyObVQWjapAXMnt4ksshxDFaALHjgrtaC0+oOjs
   NhZi3iEeWHDZnkGBAhANLu1ZrIEXOeAdFZiHYz4T3aCkUVKr5DQiEt5x3
   TfXMKpkElXH7QHTvWOHEPNQWhEyG1NhUyXhV+Ougtuifb4f9DpJJqR0bj
   A==;
X-CSE-ConnectionGUID: F4Fq7H54SLyux4xCM5K8YA==
X-CSE-MsgGUID: DhgHlFWZQ9aQixTfKu+dXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1969943"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1969943"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 13:24:51 -0700
X-CSE-ConnectionGUID: Nri+EFMIRDChuDhAYelfXQ==
X-CSE-MsgGUID: Fctv62cPSw+u6kCNP+8K/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5048260"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 13:24:51 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMACW-000000004yZ-1THE;
	Wed, 28 Oct 2026 20:24:48 +0000
Date: Wed, 28 Oct 2026 21:24:32 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/pgsize_migration.c:98: warning: expecting prototype for What(). Prototype
 was for init_pgsize_migration() instead
Message-ID: <202610282103.hWUgSZh2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ffdb1830342c4c7db15068ca5cdcebb04dd14db6
commit: e79c1d45908063d1d7bc247e0e9bde6d9283a09e [353/353] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610282103.hWUgSZh2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282103.hWUgSZh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282103.hWUgSZh2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgsize_migration.c:98: warning: expecting prototype for What(). Prototype was for init_pgsize_migration() instead


vim +98 mm/pgsize_migration.c

    81	
    82	/**
    83	 * What:          /sys/kernel/mm/pgsize_migration/enabled
    84	 * Date:          April 2024
    85	 * KernelVersion: v5.4+ (GKI kernels)
    86	 * Contact:       Kalesh Singh <kaleshsingh@google.com>
    87	 * Description:   /sys/kernel/mm/pgsize_migration/enabled
    88	 *                allows for userspace to turn on or off page size
    89	 *                migration mitigations necessary for app compatibility
    90	 *                during Android's transition from 4kB to 16kB page size.
    91	 *                Such mitigations include preserving /proc/<pid>/[s]maps
    92	 *                output as if there was no segment extension by the
    93	 *                dynamic loader; and preventing fault around in the padding
    94	 *                sections of ELF LOAD segment mappings.
    95	 * Users:         Bionic's dynamic linker
    96	 */
    97	static int __init init_pgsize_migration(void)
  > 98	{

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
