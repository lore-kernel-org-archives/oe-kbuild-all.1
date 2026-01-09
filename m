Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3FB3321B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949645; cv=none; b=f61Ql7/OO4a3dMHTqBIbJZz00UmbOuzwiXEOrlWk5RYEycUUOXPyqJyobks3NmtLGLS4ZSW1bi6R6HsQYObRQKPsMM+GeHgox5CJQONbPo1JKjJDaMEqrB07KRkZQtRqB05mjc7W25LDP1UM2feuy1UOGAfK4VU0m0K9t4HvifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949645; c=relaxed/simple;
	bh=7G+9t76Xl4vHftcLGMuOQGnxXB3QER2/OcCqkK/nIrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gbQtDouVOSl0RgB/AcIMof7i7VAPu1ux370O2GBVp/wZHKSKE6x2TxLwxGbv2G49qV6pzMeLzqB1GBdcH/PNHZyhC7BDe8PcIR+zv9glwrb3Qy3nLwZVuF7lsGMizhqcs6PFbDJs5dXlnOmzO6WLZqrb9sZrd6zq+lWD2dO8EiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaHvuC0R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaHvuC0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767949644; x=1799485644;
  h=date:from:to:cc:subject:message-id;
  bh=7G+9t76Xl4vHftcLGMuOQGnxXB3QER2/OcCqkK/nIrc=;
  b=KaHvuC0RUoEIz5/1xjrfcisepAzbZr3hjw6Ch0OSDyZQaTCEgBbr5kOU
   CIE1YKruTWFcBLHipBmJQNepsN+2NtldpVwY3dht0chE4X3aDozfHgaUA
   ZYxyYEuqv7VWp8ynfG++b/jJcN4CYfNQjY8DCPCtN7/da6w7FU6KCxzG6
   uRM03WebgveB7Ve4taRShz4o4oTEmC79UkCODcUjVSfUG9uQLX2VTCPou
   +geMn5vn1IXsIhfK+2KG9XGgp8Am8RXGCGntTENoKitgtZmM3wS4/djeo
   nWZcPn4etfLgd2B9UtpQrXGHBBCX+6W3nAqGk+TC/Lve4jGJltv9t281H
   g==;
X-CSE-ConnectionGUID: rxs0RGKCQU2d4rX87s87Gw==
X-CSE-MsgGUID: NcwTtwUnSaOq/zMhVrIkEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79969587"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="79969587"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:07:23 -0800
X-CSE-ConnectionGUID: CSXAaBX5Rxqqxxgf/OHtHw==
X-CSE-MsgGUID: kPUvjnHuR6GdWO0qTRzt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="202541278"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Jan 2026 01:07:21 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve8Sl-0000000022W-0f0N;
	Fri, 09 Jan 2026 09:07:19 +0000
Date: Fri, 09 Jan 2026 10:06:42 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 2/2] fs/overlayfs/file.c:51:69:
 warning: passing argument 1 of 'file_user_cred' discards 'const' qualifier
 from pointer target type
Message-ID: <202601091014.yhnPpyCU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   e01a54da66bb15db70e9c68e9c4fcfd458fab424
commit: e01a54da66bb15db70e9c68e9c4fcfd458fab424 [2/2] backing_file: store user_path_file
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260109/202601091014.yhnPpyCU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091014.yhnPpyCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091014.yhnPpyCU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/overlayfs/file.c: In function 'ovl_open_realfile':
>> fs/overlayfs/file.c:51:69: warning: passing argument 1 of 'file_user_cred' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      51 |                                                      file_user_cred(file),
         |                                                                     ^~~~
   In file included from fs/overlayfs/file.c:14:
   include/linux/backing-file.h:32:62: note: expected 'struct file *' but argument is of type 'const struct file *'
      32 | static inline const struct cred *file_user_cred(struct file *f)
         |                                                 ~~~~~~~~~~~~~^


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
