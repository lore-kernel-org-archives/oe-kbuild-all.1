Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAA1DFE8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 02:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190239; cv=none; b=tRMHKtNyojE9fb003ZFvYnqFD3qsmJxKFTiX6OnBk7QOzPCpzt5NjAj9gZKuBoJF71lUeuWo/qlhNh4PbliveFcnk/vV/BilMFEZ0MUyvE968Lrs3rIZeU+ehBH2YyYFcgIVe7tIf/WiV6z0qIdG5W/MdLcD4+2gaXjdb+ND3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190239; c=relaxed/simple;
	bh=tKxEawiPDguAoa6FhlfOXnvM/FxGFFtl1F5xuCMCeeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwAhyIbV5zK4mDSGkurFSTMcXqdw9dOy0k+LGuUqFpkp311HcCOhM1iA3lGHnOrEwKNzkDncBQGhNyjbgmImIERh1qrB/DxXErmB2TBIOuV4mO0PbwJD28KkvyZdq3XuRml64YiqGK9vqOfP79T4Cwlr4CgIXGPkTM93mI2RZ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Dl+28c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4Dl+28c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747190238; x=1778726238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKxEawiPDguAoa6FhlfOXnvM/FxGFFtl1F5xuCMCeeY=;
  b=L4Dl+28cNbZIxjtnNJrBTQQTDVsJl5b8ZdpcC4FFm5npOx+m8LCZ3/bC
   ue0qW/D+x57QCIHiTLakGek/lHsvnonIuT51N7wXILj+eqvNKhmO72+9g
   0z2BQXvrtEhqlRWIcJY0rTUttcV32Ed5LChOB9jop1oeDAitd2cVKQs36
   xKcupFA4x+b19vAeqokwmePRnvzVPVuh/2x+lgc1YrsSUCGXdG8YihxMV
   8maAMJUkd2azEWDrdwJoEz2ymuvBjspVfwtit5IfFhGgz2SF/NWd/88qc
   jdOGol+V8yKUnl1tSzEHhkCbos+PE9Lkla9nY0ZXOZujDKIv8CtxkT7JK
   g==;
X-CSE-ConnectionGUID: FemXVtJLSECoFIymBHg24g==
X-CSE-MsgGUID: CBL91MstQDWvxKiA+vKVqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48996425"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48996425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:37:16 -0700
X-CSE-ConnectionGUID: QjeHAsQ+ROSkrF4EIBq+PA==
X-CSE-MsgGUID: le9D11xwRDG9xzdeivIEXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138817573"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 19:37:14 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF1zb-00015q-35;
	Wed, 14 May 2025 02:37:11 +0000
Date: Wed, 14 May 2025 10:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>
Subject: [jaegeuk-f2fs:dev-test 186/191] include/linux/kern_levels.h:5:18:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 4 has type 'unsigned int'
Message-ID: <202505141028.6gTS0aOI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   869734b9a4ef9440e80dba629c688ed3277a7779
commit: 5cefc0eae8b492a1eaa645f11d0dbe362d8d8700 [186/191] f2fs: separate the options parsing and options checking
config: arm-randconfig-2006-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141028.6gTS0aOI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141028.6gTS0aOI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141028.6gTS0aOI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'handle_mount_opt':
>> include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
         |                  ^~~~~~~~
   fs/f2fs/f2fs.h:1883:26: note: in expansion of macro 'KERN_ERR'
    1883 |  f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~
   fs/f2fs/super.c:766:4: note: in expansion of macro 'f2fs_err'
     766 |    f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
         |    ^~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
