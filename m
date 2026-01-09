Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EAE364EB2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975410; cv=none; b=kLPFOpAtDyc5AA2S7GgmKf1GKiDc/PITE6xT9MT5F4qdMf0WcEO1tbrE4ucxpXJ0Ryq6yXtdz2qWEryk4/I/fUxnyNDjfpxBJesTWEn4tgX3WYNSuRTyvbqKvMBm+6KVycObRFgn2iorFa6EkqvAE7TTdPONhIPDu6Bk4RRqvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975410; c=relaxed/simple;
	bh=k7Esx1YRWiS0PKCCjv/Mn+eub6UfcWKIDTR/+d7vP2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TwujsVAYSmWONtzb0rN24ev+hBKY5Kz5bxt1Um1OwwafP6dTfjgFAPw35Q4coyk55Bxj2ojl91Iu7jysb7oD3J9GX573Nu1+c4FWSWHkuWF3+pw17BjFlJ3kk//oLXbP/u9pJVf9HldVlGFUZaNmx1ATPRYunTFTZSrH8p5vnN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIt5ADVD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIt5ADVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767975410; x=1799511410;
  h=date:from:to:cc:subject:message-id;
  bh=k7Esx1YRWiS0PKCCjv/Mn+eub6UfcWKIDTR/+d7vP2s=;
  b=YIt5ADVDXO7JAUQjLfcWMZW0VOyi9eIDJ58YrbouAFy5NqKAI/wvco9C
   rIdsuz2wXSOkYAJf11jawux7h1wIB9HOPo3yo3hsWwhq0WzS7HIItbZI0
   nHwYJcaSE+e5nxEmz3xSUPuWec9WhkZTeegALGqYcJSVkUfCM2ex167Cz
   CZr2DKdeM8G0Hj2aoSMHfZXlIlXov4mxmDl1G9e0iooA1pwzOYa+TXWgE
   87lP9H3wtd+cKOhETVqN4JHVA3/jSUfGl1FdfdvldJkFgpDAP/0DF7pKE
   OCnRRouJYOMcux2yRNxn42Xv+l7+PCtOeFyE53+h2VZkbl3MGw3h9B3OX
   A==;
X-CSE-ConnectionGUID: cD+gztGWQ5a9VJfwVNdP0A==
X-CSE-MsgGUID: hV3cefyjTKifgkJcJqzyBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69271738"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69271738"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 08:16:26 -0800
X-CSE-ConnectionGUID: 2Xl6idKBTzeGlCC60gXtSQ==
X-CSE-MsgGUID: 9aOXNqHESpeFF75uA+4yKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="203420411"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2026 08:16:25 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veF9y-0000000026W-1JXr;
	Fri, 09 Jan 2026 16:16:22 +0000
Date: Fri, 09 Jan 2026 17:15:52 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 2/2] fs/overlayfs/file.c:51:27:
 error: passing 'const struct file *' to parameter of type 'struct file *'
 discards qualifiers
Message-ID: <202601091724.llm1QtoN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   e01a54da66bb15db70e9c68e9c4fcfd458fab424
commit: e01a54da66bb15db70e9c68e9c4fcfd458fab424 [2/2] backing_file: store user_path_file
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260109/202601091724.llm1QtoN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091724.llm1QtoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091724.llm1QtoN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/overlayfs/file.c:51:27: error: passing 'const struct file *' to parameter of type 'struct file *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      51 |                                                      file_user_cred(file),
         |                                                                     ^~~~
   ./include/linux/backing-file.h:32:62: note: passing argument to parameter 'f' here
      32 | static inline const struct cred *file_user_cred(struct file *f)
         |                                                              ^
   1 error generated.


vim +51 fs/overlayfs/file.c

    26	
    27	static struct file *ovl_open_realfile(const struct file *file,
    28					      const struct path *realpath)
    29	{
    30		struct inode *realinode = d_inode(realpath->dentry);
    31		struct inode *inode = file_inode(file);
    32		struct mnt_idmap *real_idmap;
    33		struct file *realfile;
    34		int flags = file->f_flags | OVL_OPEN_FLAGS;
    35		int acc_mode = ACC_MODE(flags);
    36		int err;
    37	
    38		if (flags & O_APPEND)
    39			acc_mode |= MAY_APPEND;
    40	
    41		with_ovl_creds(inode->i_sb) {
    42			real_idmap = mnt_idmap(realpath->mnt);
    43			err = inode_permission(real_idmap, realinode, MAY_OPEN | acc_mode);
    44			if (err) {
    45				realfile = ERR_PTR(err);
    46			} else {
    47				if (!inode_owner_or_capable(real_idmap, realinode))
    48					flags &= ~O_NOATIME;
    49	
    50				realfile = backing_file_open(file_user_path(file),
  > 51							     file_user_cred(file),
    52							     flags, realpath, current_cred());
    53			}
    54		}
    55	
    56		pr_debug("open(%p[%pD2/%c], 0%o) -> (%p, 0%o)\n",
    57			 file, file, ovl_whatisit(inode, realinode), file->f_flags,
    58			 realfile, IS_ERR(realfile) ? 0 : realfile->f_flags);
    59	
    60		return realfile;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
