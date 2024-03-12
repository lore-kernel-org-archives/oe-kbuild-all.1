Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E07494
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710211212; cv=none; b=MGVwgUoem5ABU5jGofb90znB94LgtcS+LBqBbWd2BD/+UznGb3325BJHlYSyMN7MQ4Z8vDANtoiSnDS0k/hgVGQzAYfv7qzfb4K3k4H8leg/9OixuNUYRGwepRZOlftSUfwvQDYM7TKZyctVx3Xygbjss+TiM3I7Eo3zsISuOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710211212; c=relaxed/simple;
	bh=1mTuhZ7V7+GmDfoEezAbtjbDChxbpIq5YU2VcU/dmow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGoB6WyzfUFa4Rwf73JoOjSURji+T9ihT6CuVOzl3gMHpRI9L9COK6Mb08AQ5iRPb1KibZNcT2jbm/YC4fH0VZ6JREH2XhsZgqS8JJwIOrCwBfk7iOT7ifdW5i+RcjsJhSBM6DaAxGjP1Gkp0vTz90At/ONjdDqvny4pujgpsbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUX2grdX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUX2grdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710211211; x=1741747211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1mTuhZ7V7+GmDfoEezAbtjbDChxbpIq5YU2VcU/dmow=;
  b=dUX2grdX3s5y+CbCxqAbGZEhRj1YZIPMAWY4LuHk/A/7XiDzXrcE1q6h
   nlSdfGLkjK/2W5NwYbGhVGUGqi/rT4lDE6JOMl8SwlncsOkec5O0EgiGS
   suR8tYFAMYAP3BO0repFIG4dCFZKdgd1+Hnt6zXolJh3t3NVRBf5v2uzu
   fEt8l1kC0EnZm02wDaqyZwQ8wLEB2ClAPP9T4uDouwG2EKhRbE9TgUCIn
   gSwfmvRRdi3T4b6TwCUbdLPtItww/MmMzxTT/IqhIoqbxde7ZcC+vFgpr
   PTQJID6c6djJ/rAc4gDVyCbvn/qwUNij1KpD2ws8GYPfTOtixVEGfkYv9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4760506"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="4760506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 19:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11294484"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Mar 2024 19:40:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjs3g-0009fr-2m;
	Tue, 12 Mar 2024 02:40:04 +0000
Date: Tue, 12 Mar 2024 10:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/18] include/uapi/linux/mman.h:18:25:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '9223372036854775858' to '50'
Message-ID: <202403121053.pCXLHiHI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   23e5041bd90d0f3c526a3821c5f06b88c17784a9
commit: 66197e927d9f4f6fe4d6cc90da3894a95daa71d8 [1/18] ANDROID: 16K: Handle filemap faults
config: i386-buildonly-randconfig-004-20240312 (https://download.01.org/0day-ci/archive/20240312/202403121053.pCXLHiHI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121053.pCXLHiHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121053.pCXLHiHI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mman.h:9,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:7,
                    from mm/page_size_compat.c:13:
   mm/page_size_compat.c: In function '___filemap_fixup':
>> include/uapi/linux/mman.h:18:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '9223372036854775858' to '50' [-Woverflow]
      18 | #define MAP_PRIVATE     0x02            /* Changes are private */
   mm/page_size_compat.c:137:41: note: in expansion of macro 'MAP_PRIVATE'
     137 |                                         MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED|__MAP_NO_COMPAT,
         |                                         ^~~~~~~~~~~


vim +18 include/uapi/linux/mman.h

607ca46e97a1b6 David Howells      2012-10-13  16  
746c9398f5ac2b Michael S. Tsirkin 2019-02-08  17  #define MAP_SHARED	0x01		/* Share changes */
746c9398f5ac2b Michael S. Tsirkin 2019-02-08 @18  #define MAP_PRIVATE	0x02		/* Changes are private */
746c9398f5ac2b Michael S. Tsirkin 2019-02-08  19  #define MAP_SHARED_VALIDATE 0x03	/* share + validate extension flags */
746c9398f5ac2b Michael S. Tsirkin 2019-02-08  20  

:::::: The code at line 18 was first introduced by commit
:::::: 746c9398f5ac2b3f5730da4ed09e99ef4bb50b4a arch: move common mmap flags to linux/mman.h

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
