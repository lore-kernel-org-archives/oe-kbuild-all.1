Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B762352FBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782486; cv=none; b=VR8bA0Q9VdYZ4WI28NoHudHk3pxPV3OcoKIuY0HssxWzTIbI6JWc8k1gRc6UGrP5qlu3TRl3Gqa+2w6A5cRMKnhGusaLJGfxIJModhOVO0gV+tuLsCqPaDy87L3gjqxIKcvqqlLfk2riYXQ7wHlBY38RIx0kcYlqLvJB+bzyEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782486; c=relaxed/simple;
	bh=/zY9ACMhT5e4WjI69f7nA5n5btc0rkHyu0BTLJ6zVsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pp/WZNmZxrEqK39Xn7s+BOFGU4drFgXWWGz5+K6a+DIi814YmRBILusZ6SHvpVNlkG8/msfp3GhMdjbiJDJxonyUwIB3HO8DFmZPZamVG8vkEw6G3ob9QDhLHD6efMhjUDHHCGOk+2QWTT46coVFAOwoYAJ6h6Ur8W8TJXoo99U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZnUeGie; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZnUeGie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770782485; x=1802318485;
  h=date:from:to:cc:subject:message-id;
  bh=/zY9ACMhT5e4WjI69f7nA5n5btc0rkHyu0BTLJ6zVsg=;
  b=dZnUeGiePa9DV/3Ve9SGYkE+otAKdouy8AD6hL5AaOzYaiUI/plP43ab
   0VgZW0JShC8RrnW7WRKnG85JtmM8AABZZIg/WueV2l7RFbDY3F14oX0Ne
   WrBgVTyCZMpzh7KmLx4WK6OyGDh5UjucGEJ9u3zBzi8dtkIv2IHBkRC6f
   4yNx2IvbSi9iQia3FheWDAQk6Yzpp0DrNf1SEbXcOyRc1Uawv9qu/Iord
   98Lcsh6v4xTIkpiUnJKQO0XFXrDGMFU4afhjj4wmmZeiVzesVW8X1/+I/
   WS5zdVuEqaZCDtnycYtAFxTjpj3o4c+d/TwNCcAWeSSRukzO6D36qpyDZ
   w==;
X-CSE-ConnectionGUID: jN9ptIrBRqu9iod/4nVSow==
X-CSE-MsgGUID: C1dfL3W9TMy43r8uPFSdNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75769621"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75769621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 20:01:24 -0800
X-CSE-ConnectionGUID: JhS3mh/LRdS2er+W+RH8hQ==
X-CSE-MsgGUID: 05T6xvLjSpuEXUm7xQs7Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211739814"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2026 20:01:22 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq1Pk-00000000105-0Fxd;
	Wed, 11 Feb 2026 04:01:20 +0000
Date: Wed, 11 Feb 2026 05:01:03 +0100
From: kernel test robot <lkp@intel.com>
To: Ethan Ferguson <ethan.ferguson@zetier.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/fat/dir.c:121:13: warning: 'bh' is used uninitialized
Message-ID: <202602110537.1DPbicra-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ethan-Ferguson/fat-Add-FS_IOC_GETFSLABEL-ioctl/20260211-062606
head:   70cd4ab45a99c9830702281d9b29fcf07a4dcff8
commit: 70cd4ab45a99c9830702281d9b29fcf07a4dcff8 fat: Add FS_IOC_SETFSLABEL ioctl
date:   6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260211/202602110537.1DPbicra-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110537.1DPbicra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110537.1DPbicra-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'fat_get_entry',
       inlined from 'fat_rename_volume_label_dentry' at fs/fat/dir.c:1435:7:
>> fs/fat/dir.c:121:13: warning: 'bh' is used uninitialized [-Wuninitialized]
     121 |         if (*bh && *de &&
         |             ^~~
   fs/fat/dir.c: In function 'fat_rename_volume_label_dentry':
   fs/fat/dir.c:1430:29: note: 'bh' declared here
    1430 |         struct buffer_head *bh;
         |                             ^~


vim +/bh +121 fs/fat/dir.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  115  
^1da177e4c3f415 Linus Torvalds     2005-04-16  116  static inline int fat_get_entry(struct inode *dir, loff_t *pos,
^1da177e4c3f415 Linus Torvalds     2005-04-16  117  				struct buffer_head **bh,
^1da177e4c3f415 Linus Torvalds     2005-04-16  118  				struct msdos_dir_entry **de)
^1da177e4c3f415 Linus Torvalds     2005-04-16  119  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  120  	/* Fast stuff first */
^1da177e4c3f415 Linus Torvalds     2005-04-16 @121  	if (*bh && *de &&
f08b4988f229fb4 Cruz Julian Bishop 2012-10-04  122  	   (*de - (struct msdos_dir_entry *)(*bh)->b_data) <
f08b4988f229fb4 Cruz Julian Bishop 2012-10-04  123  				MSDOS_SB(dir->i_sb)->dir_per_block - 1) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  124  		*pos += sizeof(struct msdos_dir_entry);
^1da177e4c3f415 Linus Torvalds     2005-04-16  125  		(*de)++;
^1da177e4c3f415 Linus Torvalds     2005-04-16  126  		return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  127  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  128  	return fat__get_entry(dir, pos, bh, de);
^1da177e4c3f415 Linus Torvalds     2005-04-16  129  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
