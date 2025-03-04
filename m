Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9891F12E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741071764; cv=none; b=paqkKTzLqi5tfA8ekUOwna9MvnTjwfJbJ1D3TW2Ip9Vz3cjED2fvVUtUPV4jRDPtIZGTcqeAyQLiT7AT4SwMqSGI02oy49Aor/HcjzN3WJe2dgCPK6fLWX3w51rTYAiWDq40ZvpNqFo4espqNIBSNdRFFLhfbXKuZYqkdSnOSPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741071764; c=relaxed/simple;
	bh=FWU2jlvzUf9fgp3Py21M8l3MrwYq0DGwtNS1lVoLDsI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IH++r6FQeiFJH3YhNEEmVhcJdpi7C7h90uNQnIIbakMGyoeHyIKDuLmStvikYHQIuYXuoM9d0lj9EyKF46WOyYyxdqGccWlSsigcepu46rnxgtMAOPtkBt0y2LNBpL1TyiMHpBzxDhCQL+Ap3UnMr/jmXAywgSpflFWOJyQm3VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/CtyG8k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/CtyG8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741071763; x=1772607763;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FWU2jlvzUf9fgp3Py21M8l3MrwYq0DGwtNS1lVoLDsI=;
  b=X/CtyG8k29r1DmWkDhNi9wWTktArNu/uuOFBcRsRxD/9ov2EuBcPxZ41
   dOTQm3D0HzkTkQFSHcJy1QPCYG3SKjNKK1rMyZeb1wWYVHaCYsKx6Tamt
   qgrJWixww/QO6TstPfeqlYQATGUqAiqor5P/k+tDJ9kqizE1sVA1Pn/Ij
   2TuY7GVYfDFJWDmgeEz6hWK/anK7bYK+jd1Km6o9+8Nt9F693Tt8yAiiv
   4ZFUg1FTKdFJ1B5BYWjOlUu3U8pGFejfKwJhnS4taWJg54LC/a8TPHU+s
   6qJcfTwS3hMfjPTH56E8EgLTUNGAjciR6srNULec6V/cnkKxAUCldFu03
   w==;
X-CSE-ConnectionGUID: rwcMRjd5T8+3+lO+kGQHyg==
X-CSE-MsgGUID: KD9gBtS5QtiJWGVfYx+zug==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42169232"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="42169232"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 23:02:41 -0800
X-CSE-ConnectionGUID: jkwFEyW1QMmYeFmOBlbKwg==
X-CSE-MsgGUID: 6BOup5GZSOmNZASysirkkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118301801"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2025 23:02:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpMIY-000JOA-0Q
	for oe-kbuild-all@lists.linux.dev;
	Tue, 04 Mar 2025 07:02:38 +0000
Date: Tue, 4 Mar 2025 15:01:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] fs/f2fs/file.c:1659: Error: unrecognized
 opcode `csrs sstatus,a3', extension `zicsr' required
Message-ID: <202503041427.xL3iggJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 5d539245cb18afa8943cbf2be0cdc033e49f3a4a [1/1] f2fs: export FS_NOCOW_FL flag to user
config: riscv-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250304/202503041427.xL3iggJr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041427.xL3iggJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041427.xL3iggJr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:24:
   fs/f2fs/f2fs.h: In function 'blkaddr_in_node':
   fs/f2fs/f2fs.h:2191:37: warning: taking address of packed member of 'struct f2fs_inode' may result in an unaligned pointer value [-Waddress-of-packed-member]
    2191 |         return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
         |                                     ^~~~
   fs/f2fs/f2fs.h:2191:54: warning: taking address of packed member of 'struct direct_node' may result in an unaligned pointer value [-Waddress-of-packed-member]
    2191 |         return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
         |                                                      ^~~~
   fs/f2fs/file.c: Assembler messages:
   fs/f2fs/file.c:1934: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:1934: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:2881: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:2881: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> fs/f2fs/file.c:1659: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
>> fs/f2fs/file.c:1659: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   fs/f2fs/file.c:2110: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:2110: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:2628: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:2628: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:2932: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   fs/f2fs/file.c:2932: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   fs/f2fs/file.c:1723: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:1703: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/f2fs/file.c:1703: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +1659 fs/f2fs/file.c

fbfa2cc58d5363 Jaegeuk Kim 2012-11-02  1643  
52656e6cf7be69 Jaegeuk Kim 2014-09-24  1644  static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
fbfa2cc58d5363 Jaegeuk Kim 2012-11-02  1645  {
6131ffaa1f0914 Al Viro     2013-02-27  1646  	struct inode *inode = file_inode(filp);
fbfa2cc58d5363 Jaegeuk Kim 2012-11-02  1647  	struct f2fs_inode_info *fi = F2FS_I(inode);
764811581d1cfb Chao Yu     2018-04-08  1648  	unsigned int flags = fi->i_flags;
764811581d1cfb Chao Yu     2018-04-08  1649  
5b72d5e0df787c Chao Yu     2018-07-17  1650  	if (f2fs_encrypted_inode(inode))
764811581d1cfb Chao Yu     2018-04-08  1651  		flags |= F2FS_ENCRYPT_FL;
764811581d1cfb Chao Yu     2018-04-08  1652  	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
764811581d1cfb Chao Yu     2018-04-08  1653  		flags |= F2FS_INLINE_DATA_FL;
5d539245cb18af Jaegeuk Kim 2019-01-03  1654  	if (is_inode_flag_set(inode, FI_PIN_FILE))
5d539245cb18af Jaegeuk Kim 2019-01-03  1655  		flags |= F2FS_NOCOW_FL;
764811581d1cfb Chao Yu     2018-04-08  1656  
764811581d1cfb Chao Yu     2018-04-08  1657  	flags &= F2FS_FL_USER_VISIBLE;
764811581d1cfb Chao Yu     2018-04-08  1658  
fbfa2cc58d5363 Jaegeuk Kim 2012-11-02 @1659  	return put_user(flags, (int __user *)arg);
52656e6cf7be69 Jaegeuk Kim 2014-09-24  1660  }
52656e6cf7be69 Jaegeuk Kim 2014-09-24  1661  

:::::: The code at line 1659 was first introduced by commit
:::::: fbfa2cc58d5363f780f4f2ad0243a47185c2bb2a f2fs: add file operations

:::::: TO: Jaegeuk Kim <jaegeuk.kim@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk.kim@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
