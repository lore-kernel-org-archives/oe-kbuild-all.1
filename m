Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48636322B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 19:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692992225; x=1724528225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyAP6nMwOJLLo4fpwWgWAbyWCIKlgu3zT8S6U4Jm+BQ=;
  b=H49WyaNGjYGqDq7ltSuubvXyLfHUM9NfyH6u3B1nYU4wI2K/vqNU7siv
   4bu9eIWOck29B3Q5mqlO10BQ6+flQfl2XAPQtpVd1UrTuxNDYhMFne7UT
   Tu0qqNY+C3+Y/T2f4Sd4VVbVA/H5wn5JC3XaOE9axhiMjDbJ+Hqy8juAI
   lGmOu5CT9ysQpCUgkK9Jv2YkhS77AJHmAWSReyst50kFmCP/ugk1nJRfY
   dydCohUJjefeOPIdhoUqUP9RS1ZCHnLHQ4KeJ89Lm1ieo62rCeYjFR3pU
   J4HabtDzveajqGAvNgyNMtXGdVdDg8xxwmiliBP5sEPPih5StIdrx+avb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359785030"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="359785030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 12:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714449106"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="714449106"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 12:37:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZcc9-0003wv-2i;
	Fri, 25 Aug 2023 19:37:01 +0000
Date: Sat, 26 Aug 2023 03:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 20607/30000]
 fs/incfs/format.c:377:23: sparse: sparse: cast truncates bits from constant
 value (5346434e49 becomes 46434e49)
Message-ID: <202308260326.gSqGJVVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   c399249bc92003dde1c005501c03056039f0ccce
commit: 57e7c47daa1cae8cb8c1450ad359027bac68fb9b [20607/30000] ANDROID: Incremental fs: fix magic compatibility again
config: i386-randconfig-061-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260326.gSqGJVVX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260326.gSqGJVVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260326.gSqGJVVX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/format.c:377:23: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   fs/incfs/format.c:559:41: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/incfs/format.c:5:
   fs/incfs/format.c: In function 'incfs_read_next_metadata_record':
   include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t {aka unsigned int}' [-Wformat=]
    #define KERN_SOH "001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:308:9: note: in expansion of macro 'KERN_WARNING'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~~~~~
   include/linux/printk.h:309:17: note: in expansion of macro 'pr_warning'
    #define pr_warn pr_warning
                    ^~~~~~~~~~
   fs/incfs/format.c:619:3: note: in expansion of macro 'pr_warn'
      pr_warn("incfs: The record is too large. Size: %ld",
      ^~~~~~~
   fs/incfs/format.c:619:52: note: format string is defined here
      pr_warn("incfs: The record is too large. Size: %ld",
                                                     ~~^
                                                     %d

vim +377 fs/incfs/format.c

318babce66a62d Eugene Zemtsov 2019-11-18  361  
318babce66a62d Eugene Zemtsov 2019-11-18  362  /*
318babce66a62d Eugene Zemtsov 2019-11-18  363   * Write a backing file header
318babce66a62d Eugene Zemtsov 2019-11-18  364   * It should always be called only on empty file.
318babce66a62d Eugene Zemtsov 2019-11-18  365   * incfs_super_block.s_first_md_offset is 0 for now, but will be updated
318babce66a62d Eugene Zemtsov 2019-11-18  366   * once first metadata record is added.
318babce66a62d Eugene Zemtsov 2019-11-18  367   */
318babce66a62d Eugene Zemtsov 2019-11-18  368  int incfs_write_fh_to_backing_file(struct backing_file_context *bfc,
318babce66a62d Eugene Zemtsov 2019-11-18  369  				   incfs_uuid_t *uuid, u64 file_size)
318babce66a62d Eugene Zemtsov 2019-11-18  370  {
318babce66a62d Eugene Zemtsov 2019-11-18  371  	struct incfs_file_header fh = {};
318babce66a62d Eugene Zemtsov 2019-11-18  372  	loff_t file_pos = 0;
318babce66a62d Eugene Zemtsov 2019-11-18  373  
318babce66a62d Eugene Zemtsov 2019-11-18  374  	if (!bfc)
318babce66a62d Eugene Zemtsov 2019-11-18  375  		return -EFAULT;
318babce66a62d Eugene Zemtsov 2019-11-18  376  
318babce66a62d Eugene Zemtsov 2019-11-18 @377  	fh.fh_magic = cpu_to_le64(INCFS_MAGIC_NUMBER);
318babce66a62d Eugene Zemtsov 2019-11-18  378  	fh.fh_version = cpu_to_le64(INCFS_FORMAT_CURRENT_VER);
318babce66a62d Eugene Zemtsov 2019-11-18  379  	fh.fh_header_size = cpu_to_le16(sizeof(fh));
318babce66a62d Eugene Zemtsov 2019-11-18  380  	fh.fh_first_md_offset = cpu_to_le64(0);
318babce66a62d Eugene Zemtsov 2019-11-18  381  	fh.fh_data_block_size = cpu_to_le16(INCFS_DATA_FILE_BLOCK_SIZE);
318babce66a62d Eugene Zemtsov 2019-11-18  382  
318babce66a62d Eugene Zemtsov 2019-11-18  383  	fh.fh_file_size = cpu_to_le64(file_size);
318babce66a62d Eugene Zemtsov 2019-11-18  384  	fh.fh_uuid = *uuid;
318babce66a62d Eugene Zemtsov 2019-11-18  385  
318babce66a62d Eugene Zemtsov 2019-11-18  386  	LOCK_REQUIRED(bfc->bc_mutex);
318babce66a62d Eugene Zemtsov 2019-11-18  387  
318babce66a62d Eugene Zemtsov 2019-11-18  388  	file_pos = incfs_get_end_offset(bfc->bc_file);
318babce66a62d Eugene Zemtsov 2019-11-18  389  	if (file_pos != 0)
318babce66a62d Eugene Zemtsov 2019-11-18  390  		return -EEXIST;
318babce66a62d Eugene Zemtsov 2019-11-18  391  
4f81903f2276fc Paul Lawrence  2020-04-07  392  	return write_to_bf(bfc, &fh, sizeof(fh), file_pos);
318babce66a62d Eugene Zemtsov 2019-11-18  393  }
318babce66a62d Eugene Zemtsov 2019-11-18  394  

:::::: The code at line 377 was first introduced by commit
:::::: 318babce66a62d8bc8d5434909a044b89ab3a53e ANDROID: Initial commit of Incremental FS

:::::: TO: Eugene Zemtsov <ezemtsov@google.com>
:::::: CC: Paul Lawrence <paullawrence@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
