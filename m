Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F8F654
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 02:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHHZOwCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703469689; x=1735005689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iao5A4gwglH5h3QB0d9t0zkWIiSUezYXY5SpqUjFIDM=;
  b=BHHZOwCusVD6H0Jq7vqOtqkYEV9u0NKSthx+bAbkjCmRLvUj2UNscomZ
   5fnqcKOhuCvAwPKdjIhUTedM88MYQ3GYTp+GVZpJvbLgCF+5MhRygB1ct
   YMABJV2OdI4FVPK4enO/imXKyLUHCutQyTKhyZdqRRloxQR92A5cBHQTW
   ffAY73suib0AlTwJ9QJUrv7rZUJUhE2StXj5kSKqTwTGMAMrJt1iw2iKG
   1oSv4niV2JUMbB8UBSEzWDxLM/qDc9KKFOMEM1WAxt4hwnd6pN5TiOEoq
   tjCagYwkpPO+ytBKljx6YQxRrXRUKvf8xZOQqxBHE/s/xe9xaN07iecwd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="395995025"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="395995025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 18:01:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="12088549"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2023 18:01:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHaF5-000Cq5-0p;
	Mon, 25 Dec 2023 01:59:37 +0000
Date: Mon, 25 Dec 2023 09:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 6/16] fs/f2fs/checkpoint.c:173:6: warning: no
 previous prototype for '__f2fs_is_valid_blkaddr'
Message-ID: <202312250912.cvIbU0gX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   2a6668b0457fcbe4a1e8ebf9dac039dff7ff6c0d
commit: 2e82ba5e00b8108be52fd5f213558e362a77f56d [6/16] f2fs: introduce FAULT_INCONSISTENCE
config: arc-randconfig-001-20231225 (https://download.01.org/0day-ci/archive/20231225/202312250912.cvIbU0gX-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250912.cvIbU0gX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250912.cvIbU0gX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:173:6: warning: no previous prototype for '__f2fs_is_valid_blkaddr' [-Wmissing-prototypes]
     173 | bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/__f2fs_is_valid_blkaddr +173 fs/f2fs/checkpoint.c

   172	
 > 173	bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
   174						block_t blkaddr, int type)
   175	{
   176		switch (type) {
   177		case META_NAT:
   178			break;
   179		case META_SIT:
   180			if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
   181				return false;
   182			break;
   183		case META_SSA:
   184			if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
   185				blkaddr < SM_I(sbi)->ssa_blkaddr))
   186				return false;
   187			break;
   188		case META_CP:
   189			if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
   190				blkaddr < __start_cp_addr(sbi)))
   191				return false;
   192			break;
   193		case META_POR:
   194			if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
   195				blkaddr < MAIN_BLKADDR(sbi)))
   196				return false;
   197			break;
   198		case DATA_GENERIC:
   199		case DATA_GENERIC_ENHANCE:
   200		case DATA_GENERIC_ENHANCE_READ:
   201		case DATA_GENERIC_ENHANCE_UPDATE:
   202			if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
   203					blkaddr < MAIN_BLKADDR(sbi))) {
   204	
   205				/* Skip to emit an error message. */
   206				if (unlikely(f2fs_cp_error(sbi)))
   207					return false;
   208	
   209				f2fs_warn(sbi, "access invalid blkaddr:%u",
   210					  blkaddr);
   211				set_sbi_flag(sbi, SBI_NEED_FSCK);
   212				dump_stack();
   213				return false;
   214			} else {
   215				return __is_bitmap_valid(sbi, blkaddr, type);
   216			}
   217			break;
   218		case META_GENERIC:
   219			if (unlikely(blkaddr < SEG0_BLKADDR(sbi) ||
   220				blkaddr >= MAIN_BLKADDR(sbi)))
   221				return false;
   222			break;
   223		default:
   224			BUG();
   225		}
   226	
   227		return true;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
