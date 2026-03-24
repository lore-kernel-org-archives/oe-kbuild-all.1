Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC55B1BBBFC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317827; cv=none; b=mrWmYgei0x/E9RkbjkOQlvyOnl1vwMfclMpPJZfVYmgH85x/vojDAgJRO3m81J1vdeKi6YY+f39uwiq/2Pl28MSM84SoLZjq/sixLF+iYB4965/Qk+Ay4AMecY9jnvD4uySsWenR5Z9/wDuj6gl7zzyN8GrqBJq76Z/MwOyWEU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317827; c=relaxed/simple;
	bh=gZk2Flr9nhZ3EIdV6PvcCUj1Z7R5ZAHTTiO6KoVZ1Jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RmxsORxGwJ2n3oG0QRf4i9DGXlHw4lCz68k/qRUMvP4O0uSVBjGsg96q/2CimScNKvUKCkZWkuUzEA8pQFAH8NfcBCWR61JZDdDWRH04ALW1Px7F25+J7J4M/KRc5t89ExfJS4ugTkg0YTNzaN3dqH0F6lqRFSaCy1zOdPKuybI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N47BZJha; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N47BZJha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774317825; x=1805853825;
  h=date:from:to:cc:subject:message-id;
  bh=gZk2Flr9nhZ3EIdV6PvcCUj1Z7R5ZAHTTiO6KoVZ1Jg=;
  b=N47BZJhaLePQwKbxHajMEiPPb2DkI/TbJ1QBj4rJ3pU4WiYtTqIR/6JF
   Ze+YCh/fiWOcCsFOE+8PIQJhHQqAGr3alSHoJBUP2lzZb3dzh1tAC8MvR
   1dILpXdD1Na94Xxp9/iOzIc1eQZXsEqQzqDLWD4UqwjrbMbhui05zYHG2
   3uJhqGcxdLYUB8kfhOsuiZtsDL2JB04StatEKfIEfHAy7l43XByy6B6K2
   zXwe1AjDkmqYaj94zAaEOO8oCZf37JN9UHn3jVkwiXxN/DGYTeybNLiez
   e0v+lTrJ0RzlJjawayCkJVuLTxO+O4lFZym3ULqUmjycVGPpa0Q0eh2xU
   A==;
X-CSE-ConnectionGUID: lstAHTvwQ3u2gYV+/jEOcw==
X-CSE-MsgGUID: itl1ae4/RDWM+D6golhMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74346643"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74346643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:03:35 -0700
X-CSE-ConnectionGUID: EboL1mwdQAqZilTkvsAfyw==
X-CSE-MsgGUID: Jl56uwQ2QZGjRWVso0hLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229140991"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Mar 2026 19:03:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4r7C-000000003XR-1ye5;
	Tue, 24 Mar 2026 02:03:30 +0000
Date: Tue, 24 Mar 2026 10:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:ecryptfs-truncate 6/6] fs/ecryptfs/inode.c:860:17:
 warning: variable 'lower_dentry' set but not used
Message-ID: <202603240920.eZK60teg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git ecryptfs-truncate
head:   09e6565fadcff4e54583e885f52923d979fd4454
commit: 09e6565fadcff4e54583e885f52923d979fd4454 [6/6] ecryptfs: truncate the lower file from truncate_upper
config: x86_64-randconfig-011-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240920.eZK60teg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240920.eZK60teg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240920.eZK60teg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ecryptfs/inode.c:860:17: warning: variable 'lower_dentry' set but not used [-Wunused-but-set-variable]
     860 |         struct dentry *lower_dentry;
         |                        ^
   1 warning generated.


vim +/lower_dentry +860 fs/ecryptfs/inode.c

237fead619984c Michael Halcrow   2006-10-04  842  
237fead619984c Michael Halcrow   2006-10-04  843  /**
237fead619984c Michael Halcrow   2006-10-04  844   * ecryptfs_setattr
c1632a0f112093 Christian Brauner 2023-01-13  845   * @idmap: idmap of the target mount
237fead619984c Michael Halcrow   2006-10-04  846   * @dentry: dentry handle to the inode to modify
237fead619984c Michael Halcrow   2006-10-04  847   * @ia: Structure with flags of what to change and values
237fead619984c Michael Halcrow   2006-10-04  848   *
237fead619984c Michael Halcrow   2006-10-04  849   * Updates the metadata of an inode. If the update is to the size
237fead619984c Michael Halcrow   2006-10-04  850   * i.e. truncation, then ecryptfs_truncate will handle the size modification
237fead619984c Michael Halcrow   2006-10-04  851   * of both the ecryptfs inode and the lower inode.
237fead619984c Michael Halcrow   2006-10-04  852   *
237fead619984c Michael Halcrow   2006-10-04  853   * All other metadata changes will be passed right to the lower filesystem,
237fead619984c Michael Halcrow   2006-10-04  854   * and we will just update our inode to look like the lower.
237fead619984c Michael Halcrow   2006-10-04  855   */
c1632a0f112093 Christian Brauner 2023-01-13  856  static int ecryptfs_setattr(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner 2021-01-21  857  			    struct dentry *dentry, struct iattr *ia)
237fead619984c Michael Halcrow   2006-10-04  858  {
237fead619984c Michael Halcrow   2006-10-04  859  	int rc = 0;
237fead619984c Michael Halcrow   2006-10-04 @860  	struct dentry *lower_dentry;
237fead619984c Michael Halcrow   2006-10-04  861  	struct inode *inode;
237fead619984c Michael Halcrow   2006-10-04  862  	struct inode *lower_inode;
237fead619984c Michael Halcrow   2006-10-04  863  	struct ecryptfs_crypt_stat *crypt_stat;
237fead619984c Michael Halcrow   2006-10-04  864  
2b0143b5c986be David Howells     2015-03-17  865  	crypt_stat = &ecryptfs_inode_to_private(d_inode(dentry))->crypt_stat;
0bbb838f385aa7 Eric Biggers      2025-10-11  866  	if (!(crypt_stat->flags & ECRYPTFS_STRUCT_INITIALIZED))
0bbb838f385aa7 Eric Biggers      2025-10-11  867  		ecryptfs_init_crypt_stat(crypt_stat);
2b0143b5c986be David Howells     2015-03-17  868  	inode = d_inode(dentry);
237fead619984c Michael Halcrow   2006-10-04  869  	lower_inode = ecryptfs_inode_to_lower(inode);
e10f281bca03f4 Michael Halcrow   2007-06-27  870  	lower_dentry = ecryptfs_dentry_to_lower(dentry);
e10f281bca03f4 Michael Halcrow   2007-06-27  871  	mutex_lock(&crypt_stat->cs_mutex);
e36cb0b89ce20b David Howells     2015-01-29  872  	if (d_is_dir(dentry))
e10f281bca03f4 Michael Halcrow   2007-06-27  873  		crypt_stat->flags &= ~(ECRYPTFS_ENCRYPTED);
e36cb0b89ce20b David Howells     2015-01-29  874  	else if (d_is_reg(dentry)
64ee4808a786ca Michael Halcrow   2007-07-19  875  		 && (!(crypt_stat->flags & ECRYPTFS_POLICY_APPLIED)
64ee4808a786ca Michael Halcrow   2007-07-19  876  		     || !(crypt_stat->flags & ECRYPTFS_KEY_VALID))) {
e10f281bca03f4 Michael Halcrow   2007-06-27  877  		struct ecryptfs_mount_crypt_stat *mount_crypt_stat;
e10f281bca03f4 Michael Halcrow   2007-06-27  878  
e10f281bca03f4 Michael Halcrow   2007-06-27  879  		mount_crypt_stat = &ecryptfs_superblock_to_private(
e10f281bca03f4 Michael Halcrow   2007-06-27  880  			dentry->d_sb)->mount_crypt_stat;
3b06b3ebf44170 Tyler Hicks       2011-05-24  881  		rc = ecryptfs_get_lower_file(dentry, inode);
332ab16f830f59 Tyler Hicks       2011-04-14  882  		if (rc) {
332ab16f830f59 Tyler Hicks       2011-04-14  883  			mutex_unlock(&crypt_stat->cs_mutex);
332ab16f830f59 Tyler Hicks       2011-04-14  884  			goto out;
332ab16f830f59 Tyler Hicks       2011-04-14  885  		}
d7cdc5febf9f26 Michael Halcrow   2007-10-16  886  		rc = ecryptfs_read_metadata(dentry);
332ab16f830f59 Tyler Hicks       2011-04-14  887  		ecryptfs_put_lower_file(inode);
5dda6992a3138f Michael Halcrow   2007-10-16  888  		if (rc) {
e10f281bca03f4 Michael Halcrow   2007-06-27  889  			if (!(mount_crypt_stat->flags
e10f281bca03f4 Michael Halcrow   2007-06-27  890  			      & ECRYPTFS_PLAINTEXT_PASSTHROUGH_ENABLED)) {
e10f281bca03f4 Michael Halcrow   2007-06-27  891  				rc = -EIO;
25bd8174036036 Michael Halcrow   2008-02-06  892  				printk(KERN_WARNING "Either the lower file "
e10f281bca03f4 Michael Halcrow   2007-06-27  893  				       "is not in a valid eCryptfs format, "
25bd8174036036 Michael Halcrow   2008-02-06  894  				       "or the key could not be retrieved. "
25bd8174036036 Michael Halcrow   2008-02-06  895  				       "Plaintext passthrough mode is not "
e10f281bca03f4 Michael Halcrow   2007-06-27  896  				       "enabled; returning -EIO\n");
e10f281bca03f4 Michael Halcrow   2007-06-27  897  				mutex_unlock(&crypt_stat->cs_mutex);
e10f281bca03f4 Michael Halcrow   2007-06-27  898  				goto out;
e10f281bca03f4 Michael Halcrow   2007-06-27  899  			}
e10f281bca03f4 Michael Halcrow   2007-06-27  900  			rc = 0;
3aeb86ea4cd15f Tyler Hicks       2011-03-15  901  			crypt_stat->flags &= ~(ECRYPTFS_I_SIZE_INITIALIZED
3aeb86ea4cd15f Tyler Hicks       2011-03-15  902  					       | ECRYPTFS_ENCRYPTED);
e10f281bca03f4 Michael Halcrow   2007-06-27  903  		}
e10f281bca03f4 Michael Halcrow   2007-06-27  904  	}
e10f281bca03f4 Michael Halcrow   2007-06-27  905  	mutex_unlock(&crypt_stat->cs_mutex);
a261a03904849c Tyler Hicks       2012-01-19  906  
c1632a0f112093 Christian Brauner 2023-01-13  907  	rc = setattr_prepare(&nop_mnt_idmap, dentry, ia);
a261a03904849c Tyler Hicks       2012-01-19  908  	if (rc)
a261a03904849c Tyler Hicks       2012-01-19  909  		goto out;
09e6565fadcff4 Christoph Hellwig 2026-03-23  910  	if (ia->ia_valid & ATTR_SIZE)
09e6565fadcff4 Christoph Hellwig 2026-03-23  911  		rc = ecryptfs_truncate(dentry, ia->ia_size);
237fead619984c Michael Halcrow   2006-10-04  912  out:
9afa2fb6c13501 Erez Zadok        2009-12-02  913  	fsstack_copy_attr_all(inode, lower_inode);
237fead619984c Michael Halcrow   2006-10-04  914  	return rc;
237fead619984c Michael Halcrow   2006-10-04  915  }
237fead619984c Michael Halcrow   2006-10-04  916  

:::::: The code at line 860 was first introduced by commit
:::::: 237fead619984cc48818fe12ee0ceada3f55b012 [PATCH] ecryptfs: fs/Makefile and fs/Kconfig

:::::: TO: Michael Halcrow <mhalcrow@us.ibm.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
