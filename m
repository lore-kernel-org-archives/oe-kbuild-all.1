Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B661327EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711573245; cv=none; b=XDRh2hjWqwoXaDCvhrBO/2tSjtCmNHa8oKOn0Y6kiUiuillYjSns5d/0REXD4sGNWdeMmr6Dewjd3kzeEzNPTrWVo8yDLYnhzzwOfQDmOMJKM7LqcUWZlRXisuk8bCmO2Yk9yZ6SIzZmhzO4SaIYp1mUfThFa69PXf2tS0ALgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711573245; c=relaxed/simple;
	bh=CzAJa9nglG6HyIrQAxRmSS4N9UMb1bwgoNQDWfTyDMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqLwMEF8oxC5+ZxtZxkj8YwICzrAI2SSxfhQZ8OH9c0uTNPX4XB8ITLizrJukgZz4K2x94eC68qyhaA/e+3a5xbA3fcFhKI401bhq0KtNWpy5VNx/IYFs6BS+bMBrTYD525L4fmfF0bZLc15CCB1MWq9xfspm5BI2CrYJGiPJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0myBRMV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0myBRMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711573243; x=1743109243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CzAJa9nglG6HyIrQAxRmSS4N9UMb1bwgoNQDWfTyDMk=;
  b=C0myBRMVXX6KQt65tmgrqtSmwtClSZZn69rMTesLxt2j7pTi/4mHnsJU
   6syA+5SOnFpsROsF4Th6z20i5teKnoYA+i5evayfMTtMKTkJt9tZArvYE
   EpuBSRZh0NSHXaoT1G5R3JCEJ/AmijKbeWtgiaC+UVUpcNpgeukK7BrEx
   c4RHOLxKe3dRBzC5ZufFRkY2j7zyx2MeHQq3UGeLIV1YDOMdsN3eD+w1U
   oG2lgc3bUyULSVbliLyYjIciHXfsx8q0Gi9F4a9vccHqClb4Jo1qb3HPt
   Ojp6GE2RmTp2iYw22Ac7tZAYTRjfrDd3KnPH7gu29djNoOoE5FYkRi6+E
   A==;
X-CSE-ConnectionGUID: 6fEgP3ATShaa3orwkhiifA==
X-CSE-MsgGUID: waIfF8V2TeyX8lL+l2qJ+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24196229"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="24196229"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 14:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="47630939"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2024 14:00:41 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpaNy-0001Ts-2m;
	Wed, 27 Mar 2024 21:00:38 +0000
Date: Thu, 28 Mar 2024 04:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 184/450] fs/xfs/xfs_iops.c:1304:46:
 error: 'struct rw_semaphore' has no member named 'mr_lock'
Message-ID: <202403280422.kSkIMVfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   78ba84a4335927bab8c205732c55e2f6dd18a56f
commit: 55d62e19a9497ff5464c22b037f488b5de7d53b8 [184/450] xfs: hide metadata inodes from everyone because they are special
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240328/202403280422.kSkIMVfw-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280422.kSkIMVfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280422.kSkIMVfw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/semaphore.h:12,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_iops.c:6:
   fs/xfs/xfs_iops.c: In function 'xfs_setup_metadata_inode_lock_class':
>> fs/xfs/xfs_iops.c:1304:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:158:33: note: in definition of macro 'lockdep_set_class'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                 ^~~~
>> fs/xfs/xfs_iops.c:1304:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:159:32: note: in definition of macro 'lockdep_set_class'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                                ^~~~
>> fs/xfs/xfs_iops.c:1304:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:160:32: note: in definition of macro 'lockdep_set_class'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                                ^~~~
>> fs/xfs/xfs_iops.c:1304:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:161:32: note: in definition of macro 'lockdep_set_class'
     161 |                               (lock)->dep_map.lock_type)
         |                                ^~~~
   fs/xfs/xfs_iops.c:1307:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:158:33: note: in definition of macro 'lockdep_set_class'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                 ^~~~
   fs/xfs/xfs_iops.c:1307:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:159:32: note: in definition of macro 'lockdep_set_class'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                                ^~~~
   fs/xfs/xfs_iops.c:1307:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:160:32: note: in definition of macro 'lockdep_set_class'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                                ^~~~
   fs/xfs/xfs_iops.c:1307:46: error: 'struct rw_semaphore' has no member named 'mr_lock'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                              ^
   include/linux/lockdep.h:161:32: note: in definition of macro 'lockdep_set_class'
     161 |                               (lock)->dep_map.lock_type)
         |                                ^~~~


vim +1304 fs/xfs/xfs_iops.c

  1280	
  1281	static void
  1282	xfs_setup_metadata_inode_lock_class(
  1283		struct xfs_inode	*ip)
  1284	{
  1285		struct inode		*inode = &ip->i_vnode;
  1286		/*
  1287		 * Metadata directories and files are not exposed to userspace, which
  1288		 * means that they never access any of the VFS IO locks and never
  1289		 * experience page faults.  Give them separate locking classes so that
  1290		 * lockdep will not complain about conflicts that cannot happen.
  1291		 */
  1292		static struct lock_class_key xfs_metadata_file_ilock_class;
  1293		static struct lock_class_key xfs_metadata_dir_ilock_class;
  1294	
  1295		if (S_ISDIR(inode->i_mode)) {
  1296			/*
  1297			 * We set the i_rwsem class here to avoid potential races with
  1298			 * lockdep_annotate_inode_mutex_key() reinitialising the lock
  1299			 * after a filehandle lookup has already found the inode in
  1300			 * cache before it has been unlocked via unlock_new_inode().
  1301			 */
  1302			lockdep_set_class(&inode->i_rwsem,
  1303					  &inode->i_sb->s_type->i_mutex_dir_key);
> 1304			lockdep_set_class(&ip->i_lock.mr_lock,
  1305					  &xfs_metadata_dir_ilock_class);
  1306		} else {
  1307			lockdep_set_class(&ip->i_lock.mr_lock,
  1308					  &xfs_metadata_file_ilock_class);
  1309		}
  1310	}
  1311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
