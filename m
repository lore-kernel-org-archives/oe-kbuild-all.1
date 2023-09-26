Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96153717A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 21:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695764843; x=1727300843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=saS7DYev7HkbZABiAwhf7T8JIaWqjgYTGaZh5ppKvFk=;
  b=eZ61xjoCFhyWA2WjyzfVeHVCpYp8dusONLSjaXR2eHFdo0vYYCH/0Pl1
   pcFR8RCANsdsiJspdjO7++u3iAiw3tMxuPKkrFvN7gPAOqb+uzQqNeo2h
   MINY/BM8FG0SdpspjaNwdkO6WE+jHNMfFRCpen8iRv6mgVkiWH9flvwzL
   +7dX+YEIyoiEQ9RgGH0aLV78TzEK50aOtlN+CYHlmOUhlGudE/TCjBYeK
   7A/jQVDcRMRiYkFDyDPiVpFIcUQb3QGPWuaoTSxREXEGahJGDWRCgYhgH
   BxnclCIIJM42KFrJ3Px2JTD/HhK16Gl6+7Y7fUCLHBR4EAJbwDPtl++90
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385528354"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="385528354"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079872127"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="1079872127"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2023 14:46:35 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlFt3-0003OV-0s;
	Tue, 26 Sep 2023 21:46:33 +0000
Date: Wed, 27 Sep 2023 05:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fdmanana:misc-next 25/26] fs/btrfs/accessors.h:627:20: warning:
 conflicting types for 'btrfs_disk_key_to_cpu'; have 'void(struct btrfs_key
 *, const struct btrfs_disk_key *)'
Message-ID: <202309270530.JFZcxy7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux.git misc-next
head:   289858db2a1f41c9432a0aa1292c3bc0cc9005e2
commit: bb107fab47c074a7a89f4cd92949e3262b4189ab [25/26] btrfs: export comp_keys() from ctree.c as btrfs_comp_keys()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230927/202309270530.JFZcxy7c-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270530.JFZcxy7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270530.JFZcxy7c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/delayed-inode.h:17,
                    from fs/btrfs/super.c:31:
   fs/btrfs/ctree.h: In function 'btrfs_comp_keys':
   fs/btrfs/ctree.h:487:9: error: implicit declaration of function 'btrfs_disk_key_to_cpu' [-Werror=implicit-function-declaration]
     487 |         btrfs_disk_key_to_cpu(&k1, disk);
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/btrfs/super.c:55:
   fs/btrfs/accessors.h: At top level:
>> fs/btrfs/accessors.h:627:20: warning: conflicting types for 'btrfs_disk_key_to_cpu'; have 'void(struct btrfs_key *, const struct btrfs_disk_key *)'
     627 | static inline void btrfs_disk_key_to_cpu(struct btrfs_key *cpu,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/accessors.h:627:20: error: static declaration of 'btrfs_disk_key_to_cpu' follows non-static declaration
   fs/btrfs/ctree.h:487:9: note: previous implicit declaration of 'btrfs_disk_key_to_cpu' with type 'void(struct btrfs_key *, const struct btrfs_disk_key *)'
     487 |         btrfs_disk_key_to_cpu(&k1, disk);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +627 fs/btrfs/accessors.h

07e81dc94474eb Josef Bacik 2022-10-19  626  
07e81dc94474eb Josef Bacik 2022-10-19 @627  static inline void btrfs_disk_key_to_cpu(struct btrfs_key *cpu,
07e81dc94474eb Josef Bacik 2022-10-19  628  					 const struct btrfs_disk_key *disk)
07e81dc94474eb Josef Bacik 2022-10-19  629  {
07e81dc94474eb Josef Bacik 2022-10-19  630  	cpu->offset = le64_to_cpu(disk->offset);
07e81dc94474eb Josef Bacik 2022-10-19  631  	cpu->type = disk->type;
07e81dc94474eb Josef Bacik 2022-10-19  632  	cpu->objectid = le64_to_cpu(disk->objectid);
07e81dc94474eb Josef Bacik 2022-10-19  633  }
07e81dc94474eb Josef Bacik 2022-10-19  634  

:::::: The code at line 627 was first introduced by commit
:::::: 07e81dc94474eb62705c6f96d9ab1a5a797b8703 btrfs: move accessor helpers into accessors.h

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
