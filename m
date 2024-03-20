Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801029CE8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 20:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710966086; cv=none; b=d73Qh6Z78bmwZy6qIcWvDd7uovMwsiuUSOrSmwiEErjHdwI3AFNV3VXYGoaOghlXkIBHppeBKZQkYXLttldBAhtvBGao6wGKCakfJEieDiH1GeOqXE7PRFjX5kY6BRrHl5vsjl4wgHFTjtJpbPPlHeF9EV+J11q8rl2yjmGRh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710966086; c=relaxed/simple;
	bh=NiQDUAIBQKn7WdTgyWM27DEWTt6OA0HqlSC5nBWVfko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MKsVVdnljTp0s6+9QlRZ/NPw5NS3xdqNsotZCm4OqaXCzSWz03W6T4a3w43M5u1YVHLNpmU8xRptxGuwG7aAf39jKvcMkybejRxwjM7aUjL6kh/5WEGBfOvZrO2tcOIzIuQx/C7F8j1sojpmlEt5YDWzhN7+R0B6/4BMeQkLPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pb3zDB8Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pb3zDB8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710966085; x=1742502085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NiQDUAIBQKn7WdTgyWM27DEWTt6OA0HqlSC5nBWVfko=;
  b=Pb3zDB8QdCRVfnqwV5k5OhShL2I93v4axlu0VQsbWRXpzFoLfPFh/b6o
   Xb/RRTAGP29j6dJ4QmrXD5Tf8/4F4kPrcRFUaR/TGFVun17enYE+CMVHg
   mX9m0jq3uZjzu5Jx6UosqOuS0lWG8bZG4I6z95MgjEVDNSFZc1PH2Ed1P
   swgNrAK4ytD2MSZZJXMa+ah+0VBeH29L5A83MDfLMTyIsNbq+xXir5XFe
   n8yF5FLtdoBsji4j887Jjla5Yr5kIMSzjTuo2u4WUnrT5EPxJ9PcAkotZ
   uw8Ipj7NgU1OymvAncT+rg6BqQ6+DdZAGf6M5kGFLxJu1uN+4i/XjnGGd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23374882"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="23374882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 13:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14920715"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2024 13:21:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn2R6-000IuR-0V;
	Wed, 20 Mar 2024 20:21:20 +0000
Date: Thu, 21 Mar 2024 04:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:6.5-full-backport 2/167]
 fs/smb/client/file.c:1088:50: error: implicit declaration of function
 'inode_set_ctime_current'
Message-ID: <202403210428.WYYzGJ0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git 6.5-full-backport
head:   9aa9166e03ff319eedbf774305097ad3c499dd7d
commit: d867a30d3782ec84dab9abc3eeca3530a0c05912 [2/167] smb: convert to ctime accessor functions
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240321/202403210428.WYYzGJ0f-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210428.WYYzGJ0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210428.WYYzGJ0f-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/file.c: In function 'cifs_close':
>> fs/smb/client/file.c:1088:50: error: implicit declaration of function 'inode_set_ctime_current' [-Werror=implicit-function-declaration]
    1088 |                                 inode->i_mtime = inode_set_ctime_current(inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/smb/client/file.c:1088:50: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
   fs/smb/client/file.c: In function 'cifs_partialpagewrite':
   fs/smb/client/file.c:2599:51: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
    2599 |                 inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/smb/client/inode.c: In function 'cifs_fattr_to_inode':
>> fs/smb/client/inode.c:175:9: error: implicit declaration of function 'inode_set_ctime_to_ts' [-Werror=implicit-function-declaration]
     175 |         inode_set_ctime_to_ts(inode, fattr->cf_ctime);
         |         ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/inode.c: In function 'cifs_unlink':
>> fs/smb/client/inode.c:1747:17: error: implicit declaration of function 'inode_set_ctime_current' [-Werror=implicit-function-declaration]
    1747 |                 inode_set_ctime_current(inode);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/smb/client/inode.c:1749:24: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
    1749 |         dir->i_mtime = inode_set_ctime_current(dir);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/inode.c: In function 'cifs_rmdir':
   fs/smb/client/inode.c:2064:26: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
    2064 |         inode->i_mtime = inode_set_ctime_current(inode);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/inode.c: In function 'cifs_rename2':
   fs/smb/client/inode.c:2270:53: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
    2270 |         source_dir->i_mtime = target_dir->i_mtime = inode_set_ctime_to_ts(source_dir,
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/smb/client/smb2ops.c: In function 'smb2_close_getattr':
>> fs/smb/client/smb2ops.c:1399:17: error: implicit declaration of function 'inode_set_ctime_to_ts' [-Werror=implicit-function-declaration]
    1399 |                 inode_set_ctime_to_ts(inode,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/inode_set_ctime_current +1088 fs/smb/client/file.c

  1069	
  1070	int cifs_close(struct inode *inode, struct file *file)
  1071	{
  1072		struct cifsFileInfo *cfile;
  1073		struct cifsInodeInfo *cinode = CIFS_I(inode);
  1074		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
  1075		struct cifs_deferred_close *dclose;
  1076	
  1077		cifs_fscache_unuse_inode_cookie(inode, file->f_mode & FMODE_WRITE);
  1078	
  1079		if (file->private_data != NULL) {
  1080			cfile = file->private_data;
  1081			file->private_data = NULL;
  1082			dclose = kmalloc(sizeof(struct cifs_deferred_close), GFP_KERNEL);
  1083			if ((cifs_sb->ctx->closetimeo && cinode->oplock == CIFS_CACHE_RHW_FLG)
  1084			    && cinode->lease_granted &&
  1085			    !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &&
  1086			    dclose) {
  1087				if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, &cinode->flags)) {
> 1088					inode->i_mtime = inode_set_ctime_current(inode);
  1089				}
  1090				spin_lock(&cinode->deferred_lock);
  1091				cifs_add_deferred_close(cfile, dclose);
  1092				if (cfile->deferred_close_scheduled &&
  1093				    delayed_work_pending(&cfile->deferred)) {
  1094					/*
  1095					 * If there is no pending work, mod_delayed_work queues new work.
  1096					 * So, Increase the ref count to avoid use-after-free.
  1097					 */
  1098					if (!mod_delayed_work(deferredclose_wq,
  1099							&cfile->deferred, cifs_sb->ctx->closetimeo))
  1100						cifsFileInfo_get(cfile);
  1101				} else {
  1102					/* Deferred close for files */
  1103					queue_delayed_work(deferredclose_wq,
  1104							&cfile->deferred, cifs_sb->ctx->closetimeo);
  1105					cfile->deferred_close_scheduled = true;
  1106					spin_unlock(&cinode->deferred_lock);
  1107					return 0;
  1108				}
  1109				spin_unlock(&cinode->deferred_lock);
  1110				_cifsFileInfo_put(cfile, true, false);
  1111			} else {
  1112				_cifsFileInfo_put(cfile, true, false);
  1113				kfree(dclose);
  1114			}
  1115		}
  1116	
  1117		/* return code from the ->release op is always ignored */
  1118		return 0;
  1119	}
  1120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
