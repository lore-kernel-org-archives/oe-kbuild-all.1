Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B124E4A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 23:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751500505; cv=none; b=T7Kd+vTDaNO3DcPOY8RvOL7yPmkwIsLLrh73WMKFat84aUKBuGfwpH0RNY190iimPrNSfys6PMHmnKe4I81iiwmjtBXFw8mG7LZWiohYXZwYwBsG2bcdAQX+y0Jya7f3bQNrlpqV6EkF5oScPQXHlNYItDqVCe9yn0xXmAf/3PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751500505; c=relaxed/simple;
	bh=s3OPQSzwPg00hV1YzATCwvchQlSKdU8S5Xd5zApaiGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKS0W5rECoviWpgpwRtVEBsjjEU6cKEmVJ08EZiaa/R9XoN+On+JT0EhshQa5FVoGDVarGtvlE/TgTVbPLiW6x3LAnf4bKQNRZLoxgLvf9POkYWLCUWdoDvmMu4rF1siDlr2F6Rf+85u/dSRO4ELi3oTsPQP4mEV6+6O2Jl35lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPJj4z3B; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPJj4z3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751500504; x=1783036504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3OPQSzwPg00hV1YzATCwvchQlSKdU8S5Xd5zApaiGM=;
  b=nPJj4z3BNTskp2zjqTPxtpU197E8/KhDxVPziecU7FdduGwq36E5R4HJ
   pj7UaGWdpS/EtY/4OaoYosPymNA8jOSoZ55pCzaXVg4UrHu9aNYEDh75c
   1FVQe+1v8fal4nTUOWG/4VPFYQinlREuZpcrq1nnuZcGvGSNtCw2qTogW
   nT11JfrsU8xyLtfr2Fqf3rm8t0J4OA2amGDoECvr+fptjDEboYAmhz7V0
   vg3QFifIMNlZ9D579+hLsU4XoFMEandIGbDbedySwDxNTRsAR3pjFcAlY
   cmDxpwMqerkmPR+4xb7AMQm2rA8I5Ne3XIo5Fj1CcBnxnRJsWF8BQS5Bm
   Q==;
X-CSE-ConnectionGUID: eogKh1Z/R56m1PdMKPk1gQ==
X-CSE-MsgGUID: 0Z6fOrV1Snq2yT+sVWxsxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57623240"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="57623240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 16:55:03 -0700
X-CSE-ConnectionGUID: fMFjjWJOQ2W8QYTRwqewsg==
X-CSE-MsgGUID: 8olKBYQZTUOkWla7g+/AAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158782410"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 16:55:02 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX7I3-0000Mv-0B;
	Wed, 02 Jul 2025 23:54:59 +0000
Date: Thu, 3 Jul 2025 01:54:52 +0200
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>
Subject: [jaegeuk-f2fs:dev-test 26/28] include/linux/kern_levels.h:5:18:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 4 has type 'unsigned int'
Message-ID: <202507030123.7D6FE7m9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   90548c634bd0dc691ec01fefc0e4960afc49c5eb
commit: 74c8de2976b01dd602a808ac92f037fcae2fdc5c [26/28] f2fs: separate the options parsing and options checking
config: arc-randconfig-2001-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030123.7D6FE7m9-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030123.7D6FE7m9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030123.7D6FE7m9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
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
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   fs/f2fs/f2fs.h:1889:26: note: in expansion of macro 'KERN_ERR'
     f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
                             ^~~~~~~~
   fs/f2fs/super.c:767:4: note: in expansion of macro 'f2fs_err'
       f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
       ^~~~~~~~
   fs/f2fs/super.c:767:57: note: format string is defined here
       f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
                                                          ~~^
                                                          %u


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
