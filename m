Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB625757
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 23:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722555657; cv=none; b=eszLtfwjiGDP2t6f01FIBuDUgg1hIoAl48d+ueZ50kC5mNggEsBKoMK9JwO0OhDcNdOEmlmy2K6XBy71vEmY7idj+EPoMARvBwg5ucbHJNJu1gq9CLreQ6bLa+V/iHXijSOb0bl6GJOx6TtEHbScrL0ek7r+xJNs29zeuTUPRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722555657; c=relaxed/simple;
	bh=bq70bHtbwpE1DRizZX3pKrlmalSLmWJsqPZrKPC2awc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQ3/wPphcovVCZ6uUUfBginEaxT7OewBNduLnAMYCAau4kkJl1RwI99Cv5eg3brmyIAaZHs9dO0qsKGEQ2ntyVjgEr4qiT4CVBqxlGrUK1WDe4vtV94b490Aonx0Ifr/JGaq2x1lR1dfAHCXibJOUFSkngXnHaXOlXBwNCbHLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzzQDsGh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzzQDsGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722555655; x=1754091655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bq70bHtbwpE1DRizZX3pKrlmalSLmWJsqPZrKPC2awc=;
  b=XzzQDsGh3YqDIZNl3IWqJt9mGnnQ7DFbgd+BA+ggOqpa691kjh7aZDpZ
   veZflPzJq23dE39ofJgikmGLE2uHTRoilh0bzvNFWhKNzRJHrSV1TRQlJ
   y7EHWiSKgdh+t0phEAO3weKQeV+lk+oH4GSLVcf838PiY+s8yIJJiynso
   83GHOLpNajMiNN0+1W/FPgAKDcxNZJ/gpT/zUFE0e8fY9xT9TiIzF2/fV
   M6nV0exq9Z8VFK2biKgTHAY+6cuH9beY7RzlAbmEVQhbkZOzqgBrFveVS
   o04CMbsB/wGMv1g8b29ChM8br1jcXL0TSg1xiZlMz06Fh8kroDz+N/W31
   g==;
X-CSE-ConnectionGUID: DIzRKG6BSMiTkyMenoVlDg==
X-CSE-MsgGUID: hrMDan/WTxiSCcyyd91CWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="43071554"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="43071554"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 16:40:55 -0700
X-CSE-ConnectionGUID: IqyeNyLMSzqBDBqFO2Namg==
X-CSE-MsgGUID: CY9NWWj6TOCWDsevz4FajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="59316848"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2024 16:40:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZfPf-000w8i-2Z;
	Thu, 01 Aug 2024 23:40:51 +0000
Date: Fri, 2 Aug 2024 07:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 27/30] fs/utimes.c:25:16: error: variable
 'delegated_inode' has initializer but incomplete type
Message-ID: <202408020741.MyNOkFRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   4326b3d364cb1a5f0c4578c9fa19b1ab03de8b0d
commit: 4c3348b2fdf1d92c520023cf3ff108afe5554503 [27/30] fs: add struct delegated_inode
config: i386-buildonly-randconfig-004-20240802 (https://download.01.org/0day-ci/archive/20240802/202408020741.MyNOkFRw-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020741.MyNOkFRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020741.MyNOkFRw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/utimes.c: In function 'vfs_utimes':
>> fs/utimes.c:25:16: error: variable 'delegated_inode' has initializer but incomplete type
      25 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/utimes.c:25:32: error: storage size of 'delegated_inode' isn't known
      25 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/utimes.c:25:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/xattr.c: In function 'vfs_setxattr':
>> fs/xattr.c:308:16: error: variable 'delegated_inode' has initializer but incomplete type
     308 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/xattr.c:308:32: error: storage size of 'delegated_inode' isn't known
     308 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/xattr.c:308:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/xattr.c: In function 'vfs_removexattr':
   fs/xattr.c:570:16: error: variable 'delegated_inode' has initializer but incomplete type
     570 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/xattr.c:570:32: error: storage size of 'delegated_inode' isn't known
     570 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/xattr.c:570:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/open.c: In function 'chmod_common':
>> fs/open.c:636:16: error: variable 'delegated_inode' has initializer but incomplete type
     636 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/open.c:636:32: error: storage size of 'delegated_inode' isn't known
     636 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/open.c:636:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/open.c: In function 'chown_common':
   fs/open.c:760:16: error: variable 'delegated_inode' has initializer but incomplete type
     760 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/open.c:760:32: error: storage size of 'delegated_inode' isn't known
     760 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/open.c:760:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/namei.c: In function 'open_last_lookups':
>> fs/namei.c:3540:16: error: variable 'delegated_inode' has initializer but incomplete type
    3540 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/namei.c:3540:32: error: storage size of 'delegated_inode' isn't known
    3540 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/namei.c:3540:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_mknodat':
   fs/namei.c:4082:16: error: variable 'delegated_inode' has initializer but incomplete type
    4082 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4082:32: error: storage size of 'delegated_inode' isn't known
    4082 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4082:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_mkdirat':
   fs/namei.c:4205:16: error: variable 'delegated_inode' has initializer but incomplete type
    4205 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4205:32: error: storage size of 'delegated_inode' isn't known
    4205 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4205:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_rmdir':
   fs/namei.c:4315:16: error: variable 'delegated_inode' has initializer but incomplete type
    4315 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4315:32: error: storage size of 'delegated_inode' isn't known
    4315 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4315:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_unlinkat':
   fs/namei.c:4464:16: error: variable 'delegated_inode' has initializer but incomplete type
    4464 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4464:32: error: storage size of 'delegated_inode' isn't known
    4464 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4464:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_linkat':
   fs/namei.c:4730:16: error: variable 'delegated_inode' has initializer but incomplete type
    4730 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4730:32: error: storage size of 'delegated_inode' isn't known
    4730 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4730:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_renameat2':
   fs/namei.c:5030:16: error: variable 'delegated_inode' has initializer but incomplete type
    5030 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:5030:32: error: storage size of 'delegated_inode' isn't known
    5030 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:5030:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/posix_acl.c: In function 'vfs_set_acl':
>> fs/posix_acl.c:1095:16: error: variable 'delegated_inode' has initializer but incomplete type
    1095 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/posix_acl.c:1095:32: error: storage size of 'delegated_inode' isn't known
    1095 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/posix_acl.c:1095:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/posix_acl.c: In function 'vfs_remove_acl':
   fs/posix_acl.c:1216:16: error: variable 'delegated_inode' has initializer but incomplete type
    1216 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/posix_acl.c:1216:32: error: storage size of 'delegated_inode' isn't known
    1216 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/posix_acl.c:1216:32: warning: unused variable 'delegated_inode' [-Wunused-variable]


vim +/delegated_inode +25 fs/utimes.c

    19	
    20	int vfs_utimes(const struct path *path, struct timespec64 *times)
    21	{
    22		int error;
    23		struct iattr newattrs;
    24		struct inode *inode = path->dentry->d_inode;
  > 25		struct delegated_inode delegated_inode = { };
    26	
    27		if (times) {
    28			if (!nsec_valid(times[0].tv_nsec) ||
    29			    !nsec_valid(times[1].tv_nsec))
    30				return -EINVAL;
    31			if (times[0].tv_nsec == UTIME_NOW &&
    32			    times[1].tv_nsec == UTIME_NOW)
    33				times = NULL;
    34		}
    35	
    36		error = mnt_want_write(path->mnt);
    37		if (error)
    38			goto out;
    39	
    40		newattrs.ia_valid = ATTR_CTIME | ATTR_MTIME | ATTR_ATIME;
    41		if (times) {
    42			if (times[0].tv_nsec == UTIME_OMIT)
    43				newattrs.ia_valid &= ~ATTR_ATIME;
    44			else if (times[0].tv_nsec != UTIME_NOW) {
    45				newattrs.ia_atime = times[0];
    46				newattrs.ia_valid |= ATTR_ATIME_SET;
    47			}
    48	
    49			if (times[1].tv_nsec == UTIME_OMIT)
    50				newattrs.ia_valid &= ~ATTR_MTIME;
    51			else if (times[1].tv_nsec != UTIME_NOW) {
    52				newattrs.ia_mtime = times[1];
    53				newattrs.ia_valid |= ATTR_MTIME_SET;
    54			}
    55			/*
    56			 * Tell setattr_prepare(), that this is an explicit time
    57			 * update, even if neither ATTR_ATIME_SET nor ATTR_MTIME_SET
    58			 * were used.
    59			 */
    60			newattrs.ia_valid |= ATTR_TIMES_SET;
    61		} else {
    62			newattrs.ia_valid |= ATTR_TOUCH;
    63		}
    64	retry_deleg:
    65		inode_lock(inode);
    66		error = notify_change(mnt_idmap(path->mnt), path->dentry, &newattrs,
    67				      &delegated_inode);
    68		inode_unlock(inode);
    69		if (delegated_inode.di_inode) {
    70			error = break_deleg_wait(&delegated_inode);
    71			if (!error)
    72				goto retry_deleg;
    73		}
    74	
    75		mnt_drop_write(path->mnt);
    76	out:
    77		return error;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
