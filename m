Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901F2FFFA5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771620332; cv=none; b=MNAfTCwO8N8EkaTzNGJQSIPPl6uYxFvjwEQAysPWi3sElI5RQp60Ed4OdauCZwcYYw3VtRFmbIr11ptur/DUin20DsRrAW8h9G20WFSOzML62bDW7fOEDBBdL+37ZIazHkdZeafkzVe/cWJXM6QezIsPFnHRtZhV1IVRHOPT3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771620332; c=relaxed/simple;
	bh=s0pNIRN7lMePYAg5APl/fK6gsa8rmjTRv/tsif5bofI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bVlv/lqmMOwOrks2uD0IXJ2QFz3vpFj9BDi1QIezK606/0TewlTbCmqyz75xhNyWNPXyrV68m+OcHSPTVxOvVU5kjJVMHPobyrEwZI24QFKfdSw60FyRBZv46VAl01FYU3YLOU2zHWijTS1Ya8oXynZUJ2FFlx0/JsPM6MyMR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TC3pPZuh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TC3pPZuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771620332; x=1803156332;
  h=date:from:to:cc:subject:message-id;
  bh=s0pNIRN7lMePYAg5APl/fK6gsa8rmjTRv/tsif5bofI=;
  b=TC3pPZuhSiMH5y2pysRe45vIYv9M0QIYanVzZn122GZqL/QLIDvnnRJ6
   3aC+0jzwp78neywy5wlf6IaQstYz3YVRYzsj6Zlkqt0qJ2lE/uGQ8CMgO
   8h3Rhw6zrF0qr1yVEoW5wwDFTPNbAkStFAZ3KhsigWuRZFkcwzMEfO02K
   pl+S12qUsN3r31JDrTWQcN+Tqh/Cy59dNPooLO7VGurKSWd4sV79ZRbB4
   PStHeB17UxfEluZY6/nQX8uC1TfXAl1aTsI1oEckAZGuey+kiKUmHbaev
   Cw2ozEqT0GwFkkctfPL7Aulu4e40bY82Xr798k2lHDvGhhTXVsG11JbaT
   Q==;
X-CSE-ConnectionGUID: IgkUsjp5RF+COl/8ZhoAmw==
X-CSE-MsgGUID: 2o5DyGXgQBKgUnpIJpGwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72781043"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72781043"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:45:31 -0800
X-CSE-ConnectionGUID: OqWRNqs4Tc2blL/id7sF2A==
X-CSE-MsgGUID: x39w8aMLQ4GK1e/JW3TIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213036180"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2026 12:45:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtXNP-000000014Sv-2MUw;
	Fri, 20 Feb 2026 20:45:27 +0000
Date: Sat, 21 Feb 2026 04:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:iino-u64 2/29] fs/crypto/keysetup.c:95:5: warning:
 format specifies type 'unsigned long' but the argument has type 'u64' (aka
 'unsigned long long')
Message-ID: <202602210427.S5OMVy1a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git iino-u64
head:   5aef1b33e04ec98ed6f4a02ce457ecdc39b794dd
commit: a84299eafee5781e2616860a83f947d8b2c7daee [2/29] vfs: change i_ino from unsigned long to u64
config: sparc64-randconfig-r071-20260221 (https://download.01.org/0day-ci/archive/20260221/202602210427.S5OMVy1a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210427.S5OMVy1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210427.S5OMVy1a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/crypto/keysetup.c:95:5: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      94 |         WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
         |                                                                                   ~~~
         |                                                                                   %llu
      95 |                   inode->i_ino, (inode->i_mode & S_IFMT));
         |                   ^~~~~~~~~~~~
   include/asm-generic/bug.h:185:38: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:166:29: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:142:48: note: expanded from macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   1 warning generated.


vim +95 fs/crypto/keysetup.c

e3b1078bedd323d fs/crypto/keysetup.c Eric Biggers  2020-05-15  81  
e1cc40e5d42acb1 fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  82  static struct fscrypt_mode *
5dae460c2292dbb fs/crypto/keysetup.c Eric Biggers  2019-08-04  83  select_encryption_mode(const union fscrypt_policy *policy,
5dae460c2292dbb fs/crypto/keysetup.c Eric Biggers  2019-08-04  84  		       const struct inode *inode)
8f39850dffa9cba fs/crypto/keyinfo.c  Eric Biggers  2016-09-15  85  {
3ceb6543e9cf6ed fs/crypto/keysetup.c Eric Biggers  2020-10-23  86  	BUILD_BUG_ON(ARRAY_SIZE(fscrypt_modes) != FSCRYPT_MODE_MAX + 1);
3ceb6543e9cf6ed fs/crypto/keysetup.c Eric Biggers  2020-10-23  87  
e1cc40e5d42acb1 fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  88  	if (S_ISREG(inode->i_mode))
85af90e57ce9697 fs/crypto/keysetup.c Eric Biggers  2019-12-09  89  		return &fscrypt_modes[fscrypt_policy_contents_mode(policy)];
e1cc40e5d42acb1 fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  90  
e1cc40e5d42acb1 fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  91  	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
85af90e57ce9697 fs/crypto/keysetup.c Eric Biggers  2019-12-09  92  		return &fscrypt_modes[fscrypt_policy_fnames_mode(policy)];
e1cc40e5d42acb1 fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  93  
b7e7cf7a66a27e6 fs/crypto/keyinfo.c  Daniel Walter 2017-06-19  94  	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
b7e7cf7a66a27e6 fs/crypto/keyinfo.c  Daniel Walter 2017-06-19 @95  		  inode->i_ino, (inode->i_mode & S_IFMT));
e1cc40e5d42acb1 fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  96  	return ERR_PTR(-EINVAL);
8f39850dffa9cba fs/crypto/keyinfo.c  Eric Biggers  2016-09-15  97  }
8f39850dffa9cba fs/crypto/keyinfo.c  Eric Biggers  2016-09-15  98  

:::::: The code at line 95 was first introduced by commit
:::::: b7e7cf7a66a27e62c5f873a0068cee34094bf5d7 fscrypt: add support for AES-128-CBC

:::::: TO: Daniel Walter <dwalter@sigma-star.at>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
