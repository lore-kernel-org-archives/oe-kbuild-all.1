Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD227EF1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sts+I+us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696523586; x=1728059586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dhvc1UH6bwvDDgLz3mAEyaGsSAnZDYkZCI9t/lLvXlM=;
  b=Sts+I+usMwvACPHfoOom2hehnBc+oVT5oM7GFwXISA528ShHANzWLHfv
   EwrgKX+NmjVq6sZGvIjaRCHNLNK0KwUkxLo8LPBdNazbI89G6o8y7LJg1
   /P3TBs2Y0Db5WxmRWDQUYerEdSmMJxoKo8PDKpL8fwxS+3uLapcEiH7OU
   5b82xVbMjKS2KkSodHZUO2VPoPFxHcGrhEXoIQ8lqcptLggMprHkeo8OX
   f85bG+gfieCvL8hsBMf19a5L3e9X7L84W5ddi2m+ZhgNWr5E8Nyx9dbdu
   +iC6qXCgiPnjwfi53kvS2K9JC4wvO+zogFxmhYET+Ic2slTsPoZJjwFYt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383448121"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="383448121"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 09:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842476699"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="842476699"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2023 09:33:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoRHG-000LeM-27;
	Thu, 05 Oct 2023 16:32:45 +0000
Date: Fri, 6 Oct 2023 00:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 39/44] fs/smb/client/smb2ops.c:3685:42:
 sparse: sparse: incorrect type in argument 2 (different base types)
Message-ID: <202310060059.coCAuvkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db
commit: dc3a795ea64be3d1d5fa33be5719e3d52ae80847 [39/44] cifs: Share server EOF pos with netfslib
config: i386-randconfig-061-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060059.coCAuvkv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060059.coCAuvkv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060059.coCAuvkv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2ops.c:3685:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected long long [usertype] new_i_size @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3685:42: sparse:     expected long long [usertype] new_i_size
   fs/smb/client/smb2ops.c:3685:42: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof
>> fs/smb/client/smb2ops.c:3686:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected long long [usertype] newsize @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3686:33: sparse:     expected long long [usertype] newsize
   fs/smb/client/smb2ops.c:3686:33: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof
>> fs/smb/client/smb2ops.c:3687:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected long long [usertype] new_size @@     got restricted __le64 [addressable] [assigned] [usertype] eof @@
   fs/smb/client/smb2ops.c:3687:57: sparse:     expected long long [usertype] new_size
   fs/smb/client/smb2ops.c:3687:57: sparse:     got restricted __le64 [addressable] [assigned] [usertype] eof

vim +3685 fs/smb/client/smb2ops.c

  3642	
  3643	static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
  3644				    loff_t off, loff_t len)
  3645	{
  3646		int rc;
  3647		unsigned int xid;
  3648		struct inode *inode = file_inode(file);
  3649		struct cifsInodeInfo *cifsi = CIFS_I(inode);
  3650		struct cifsFileInfo *cfile = file->private_data;
  3651		__le64 eof;
  3652		loff_t old_eof;
  3653	
  3654		xid = get_xid();
  3655	
  3656		inode_lock(inode);
  3657	
  3658		old_eof = i_size_read(inode);
  3659		if ((off >= old_eof) ||
  3660		    off + len >= old_eof) {
  3661			rc = -EINVAL;
  3662			goto out;
  3663		}
  3664	
  3665		filemap_invalidate_lock(inode->i_mapping);
  3666		rc = filemap_write_and_wait_range(inode->i_mapping, off, old_eof - 1);
  3667		if (rc < 0)
  3668			goto out_2;
  3669	
  3670		truncate_pagecache_range(inode, off, old_eof);
  3671	
  3672		rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
  3673					  old_eof - off - len, off);
  3674		if (rc < 0)
  3675			goto out_2;
  3676	
  3677		eof = cpu_to_le64(old_eof - len);
  3678		rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
  3679				  cfile->fid.volatile_fid, cfile->pid, &eof);
  3680		if (rc < 0)
  3681			goto out_2;
  3682	
  3683		rc = 0;
  3684	
> 3685		netfs_resize_file(&cifsi->netfs, eof);
> 3686		truncate_setsize(inode, eof);
> 3687		fscache_resize_cookie(cifs_inode_cookie(inode), eof);
  3688	out_2:
  3689		filemap_invalidate_unlock(inode->i_mapping);
  3690	 out:
  3691		inode_unlock(inode);
  3692		free_xid(xid);
  3693		return rc;
  3694	}
  3695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
