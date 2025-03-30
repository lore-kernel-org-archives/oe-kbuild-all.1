Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618239461
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743350589; cv=none; b=UVLiqzLGkxYAyoYlYACXqr2YYw6UTy6hJPi6LB1YkaUQkQiPJa8DsMAQSVDoSDyV/DgnBXKwZyA6jdeYgy5c8OiM/4iMmqnWk4ToLSizGCcjXhtZXb9zu9ziixHQZ9607Nk3ewob+v/0uYKR/I51Hb/f3jy2iRNfLcvzba6Un88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743350589; c=relaxed/simple;
	bh=JuWXqm6BUFungUdELaUxlM0SRWMtAv9SoZmWRjs4qxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhy7pgxiHSo2HqN2KlZgKCV7pD55UipjBsVVUBUQvwJJiWGrm/denSM+KZdsuce6exxZhMWTwm3+nXBL3BKRQKreKiSEr0AKXY0Op8QxDwtjChGtC0QDEXIARdPeL6cSFLXXbg1z1OWM1A3Dh4VYy6ijw7da3yoW/xUvCaQBfm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9UF9rUH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9UF9rUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743350587; x=1774886587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JuWXqm6BUFungUdELaUxlM0SRWMtAv9SoZmWRjs4qxY=;
  b=i9UF9rUHDXhhnl1nviknWUQnlquy7jjGTcL7LmREXXE3e9rhCC2aSn9v
   CV4FV1uGTueICiJ/sfT40Fvm1ewFkvTqXpquFC6QeS2Kbozx//IAF3nxc
   XypKaosSzw0LZrqD4+Ii4UKY0ReUQM7/X27TxLDXLkqDEOLUCM0ScGysn
   o3iSpQcde/Ns88AJd2I3wGXjesOCHSnQ8TkrXhFfBHg+w7+X62D71mba5
   hj8KpscveCv97lWQ5NNKlhk5Mo5TKWvDKKzICWoV8op62RLJNor5uIMqy
   YG5maSmsb4S/6rYbEXF86yy2PJIJ3bmVoJPCeZYnAAz/O1TRmTccuBePT
   w==;
X-CSE-ConnectionGUID: dJw+rtrbREKKuEtR4TD8jA==
X-CSE-MsgGUID: G5rGbqbzQN6IJ/YM0qcFcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="55309188"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="55309188"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 09:03:07 -0700
X-CSE-ConnectionGUID: OUF52fy5ThKGlT4oknuigQ==
X-CSE-MsgGUID: wspljF7uRzicy3uZeQe/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="125794679"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2025 09:03:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyv7n-0008m2-0S;
	Sun, 30 Mar 2025 16:03:03 +0000
Date: Mon, 31 Mar 2025 00:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs-6.16.super 2/2] fs/efivarfs/super.c:445:12:
 warning: 'efivarfs_check_missing' defined but not used
Message-ID: <202503302320.FYCzntC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.16.super
head:   4cb24e33a63a8f9dd5a2ab56b1b183c1ef26c4d0
commit: 4cb24e33a63a8f9dd5a2ab56b1b183c1ef26c4d0 [2/2] [DRAFT] efivarfs: support freeze/thaw for suspend/hibernate
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250330/202503302320.FYCzntC9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503302320.FYCzntC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503302320.FYCzntC9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/efivarfs/super.c:445:12: warning: 'efivarfs_check_missing' defined but not used [-Wunused-function]
     445 | static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> fs/efivarfs/super.c:409:13: warning: 'efivarfs_actor' defined but not used [-Wunused-function]
     409 | static bool efivarfs_actor(struct dir_context *ctx, const char *name, int len,
         |             ^~~~~~~~~~~~~~


vim +/efivarfs_check_missing +445 fs/efivarfs/super.c

b5d1e6ee761a10 James Bottomley 2025-01-07  408  
b5d1e6ee761a10 James Bottomley 2025-01-07 @409  static bool efivarfs_actor(struct dir_context *ctx, const char *name, int len,
b5d1e6ee761a10 James Bottomley 2025-01-07  410  			   loff_t offset, u64 ino, unsigned mode)
b5d1e6ee761a10 James Bottomley 2025-01-07  411  {
b5d1e6ee761a10 James Bottomley 2025-01-07  412  	unsigned long size;
b5d1e6ee761a10 James Bottomley 2025-01-07  413  	struct efivarfs_ctx *ectx = container_of(ctx, struct efivarfs_ctx, ctx);
b5d1e6ee761a10 James Bottomley 2025-01-07  414  	struct qstr qstr = { .name = name, .len = len };
b5d1e6ee761a10 James Bottomley 2025-01-07  415  	struct dentry *dentry = d_hash_and_lookup(ectx->sb->s_root, &qstr);
b5d1e6ee761a10 James Bottomley 2025-01-07  416  	struct inode *inode;
b5d1e6ee761a10 James Bottomley 2025-01-07  417  	struct efivar_entry *entry;
b5d1e6ee761a10 James Bottomley 2025-01-07  418  	int err;
b5d1e6ee761a10 James Bottomley 2025-01-07  419  
b5d1e6ee761a10 James Bottomley 2025-01-07  420  	if (IS_ERR_OR_NULL(dentry))
b5d1e6ee761a10 James Bottomley 2025-01-07  421  		return true;
b5d1e6ee761a10 James Bottomley 2025-01-07  422  
b5d1e6ee761a10 James Bottomley 2025-01-07  423  	inode = d_inode(dentry);
b5d1e6ee761a10 James Bottomley 2025-01-07  424  	entry = efivar_entry(inode);
b5d1e6ee761a10 James Bottomley 2025-01-07  425  
b5d1e6ee761a10 James Bottomley 2025-01-07  426  	err = efivar_entry_size(entry, &size);
b5d1e6ee761a10 James Bottomley 2025-01-07  427  	size += sizeof(__u32);	/* attributes */
b5d1e6ee761a10 James Bottomley 2025-01-07  428  	if (err)
b5d1e6ee761a10 James Bottomley 2025-01-07  429  		size = 0;
b5d1e6ee761a10 James Bottomley 2025-01-07  430  
dec1277875a597 Ard Biesheuvel  2025-03-17  431  	inode_lock_nested(inode, I_MUTEX_CHILD);
b5d1e6ee761a10 James Bottomley 2025-01-07  432  	i_size_write(inode, size);
b5d1e6ee761a10 James Bottomley 2025-01-07  433  	inode_unlock(inode);
b5d1e6ee761a10 James Bottomley 2025-01-07  434  
b5d1e6ee761a10 James Bottomley 2025-01-07  435  	if (!size) {
b5d1e6ee761a10 James Bottomley 2025-01-07  436  		ectx->dentry = dentry;
b5d1e6ee761a10 James Bottomley 2025-01-07  437  		return false;
b5d1e6ee761a10 James Bottomley 2025-01-07  438  	}
b5d1e6ee761a10 James Bottomley 2025-01-07  439  
b5d1e6ee761a10 James Bottomley 2025-01-07  440  	dput(dentry);
b5d1e6ee761a10 James Bottomley 2025-01-07  441  
b5d1e6ee761a10 James Bottomley 2025-01-07  442  	return true;
b5d1e6ee761a10 James Bottomley 2025-01-07  443  }
b5d1e6ee761a10 James Bottomley 2025-01-07  444  
b5d1e6ee761a10 James Bottomley 2025-01-07 @445  static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
b5d1e6ee761a10 James Bottomley 2025-01-07  446  				  unsigned long name_size, void *data)
b5d1e6ee761a10 James Bottomley 2025-01-07  447  {
b5d1e6ee761a10 James Bottomley 2025-01-07  448  	char *name;
b5d1e6ee761a10 James Bottomley 2025-01-07  449  	struct super_block *sb = data;
b5d1e6ee761a10 James Bottomley 2025-01-07  450  	struct dentry *dentry;
b5d1e6ee761a10 James Bottomley 2025-01-07  451  	struct qstr qstr;
b5d1e6ee761a10 James Bottomley 2025-01-07  452  	int err;
b5d1e6ee761a10 James Bottomley 2025-01-07  453  
b5d1e6ee761a10 James Bottomley 2025-01-07  454  	if (guid_equal(&vendor, &LINUX_EFI_RANDOM_SEED_TABLE_GUID))
b5d1e6ee761a10 James Bottomley 2025-01-07  455  		return 0;
b5d1e6ee761a10 James Bottomley 2025-01-07  456  
b5d1e6ee761a10 James Bottomley 2025-01-07  457  	name = efivar_get_utf8name(name16, &vendor);
b5d1e6ee761a10 James Bottomley 2025-01-07  458  	if (!name)
b5d1e6ee761a10 James Bottomley 2025-01-07  459  		return -ENOMEM;
b5d1e6ee761a10 James Bottomley 2025-01-07  460  
b5d1e6ee761a10 James Bottomley 2025-01-07  461  	qstr.name = name;
b5d1e6ee761a10 James Bottomley 2025-01-07  462  	qstr.len = strlen(name);
b5d1e6ee761a10 James Bottomley 2025-01-07  463  	dentry = d_hash_and_lookup(sb->s_root, &qstr);
b5d1e6ee761a10 James Bottomley 2025-01-07  464  	if (IS_ERR(dentry)) {
b5d1e6ee761a10 James Bottomley 2025-01-07  465  		err = PTR_ERR(dentry);
b5d1e6ee761a10 James Bottomley 2025-01-07  466  		goto out;
b5d1e6ee761a10 James Bottomley 2025-01-07  467  	}
b5d1e6ee761a10 James Bottomley 2025-01-07  468  
b5d1e6ee761a10 James Bottomley 2025-01-07  469  	if (!dentry) {
b5d1e6ee761a10 James Bottomley 2025-01-07  470  		/* found missing entry */
b5d1e6ee761a10 James Bottomley 2025-01-07  471  		pr_info("efivarfs: creating variable %s\n", name);
b5d1e6ee761a10 James Bottomley 2025-01-07  472  		return efivarfs_create_dentry(sb, name16, name_size, vendor, name);
b5d1e6ee761a10 James Bottomley 2025-01-07  473  	}
b5d1e6ee761a10 James Bottomley 2025-01-07  474  
b5d1e6ee761a10 James Bottomley 2025-01-07  475  	dput(dentry);
b5d1e6ee761a10 James Bottomley 2025-01-07  476  	err = 0;
b5d1e6ee761a10 James Bottomley 2025-01-07  477  
b5d1e6ee761a10 James Bottomley 2025-01-07  478   out:
b5d1e6ee761a10 James Bottomley 2025-01-07  479  	kfree(name);
b5d1e6ee761a10 James Bottomley 2025-01-07  480  
b5d1e6ee761a10 James Bottomley 2025-01-07  481  	return err;
b5d1e6ee761a10 James Bottomley 2025-01-07  482  }
b5d1e6ee761a10 James Bottomley 2025-01-07  483  

:::::: The code at line 445 was first introduced by commit
:::::: b5d1e6ee761a109400e97ac6a1b91c57d0f6a43a efivarfs: add variable resync after hibernation

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
