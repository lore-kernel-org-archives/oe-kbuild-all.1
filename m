Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C146B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 02:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhuIHXzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703904915; x=1735440915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAiZhgrDbdiTZLSw3gR8OMJMEECVu/KMCgdf9vEv4S4=;
  b=AhuIHXzlHHppB3TRM6WiF/Cr3rLUuQa6PiZW4XE4MxY48NLlWONc7gne
   mDiJXLlrL0o/jMPtCF4fkqxPlJ9z7q/elso3UfP4tJSsayUhir15KApla
   8fiHGJETQgeOb2RTesJxSoVbMyta4nZ+tUGku4V4HbgmFWvyb2DrFOxTC
   pJ++jMZLvYRDQ8qk536o9dUzTbUDSwqPS6Ur+pf4+mCQngtEw5vzp95oa
   92vFDT4EPv6XkkzjLb3AyEzJ1qu0TtFiEvPwrCLsSZy7eGyAgn5fUWf15
   uMWgyRl3sx4A6C6z85XN9LM5RdAzhhuSZ+If1nskGwTgQRjX2edH6nSt3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="387130585"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="387130585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 18:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="728738690"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="728738690"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Dec 2023 18:55:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJPVB-000I0b-0D;
	Sat, 30 Dec 2023 02:55:05 +0000
Date: Sat, 30 Dec 2023 10:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 43/53] fs/smb/client/smb2ops.c:3720:26:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202312301040.13P433Mx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   3313e9acb08768eab87d882d830857ebb9907ba1
commit: fe6648ebcd0802759277ca7cd32fe8d3560da0cf [43/53] cifs: Share server EOF pos with netfslib
config: i386-randconfig-061-20231229 (https://download.01.org/0day-ci/archive/20231230/202312301040.13P433Mx-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312301040.13P433Mx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312301040.13P433Mx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/smb2ops.c:3718:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected long long [usertype] newsize @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3718:33: sparse:     expected long long [usertype] newsize
   fs/smb/client/smb2ops.c:3718:33: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof
   fs/smb/client/smb2ops.c:3719:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected long long [usertype] new_i_size @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3719:42: sparse:     expected long long [usertype] new_i_size
   fs/smb/client/smb2ops.c:3719:42: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof
>> fs/smb/client/smb2ops.c:3720:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected long long [usertype] zero_point @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3720:26: sparse:     expected long long [usertype] zero_point
   fs/smb/client/smb2ops.c:3720:26: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof
   fs/smb/client/smb2ops.c:3721:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected long long [usertype] new_size @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3721:57: sparse:     expected long long [usertype] new_size
   fs/smb/client/smb2ops.c:3721:57: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof
   fs/smb/client/smb2ops.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +3720 fs/smb/client/smb2ops.c

  3673	
  3674	static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
  3675				    loff_t off, loff_t len)
  3676	{
  3677		int rc;
  3678		unsigned int xid;
  3679		struct inode *inode = file_inode(file);
  3680		struct cifsInodeInfo *cifsi = CIFS_I(inode);
  3681		struct cifsFileInfo *cfile = file->private_data;
  3682		struct netfs_inode *ictx = &cifsi->netfs;
  3683		__le64 eof;
  3684		loff_t old_eof;
  3685	
  3686		xid = get_xid();
  3687	
  3688		inode_lock(inode);
  3689	
  3690		old_eof = i_size_read(inode);
  3691		if ((off >= old_eof) ||
  3692		    off + len >= old_eof) {
  3693			rc = -EINVAL;
  3694			goto out;
  3695		}
  3696	
  3697		filemap_invalidate_lock(inode->i_mapping);
  3698		rc = filemap_write_and_wait_range(inode->i_mapping, off, old_eof - 1);
  3699		if (rc < 0)
  3700			goto out_2;
  3701	
  3702		truncate_pagecache_range(inode, off, old_eof);
  3703		ictx->zero_point = old_eof;
  3704	
  3705		rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
  3706					  old_eof - off - len, off);
  3707		if (rc < 0)
  3708			goto out_2;
  3709	
  3710		eof = cpu_to_le64(old_eof - len);
  3711		rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
  3712				  cfile->fid.volatile_fid, cfile->pid, &eof);
  3713		if (rc < 0)
  3714			goto out_2;
  3715	
  3716		rc = 0;
  3717	
  3718		truncate_setsize(inode, eof);
  3719		netfs_resize_file(&cifsi->netfs, eof, true);
> 3720		ictx->zero_point = eof;
  3721		fscache_resize_cookie(cifs_inode_cookie(inode), eof);
  3722	out_2:
  3723		filemap_invalidate_unlock(inode->i_mapping);
  3724	 out:
  3725		inode_unlock(inode);
  3726		free_xid(xid);
  3727		return rc;
  3728	}
  3729	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
