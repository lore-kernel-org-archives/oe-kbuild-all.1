Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172881465AB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711557100; cv=none; b=cuJI1BKFld58DpRLpavLrb38ExuOOlmDQnBMQ8P3+Noak0TVW4Z6w6rMfstLIKfDRBSKlJQcf6LwWNow2K3y8l0lWwI1DVaBZZsiVneaY3OUrovwoCGSDjmWH/nRMqoZI2y7kiHiQDt08+phYVFGkFaLuDXV4wuXWekljvslsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711557100; c=relaxed/simple;
	bh=Dgr5BuJhx6RiGKMrFdgInhvo78rWkzAr9vTt4XTbPLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRhX0wBc+qOjEWYJeI/l4yaiD/3Jzi1GRZzsZgfwKeE0nh2QJDdN1JmXLzmMMUBDfV9otFzFqzBQDyQdMqaMOjjraQGNubXfuM3yjmeC0ZKspGil2CX9x0rA844sho5ZUd6WpPnuRj/ADmihZ5GVt2TAYFGRijTffG3zNdwXFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXum0Pjh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXum0Pjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711557095; x=1743093095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dgr5BuJhx6RiGKMrFdgInhvo78rWkzAr9vTt4XTbPLE=;
  b=XXum0Pjhq1zQcTqfW8WlaxziiKtz62zNps5A2+lhv59s1PUhqXX1yXls
   4AOGyixzRTOCJa3N340DyKas+Cn6tHfledQV4B5Vruo7/fbGKnNO9hUUk
   SNeostQZViX9RkaNRaqnQQfNbERS7cZ4d8nfRSS90XcH+6GcpT7svf8TJ
   143yKfrxSW00YL654+VNl2QXsleLnTCj4NbZjfPLTJ9/10HidS+5RFnFP
   sib5wUTtKuWQbWeN/Y3F/rDo1oJfS8pDRVmUjcBK4ul+cdDIJhw7pnVQD
   25vYykllSsU0bSqcXS3+qYXTgVVtkxacwYgEuAdtnzkBByQZJElqEUzhE
   A==;
X-CSE-ConnectionGUID: b+HHvzJ4TDORMQ7z1B5l8Q==
X-CSE-MsgGUID: q3IEwDV3TxqVFNAzy370pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17223034"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17223034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53823760"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Mar 2024 09:31:32 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpWBV-0001Fq-33;
	Wed, 27 Mar 2024 16:31:29 +0000
Date: Thu, 28 Mar 2024 00:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 184/450] fs/xfs/xfs_iops.c:1304:33:
 error: no member named 'mr_lock' in 'struct rw_semaphore'
Message-ID: <202403280022.1NF9fnqq-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240328/202403280022.1NF9fnqq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280022.1NF9fnqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280022.1NF9fnqq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_iops.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/xfs/xfs_iops.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:28:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/xfs/xfs_iops.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:28:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/xfs/xfs_iops.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:28:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/xfs/xfs_iops.c:1304:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:158:26: note: expanded from macro 'lockdep_set_class'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                 ^~~~
>> fs/xfs/xfs_iops.c:1304:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:159:11: note: expanded from macro 'lockdep_set_class'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                                ^~~~
>> fs/xfs/xfs_iops.c:1304:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:160:11: note: expanded from macro 'lockdep_set_class'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                                ^~~~
>> fs/xfs/xfs_iops.c:1304:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1304 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:161:11: note: expanded from macro 'lockdep_set_class'
     161 |                               (lock)->dep_map.lock_type)
         |                                ^~~~
   fs/xfs/xfs_iops.c:1307:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:158:26: note: expanded from macro 'lockdep_set_class'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                 ^~~~
   fs/xfs/xfs_iops.c:1307:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:159:11: note: expanded from macro 'lockdep_set_class'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                                ^~~~
   fs/xfs/xfs_iops.c:1307:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:160:11: note: expanded from macro 'lockdep_set_class'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                                ^~~~
   fs/xfs/xfs_iops.c:1307:33: error: no member named 'mr_lock' in 'struct rw_semaphore'
    1307 |                 lockdep_set_class(&ip->i_lock.mr_lock,
         |                                    ~~~~~~~~~~ ^
   include/linux/lockdep.h:161:11: note: expanded from macro 'lockdep_set_class'
     161 |                               (lock)->dep_map.lock_type)
         |                                ^~~~
   7 warnings and 8 errors generated.


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
