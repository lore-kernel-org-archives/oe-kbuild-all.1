Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BB2FD1DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726337; cv=none; b=Eb6yolJ6m1LsTaZvNArUFpWTlhbCDkVKCLKVNnMKurnkv2XnVyXJeMJ9jz2CJS2nkeX8ZNEszHhMYM6Qy022GV+CPz90hjxOkILwMy/7Ar7cGG7PooBqsgffjhY3GAq5MYSgfarpjWjdLxEnIC7X2Cb3NNzzNU8zB3mACR/rHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726337; c=relaxed/simple;
	bh=ROUvbuY8lWsp6zIG1IaF9Snq6N6tcwHMDR2KvxxEm9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPsNB1ttIHivCyPzvZQuPFCh4ZRMfhI1QEZ7hSMSOsGSiSxx3RWeCLyvG/C6GneKW1ACii05fP939VI9o2NOwb1res5ScOFT/a954w9Xy/bh6SfkT9jHY7jFnxJAQL5gnZvlmJ4V1O3IbtThaEOLXzmC2G2demxqS5GdwjeVUtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atF157Zk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atF157Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763726336; x=1795262336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROUvbuY8lWsp6zIG1IaF9Snq6N6tcwHMDR2KvxxEm9A=;
  b=atF157ZkEfptkbtHscRRt7SXeCq9IeVmN7la02n7ggq7NsCrj9HGKUUp
   SJ+KfYWypJmRzx2XsHeuVPeDkRZYWOi5aXNplDdORoFiW/4LAOgfS7G6f
   hfkgWExm2+bKiQnYVdfyHoN13O/hOAcNivlr05Qzi0X6agR4N22EM7biK
   Zr1pMNMkrhH6Gn6LBZz76ZYxs9Tcs+vXcVOPGz4mMIC2Q3V9vwLr9xgAi
   k832SVkL7oYg2aenCbMoJUWQKlJyDe+F/b7wJSEOB2VSkIiD3QFPu7T5k
   pEBJUSfbQCaEnZlh26KKYWMfMK/QjyZpNRCZlDoafaTnZifmuDsb+6rQV
   g==;
X-CSE-ConnectionGUID: peJ7uBCESFaoSwetsvg9dA==
X-CSE-MsgGUID: lVdOWAS2TI26KbY7jEIhJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76924434"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="76924434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:58:55 -0800
X-CSE-ConnectionGUID: iwYnKyFnTbiyINpbOzpG2A==
X-CSE-MsgGUID: o0xSoxlrS72K+ncAVG0PnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="196621527"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2025 03:58:54 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMPmt-0005J3-1S;
	Fri, 21 Nov 2025 11:58:51 +0000
Date: Fri, 21 Nov 2025 19:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 12/13] fs/ntfsplus/ea.c:536:39: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202511211900.uUAOaEj1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   b9cfd219782e00a06a19ed8ad23f84b2e6f46bdd
commit: 0a9cc0550bdfdf98654865de47197d09935c8e0c [12/13] ntfsplus: add v2 changes
config: nios2-randconfig-r123-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211900.uUAOaEj1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211900.uUAOaEj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211900.uUAOaEj1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ntfsplus/ea.c: note: in included file:
   fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
   fs/ntfsplus/ea.c:30:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 [usertype] type @@     got int type @@
   fs/ntfsplus/ea.c:30:43: sparse:     expected restricted __le32 [usertype] type
   fs/ntfsplus/ea.c:30:43: sparse:     got int type
   fs/ntfsplus/ea.c:132:24: sparse: sparse: cast to restricted __le16
   fs/ntfsplus/ea.c:132:24: sparse: sparse: cast from restricted __le32
   fs/ntfsplus/ea.c:265:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ea_query_length @@     got restricted __le16 [usertype] @@
   fs/ntfsplus/ea.c:265:44: sparse:     expected restricted __le32 [usertype] ea_query_length
   fs/ntfsplus/ea.c:265:44: sparse:     got restricted __le16 [usertype]
   fs/ntfsplus/ea.c:267:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:267:41: sparse:     expected int type
   fs/ntfsplus/ea.c:267:41: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:272:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:272:41: sparse:     expected int type
   fs/ntfsplus/ea.c:272:41: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:327:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:327:41: sparse:     expected int type
   fs/ntfsplus/ea.c:327:41: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:333:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:333:33: sparse:     expected int type
   fs/ntfsplus/ea.c:333:33: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:461:25: sparse: sparse: cast to restricted __le16
   fs/ntfsplus/ea.c:461:25: sparse: sparse: cast from restricted __le32
>> fs/ntfsplus/ea.c:536:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __le32 [usertype] flags @@
   fs/ntfsplus/ea.c:536:39: sparse:     expected unsigned char [usertype]
   fs/ntfsplus/ea.c:536:39: sparse:     got restricted __le32 [usertype] flags
--
   fs/ntfsplus/namei.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h):
   fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/namei.c:71:32: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/namei.c:72:31: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/namei.c:75:52: sparse: sparse: restricted __le16 degrades to integer
>> fs/ntfsplus/namei.c:79:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfsplus/namei.c:79:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfsplus/namei.c:79:42: sparse:     got unsigned short const *wc
   fs/ntfsplus/namei.c:80:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfsplus/namei.c:80:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfsplus/namei.c:80:42: sparse:     got unsigned short const *wc
   fs/ntfsplus/namei.c:81:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfsplus/namei.c:81:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfsplus/namei.c:81:42: sparse:     got unsigned short const *wc
   fs/ntfsplus/namei.c:82:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfsplus/namei.c:82:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfsplus/namei.c:82:42: sparse:     got unsigned short const *wc
   fs/ntfsplus/namei.c:86:52: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/namei.c:90:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfsplus/namei.c:90:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfsplus/namei.c:90:42: sparse:     got unsigned short const *wc
   fs/ntfsplus/namei.c:91:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfsplus/namei.c:91:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfsplus/namei.c:91:42: sparse:     got unsigned short const *wc
>> fs/ntfsplus/namei.c:92:32: sparse: sparse: cast to restricted __le16
   fs/ntfsplus/namei.c:646:59: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/namei.c:756:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:756:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:756:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1016:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1016:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1016:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1060:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1060:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1060:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1102:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1102:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1102:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1189:67: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/namei.c:1266:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname_new @@
   fs/ntfsplus/namei.c:1266:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1266:48: sparse:     got restricted __le16 [usertype] *[addressable] uname_new
   fs/ntfsplus/namei.c:1412:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] usrc @@
   fs/ntfsplus/namei.c:1412:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1412:48: sparse:     got restricted __le16 [usertype] *[addressable] usrc
   fs/ntfsplus/namei.c:1468:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1468:48: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1468:48: sparse:     got restricted __le16 [usertype] *[addressable] uname

vim +536 fs/ntfsplus/ea.c

   518	
   519	static int ntfs_getxattr(const struct xattr_handler *handler,
   520			struct dentry *unused, struct inode *inode, const char *name,
   521			void *buffer, size_t size)
   522	{
   523		struct ntfs_inode *ni = NTFS_I(inode);
   524		int err;
   525	
   526		if (NVolShutdown(ni->vol))
   527			return -EIO;
   528	
   529		if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
   530			if (!buffer) {
   531				err = sizeof(u8);
   532			} else if (size < sizeof(u8)) {
   533				err = -ENODATA;
   534			} else {
   535				err = sizeof(u8);
 > 536				*(u8 *)buffer = ni->flags;
   537			}
   538			goto out;
   539		}
   540	
   541		if (!strcmp(name, SYSTEM_NTFS_ATTRIB) ||
   542		    !strcmp(name, SYSTEM_NTFS_ATTRIB_BE)) {
   543			if (!buffer) {
   544				err = sizeof(u32);
   545			} else if (size < sizeof(u32)) {
   546				err = -ENODATA;
   547			} else {
   548				err = sizeof(u32);
   549				*(u32 *)buffer = le32_to_cpu(ni->flags);
   550				if (!strcmp(name, SYSTEM_NTFS_ATTRIB_BE))
   551					*(__be32 *)buffer = cpu_to_be32(*(u32 *)buffer);
   552			}
   553			goto out;
   554		}
   555	
   556		mutex_lock(&ni->mrec_lock);
   557		err = ntfs_get_ea(inode, name, strlen(name), buffer, size);
   558		mutex_unlock(&ni->mrec_lock);
   559	
   560	out:
   561		return err;
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
