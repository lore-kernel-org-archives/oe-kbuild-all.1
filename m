Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2868717C77
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 00:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740617659; cv=none; b=lKSZn5pPuuA3OzRWTTViQad4icN0FUK5aY7LED7JtHRC2ueYhd67BiXlEk4CMHpQIDijk4rRjYMWs3ex9XybmhuqL6AaRR/R1i+g9RLu5cw3Fu8KL5MZJR1/3UY0eV+hjFoAoj5ll0yfnQ6mXjWkqI2zbysFVWOs0CSRws3Iwj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740617659; c=relaxed/simple;
	bh=aB3AxHvL/77znFSZH6o+pwFtiCJ8hGp0eJZ9+XdwhF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPo26+u3Qp89EKihc3xLS5ZrLtQDvQyZTDGS+miPIXLG6CxLnCOu3T5Yw0Cn1XleboljiUnO5ToFTY7ZaI6mHd3uvS2iBHk7H11B3QvYKlgNINpin5ffKTW4BGh9GL0ueKFIIVjLVYmjU9dgisZYKYvptPjvT1zWfanDZeSQgl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2dfz47M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2dfz47M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740617658; x=1772153658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aB3AxHvL/77znFSZH6o+pwFtiCJ8hGp0eJZ9+XdwhF0=;
  b=M2dfz47MAVTcRk8UZmhjl4ZEJVTVouFYvqKtuefkkqbEsJbswyiTHm6U
   Yna3WAYrMwz4lORjfO8be1YFvgxtCFxkc+8gQDHM1weKkg07NgOnn7w8p
   /RD8Voeu0C1vBE3BXEMlMi/EAOaoqdlcLoIoX+rMr8neGZJ1fxznxaFfT
   szWCfz1uCqsE7e01stn4G7/tvX3ftAKRhdG39weVfDP5emzHNFS9YuOG+
   yYhN7dAWL0bKH+gG9e6touw3QCwxepdMPiSLpwI9MTGZ3W4Ef/5pIQ7W6
   KAENVUuRr5nQWLaCYMdsPDp+gjYmOKfOJcE1NqTDuPiDlZAo2i9qXUzDA
   A==;
X-CSE-ConnectionGUID: 10Lh1N0rRty/5F1B2yKdIA==
X-CSE-MsgGUID: Zho5e+pmQHOgSs2U5d2O+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52128941"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="52128941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 16:54:18 -0800
X-CSE-ConnectionGUID: fINL0RTlTDaz75pgffktzg==
X-CSE-MsgGUID: otg1VR1+Qc6xPsB4tFoQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="117505414"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Feb 2025 16:54:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnS9n-000CfO-0F;
	Thu, 27 Feb 2025 00:53:54 +0000
Date: Thu, 27 Feb 2025 08:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-12 0/1] fs/f2fs/segment.h:649:34:
 error: implicit declaration of function 'get_available_block_count'; did you
 mean 'dec_valid_block_count'?
Message-ID: <202502270811.kStwmiNC-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270811.kStwmiNC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270811.kStwmiNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270811.kStwmiNC-lkp@intel.com/

Note: the android-common/android14-6.1-2024-12 HEAD f8effc48a6c42ba7194ced2862d05c82c80e2ae3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/checkpoint.c:20:
   fs/f2fs/segment.h: In function 'has_enough_free_blks':
>> fs/f2fs/segment.h:649:34: error: implicit declaration of function 'get_available_block_count'; did you mean 'dec_valid_block_count'? [-Werror=implicit-function-declaration]
     649 |         avail_user_block_count = get_available_block_count(sbi, NULL, true);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  dec_valid_block_count
   cc1: some warnings being treated as errors


vim +649 fs/f2fs/segment.h

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
