Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AB61E8856
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 02:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728613070; cv=none; b=GlaeHIv7W7BX57DGoeoO6oM5GLmqFRXhhvsw0ICJ2N1ZCWSUsMkfeexYwhN0MpnNXA9cYU/BglLYzRobD/Cmj6uQhcoacVn++w7G/nOt9yRXaFol1ll8++hReRkPcxXcFclr8xvaV81qanWvi2Kd0JbxklRlvhbJbZ1yBukHdG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728613070; c=relaxed/simple;
	bh=oFMw6CUKkB+zBPjtDLOhRITpWYoHEYqTP/0OMrtYAQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uci1djgtD4z4WQUfRmIk8s/JZ7Bu1a8MWsNveh7NAiwM+SQIqvL0T0iJEV5MRkc9kG+lT4h4IoS8E8UXxDaUybIuSLr+b4c3uXL013fvISIZ2f2Ki2mbv3pK5HGP2OywdfLsbkmDmNNKh8Zd4v0JbPrU/YHuZk98m38hmkgGSKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl2+w0H7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl2+w0H7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728613069; x=1760149069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFMw6CUKkB+zBPjtDLOhRITpWYoHEYqTP/0OMrtYAQI=;
  b=Hl2+w0H7b1BIlF5AbrDxqpE7rQHyQ96PXUijQisA68VaBBt2g2Cpysg3
   eZMltGzaXdC3PKDt8kwmkTMYJVDBWqaLjBPfE3RLk6QZsqyQjOnz6cAvQ
   fvbrm/HQaR0ubu9TVGSulTRfc7jfHtn7IUDVYIY8iDawQx8KbE4qFn96p
   UNby2hJm/43VzG69R3bAYuVgt0M1VEweBIt2hvJXWr6MOZrJU635usFy+
   aRbC3wZvL+ualb+Cw4piXwdvYvWM+kJi19Qx+AFyOlxQzfq4T5JHwC5ch
   NSEmTHgS+eFhLLwAx1AbXZP4PzzTN3yb3lzTyhggE2aDlj6SpCvChaiPp
   g==;
X-CSE-ConnectionGUID: yhknQ6F/TBSfcbsLeH70Fg==
X-CSE-MsgGUID: QHspQ4a8Tia35NkHavuz9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38651034"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="38651034"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 19:17:48 -0700
X-CSE-ConnectionGUID: wAw9J6hBQuCxNzoXoqzVlw==
X-CSE-MsgGUID: aCK410pvR0eI/F/nbWVByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76694337"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2024 19:17:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz5Ds-000Bc9-2B;
	Fri, 11 Oct 2024 02:17:44 +0000
Date: Fri, 11 Oct 2024 10:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 31/35] fs/utimes.c:25:16: error: variable
 'delegated_inode' has initializer but incomplete type
Message-ID: <202410111053.rYvkm0YX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   b91bc932b468b4c460faef8759fbae5a75b2ab5c
commit: dfd80c5780301295a6cf5ed1f77cd4f724ec1d3e [31/35] fs: add struct delegated_inode
config: i386-buildonly-randconfig-003-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111053.rYvkm0YX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111053.rYvkm0YX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111053.rYvkm0YX-lkp@intel.com/

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
   fs/namei.c: In function 'open_last_lookups':
>> fs/namei.c:3666:16: error: variable 'delegated_inode' has initializer but incomplete type
    3666 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/namei.c:3666:32: error: storage size of 'delegated_inode' isn't known
    3666 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/namei.c:3666:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_mknodat':
   fs/namei.c:4202:16: error: variable 'delegated_inode' has initializer but incomplete type
    4202 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4202:32: error: storage size of 'delegated_inode' isn't known
    4202 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4202:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_mkdirat':
   fs/namei.c:4325:16: error: variable 'delegated_inode' has initializer but incomplete type
    4325 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4325:32: error: storage size of 'delegated_inode' isn't known
    4325 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4325:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_rmdir':
   fs/namei.c:4436:16: error: variable 'delegated_inode' has initializer but incomplete type
    4436 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4436:32: error: storage size of 'delegated_inode' isn't known
    4436 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4436:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_unlinkat':
   fs/namei.c:4585:16: error: variable 'delegated_inode' has initializer but incomplete type
    4585 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4585:32: error: storage size of 'delegated_inode' isn't known
    4585 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4585:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_linkat':
   fs/namei.c:4851:16: error: variable 'delegated_inode' has initializer but incomplete type
    4851 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4851:32: error: storage size of 'delegated_inode' isn't known
    4851 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4851:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_renameat2':
   fs/namei.c:5151:16: error: variable 'delegated_inode' has initializer but incomplete type
    5151 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:5151:32: error: storage size of 'delegated_inode' isn't known
    5151 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:5151:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
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
--
   fs/open.c: In function 'chmod_common':
>> fs/open.c:639:16: error: variable 'delegated_inode' has initializer but incomplete type
     639 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/open.c:639:32: error: storage size of 'delegated_inode' isn't known
     639 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
>> fs/open.c:639:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/open.c: In function 'chown_common':
   fs/open.c:763:16: error: variable 'delegated_inode' has initializer but incomplete type
     763 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/open.c:763:32: error: storage size of 'delegated_inode' isn't known
     763 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/open.c:763:32: warning: unused variable 'delegated_inode' [-Wunused-variable]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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
