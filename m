Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BF134AC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725805402; cv=none; b=e7ajY/Bm8eoz1UKOyx/XEmUxa2bN6x2zbGHzUY4CazZ0lOkZtJz95YPsDH7wUPB3oz7qcHXftUwW4JStJd8zbDdcaoQFWx9cDSJ/c5JlJtJGfCmPyUb6c/IcSYo0ox9nRKvfX6UHYYfgqtHS4Sa2KErl283Vyq/z5P1yxMnMzR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725805402; c=relaxed/simple;
	bh=1HihnCG4OpGqoVOk300KPdyGoigIPBk1fnQjVRla56Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQgC+Ya7HRjMlyLpM2UIAz6p3FNwbmcdNKK76tqzE7HlNsBjuN6ZePyCqoYeOJ26z51IIAOmYyStEzIOnqZHo348zS2C/lf5x4d1xDlBqt9Xdx4gPgQkDr4lulAOrhubrftr5Ta5Im174R+VISclvpvX2dOw5sjZYN6L4vHXR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyEo9CLq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyEo9CLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725805400; x=1757341400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HihnCG4OpGqoVOk300KPdyGoigIPBk1fnQjVRla56Y=;
  b=UyEo9CLqDHCVo3hb1XcMP2UVKQwGuHDSsa1zzr3/y8hZyAe/qLAGjV9V
   43E0lHyY1PLfTkg4/TpfW9JbJRiq3+s+8zgrYu08WI4BsyvA9cdsMZV56
   ZDss1CcMeztllODPbEwzGOEWSLKSVB2Bl9gnTeAcSS/6RfqYTLC+ln8qb
   8WaUm5xGe6awC5g34X4X5FPUEk3Pol5B6kqFwpYavXJeiGzwH0tP+64g2
   2EHXllbvQJyMrL7UwjHdftJcxL9J0t9IvXq5BE1vjS8AmYJh5cjGuwMz8
   OQ9CNTu1/uTM8qPjHy+ivst+23P4icK1y/Nb7qmd5IW0oMMTdMVq1C77l
   g==;
X-CSE-ConnectionGUID: k9q1nwQeRGmdVpkpwHB8tA==
X-CSE-MsgGUID: Hi4CvxLNTIGlE3A0FSfJcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27423954"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="27423954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 07:23:19 -0700
X-CSE-ConnectionGUID: UF30P15jT52c79434MxCPg==
X-CSE-MsgGUID: yhJyTVbzQQe9G8TUruE/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="103882895"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2024 07:23:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snIou-000Dbz-1c;
	Sun, 08 Sep 2024 14:23:16 +0000
Date: Sun, 8 Sep 2024 22:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 482/1172]
 include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long
 unsigned int'}
Message-ID: <202409082210.IeVRD5N6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 0f87f20d0536ae21524ce1c25335aec991229114 [482/1172] f2fs: fix to check i_compr_blocks correctly
config: i386-buildonly-randconfig-001-20240908 (https://download.01.org/0day-ci/archive/20240908/202409082210.IeVRD5N6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082210.IeVRD5N6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082210.IeVRD5N6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/percpu_counter.h:16,
                    from include/linux/quota.h:40,
                    from include/linux/fs.h:234,
                    from fs/f2fs/inode.c:8:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from fs/f2fs/inode.c:14:
   fs/f2fs/f2fs.h: In function 'blkaddr_in_node':
   fs/f2fs/f2fs.h:2377:37: warning: taking address of packed member of 'struct f2fs_inode' may result in an unaligned pointer value [-Waddress-of-packed-member]
    2377 |         return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
         |                                     ^~~~
   fs/f2fs/f2fs.h:2377:54: warning: taking address of packed member of 'struct direct_node' may result in an unaligned pointer value [-Waddress-of-packed-member]
    2377 |         return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
         |                                                      ^~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1949:26: note: in expansion of macro 'KERN_WARNING'
    1949 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:303:25: note: in expansion of macro 'f2fs_warn'
     303 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
         |                         ^~~~~~~~~


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
