Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC93F25F984
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580096; cv=none; b=UIkfDbrW2uGtcbuLzx8soAcdgfgqLTwHxAj6JK69SzUtTalLw/uRqQurw7/44JFjwunquzu1YHNIBBuhgwoPRGWUZG9BMAUE5EkW3CliO71oE4McPpIPYV7Y5jFyjwSDqcgj/4oLTu3e8ynKfD+bPf/hIsYQGY/eww58EMmJJTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580096; c=relaxed/simple;
	bh=h138nIvm9hkry9FgevuHsDrEo6CtiNzI+y3if15LC4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TppRjGWPpMahHvdZvAFjU7Ro3evMSi9vY13Y45vElR6whxYLLnPyScX8Lrl5E/MBuMGi8Ooh6mSbz+Sh9p4euQDmB7iBMKuurqTpMzEFSM5xZuJVKfD0U3WsuiMl0PTysXuWDDhnpC787p2jG3BdwejwZ5f5CH+XGIJlWDTh9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3RPRPVl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3RPRPVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763580092; x=1795116092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h138nIvm9hkry9FgevuHsDrEo6CtiNzI+y3if15LC4E=;
  b=M3RPRPVly/fvDyL8tm2K6jtDwmk9lNag2vJc3siTjXuM2BbgAiDdVHDS
   0LEs/Qzfd6u/ycS9mRfyX+3GUoy/1a6PqVqVU13u8G2dTPUHfxRyqRiep
   qxyN9nmoYdmyx72Xel1Q+hPcnBfZHzV+th0jIdNQ0cfHJijjVCuOQcnIe
   eV5tR2QcoE5KpcAo49d9GCeJv7lIMoBNaj7UtWKeK+ev6eqAUJ9Z8xaox
   GAJRYUW0qujGdqtcg3v15zClKulo2MgXSja2rUCD7Os5xnP2w7HNsG27a
   lLU2nBp75qRFuBXVM4dAUEo4adSRh5UgbeWUQk3SdGLXlff879olPF2gc
   Q==;
X-CSE-ConnectionGUID: IjwSmQz8SFiOhFHtqO1kcg==
X-CSE-MsgGUID: ud2bFFsCRFK5WcmzZvyiQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83258925"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="83258925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 11:21:29 -0800
X-CSE-ConnectionGUID: +wNmEhuDQGOJXdknBSOyXw==
X-CSE-MsgGUID: JhxgjquxTTap88LlGiBIPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="196286608"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2025 11:21:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLnk6-0003Cz-08;
	Wed, 19 Nov 2025 19:21:26 +0000
Date: Thu, 20 Nov 2025 03:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 43/45]
 security/selinux/hooks.c:3715:37: warning: variable 'sbsec' set but not used
Message-ID: <202511200351.DvXxU03h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   005572c247575301e0fc2306a3e69fa672987546
commit: 043018554018c722f1650526ffdf3dde35941a36 [43/45] selinux: do not cache sblabel mount flag in superblock
config: s390-randconfig-002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200351.DvXxU03h-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200351.DvXxU03h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200351.DvXxU03h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/selinux/hooks.c: In function 'selinux_inode_setsecurity':
>> security/selinux/hooks.c:3715:37: warning: variable 'sbsec' set but not used [-Wunused-but-set-variable]
     struct superblock_security_struct *sbsec;
                                        ^~~~~


vim +/sbsec +3715 security/selinux/hooks.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  3710  
^1da177e4c3f41 Linus Torvalds      2005-04-16  3711  static int selinux_inode_setsecurity(struct inode *inode, const char *name,
^1da177e4c3f41 Linus Torvalds      2005-04-16  3712  				     const void *value, size_t size, int flags)
^1da177e4c3f41 Linus Torvalds      2005-04-16  3713  {
2c97165befb487 Paul Moore          2016-04-19  3714  	struct inode_security_struct *isec = inode_security_novalidate(inode);
1aea7808372eee Casey Schaufler     2021-04-22 @3715  	struct superblock_security_struct *sbsec;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3716  	u32 newsid;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3717  	int rc;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3718  
^1da177e4c3f41 Linus Torvalds      2005-04-16  3719  	if (strcmp(name, XATTR_SELINUX_SUFFIX))
^1da177e4c3f41 Linus Torvalds      2005-04-16  3720  		return -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3721  
1aea7808372eee Casey Schaufler     2021-04-22  3722  	sbsec = selinux_superblock(inode->i_sb);
043018554018c7 Stephen Smalley     2025-11-17  3723  	if (!selinux_is_sblabel_mnt(inode->i_sb))
53e0c2aa9a59a4 Ondrej Mosnacek     2018-12-21  3724  		return -EOPNOTSUPP;
53e0c2aa9a59a4 Ondrej Mosnacek     2018-12-21  3725  
^1da177e4c3f41 Linus Torvalds      2005-04-16  3726  	if (!value || !size)
^1da177e4c3f41 Linus Torvalds      2005-04-16  3727  		return -EACCES;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3728  
38192e46586861 Stephen Smalley     2020-08-21  3729  	rc = security_context_to_sid(current_selinux_state, value, size, &newsid,
aa8e712cee93d5 Stephen Smalley     2018-03-01  3730  				     GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds      2005-04-16  3731  	if (rc)
^1da177e4c3f41 Linus Torvalds      2005-04-16  3732  		return rc;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3733  
9287aed2ad1ff1 Andreas Gruenbacher 2016-11-15  3734  	spin_lock(&isec->lock);
aa9c2669626ca7 David Quigley       2013-05-22  3735  	isec->sclass = inode_mode_to_security_class(inode->i_mode);
^1da177e4c3f41 Linus Torvalds      2005-04-16  3736  	isec->sid = newsid;
6f3be9f562e302 Andreas Gruenbacher 2015-12-24  3737  	isec->initialized = LABEL_INITIALIZED;
9287aed2ad1ff1 Andreas Gruenbacher 2016-11-15  3738  	spin_unlock(&isec->lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  3739  	return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3740  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  3741  

:::::: The code at line 3715 was first introduced by commit
:::::: 1aea7808372eee4ad01f98e064c88c57f1e94855 LSM: Infrastructure management of the superblock

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: James Morris <jamorris@linux.microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
