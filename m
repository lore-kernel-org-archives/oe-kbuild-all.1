Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151C171A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 01:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740620772; cv=none; b=QJd70RiGyYU9cCgxA07jjpDtUPtgcXSduQ3rst17TBBt1p4RlMmdMZLhC2TvAUObssJQSSji5paqrAWO2UKbwMrvo3n2IjU6w3VLNBrIp3PRDbCvXKIj5gq4RKTUQgcNBdaLZ3EHjJG/o/AC3peV3OOFUzFFV932UO410243KgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740620772; c=relaxed/simple;
	bh=vcolFWfybwzWiZ/TAys2Pm6srjGGtAtpZhWYkKfZVH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMndkfEuPQkXmhR2sMn/TceIfTYzaJ824YPKJGL6Va2w6449IozMntBDyZhMN5EG7USXdAGjsrj+bzScYEpzwHqr5cGrRl1AUdKyfZXHQE0Lbq3OPWCy8FcbmRq8XoYpoEfH/fMf+rmGwTQ3Z4qR1/j7r3oKHbX/qPkhx1AMObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePtjANi9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePtjANi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740620770; x=1772156770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcolFWfybwzWiZ/TAys2Pm6srjGGtAtpZhWYkKfZVH4=;
  b=ePtjANi9uJCO6w2W4Pl2Rz9otm4fiR/QmBa8BnocimB2NmTsIm+FChHv
   ySw17eFgnuYjlfantiXuW5AprUxV+JRGwNCd8U61rJ0fZqKWAclMYGMee
   8hMlJlLLeWo/SwMZQe/oVb30VYVLjqHeFs/rHeReIY+Vi30T2V8sj+v1U
   nG0q/BL1DmvTYDFgHFdERUkAVI1t9TSLICXfs9atabpYPndecLGfGVl8u
   T8cGX8e2qNGg+tsUzOwwoS2UY0Pb23ijOGGCYbcdWRlhI9M+IByQTUEtu
   9UF+/pm0LchoIF1ILXoSemLI9W7ryXCdKEJtAxdXuVb3UQ2xgN0LboloH
   g==;
X-CSE-ConnectionGUID: 9B9EItYiTPCan3+LymMj8g==
X-CSE-MsgGUID: hP0kpHkARgCL9QoWSPSyNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="66868943"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="66868943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 17:46:10 -0800
X-CSE-ConnectionGUID: shVkSqynQummbm/s8R8/eg==
X-CSE-MsgGUID: QdItuYnmSiGRE5OxxZeifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="117516782"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Feb 2025 17:46:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnSyB-000Che-0p;
	Thu, 27 Feb 2025 01:45:51 +0000
Date: Thu, 27 Feb 2025 09:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-12 0/1] fs/f2fs/segment.h:649:27:
 error: call to undeclared function 'get_available_block_count'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202502270948.h6Kx4kAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-12
head:   f8effc48a6c42ba7194ced2862d05c82c80e2ae3
commit: 54182a079534b3c7ac889a94c90ffc9567f90831 [0/1] UPSTREAM: f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable
config: x86_64-buildonly-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270948.h6Kx4kAi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270948.h6Kx4kAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270948.h6Kx4kAi-lkp@intel.com/

Note: the android-common/android14-6.1-2024-12 HEAD f8effc48a6c42ba7194ced2862d05c82c80e2ae3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/xattr.c:19:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2039:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/f2fs/xattr.c:24:
>> fs/f2fs/segment.h:649:27: error: call to undeclared function 'get_available_block_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     649 |         avail_user_block_count = get_available_block_count(sbi, NULL, true);
         |                                  ^
   fs/f2fs/segment.h:649:27: note: did you mean 'dec_valid_block_count'?
   fs/f2fs/f2fs.h:2404:20: note: 'dec_valid_block_count' declared here
    2404 | static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
         |                    ^
   1 warning and 1 error generated.


vim +/get_available_block_count +649 fs/f2fs/segment.h

   641	
   642	static inline bool has_enough_free_blks(struct f2fs_sb_info *sbi)
   643	{
   644		unsigned int total_free_blocks = 0;
   645		unsigned int avail_user_block_count;
   646	
   647		spin_lock(&sbi->stat_lock);
   648	
 > 649		avail_user_block_count = get_available_block_count(sbi, NULL, true);
   650		total_free_blocks = avail_user_block_count - (unsigned int)valid_user_blocks(sbi);
   651	
   652		spin_unlock(&sbi->stat_lock);
   653	
   654		return total_free_blocks > 0;
   655	}
   656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
