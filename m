Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EC38F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715906032; cv=none; b=ljA2MrNERo8b7/oBE9VIdYl3qkgq0bTd6QQcstjsq55Pg5U3hs1ATd6W4V51/04klLZi0y+uWOrxFPqR5K2sibr3zQtolwIKFpxkbzjuuTLW7fBZE0fAaRmwPnGGbw+f9srKYc3fmDIBF7bWwI0WWDI16IksCMYdMJF/Zqd8esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715906032; c=relaxed/simple;
	bh=02odN8M+YMnAb+o/2Vjq7ExPWA6LROia7YrbPhQhXk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoYRW7MwYvOdHcVuAVP0ZvvTQ7pR1VOjnITO8LteEHgdgCnz8SCY4eK21OsUOaYhy97e/dbSdgCnlTaLdLNjmzXMUScEjW438cw1DPnmQefS2qItGgeqEr/Wp05LsLsCrjo4OVCcilaN0gZPkeYK28iYDzl08C5/DIPutEjgSD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uua/vovz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uua/vovz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715906030; x=1747442030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02odN8M+YMnAb+o/2Vjq7ExPWA6LROia7YrbPhQhXk4=;
  b=Uua/vovzcF8R8uffY5nPm975a514ubcZxmQW/qXLypRjI3AnJUSVpoAG
   /+rxASIpuBhFIVWkZAeYCCM2ih65zRkQ+VK6AD3w2N/xqbScrlt9dOflD
   a2auLgRJaj4jNTdl4ZnCjFynZ5pOTVm1SC3EpbIp1b34eIbqLcvrNm3o8
   Ri+pchqIOTKM5x+3HqPtCCtXN6Gkt6AQeHGRRfFR0Duy8kw68BkVKdXBU
   Yie7gPibbte67yHbZOp4ud/rUh9CCs0Zql4m0ulMLoP5TCq3MdLLwG/B1
   Gyp8DWtD+qsCXhtziIVeB6QRuOKYMZ1CKZ1VTPNd+7EcN7X0cDtnrHguE
   w==;
X-CSE-ConnectionGUID: 7n+7lR+VRXqzh6gg0cgWYQ==
X-CSE-MsgGUID: ynKjq+jfRNeBpLxfamjTfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11904380"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="11904380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 17:33:49 -0700
X-CSE-ConnectionGUID: XAXQ697rQh+RyDEBqb5rEw==
X-CSE-MsgGUID: 1Qkqud0jTd2Y1uejwet65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="32037257"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2024 17:33:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7lXd-000F2L-2I;
	Fri, 17 May 2024 00:33:45 +0000
Date: Fri, 17 May 2024 08:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/1] fs/incfs/vfs.c:782:13-15:
 WARNING: casting value returned by memory allocation function to (u8 *) is
 useless.
Message-ID: <202405170824.mAOIsN91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   2dca19b0a7e69d92441f241b8597bee11dd0d094
commit: 2dca19b0a7e69d92441f241b8597bee11dd0d094 [1/1] ANDROID: incremental-fs: Make work with 16k pages
config: x86_64-randconfig-104-20240517 (https://download.01.org/0day-ci/archive/20240517/202405170824.mAOIsN91-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170824.mAOIsN91-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/incfs/vfs.c:782:13-15: WARNING: casting value returned by memory allocation function to (u8 *) is useless.

vim +782 fs/incfs/vfs.c

   758	
   759	static long ioctl_fill_blocks(struct file *f, void __user *arg)
   760	{
   761		struct incfs_fill_blocks __user *usr_fill_blocks = arg;
   762		struct incfs_fill_blocks fill_blocks;
   763		struct incfs_fill_block __user *usr_fill_block_array;
   764		struct data_file *df = get_incfs_data_file(f);
   765		struct incfs_file_data *fd = f->private_data;
   766		const ssize_t data_buf_size = 2 * INCFS_DATA_FILE_BLOCK_SIZE;
   767		u8 *data_buf = NULL;
   768		ssize_t error = 0;
   769		int i = 0;
   770		bool complete = false;
   771	
   772		if (!df)
   773			return -EBADF;
   774	
   775		if (!fd || fd->fd_fill_permission != CAN_FILL)
   776			return -EPERM;
   777	
   778		if (copy_from_user(&fill_blocks, usr_fill_blocks, sizeof(fill_blocks)))
   779			return -EFAULT;
   780	
   781		usr_fill_block_array = u64_to_user_ptr(fill_blocks.fill_blocks);
 > 782		data_buf = (u8 *)kzalloc(data_buf_size, GFP_NOFS);
   783		if (!data_buf)
   784			return -ENOMEM;
   785	
   786		for (i = 0; i < fill_blocks.count; i++) {
   787			struct incfs_fill_block fill_block = {};
   788	
   789			if (copy_from_user(&fill_block, &usr_fill_block_array[i],
   790					   sizeof(fill_block)) > 0) {
   791				error = -EFAULT;
   792				break;
   793			}
   794	
   795			if (fill_block.data_len > data_buf_size) {
   796				error = -E2BIG;
   797				break;
   798			}
   799	
   800			if (copy_from_user(data_buf, u64_to_user_ptr(fill_block.data),
   801					   fill_block.data_len) > 0) {
   802				error = -EFAULT;
   803				break;
   804			}
   805			fill_block.data = 0; /* To make sure nobody uses it. */
   806			if (fill_block.flags & INCFS_BLOCK_FLAGS_HASH) {
   807				error = incfs_process_new_hash_block(df, &fill_block,
   808								     data_buf);
   809			} else {
   810				error = incfs_process_new_data_block(df, &fill_block,
   811								data_buf, &complete);
   812			}
   813			if (error)
   814				break;
   815		}
   816	
   817		kfree(data_buf);
   818	
   819		if (complete)
   820			handle_file_completed(f, df);
   821	
   822		/*
   823		 * Only report the error if no records were processed, otherwise
   824		 * just return how many were processed successfully.
   825		 */
   826		if (i == 0)
   827			return error;
   828	
   829		return i;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
