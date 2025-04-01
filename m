Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10517588
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 00:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467491; cv=none; b=jiJHNvoZfDUI/npCqIPQzL8GqkAbrUlhvdMgtiYoWHOZNFkbp8Wcsz+j10pzGUSsEA8AjPXqcZl9tJEIIqETBOaqyHnI2j4KcnRgIJJdCf3epYcuNBaYhpxpHM0kee3uOlqVXw98ju00pLksqAbaffOFsWUBotVK73efaeyVUyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467491; c=relaxed/simple;
	bh=pHWPXjik76sqAtmeKNBtU5yYruMFW8+y3Dsz+bo/1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbt3lmLfD21YMzYVt8l8jX4hTSubwt1XuLBcHfOhPsjLd/n2OUftQTc6ea7rOzfB206Mp/hQzfQWFlaMY6o4zaL15pPzyxMNqH0l+AbFpGrr4BtmxGYlt1bn8ociq6Z064533Vi2J/PM5rs/BZxQWHJTE4iyjcWXfJMdjUOOD3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnI7BXfv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnI7BXfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743467490; x=1775003490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHWPXjik76sqAtmeKNBtU5yYruMFW8+y3Dsz+bo/1pw=;
  b=DnI7BXfv+yM5cFuOZb/u363kzJojFacTj9ydHoRGApPouEDgjThbpP8V
   GU1YCe0Ir9Y+gqm5LomCpaFa8aX6O0KRuQ1bS3W4SLjObbki3VbDrs0et
   FxI0vt/Px3p57drqo9ASec4g+E9k6ZYAAZUuwchU0Kok+JzaJmREDfBRr
   mcaZfRQjfL05YcOnFSFPEHHTajzeGT4r1gC7Lme1tv5po8sG8QN01YEuY
   3NymKNZy/sjiiUMSFN6TNviLDZwvxuXAqn5UznHxgkCQZazzzDpN8VSZn
   Agv/OtKxXnIBtH1cTLCLHbg1gb4yDPA1p0Fg+Ejk+zYcDv3j0UeiVQOYt
   A==;
X-CSE-ConnectionGUID: tuFe2IVCQEiUSSn/iJ7Ilw==
X-CSE-MsgGUID: xTJKnatfTPywr8ELhfsSew==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44681781"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="44681781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:31:29 -0700
X-CSE-ConnectionGUID: Fa0+bWxNQWWXOQutcRx9Lg==
X-CSE-MsgGUID: X5+PEeBNTpSiPMnNpe30SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126699144"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2025 17:31:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzPXJ-0009VR-0e;
	Tue, 01 Apr 2025 00:31:25 +0000
Date: Tue, 1 Apr 2025 08:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: fs/efivarfs/super.c:473:48: error: passing argument 2 of
 'efivar_entry_size' from incompatible pointer type
Message-ID: <202504010804.b0dXwO6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.16.super
head:   a1151f6e857ccf46a456cf179e1c53db90b79dfa
commit: 04008d7aae2a052ebd8bb9255bdcf22dbbb38a64 efivarfs: support freeze/thaw
date:   12 hours ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250401/202504010804.b0dXwO6Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010804.b0dXwO6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504010804.b0dXwO6Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/efivarfs/super.c: In function 'efivarfs_unfreeze_fs':
>> fs/efivarfs/super.c:473:48: error: passing argument 2 of 'efivar_entry_size' from incompatible pointer type [-Wincompatible-pointer-types]
     473 |                 err = efivar_entry_size(entry, &size);
         |                                                ^~~~~
         |                                                |
         |                                                size_t * {aka unsigned int *}
   In file included from fs/efivarfs/super.c:22:
   fs/efivarfs/internal.h:44:66: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      44 | int efivar_entry_size(struct efivar_entry *entry, unsigned long *size);
         |                                                   ~~~~~~~~~~~~~~~^~~~


vim +/efivar_entry_size +473 fs/efivarfs/super.c

   447	
   448	static int efivarfs_unfreeze_fs(struct super_block *sb)
   449	{
   450		struct dentry *child = NULL;
   451	
   452		/*
   453		 * Unconditionally resync the variable state on a thaw request.
   454		 * Given the size of efivarfs it really doesn't matter to simply
   455		 * iterate through all of the entries and resync. Freeze/thaw
   456		 * requests are rare enough for that to not matter and the
   457		 * number of entries is pretty low too. So we really don't care.
   458		 */
   459		pr_info("efivarfs: resyncing variable state\n");
   460		for (;;) {
   461			int err;
   462			size_t size;
   463			struct inode *inode;
   464			struct efivar_entry *entry;
   465	
   466			child = find_next_child(sb->s_root, child);
   467			if (!child)
   468				break;
   469	
   470			inode = d_inode(child);
   471			entry = efivar_entry(inode);
   472	
 > 473			err = efivar_entry_size(entry, &size);
   474			if (err)
   475				size = 0;
   476			else
   477				size += sizeof(__u32);
   478	
   479			inode_lock(inode);
   480			i_size_write(inode, size);
   481			inode_unlock(inode);
   482	
   483			if (!err)
   484				continue;
   485	
   486			/* The variable doesn't exist anymore, delete it. */
   487			simple_recursive_removal(child, NULL);
   488		}
   489	
   490		efivar_init(efivarfs_check_missing, sb, false);
   491		pr_info("efivarfs: finished resyncing variable state\n");
   492		return 0;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
