Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E637B281356
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765630245; cv=none; b=SoIcozHiuV+x0cTQQ4UVvJkRA5sy/UyQHNOzH+n67A1bJ59KZkPja+zZohEbJZ+kITpvjD6icVoK4fI3uxaSJatNDtrRwmVPvmWpC3mVimdWfhNdCuUYDo0I50Z/Uaa8uZ0x0EnB0rtbLlQNVxOREz5BE8u1ekjK+2Vo5aX/YtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765630245; c=relaxed/simple;
	bh=j/ggGJX0y/n82mktgCzAUpXe6w8F3z4XyjtdFjCCmtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQPyVukXuxShAfdX/EERs2o+r7oQmdUFoSGBpdnWYJITj1ujhRkVxrvz9z59mMKoxOJu0hUuf4izeMbngnRTRVrSek90Cs0855waq0WzJ5EfmqT7aE4U2SdtLy3dUFlcH/7i9oSZjJbfdbGIlowy0JUMZQFx0IHvmhyUWnwpbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7wKw3BS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7wKw3BS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765630244; x=1797166244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/ggGJX0y/n82mktgCzAUpXe6w8F3z4XyjtdFjCCmtQ=;
  b=l7wKw3BSqbmQyvWqWZpg0hM2IjCuZypCM+3DPcRZ7SH5rxJu5XgJyDJF
   jV+reycw6YsYcab+9G/tgWiyyvNZ0pKQ1WPOBSaLq7RHz3QrtS56Mlzme
   DN9cT5qH1pS6NpBjg9Cl7fSV1Abye9zHafesxQEJ/9LSkg/uwT662LfE8
   YuXWWRZ0F8KGtmmvr8DVqup+/uNjqsZUS/wAm4lLugfk4lv8s+bVm97/9
   vqzF8SRQYtf9aaMXDkt0Jksjknf4JvU7vVivNG2buQgd48zn1O+hgMFmp
   z+co1l1OJQyjt5gJiOvnNz1qCtr38jSdPxzGqFzWMNOsPZNVz80yPQjT2
   Q==;
X-CSE-ConnectionGUID: /JEr88oYQ528Eh0mUrkPHg==
X-CSE-MsgGUID: l0eyYMjcTxakq2WZQVIvgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78981992"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78981992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:50:42 -0800
X-CSE-ConnectionGUID: u8t/ahThQLWOTQQpqUbWfw==
X-CSE-MsgGUID: nduhm98QSOW8c3N09MCJuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197579798"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 04:50:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUP54-000000007e0-23Hb;
	Sat, 13 Dec 2025 12:50:38 +0000
Date: Sat, 13 Dec 2025 20:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] fs/ext4/inode.c:2995:23:
 warning: unused variable 'sbi'
Message-ID: <202512132031.c1OJdCdq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 7b208222f6845875c568d238aeb9db17a1c63d96 [1941/1941] ext4: avoid deadlock in fs reclaim with page writeback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512132031.c1OJdCdq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132031.c1OJdCdq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132031.c1OJdCdq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/inode.c:2995:23: warning: unused variable 'sbi' [-Wunused-variable]
    2995 |         struct ext4_sb_info *sbi = EXT4_SB(mapping->host->i_sb);
         |                              ^~~
   1 warning generated.


vim +/sbi +2995 fs/ext4/inode.c

64769240bd07f4 Alex Tomas   2008-07-11  2988  
5f0663bb4a64f5 Dan Williams 2017-12-21  2989  static int ext4_dax_writepages(struct address_space *mapping,
5f0663bb4a64f5 Dan Williams 2017-12-21  2990  			       struct writeback_control *wbc)
5f0663bb4a64f5 Dan Williams 2017-12-21  2991  {
5f0663bb4a64f5 Dan Williams 2017-12-21  2992  	int ret;
5f0663bb4a64f5 Dan Williams 2017-12-21  2993  	long nr_to_write = wbc->nr_to_write;
5f0663bb4a64f5 Dan Williams 2017-12-21  2994  	struct inode *inode = mapping->host;
5f0663bb4a64f5 Dan Williams 2017-12-21 @2995  	struct ext4_sb_info *sbi = EXT4_SB(mapping->host->i_sb);
7b208222f68458 Jan Kara     2024-06-11  2996  	int alloc_ctx;
5f0663bb4a64f5 Dan Williams 2017-12-21  2997  
5f0663bb4a64f5 Dan Williams 2017-12-21  2998  	if (unlikely(ext4_forced_shutdown(EXT4_SB(inode->i_sb))))
5f0663bb4a64f5 Dan Williams 2017-12-21  2999  		return -EIO;
5f0663bb4a64f5 Dan Williams 2017-12-21  3000  
7b208222f68458 Jan Kara     2024-06-11  3001  	alloc_ctx = ext4_writepages_down_read(inode->i_sb);
5f0663bb4a64f5 Dan Williams 2017-12-21  3002  	trace_ext4_writepages(inode, wbc);
5f0663bb4a64f5 Dan Williams 2017-12-21  3003  
5f0663bb4a64f5 Dan Williams 2017-12-21  3004  	ret = dax_writeback_mapping_range(mapping, inode->i_sb->s_bdev, wbc);
5f0663bb4a64f5 Dan Williams 2017-12-21  3005  	trace_ext4_writepages_result(inode, wbc, ret,
5f0663bb4a64f5 Dan Williams 2017-12-21  3006  				     nr_to_write - wbc->nr_to_write);
7b208222f68458 Jan Kara     2024-06-11  3007  	ext4_writepages_up_read(inode->i_sb, alloc_ctx);
5f0663bb4a64f5 Dan Williams 2017-12-21  3008  	return ret;
5f0663bb4a64f5 Dan Williams 2017-12-21  3009  }
5f0663bb4a64f5 Dan Williams 2017-12-21  3010  

:::::: The code at line 2995 was first introduced by commit
:::::: 5f0663bb4a64f588f0a2dd6d1be68d40f9af0086 ext4, dax: introduce ext4_dax_aops

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
