Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9BA4400
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712192791; cv=none; b=F8LqXT4/8OcgJFJnGOM4LFQlkOjZ+e1Ql4dPEE0z5dcfnPLb2BscN0Me6yYnaui4iSa2Mh9+5m+a3ow+fmMfNGF+NJSUJawP0UNjxXXiuIVA9o2KU017GrnBYp4kGu7oqNy8K6q1Qm3etS1UZ36vpOe2Ot8S+Zt/8oRX78zt1Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712192791; c=relaxed/simple;
	bh=Pa9SQPGUIXl8qWDHbm9FExGnpMQ3Mdgatn4DAkQWWRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUI2gGMSIC/ZuvBeUq2+9qpMWypVPbL/SXRoj+9G07QFJRkHZl7LX17PQfSD7c38gwyEyW60DXrHK+g2aZ3dGubvBWCFBK4BPlFWDRyKbzDt3bBhrpp+CyTYcj0rpP/6ADwZ4haBN1mgSHSVsFarotnZ0YeI9b+ePZrgHy9TtSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fy8HaebP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fy8HaebP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712192783; x=1743728783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pa9SQPGUIXl8qWDHbm9FExGnpMQ3Mdgatn4DAkQWWRw=;
  b=fy8HaebPMCTrdr5BqDzTzs3qUItaNCWs3DVyeDFgtVaUejDTjKPt93VK
   Twdt31TWHflh9Rb5lJza8ToRk2Wr9pc62D1k9Aue+iRc6wHr0CPV1exOZ
   dDpFgncvc0fEhDJpNTxMlP5Q/AQqcpucnCD4y3PYC8Mxg6ilUOtZe00zk
   YGVUGiDVAOh/1vDvK9aYRTAApGFTvTrkteWUg/CWWdhKrA5TdKu+39eTO
   FoYxdyAgMWJRocJiMoNn+6Eyp5Y3UPNaAwN4K/IbbwbsJc55i9i1wXkH6
   k6U6r0JMiiPjb7ZwTpqJJbQZKVfZZ9oJ8vrohAT1X186ab20tLKFfN51J
   g==;
X-CSE-ConnectionGUID: UxMJb5BqSYixWK+5Ar0Frw==
X-CSE-MsgGUID: H0ts+eFFTm+KXLylODpxvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11231699"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="11231699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:06:21 -0700
X-CSE-ConnectionGUID: wVIVKTmrSzqnKVbUXbpvmw==
X-CSE-MsgGUID: 5/zGGGpFS0mf7dJod7dHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56071613"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 18:06:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsBYX-0000QE-0w;
	Thu, 04 Apr 2024 01:06:17 +0000
Date: Thu, 4 Apr 2024 09:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2524/3504] fs/nfs/nfs4idmap.c:576:13: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202404040829.zp09tB2p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2524/3504] riscv: Emulate one-byte and two-byte cmpxchg
config: riscv-randconfig-r112-20240403 (https://download.01.org/0day-ci/archive/20240404/202404040829.zp09tB2p-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404040829.zp09tB2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040829.zp09tB2p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/nfs4idmap.c:576:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct idmap_legacy_upcalldata *__old @@
   fs/nfs/nfs4idmap.c:576:13: sparse:     expected unsigned long [usertype] old
   fs/nfs/nfs4idmap.c:576:13: sparse:     got struct idmap_legacy_upcalldata *__old
>> fs/nfs/nfs4idmap.c:576:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct idmap_legacy_upcalldata *__new @@
   fs/nfs/nfs4idmap.c:576:13: sparse:     expected unsigned long [usertype] new
   fs/nfs/nfs4idmap.c:576:13: sparse:     got struct idmap_legacy_upcalldata *__new
>> fs/nfs/nfs4idmap.c:576:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct idmap_legacy_upcalldata *__ret @@     got unsigned long @@
   fs/nfs/nfs4idmap.c:576:13: sparse:     expected struct idmap_legacy_upcalldata *__ret
   fs/nfs/nfs4idmap.c:576:13: sparse:     got unsigned long
>> fs/nfs/nfs4idmap.c:576:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct idmap_legacy_upcalldata *__old @@
   fs/nfs/nfs4idmap.c:576:13: sparse:     expected unsigned long [usertype] old
   fs/nfs/nfs4idmap.c:576:13: sparse:     got struct idmap_legacy_upcalldata *__old
>> fs/nfs/nfs4idmap.c:576:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct idmap_legacy_upcalldata *__new @@
   fs/nfs/nfs4idmap.c:576:13: sparse:     expected unsigned long [usertype] new
   fs/nfs/nfs4idmap.c:576:13: sparse:     got struct idmap_legacy_upcalldata *__new
>> fs/nfs/nfs4idmap.c:576:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct idmap_legacy_upcalldata *__ret @@     got unsigned long @@
   fs/nfs/nfs4idmap.c:576:13: sparse:     expected struct idmap_legacy_upcalldata *__ret
   fs/nfs/nfs4idmap.c:576:13: sparse:     got unsigned long
--
>> fs/overlayfs/readdir.c:898:31: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct file *__old @@
   fs/overlayfs/readdir.c:898:31: sparse:     expected unsigned long [usertype] old
   fs/overlayfs/readdir.c:898:31: sparse:     got struct file *__old
>> fs/overlayfs/readdir.c:898:31: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct file *__new @@
   fs/overlayfs/readdir.c:898:31: sparse:     expected unsigned long [usertype] new
   fs/overlayfs/readdir.c:898:31: sparse:     got struct file *__new
>> fs/overlayfs/readdir.c:898:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct file *__ret @@     got unsigned long @@
   fs/overlayfs/readdir.c:898:31: sparse:     expected struct file *__ret
   fs/overlayfs/readdir.c:898:31: sparse:     got unsigned long
>> fs/overlayfs/readdir.c:898:31: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct file *__old @@
   fs/overlayfs/readdir.c:898:31: sparse:     expected unsigned long [usertype] old
   fs/overlayfs/readdir.c:898:31: sparse:     got struct file *__old
>> fs/overlayfs/readdir.c:898:31: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct file *__new @@
   fs/overlayfs/readdir.c:898:31: sparse:     expected unsigned long [usertype] new
   fs/overlayfs/readdir.c:898:31: sparse:     got struct file *__new
>> fs/overlayfs/readdir.c:898:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct file *__ret @@     got unsigned long @@
   fs/overlayfs/readdir.c:898:31: sparse:     expected struct file *__ret
   fs/overlayfs/readdir.c:898:31: sparse:     got unsigned long
--
>> fs/debugfs/file.c:110:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got void *__old @@
   fs/debugfs/file.c:110:21: sparse:     expected unsigned long [usertype] old
   fs/debugfs/file.c:110:21: sparse:     got void *__old
>> fs/debugfs/file.c:110:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got void *__new @@
   fs/debugfs/file.c:110:21: sparse:     expected unsigned long [usertype] new
   fs/debugfs/file.c:110:21: sparse:     got void *__new
>> fs/debugfs/file.c:110:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected void *__ret @@     got unsigned long @@
   fs/debugfs/file.c:110:21: sparse:     expected void *__ret
   fs/debugfs/file.c:110:21: sparse:     got unsigned long
>> fs/debugfs/file.c:110:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got void *__old @@
   fs/debugfs/file.c:110:21: sparse:     expected unsigned long [usertype] old
   fs/debugfs/file.c:110:21: sparse:     got void *__old
>> fs/debugfs/file.c:110:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got void *__new @@
   fs/debugfs/file.c:110:21: sparse:     expected unsigned long [usertype] new
   fs/debugfs/file.c:110:21: sparse:     got void *__new
>> fs/debugfs/file.c:110:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected void *__ret @@     got unsigned long @@
   fs/debugfs/file.c:110:21: sparse:     expected void *__ret
   fs/debugfs/file.c:110:21: sparse:     got unsigned long
--
>> fs/btrfs/raid56.c:152:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct btrfs_stripe_hash_table *__old @@
   fs/btrfs/raid56.c:152:13: sparse:     expected unsigned long [usertype] old
   fs/btrfs/raid56.c:152:13: sparse:     got struct btrfs_stripe_hash_table *__old
>> fs/btrfs/raid56.c:152:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct btrfs_stripe_hash_table *__new @@
   fs/btrfs/raid56.c:152:13: sparse:     expected unsigned long [usertype] new
   fs/btrfs/raid56.c:152:13: sparse:     got struct btrfs_stripe_hash_table *__new
>> fs/btrfs/raid56.c:152:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct btrfs_stripe_hash_table *__ret @@     got unsigned long @@
   fs/btrfs/raid56.c:152:13: sparse:     expected struct btrfs_stripe_hash_table *__ret
   fs/btrfs/raid56.c:152:13: sparse:     got unsigned long
>> fs/btrfs/raid56.c:152:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct btrfs_stripe_hash_table *__old @@
   fs/btrfs/raid56.c:152:13: sparse:     expected unsigned long [usertype] old
   fs/btrfs/raid56.c:152:13: sparse:     got struct btrfs_stripe_hash_table *__old
>> fs/btrfs/raid56.c:152:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct btrfs_stripe_hash_table *__new @@
   fs/btrfs/raid56.c:152:13: sparse:     expected unsigned long [usertype] new
   fs/btrfs/raid56.c:152:13: sparse:     got struct btrfs_stripe_hash_table *__new
>> fs/btrfs/raid56.c:152:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct btrfs_stripe_hash_table *__ret @@     got unsigned long @@
   fs/btrfs/raid56.c:152:13: sparse:     expected struct btrfs_stripe_hash_table *__ret
   fs/btrfs/raid56.c:152:13: sparse:     got unsigned long
--
>> fs/nfs/filelayout/filelayout.c:581:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct nfs4_file_layout_dsaddr *__old @@
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     expected unsigned long [usertype] old
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     got struct nfs4_file_layout_dsaddr *__old
>> fs/nfs/filelayout/filelayout.c:581:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct nfs4_file_layout_dsaddr *__new @@
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     expected unsigned long [usertype] new
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     got struct nfs4_file_layout_dsaddr *__new
>> fs/nfs/filelayout/filelayout.c:581:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nfs4_file_layout_dsaddr *__ret @@     got unsigned long @@
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     expected struct nfs4_file_layout_dsaddr *__ret
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     got unsigned long
>> fs/nfs/filelayout/filelayout.c:581:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct nfs4_file_layout_dsaddr *__old @@
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     expected unsigned long [usertype] old
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     got struct nfs4_file_layout_dsaddr *__old
>> fs/nfs/filelayout/filelayout.c:581:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct nfs4_file_layout_dsaddr *__new @@
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     expected unsigned long [usertype] new
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     got struct nfs4_file_layout_dsaddr *__new
>> fs/nfs/filelayout/filelayout.c:581:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nfs4_file_layout_dsaddr *__ret @@     got unsigned long @@
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     expected struct nfs4_file_layout_dsaddr *__ret
   fs/nfs/filelayout/filelayout.c:581:13: sparse:     got unsigned long
--
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct nfs4_ff_layout_ds *__old @@
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     expected unsigned long [usertype] old
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     got struct nfs4_ff_layout_ds *__old
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct nfs4_ff_layout_ds *__new @@
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     expected unsigned long [usertype] new
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     got struct nfs4_ff_layout_ds *__new
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nfs4_ff_layout_ds *__ret @@     got unsigned long @@
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     expected struct nfs4_ff_layout_ds *__ret
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     got unsigned long
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct nfs4_ff_layout_ds *__old @@
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     expected unsigned long [usertype] old
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     got struct nfs4_ff_layout_ds *__old
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct nfs4_ff_layout_ds *__new @@
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     expected unsigned long [usertype] new
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     got struct nfs4_ff_layout_ds *__new
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nfs4_ff_layout_ds *__ret @@     got unsigned long @@
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     expected struct nfs4_ff_layout_ds *__ret
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:338:21: sparse:     got unsigned long
--
>> block/blk-mq.c:3242:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct request *__old @@
   block/blk-mq.c:3242:33: sparse:     expected unsigned long [usertype] old
   block/blk-mq.c:3242:33: sparse:     got struct request *__old
>> block/blk-mq.c:3242:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct request *__new @@
   block/blk-mq.c:3242:33: sparse:     expected unsigned long [usertype] new
   block/blk-mq.c:3242:33: sparse:     got struct request *__new
>> block/blk-mq.c:3242:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct request *__ret @@     got unsigned long @@
   block/blk-mq.c:3242:33: sparse:     expected struct request *__ret
   block/blk-mq.c:3242:33: sparse:     got unsigned long
>> block/blk-mq.c:3242:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct request *__old @@
   block/blk-mq.c:3242:33: sparse:     expected unsigned long [usertype] old
   block/blk-mq.c:3242:33: sparse:     got struct request *__old
>> block/blk-mq.c:3242:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct request *__new @@
   block/blk-mq.c:3242:33: sparse:     expected unsigned long [usertype] new
   block/blk-mq.c:3242:33: sparse:     got struct request *__new
>> block/blk-mq.c:3242:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct request *__ret @@     got unsigned long @@
   block/blk-mq.c:3242:33: sparse:     expected struct request *__ret
   block/blk-mq.c:3242:33: sparse:     got unsigned long
   block/blk-mq.c:3607:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct request *__old @@
   block/blk-mq.c:3607:17: sparse:     expected unsigned long [usertype] old
   block/blk-mq.c:3607:17: sparse:     got struct request *__old
   block/blk-mq.c:3607:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct request *__new @@
   block/blk-mq.c:3607:17: sparse:     expected unsigned long [usertype] new
   block/blk-mq.c:3607:17: sparse:     got struct request *__new
   block/blk-mq.c:3607:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct request *__ret @@     got unsigned long @@
   block/blk-mq.c:3607:17: sparse:     expected struct request *__ret
   block/blk-mq.c:3607:17: sparse:     got unsigned long
   block/blk-mq.c:3607:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct request *__old @@
   block/blk-mq.c:3607:17: sparse:     expected unsigned long [usertype] old
   block/blk-mq.c:3607:17: sparse:     got struct request *__old
   block/blk-mq.c:3607:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct request *__new @@
   block/blk-mq.c:3607:17: sparse:     expected unsigned long [usertype] new
   block/blk-mq.c:3607:17: sparse:     got struct request *__new
   block/blk-mq.c:3607:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct request *__ret @@     got unsigned long @@
   block/blk-mq.c:3607:17: sparse:     expected struct request *__ret
   block/blk-mq.c:3607:17: sparse:     got unsigned long
--
   fs/posix_acl.c:53:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/posix_acl.c:53:23: sparse:    struct posix_acl [noderef] __rcu *
   fs/posix_acl.c:53:23: sparse:    struct posix_acl *
   fs/posix_acl.c:67:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/posix_acl.c:67:33: sparse:    struct posix_acl [noderef] __rcu *
   fs/posix_acl.c:67:33: sparse:    struct posix_acl *
>> fs/posix_acl.c:146:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct posix_acl *__old @@
   fs/posix_acl.c:146:9: sparse:     expected unsigned long [usertype] old
   fs/posix_acl.c:146:9: sparse:     got struct posix_acl *__old
>> fs/posix_acl.c:146:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct posix_acl *__new @@
   fs/posix_acl.c:146:9: sparse:     expected unsigned long [usertype] new
   fs/posix_acl.c:146:9: sparse:     got struct posix_acl *__new
>> fs/posix_acl.c:146:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct posix_acl *__ret @@     got unsigned long @@
   fs/posix_acl.c:146:9: sparse:     expected struct posix_acl *__ret
   fs/posix_acl.c:146:9: sparse:     got unsigned long
>> fs/posix_acl.c:146:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct posix_acl *__old @@
   fs/posix_acl.c:146:9: sparse:     expected unsigned long [usertype] old
   fs/posix_acl.c:146:9: sparse:     got struct posix_acl *__old
>> fs/posix_acl.c:146:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct posix_acl *__new @@
   fs/posix_acl.c:146:9: sparse:     expected unsigned long [usertype] new
   fs/posix_acl.c:146:9: sparse:     got struct posix_acl *__new
>> fs/posix_acl.c:146:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct posix_acl *__ret @@     got unsigned long @@
   fs/posix_acl.c:146:9: sparse:     expected struct posix_acl *__ret
   fs/posix_acl.c:146:9: sparse:     got unsigned long
   fs/posix_acl.c:169:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct posix_acl *__old @@
   fs/posix_acl.c:169:17: sparse:     expected unsigned long [usertype] old
   fs/posix_acl.c:169:17: sparse:     got struct posix_acl *__old
   fs/posix_acl.c:169:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct posix_acl *__new @@
   fs/posix_acl.c:169:17: sparse:     expected unsigned long [usertype] new
   fs/posix_acl.c:169:17: sparse:     got struct posix_acl *__new
   fs/posix_acl.c:169:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct posix_acl *__ret @@     got unsigned long @@
   fs/posix_acl.c:169:17: sparse:     expected struct posix_acl *__ret
   fs/posix_acl.c:169:17: sparse:     got unsigned long
   fs/posix_acl.c:169:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct posix_acl *__old @@
   fs/posix_acl.c:169:17: sparse:     expected unsigned long [usertype] old
   fs/posix_acl.c:169:17: sparse:     got struct posix_acl *__old
   fs/posix_acl.c:169:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct posix_acl *__new @@
   fs/posix_acl.c:169:17: sparse:     expected unsigned long [usertype] new
   fs/posix_acl.c:169:17: sparse:     got struct posix_acl *__new
   fs/posix_acl.c:169:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct posix_acl *__ret @@     got unsigned long @@
   fs/posix_acl.c:169:17: sparse:     expected struct posix_acl *__ret
   fs/posix_acl.c:169:17: sparse:     got unsigned long
   fs/posix_acl.c:177:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct posix_acl *__old @@
   fs/posix_acl.c:177:13: sparse:     expected unsigned long [usertype] old
   fs/posix_acl.c:177:13: sparse:     got struct posix_acl *__old
   fs/posix_acl.c:177:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct posix_acl *__new @@
   fs/posix_acl.c:177:13: sparse:     expected unsigned long [usertype] new
   fs/posix_acl.c:177:13: sparse:     got struct posix_acl *__new
   fs/posix_acl.c:177:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct posix_acl *__ret @@     got unsigned long @@
   fs/posix_acl.c:177:13: sparse:     expected struct posix_acl *__ret
   fs/posix_acl.c:177:13: sparse:     got unsigned long
   fs/posix_acl.c:177:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct posix_acl *__old @@
   fs/posix_acl.c:177:13: sparse:     expected unsigned long [usertype] old
   fs/posix_acl.c:177:13: sparse:     got struct posix_acl *__old
   fs/posix_acl.c:177:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct posix_acl *__new @@
   fs/posix_acl.c:177:13: sparse:     expected unsigned long [usertype] new
   fs/posix_acl.c:177:13: sparse:     got struct posix_acl *__new
   fs/posix_acl.c:177:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct posix_acl *__ret @@     got unsigned long @@
   fs/posix_acl.c:177:13: sparse:     expected struct posix_acl *__ret
   fs/posix_acl.c:177:13: sparse:     got unsigned long
--
>> fs/locks.c:199:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct file_lock_context *__old @@
   fs/locks.c:199:13: sparse:     expected unsigned long [usertype] old
   fs/locks.c:199:13: sparse:     got struct file_lock_context *__old
>> fs/locks.c:199:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct file_lock_context *__new @@
   fs/locks.c:199:13: sparse:     expected unsigned long [usertype] new
   fs/locks.c:199:13: sparse:     got struct file_lock_context *__new
>> fs/locks.c:199:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct file_lock_context *__ret @@     got unsigned long @@
   fs/locks.c:199:13: sparse:     expected struct file_lock_context *__ret
   fs/locks.c:199:13: sparse:     got unsigned long
>> fs/locks.c:199:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct file_lock_context *__old @@
   fs/locks.c:199:13: sparse:     expected unsigned long [usertype] old
   fs/locks.c:199:13: sparse:     got struct file_lock_context *__old
>> fs/locks.c:199:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct file_lock_context *__new @@
   fs/locks.c:199:13: sparse:     expected unsigned long [usertype] new
   fs/locks.c:199:13: sparse:     got struct file_lock_context *__new
>> fs/locks.c:199:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct file_lock_context *__ret @@     got unsigned long @@
   fs/locks.c:199:13: sparse:     expected struct file_lock_context *__ret
   fs/locks.c:199:13: sparse:     got unsigned long
--
>> fs/super.c:2222:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct workqueue_struct *__old @@
   fs/super.c:2222:15: sparse:     expected unsigned long [usertype] old
   fs/super.c:2222:15: sparse:     got struct workqueue_struct *__old
>> fs/super.c:2222:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct workqueue_struct *__new @@
   fs/super.c:2222:15: sparse:     expected unsigned long [usertype] new
   fs/super.c:2222:15: sparse:     got struct workqueue_struct *__new
>> fs/super.c:2222:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct workqueue_struct *__ret @@     got unsigned long @@
   fs/super.c:2222:15: sparse:     expected struct workqueue_struct *__ret
   fs/super.c:2222:15: sparse:     got unsigned long
>> fs/super.c:2222:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct workqueue_struct *__old @@
   fs/super.c:2222:15: sparse:     expected unsigned long [usertype] old
   fs/super.c:2222:15: sparse:     got struct workqueue_struct *__old
>> fs/super.c:2222:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct workqueue_struct *__new @@
   fs/super.c:2222:15: sparse:     expected unsigned long [usertype] new
   fs/super.c:2222:15: sparse:     got struct workqueue_struct *__new
>> fs/super.c:2222:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct workqueue_struct *__ret @@     got unsigned long @@
   fs/super.c:2222:15: sparse:     expected struct workqueue_struct *__ret
   fs/super.c:2222:15: sparse:     got unsigned long
   fs/super.c:523:13: sparse: sparse: context imbalance in 'grab_super' - unexpected unlock
   fs/super.c:729:20: sparse: sparse: context imbalance in 'sget_fc' - different lock contexts for basic block
   fs/super.c:803:20: sparse: sparse: context imbalance in 'sget' - different lock contexts for basic block
   fs/super.c:1361:27: sparse: sparse: context imbalance in 'bdev_super_lock' - wrong count at exit
   fs/super.c:1397:13: sparse: sparse: context imbalance in 'fs_bdev_mark_dead' - unexpected unlock
   fs/super.c:1415:13: sparse: sparse: context imbalance in 'fs_bdev_sync' - unexpected unlock
   fs/super.c:1427:27: sparse: sparse: context imbalance in 'get_bdev_super' - unexpected unlock
--
>> fs/libfs.c:2054:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dentry *__old @@
   fs/libfs.c:2054:23: sparse:     expected unsigned long [usertype] old
   fs/libfs.c:2054:23: sparse:     got struct dentry *__old
>> fs/libfs.c:2054:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dentry *__new @@
   fs/libfs.c:2054:23: sparse:     expected unsigned long [usertype] new
   fs/libfs.c:2054:23: sparse:     got struct dentry *__new
>> fs/libfs.c:2054:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dentry *__ret @@     got unsigned long @@
   fs/libfs.c:2054:23: sparse:     expected struct dentry *__ret
   fs/libfs.c:2054:23: sparse:     got unsigned long
>> fs/libfs.c:2054:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dentry *__old @@
   fs/libfs.c:2054:23: sparse:     expected unsigned long [usertype] old
   fs/libfs.c:2054:23: sparse:     got struct dentry *__old
>> fs/libfs.c:2054:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dentry *__new @@
   fs/libfs.c:2054:23: sparse:     expected unsigned long [usertype] new
   fs/libfs.c:2054:23: sparse:     got struct dentry *__new
>> fs/libfs.c:2054:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dentry *__ret @@     got unsigned long @@
   fs/libfs.c:2054:23: sparse:     expected struct dentry *__ret
   fs/libfs.c:2054:23: sparse:     got unsigned long
   fs/libfs.c:2063:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dentry *__old @@
   fs/libfs.c:2063:21: sparse:     expected unsigned long [usertype] old
   fs/libfs.c:2063:21: sparse:     got struct dentry *__old
   fs/libfs.c:2063:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dentry *__new @@
   fs/libfs.c:2063:21: sparse:     expected unsigned long [usertype] new
   fs/libfs.c:2063:21: sparse:     got struct dentry *__new
   fs/libfs.c:2063:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dentry *__ret @@     got unsigned long @@
   fs/libfs.c:2063:21: sparse:     expected struct dentry *__ret
   fs/libfs.c:2063:21: sparse:     got unsigned long
   fs/libfs.c:2063:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dentry *__old @@
   fs/libfs.c:2063:21: sparse:     expected unsigned long [usertype] old
   fs/libfs.c:2063:21: sparse:     got struct dentry *__old
   fs/libfs.c:2063:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dentry *__new @@
   fs/libfs.c:2063:21: sparse:     expected unsigned long [usertype] new
   fs/libfs.c:2063:21: sparse:     got struct dentry *__new
   fs/libfs.c:2063:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dentry *__ret @@     got unsigned long @@
   fs/libfs.c:2063:21: sparse:     expected struct dentry *__ret
   fs/libfs.c:2063:21: sparse:     got unsigned long
   fs/libfs.c:2131:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dentry *__old @@
   fs/libfs.c:2131:9: sparse:     expected unsigned long [usertype] old
   fs/libfs.c:2131:9: sparse:     got struct dentry *__old
   fs/libfs.c:2131:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dentry *__new @@
   fs/libfs.c:2131:9: sparse:     expected unsigned long [usertype] new
   fs/libfs.c:2131:9: sparse:     got struct dentry *__new
   fs/libfs.c:2131:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dentry *__ret @@     got unsigned long @@
   fs/libfs.c:2131:9: sparse:     expected struct dentry *__ret
   fs/libfs.c:2131:9: sparse:     got unsigned long
   fs/libfs.c:2131:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dentry *__old @@
   fs/libfs.c:2131:9: sparse:     expected unsigned long [usertype] old
   fs/libfs.c:2131:9: sparse:     got struct dentry *__old
   fs/libfs.c:2131:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dentry *__new @@
   fs/libfs.c:2131:9: sparse:     expected unsigned long [usertype] new
   fs/libfs.c:2131:9: sparse:     got struct dentry *__new
   fs/libfs.c:2131:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dentry *__ret @@     got unsigned long @@
   fs/libfs.c:2131:9: sparse:     expected struct dentry *__ret
   fs/libfs.c:2131:9: sparse:     got unsigned long
   fs/libfs.c:2046:22: sparse: sparse: context imbalance in 'stash_dentry' - wrong count at exit
   fs/libfs.c:2085:5: sparse: sparse: context imbalance in 'path_from_stashed' - wrong count at exit
--
   fs/eventpoll.c:619:9: sparse: sparse: restricted __poll_t degrades to integer
   fs/eventpoll.c:619:9: sparse: sparse: cast to restricted __poll_t
   fs/eventpoll.c:1349:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int pollflags @@     got restricted __poll_t @@
   fs/eventpoll.c:1349:53: sparse:     expected unsigned int pollflags
   fs/eventpoll.c:1349:53: sparse:     got restricted __poll_t
>> fs/eventpoll.c:1245:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct epitem *__old @@
   fs/eventpoll.c:1245:13: sparse:     expected unsigned long [usertype] old
   fs/eventpoll.c:1245:13: sparse:     got struct epitem *__old
>> fs/eventpoll.c:1245:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct epitem *__new @@
   fs/eventpoll.c:1245:13: sparse:     expected unsigned long [usertype] new
   fs/eventpoll.c:1245:13: sparse:     got struct epitem *__new
>> fs/eventpoll.c:1245:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct epitem *__ret @@     got unsigned long @@
   fs/eventpoll.c:1245:13: sparse:     expected struct epitem *__ret
   fs/eventpoll.c:1245:13: sparse:     got unsigned long
>> fs/eventpoll.c:1245:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct epitem *__old @@
   fs/eventpoll.c:1245:13: sparse:     expected unsigned long [usertype] old
   fs/eventpoll.c:1245:13: sparse:     got struct epitem *__old
>> fs/eventpoll.c:1245:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct epitem *__new @@
   fs/eventpoll.c:1245:13: sparse:     expected unsigned long [usertype] new
   fs/eventpoll.c:1245:13: sparse:     got struct epitem *__new
>> fs/eventpoll.c:1245:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct epitem *__ret @@     got unsigned long @@
   fs/eventpoll.c:1245:13: sparse:     expected struct epitem *__ret
   fs/eventpoll.c:1245:13: sparse:     got unsigned long
>> fs/eventpoll.c:1206:14: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct list_head *__old @@
   fs/eventpoll.c:1206:14: sparse:     expected unsigned long [usertype] old
   fs/eventpoll.c:1206:14: sparse:     got struct list_head *__old
>> fs/eventpoll.c:1206:14: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct list_head *__new @@
   fs/eventpoll.c:1206:14: sparse:     expected unsigned long [usertype] new
   fs/eventpoll.c:1206:14: sparse:     got struct list_head *__new
>> fs/eventpoll.c:1206:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct list_head *__ret @@     got unsigned long @@
   fs/eventpoll.c:1206:14: sparse:     expected struct list_head *__ret
   fs/eventpoll.c:1206:14: sparse:     got unsigned long
>> fs/eventpoll.c:1206:14: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct list_head *__old @@
   fs/eventpoll.c:1206:14: sparse:     expected unsigned long [usertype] old
   fs/eventpoll.c:1206:14: sparse:     got struct list_head *__old
>> fs/eventpoll.c:1206:14: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct list_head *__new @@
   fs/eventpoll.c:1206:14: sparse:     expected unsigned long [usertype] new
   fs/eventpoll.c:1206:14: sparse:     got struct list_head *__new
>> fs/eventpoll.c:1206:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct list_head *__ret @@     got unsigned long @@
   fs/eventpoll.c:1206:14: sparse:     expected struct list_head *__ret
   fs/eventpoll.c:1206:14: sparse:     got unsigned long
--
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:345:48: sparse: sparse: array of flexible structures
   include/linux/io_uring_types.h:183:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:2204:23: sparse: sparse: cast to restricted io_req_flags_t
   io_uring/io_uring.c:652:36: sparse: sparse: context imbalance in 'io_fill_cqe_req_aux' - unexpected unlock
>> io_uring/io_uring.c:1333:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   io_uring/io_uring.c:1333:19: sparse:     expected unsigned long [usertype] old
   io_uring/io_uring.c:1333:19: sparse:     got struct llist_node *__old
>> io_uring/io_uring.c:1333:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   io_uring/io_uring.c:1333:19: sparse:     expected unsigned long [usertype] new
   io_uring/io_uring.c:1333:19: sparse:     got struct llist_node *__new
>> io_uring/io_uring.c:1333:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   io_uring/io_uring.c:1333:19: sparse:     expected struct llist_node *__ret
   io_uring/io_uring.c:1333:19: sparse:     got unsigned long
>> io_uring/io_uring.c:1333:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   io_uring/io_uring.c:1333:19: sparse:     expected unsigned long [usertype] old
   io_uring/io_uring.c:1333:19: sparse:     got struct llist_node *__old
>> io_uring/io_uring.c:1333:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   io_uring/io_uring.c:1333:19: sparse:     expected unsigned long [usertype] new
   io_uring/io_uring.c:1333:19: sparse:     got struct llist_node *__new
>> io_uring/io_uring.c:1333:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   io_uring/io_uring.c:1333:19: sparse:     expected struct llist_node *__ret
   io_uring/io_uring.c:1333:19: sparse:     got unsigned long
   io_uring/io_uring.c:654:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
--
>> kernel/task_work.c:55:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct callback_head *__old @@
   kernel/task_work.c:55:19: sparse:     expected unsigned long [usertype] old
   kernel/task_work.c:55:19: sparse:     got struct callback_head *__old
>> kernel/task_work.c:55:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct callback_head *__new @@
   kernel/task_work.c:55:19: sparse:     expected unsigned long [usertype] new
   kernel/task_work.c:55:19: sparse:     got struct callback_head *__new
>> kernel/task_work.c:55:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct callback_head *__ret @@     got unsigned long @@
   kernel/task_work.c:55:19: sparse:     expected struct callback_head *__ret
   kernel/task_work.c:55:19: sparse:     got unsigned long
>> kernel/task_work.c:55:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct callback_head *__old @@
   kernel/task_work.c:55:19: sparse:     expected unsigned long [usertype] old
   kernel/task_work.c:55:19: sparse:     got struct callback_head *__old
>> kernel/task_work.c:55:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct callback_head *__new @@
   kernel/task_work.c:55:19: sparse:     expected unsigned long [usertype] new
   kernel/task_work.c:55:19: sparse:     got struct callback_head *__new
>> kernel/task_work.c:55:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct callback_head *__ret @@     got unsigned long @@
   kernel/task_work.c:55:19: sparse:     expected struct callback_head *__ret
   kernel/task_work.c:55:19: sparse:     got unsigned long
   kernel/task_work.c:109:28: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct callback_head *__old @@
   kernel/task_work.c:109:28: sparse:     expected unsigned long [usertype] old
   kernel/task_work.c:109:28: sparse:     got struct callback_head *__old
   kernel/task_work.c:109:28: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct callback_head *__new @@
   kernel/task_work.c:109:28: sparse:     expected unsigned long [usertype] new
   kernel/task_work.c:109:28: sparse:     got struct callback_head *__new
   kernel/task_work.c:109:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct callback_head *__ret @@     got unsigned long @@
   kernel/task_work.c:109:28: sparse:     expected struct callback_head *__ret
   kernel/task_work.c:109:28: sparse:     got unsigned long
   kernel/task_work.c:109:28: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct callback_head *__old @@
   kernel/task_work.c:109:28: sparse:     expected unsigned long [usertype] old
   kernel/task_work.c:109:28: sparse:     got struct callback_head *__old
   kernel/task_work.c:109:28: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct callback_head *__new @@
   kernel/task_work.c:109:28: sparse:     expected unsigned long [usertype] new
   kernel/task_work.c:109:28: sparse:     got struct callback_head *__new
   kernel/task_work.c:109:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct callback_head *__ret @@     got unsigned long @@
   kernel/task_work.c:109:28: sparse:     expected struct callback_head *__ret
   kernel/task_work.c:109:28: sparse:     got unsigned long
   kernel/task_work.c:166:27: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct callback_head *__old @@
   kernel/task_work.c:166:27: sparse:     expected unsigned long [usertype] old
   kernel/task_work.c:166:27: sparse:     got struct callback_head *__old
   kernel/task_work.c:166:27: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct callback_head *__new @@
   kernel/task_work.c:166:27: sparse:     expected unsigned long [usertype] new
   kernel/task_work.c:166:27: sparse:     got struct callback_head *__new
   kernel/task_work.c:166:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct callback_head *__ret @@     got unsigned long @@
   kernel/task_work.c:166:27: sparse:     expected struct callback_head *__ret
   kernel/task_work.c:166:27: sparse:     got unsigned long
   kernel/task_work.c:166:27: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct callback_head *__old @@
   kernel/task_work.c:166:27: sparse:     expected unsigned long [usertype] old
   kernel/task_work.c:166:27: sparse:     got struct callback_head *__old
   kernel/task_work.c:166:27: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct callback_head *__new @@
   kernel/task_work.c:166:27: sparse:     expected unsigned long [usertype] new
   kernel/task_work.c:166:27: sparse:     got struct callback_head *__new
   kernel/task_work.c:166:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct callback_head *__ret @@     got unsigned long @@
   kernel/task_work.c:166:27: sparse:     expected struct callback_head *__ret
   kernel/task_work.c:166:27: sparse:     got unsigned long
--
>> kernel/acct.c:196:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fs_pin *__old @@
   kernel/acct.c:196:9: sparse:     expected unsigned long [usertype] old
   kernel/acct.c:196:9: sparse:     got struct fs_pin *__old
>> kernel/acct.c:196:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fs_pin *__new @@
   kernel/acct.c:196:9: sparse:     expected unsigned long [usertype] new
   kernel/acct.c:196:9: sparse:     got struct fs_pin *__new
>> kernel/acct.c:196:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fs_pin *__ret @@     got unsigned long @@
   kernel/acct.c:196:9: sparse:     expected struct fs_pin *__ret
   kernel/acct.c:196:9: sparse:     got unsigned long
>> kernel/acct.c:196:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fs_pin *__old @@
   kernel/acct.c:196:9: sparse:     expected unsigned long [usertype] old
   kernel/acct.c:196:9: sparse:     got struct fs_pin *__old
>> kernel/acct.c:196:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fs_pin *__new @@
   kernel/acct.c:196:9: sparse:     expected unsigned long [usertype] new
   kernel/acct.c:196:9: sparse:     got struct fs_pin *__new
>> kernel/acct.c:196:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fs_pin *__ret @@     got unsigned long @@
   kernel/acct.c:196:9: sparse:     expected struct fs_pin *__ret
   kernel/acct.c:196:9: sparse:     got unsigned long
   kernel/acct.c:477:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/acct.c:477:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/acct.c:477:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/acct.c:487:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/acct.c:487:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/acct.c:487:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/acct.c:570:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/acct.c:570:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/acct.c:570:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/acct.c:590:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/acct.c:590:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/acct.c:590:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/acct.c:212:12: sparse: sparse: context imbalance in 'acct_on' - different lock contexts for basic block
   kernel/acct.c:313:9: sparse: sparse: context imbalance in '__se_sys_acct' - different lock contexts for basic block
   kernel/acct.c:316:6: sparse: sparse: context imbalance in 'acct_exit_ns' - wrong count at exit
--
>> lib/llist.c:33:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   lib/llist.c:33:19: sparse:     expected unsigned long [usertype] old
   lib/llist.c:33:19: sparse:     got struct llist_node *__old
>> lib/llist.c:33:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   lib/llist.c:33:19: sparse:     expected unsigned long [usertype] new
   lib/llist.c:33:19: sparse:     got struct llist_node *__new
>> lib/llist.c:33:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   lib/llist.c:33:19: sparse:     expected struct llist_node *__ret
   lib/llist.c:33:19: sparse:     got unsigned long
>> lib/llist.c:33:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   lib/llist.c:33:19: sparse:     expected unsigned long [usertype] old
   lib/llist.c:33:19: sparse:     got struct llist_node *__old
>> lib/llist.c:33:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   lib/llist.c:33:19: sparse:     expected unsigned long [usertype] new
   lib/llist.c:33:19: sparse:     got struct llist_node *__new
>> lib/llist.c:33:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   lib/llist.c:33:19: sparse:     expected struct llist_node *__ret
   lib/llist.c:33:19: sparse:     got unsigned long
   lib/llist.c:62:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   lib/llist.c:62:19: sparse:     expected unsigned long [usertype] old
   lib/llist.c:62:19: sparse:     got struct llist_node *__old
   lib/llist.c:62:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   lib/llist.c:62:19: sparse:     expected unsigned long [usertype] new
   lib/llist.c:62:19: sparse:     got struct llist_node *__new
   lib/llist.c:62:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   lib/llist.c:62:19: sparse:     expected struct llist_node *__ret
   lib/llist.c:62:19: sparse:     got unsigned long
   lib/llist.c:62:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   lib/llist.c:62:19: sparse:     expected unsigned long [usertype] old
   lib/llist.c:62:19: sparse:     got struct llist_node *__old
   lib/llist.c:62:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   lib/llist.c:62:19: sparse:     expected unsigned long [usertype] new
   lib/llist.c:62:19: sparse:     got struct llist_node *__new
   lib/llist.c:62:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   lib/llist.c:62:19: sparse:     expected struct llist_node *__ret
   lib/llist.c:62:19: sparse:     got unsigned long
   lib/llist.c:90:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   lib/llist.c:90:19: sparse:     expected unsigned long [usertype] old
   lib/llist.c:90:19: sparse:     got struct llist_node *__old
   lib/llist.c:90:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   lib/llist.c:90:19: sparse:     expected unsigned long [usertype] new
   lib/llist.c:90:19: sparse:     got struct llist_node *__new
   lib/llist.c:90:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   lib/llist.c:90:19: sparse:     expected struct llist_node *__ret
   lib/llist.c:90:19: sparse:     got unsigned long
   lib/llist.c:90:19: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct llist_node *__old @@
   lib/llist.c:90:19: sparse:     expected unsigned long [usertype] old
   lib/llist.c:90:19: sparse:     got struct llist_node *__old
   lib/llist.c:90:19: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct llist_node *__new @@
   lib/llist.c:90:19: sparse:     expected unsigned long [usertype] new
   lib/llist.c:90:19: sparse:     got struct llist_node *__new
   lib/llist.c:90:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct llist_node *__ret @@     got unsigned long @@
   lib/llist.c:90:19: sparse:     expected struct llist_node *__ret
   lib/llist.c:90:19: sparse:     got unsigned long
--
>> lib/rhashtable.c:140:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got union nested_table *__old @@
   lib/rhashtable.c:140:13: sparse:     expected unsigned long [usertype] old
   lib/rhashtable.c:140:13: sparse:     got union nested_table *__old
>> lib/rhashtable.c:140:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got union nested_table *__new @@
   lib/rhashtable.c:140:13: sparse:     expected unsigned long [usertype] new
   lib/rhashtable.c:140:13: sparse:     got union nested_table *__new
>> lib/rhashtable.c:140:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected union nested_table *__ret @@     got unsigned long @@
   lib/rhashtable.c:140:13: sparse:     expected union nested_table *__ret
   lib/rhashtable.c:140:13: sparse:     got unsigned long
>> lib/rhashtable.c:140:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got union nested_table *__old @@
   lib/rhashtable.c:140:13: sparse:     expected unsigned long [usertype] old
   lib/rhashtable.c:140:13: sparse:     got union nested_table *__old
>> lib/rhashtable.c:140:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got union nested_table *__new @@
   lib/rhashtable.c:140:13: sparse:     expected unsigned long [usertype] new
   lib/rhashtable.c:140:13: sparse:     got union nested_table *__new
>> lib/rhashtable.c:140:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected union nested_table *__ret @@     got unsigned long @@
   lib/rhashtable.c:140:13: sparse:     expected union nested_table *__ret
   lib/rhashtable.c:140:13: sparse:     got unsigned long
>> lib/rhashtable.c:308:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bucket_table *__old @@
   lib/rhashtable.c:308:13: sparse:     expected unsigned long [usertype] old
   lib/rhashtable.c:308:13: sparse:     got struct bucket_table *__old
>> lib/rhashtable.c:308:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bucket_table *__new @@
   lib/rhashtable.c:308:13: sparse:     expected unsigned long [usertype] new
   lib/rhashtable.c:308:13: sparse:     got struct bucket_table *__new
>> lib/rhashtable.c:308:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bucket_table *__ret @@     got unsigned long @@
   lib/rhashtable.c:308:13: sparse:     expected struct bucket_table *__ret
   lib/rhashtable.c:308:13: sparse:     got unsigned long
>> lib/rhashtable.c:308:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bucket_table *__old @@
   lib/rhashtable.c:308:13: sparse:     expected unsigned long [usertype] old
   lib/rhashtable.c:308:13: sparse:     got struct bucket_table *__old
>> lib/rhashtable.c:308:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bucket_table *__new @@
   lib/rhashtable.c:308:13: sparse:     expected unsigned long [usertype] new
   lib/rhashtable.c:308:13: sparse:     got struct bucket_table *__new
>> lib/rhashtable.c:308:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bucket_table *__ret @@     got unsigned long @@
   lib/rhashtable.c:308:13: sparse:     expected struct bucket_table *__ret
   lib/rhashtable.c:308:13: sparse:     got unsigned long
--
>> lib/generic-radix-tree.c:121:26: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct genradix_root *__old @@
   lib/generic-radix-tree.c:121:26: sparse:     expected unsigned long [usertype] old
   lib/generic-radix-tree.c:121:26: sparse:     got struct genradix_root *__old
>> lib/generic-radix-tree.c:121:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct genradix_root *__new @@
   lib/generic-radix-tree.c:121:26: sparse:     expected unsigned long [usertype] new
   lib/generic-radix-tree.c:121:26: sparse:     got struct genradix_root *__new
>> lib/generic-radix-tree.c:121:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct genradix_root *__ret @@     got unsigned long @@
   lib/generic-radix-tree.c:121:26: sparse:     expected struct genradix_root *__ret
   lib/generic-radix-tree.c:121:26: sparse:     got unsigned long
>> lib/generic-radix-tree.c:121:26: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct genradix_root *__old @@
   lib/generic-radix-tree.c:121:26: sparse:     expected unsigned long [usertype] old
   lib/generic-radix-tree.c:121:26: sparse:     got struct genradix_root *__old
>> lib/generic-radix-tree.c:121:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct genradix_root *__new @@
   lib/generic-radix-tree.c:121:26: sparse:     expected unsigned long [usertype] new
   lib/generic-radix-tree.c:121:26: sparse:     got struct genradix_root *__new
>> lib/generic-radix-tree.c:121:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct genradix_root *__ret @@     got unsigned long @@
   lib/generic-radix-tree.c:121:26: sparse:     expected struct genradix_root *__ret
   lib/generic-radix-tree.c:121:26: sparse:     got unsigned long
>> lib/generic-radix-tree.c:140:35: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct genradix_node *__old @@
   lib/generic-radix-tree.c:140:35: sparse:     expected unsigned long [usertype] old
   lib/generic-radix-tree.c:140:35: sparse:     got struct genradix_node *__old
>> lib/generic-radix-tree.c:140:35: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct genradix_node *__new @@
   lib/generic-radix-tree.c:140:35: sparse:     expected unsigned long [usertype] new
   lib/generic-radix-tree.c:140:35: sparse:     got struct genradix_node *__new
>> lib/generic-radix-tree.c:140:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct genradix_node *__ret @@     got unsigned long @@
   lib/generic-radix-tree.c:140:35: sparse:     expected struct genradix_node *__ret
   lib/generic-radix-tree.c:140:35: sparse:     got unsigned long
>> lib/generic-radix-tree.c:140:35: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct genradix_node *__old @@
   lib/generic-radix-tree.c:140:35: sparse:     expected unsigned long [usertype] old
   lib/generic-radix-tree.c:140:35: sparse:     got struct genradix_node *__old
>> lib/generic-radix-tree.c:140:35: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct genradix_node *__new @@
   lib/generic-radix-tree.c:140:35: sparse:     expected unsigned long [usertype] new
   lib/generic-radix-tree.c:140:35: sparse:     got struct genradix_node *__new
>> lib/generic-radix-tree.c:140:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct genradix_node *__ret @@     got unsigned long @@
   lib/generic-radix-tree.c:140:35: sparse:     expected struct genradix_node *__ret
   lib/generic-radix-tree.c:140:35: sparse:     got unsigned long
--
>> mm/page_io.c:256:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct mempool_s [usertype] *__old @@
   mm/page_io.c:256:21: sparse:     expected unsigned long [usertype] old
   mm/page_io.c:256:21: sparse:     got struct mempool_s [usertype] *__old
>> mm/page_io.c:256:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct mempool_s [usertype] *__new @@
   mm/page_io.c:256:21: sparse:     expected unsigned long [usertype] new
   mm/page_io.c:256:21: sparse:     got struct mempool_s [usertype] *__new
>> mm/page_io.c:256:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct mempool_s [usertype] *__ret @@     got unsigned long @@
   mm/page_io.c:256:21: sparse:     expected struct mempool_s [usertype] *__ret
   mm/page_io.c:256:21: sparse:     got unsigned long
>> mm/page_io.c:256:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct mempool_s [usertype] *__old @@
   mm/page_io.c:256:21: sparse:     expected unsigned long [usertype] old
   mm/page_io.c:256:21: sparse:     got struct mempool_s [usertype] *__old
>> mm/page_io.c:256:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct mempool_s [usertype] *__new @@
   mm/page_io.c:256:21: sparse:     expected unsigned long [usertype] new
   mm/page_io.c:256:21: sparse:     got struct mempool_s [usertype] *__new
>> mm/page_io.c:256:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct mempool_s [usertype] *__ret @@     got unsigned long @@
   mm/page_io.c:256:21: sparse:     expected struct mempool_s [usertype] *__ret
   mm/page_io.c:256:21: sparse:     got unsigned long
   mm/page_io.c: note: in included file (through include/linux/thread_info.h, include/asm-generic/preempt.h, arch/riscv/include/generated/asm/preempt.h, ...):
   arch/riscv/include/asm/current.h:31:16: sparse: sparse: self-comparison always evaluates to false
   arch/riscv/include/asm/current.h:31:16: sparse: sparse: self-comparison always evaluates to false
--
>> mm/oom_kill.c:767:14: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct mm_struct *__old @@
   mm/oom_kill.c:767:14: sparse:     expected unsigned long [usertype] old
   mm/oom_kill.c:767:14: sparse:     got struct mm_struct *__old
>> mm/oom_kill.c:767:14: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct mm_struct *__new @@
   mm/oom_kill.c:767:14: sparse:     expected unsigned long [usertype] new
   mm/oom_kill.c:767:14: sparse:     got struct mm_struct *__new
>> mm/oom_kill.c:767:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct mm_struct *__ret @@     got unsigned long @@
   mm/oom_kill.c:767:14: sparse:     expected struct mm_struct *__ret
   mm/oom_kill.c:767:14: sparse:     got unsigned long
>> mm/oom_kill.c:767:14: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct mm_struct *__old @@
   mm/oom_kill.c:767:14: sparse:     expected unsigned long [usertype] old
   mm/oom_kill.c:767:14: sparse:     got struct mm_struct *__old
>> mm/oom_kill.c:767:14: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct mm_struct *__new @@
   mm/oom_kill.c:767:14: sparse:     expected unsigned long [usertype] new
   mm/oom_kill.c:767:14: sparse:     got struct mm_struct *__new
>> mm/oom_kill.c:767:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct mm_struct *__ret @@     got unsigned long @@
   mm/oom_kill.c:767:14: sparse:     expected struct mm_struct *__ret
   mm/oom_kill.c:767:14: sparse:     got unsigned long
   mm/oom_kill.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/oom.h):
   include/trace/events/oom.h:76:1: sparse: sparse: self-comparison always evaluates to false
   mm/oom_kill.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/oom.h):
   include/trace/events/oom.h:76:1: sparse: sparse: self-comparison always evaluates to false
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:870:9: sparse: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
   mm/oom_kill.c:223:28: sparse: sparse: context imbalance in 'oom_badness' - unexpected unlock
   mm/oom_kill.c:403:9: sparse: sparse: context imbalance in 'dump_task' - unexpected unlock
   include/linux/rcupdate.h:870:9: sparse: sparse: context imbalance in '__oom_kill_process' - unexpected unlock
   mm/oom_kill.c:1237:20: sparse: sparse: context imbalance in '__se_sys_process_mrelease' - unexpected unlock
--
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct dma_fence [noderef] __rcu *__old @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] old
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__old
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct dma_fence [noderef] __rcu *__new @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected unsigned long [usertype] new
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got struct dma_fence [noderef] __rcu *__new
>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence [noderef] __rcu *__ret @@     got unsigned long @@
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     expected struct dma_fence [noderef] __rcu *__ret
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse:     got unsigned long
   drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: cast removes address space '__rcu' of expression
--
>> drivers/tty/tty_audit.c:192:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct tty_audit_buf *__old @@
   drivers/tty/tty_audit.c:192:13: sparse:     expected unsigned long [usertype] old
   drivers/tty/tty_audit.c:192:13: sparse:     got struct tty_audit_buf *__old
>> drivers/tty/tty_audit.c:192:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct tty_audit_buf *__new @@
   drivers/tty/tty_audit.c:192:13: sparse:     expected unsigned long [usertype] new
   drivers/tty/tty_audit.c:192:13: sparse:     got struct tty_audit_buf *__new
>> drivers/tty/tty_audit.c:192:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct tty_audit_buf *__ret @@     got unsigned long @@
   drivers/tty/tty_audit.c:192:13: sparse:     expected struct tty_audit_buf *__ret
   drivers/tty/tty_audit.c:192:13: sparse:     got unsigned long
>> drivers/tty/tty_audit.c:192:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct tty_audit_buf *__old @@
   drivers/tty/tty_audit.c:192:13: sparse:     expected unsigned long [usertype] old
   drivers/tty/tty_audit.c:192:13: sparse:     got struct tty_audit_buf *__old
>> drivers/tty/tty_audit.c:192:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct tty_audit_buf *__new @@
   drivers/tty/tty_audit.c:192:13: sparse:     expected unsigned long [usertype] new
   drivers/tty/tty_audit.c:192:13: sparse:     got struct tty_audit_buf *__new
>> drivers/tty/tty_audit.c:192:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct tty_audit_buf *__ret @@     got unsigned long @@
   drivers/tty/tty_audit.c:192:13: sparse:     expected struct tty_audit_buf *__ret
   drivers/tty/tty_audit.c:192:13: sparse:     got unsigned long
--
   net/core/filter.c:1419:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1419:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1419:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:1497:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1497:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1497:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:2325:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] daddr @@     got unsigned int [usertype] ipv4_nh @@
   net/core/filter.c:2325:45: sparse:     expected restricted __be32 [usertype] daddr
   net/core/filter.c:2325:45: sparse:     got unsigned int [usertype] ipv4_nh
>> net/core/filter.c:4302:25: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_map *__old @@
   net/core/filter.c:4302:25: sparse:     expected unsigned long [usertype] old
   net/core/filter.c:4302:25: sparse:     got struct bpf_map *__old
>> net/core/filter.c:4302:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_map *__new @@
   net/core/filter.c:4302:25: sparse:     expected unsigned long [usertype] new
   net/core/filter.c:4302:25: sparse:     got struct bpf_map *__new
>> net/core/filter.c:4302:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_map *__ret @@     got unsigned long @@
   net/core/filter.c:4302:25: sparse:     expected struct bpf_map *__ret
   net/core/filter.c:4302:25: sparse:     got unsigned long
>> net/core/filter.c:4302:25: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_map *__old @@
   net/core/filter.c:4302:25: sparse:     expected unsigned long [usertype] old
   net/core/filter.c:4302:25: sparse:     got struct bpf_map *__old
>> net/core/filter.c:4302:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_map *__new @@
   net/core/filter.c:4302:25: sparse:     expected unsigned long [usertype] new
   net/core/filter.c:4302:25: sparse:     got struct bpf_map *__new
>> net/core/filter.c:4302:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_map *__ret @@     got unsigned long @@
   net/core/filter.c:4302:25: sparse:     expected struct bpf_map *__ret
   net/core/filter.c:4302:25: sparse:     got unsigned long
>> net/core/filter.c:4855:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct metadata_dst [noderef] __percpu *__old @@
   net/core/filter.c:4855:21: sparse:     expected unsigned long [usertype] old
   net/core/filter.c:4855:21: sparse:     got struct metadata_dst [noderef] __percpu *__old
>> net/core/filter.c:4855:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct metadata_dst [noderef] __percpu *__new @@
   net/core/filter.c:4855:21: sparse:     expected unsigned long [usertype] new
   net/core/filter.c:4855:21: sparse:     got struct metadata_dst [noderef] __percpu *__new
>> net/core/filter.c:4855:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct metadata_dst [noderef] __percpu *__ret @@     got unsigned long @@
   net/core/filter.c:4855:21: sparse:     expected struct metadata_dst [noderef] __percpu *__ret
   net/core/filter.c:4855:21: sparse:     got unsigned long
>> net/core/filter.c:4855:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct metadata_dst [noderef] __percpu *__old @@
   net/core/filter.c:4855:21: sparse:     expected unsigned long [usertype] old
   net/core/filter.c:4855:21: sparse:     got struct metadata_dst [noderef] __percpu *__old
>> net/core/filter.c:4855:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct metadata_dst [noderef] __percpu *__new @@
   net/core/filter.c:4855:21: sparse:     expected unsigned long [usertype] new
   net/core/filter.c:4855:21: sparse:     got struct metadata_dst [noderef] __percpu *__new
>> net/core/filter.c:4855:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct metadata_dst [noderef] __percpu *__ret @@     got unsigned long @@
   net/core/filter.c:4855:21: sparse:     expected struct metadata_dst [noderef] __percpu *__ret
   net/core/filter.c:4855:21: sparse:     got unsigned long
   net/core/filter.c:4855:21: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/filter.c:10960:31: sparse: sparse: symbol 'cg_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10966:27: sparse: sparse: symbol 'cg_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11011:31: sparse: sparse: symbol 'cg_sock_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11017:27: sparse: sparse: symbol 'cg_sock_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11020:31: sparse: sparse: symbol 'cg_sock_addr_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11026:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops' was not declared. Should it be static?
   net/core/filter.c:1931:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1931:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1931:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1934:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1934:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1934:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1934:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1934:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1934:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1937:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1937:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1937:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1937:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1937:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1937:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1982:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1982:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1982:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1985:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1985:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:1985:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1985:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1985:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:1985:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1988:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1988:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1988:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1988:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1988:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1988:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2034:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum @@
   net/core/filter.c:2034:28: sparse:     expected unsigned long long
   net/core/filter.c:2034:28: sparse:     got restricted __wsum
   net/core/filter.c:2056:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:2056:35: sparse:     expected unsigned long long
   net/core/filter.c:2056:35: sparse:     got restricted __wsum [usertype] csum
   net/core/filter.c:5789:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] spi @@     got restricted __be32 const [usertype] spi @@
   net/core/filter.c:5789:17: sparse:     expected unsigned int [usertype] spi
   net/core/filter.c:5789:17: sparse:     got restricted __be32 const [usertype] spi
   net/core/filter.c:5797:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] remote_ipv4 @@     got restricted __be32 const [usertype] a4 @@
   net/core/filter.c:5797:33: sparse:     expected unsigned int [usertype] remote_ipv4
   net/core/filter.c:5797:33: sparse:     got restricted __be32 const [usertype] a4
--
>> net/core/lwtunnel.c:86:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct lwtunnel_encap_ops const *__old @@
   net/core/lwtunnel.c:86:17: sparse:     expected unsigned long [usertype] old
   net/core/lwtunnel.c:86:17: sparse:     got struct lwtunnel_encap_ops const *__old
>> net/core/lwtunnel.c:86:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct lwtunnel_encap_ops const *__new @@
   net/core/lwtunnel.c:86:17: sparse:     expected unsigned long [usertype] new
   net/core/lwtunnel.c:86:17: sparse:     got struct lwtunnel_encap_ops const *__new
>> net/core/lwtunnel.c:86:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct lwtunnel_encap_ops const *__ret @@     got unsigned long @@
   net/core/lwtunnel.c:86:17: sparse:     expected struct lwtunnel_encap_ops const *__ret
   net/core/lwtunnel.c:86:17: sparse:     got unsigned long
>> net/core/lwtunnel.c:86:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct lwtunnel_encap_ops const *__old @@
   net/core/lwtunnel.c:86:17: sparse:     expected unsigned long [usertype] old
   net/core/lwtunnel.c:86:17: sparse:     got struct lwtunnel_encap_ops const *__old
>> net/core/lwtunnel.c:86:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct lwtunnel_encap_ops const *__new @@
   net/core/lwtunnel.c:86:17: sparse:     expected unsigned long [usertype] new
   net/core/lwtunnel.c:86:17: sparse:     got struct lwtunnel_encap_ops const *__new
>> net/core/lwtunnel.c:86:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct lwtunnel_encap_ops const *__ret @@     got unsigned long @@
   net/core/lwtunnel.c:86:17: sparse:     expected struct lwtunnel_encap_ops const *__ret
   net/core/lwtunnel.c:86:17: sparse:     got unsigned long
   net/core/lwtunnel.c:101:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct lwtunnel_encap_ops const *__old @@
   net/core/lwtunnel.c:101:16: sparse:     expected unsigned long [usertype] old
   net/core/lwtunnel.c:101:16: sparse:     got struct lwtunnel_encap_ops const *__old
   net/core/lwtunnel.c:101:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct lwtunnel_encap_ops const *__new @@
   net/core/lwtunnel.c:101:16: sparse:     expected unsigned long [usertype] new
   net/core/lwtunnel.c:101:16: sparse:     got struct lwtunnel_encap_ops const *__new
   net/core/lwtunnel.c:101:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct lwtunnel_encap_ops const *__ret @@     got unsigned long @@
   net/core/lwtunnel.c:101:16: sparse:     expected struct lwtunnel_encap_ops const *__ret
   net/core/lwtunnel.c:101:16: sparse:     got unsigned long
   net/core/lwtunnel.c:101:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct lwtunnel_encap_ops const *__old @@
   net/core/lwtunnel.c:101:16: sparse:     expected unsigned long [usertype] old
   net/core/lwtunnel.c:101:16: sparse:     got struct lwtunnel_encap_ops const *__old
   net/core/lwtunnel.c:101:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct lwtunnel_encap_ops const *__new @@
   net/core/lwtunnel.c:101:16: sparse:     expected unsigned long [usertype] new
   net/core/lwtunnel.c:101:16: sparse:     got struct lwtunnel_encap_ops const *__new
   net/core/lwtunnel.c:101:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct lwtunnel_encap_ops const *__ret @@     got unsigned long @@
   net/core/lwtunnel.c:101:16: sparse:     expected struct lwtunnel_encap_ops const *__ret
   net/core/lwtunnel.c:101:16: sparse:     got unsigned long
   net/core/lwtunnel.c:223:60: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct lwtunnel_encap_ops const *ops @@     got struct lwtunnel_encap_ops const [noderef] __rcu * @@
   net/core/lwtunnel.c:223:60: sparse:     expected struct lwtunnel_encap_ops const *ops
   net/core/lwtunnel.c:223:60: sparse:     got struct lwtunnel_encap_ops const [noderef] __rcu *
--
   net/core/dev.c:3332:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3332:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3332:23: sparse:     got unsigned int
   net/core/dev.c:3332:23: sparse: sparse: cast from restricted __wsum
>> net/core/dev.c:10629:18: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_device_core_stats [noderef] __percpu *__old @@
   net/core/dev.c:10629:18: sparse:     expected unsigned long [usertype] old
   net/core/dev.c:10629:18: sparse:     got struct net_device_core_stats [noderef] __percpu *__old
>> net/core/dev.c:10629:18: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_device_core_stats [noderef] __percpu *__new @@
   net/core/dev.c:10629:18: sparse:     expected unsigned long [usertype] new
   net/core/dev.c:10629:18: sparse:     got struct net_device_core_stats [noderef] __percpu *__new
>> net/core/dev.c:10629:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_device_core_stats [noderef] __percpu *__ret @@     got unsigned long @@
   net/core/dev.c:10629:18: sparse:     expected struct net_device_core_stats [noderef] __percpu *__ret
   net/core/dev.c:10629:18: sparse:     got unsigned long
>> net/core/dev.c:10629:18: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_device_core_stats [noderef] __percpu *__old @@
   net/core/dev.c:10629:18: sparse:     expected unsigned long [usertype] old
   net/core/dev.c:10629:18: sparse:     got struct net_device_core_stats [noderef] __percpu *__old
>> net/core/dev.c:10629:18: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_device_core_stats [noderef] __percpu *__new @@
   net/core/dev.c:10629:18: sparse:     expected unsigned long [usertype] new
   net/core/dev.c:10629:18: sparse:     got struct net_device_core_stats [noderef] __percpu *__new
>> net/core/dev.c:10629:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_device_core_stats [noderef] __percpu *__ret @@     got unsigned long @@
   net/core/dev.c:10629:18: sparse:     expected struct net_device_core_stats [noderef] __percpu *__ret
   net/core/dev.c:10629:18: sparse:     got unsigned long
   net/core/dev.c:10629:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3772:17: sparse: sparse: context imbalance in '__dev_queue_xmit' - different lock contexts for basic block
   net/core/dev.c:5171:17: sparse: sparse: context imbalance in 'net_tx_action' - different lock contexts for basic block
--
>> net/core/sock_diag.c:212:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct sock_diag_handler const *__old @@
   net/core/sock_diag.c:212:17: sparse:     expected unsigned long [usertype] old
   net/core/sock_diag.c:212:17: sparse:     got struct sock_diag_handler const *__old
>> net/core/sock_diag.c:212:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct sock_diag_handler const *__new @@
   net/core/sock_diag.c:212:17: sparse:     expected unsigned long [usertype] new
   net/core/sock_diag.c:212:17: sparse:     got struct sock_diag_handler const *__new
>> net/core/sock_diag.c:212:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct sock_diag_handler const *__ret @@     got unsigned long @@
   net/core/sock_diag.c:212:17: sparse:     expected struct sock_diag_handler const *__ret
   net/core/sock_diag.c:212:17: sparse:     got unsigned long
>> net/core/sock_diag.c:212:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct sock_diag_handler const *__old @@
   net/core/sock_diag.c:212:17: sparse:     expected unsigned long [usertype] old
   net/core/sock_diag.c:212:17: sparse:     got struct sock_diag_handler const *__old
>> net/core/sock_diag.c:212:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct sock_diag_handler const *__new @@
   net/core/sock_diag.c:212:17: sparse:     expected unsigned long [usertype] new
   net/core/sock_diag.c:212:17: sparse:     got struct sock_diag_handler const *__new
>> net/core/sock_diag.c:212:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct sock_diag_handler const *__ret @@     got unsigned long @@
   net/core/sock_diag.c:212:17: sparse:     expected struct sock_diag_handler const *__ret
   net/core/sock_diag.c:212:17: sparse:     got unsigned long
--
   net/core/sock_map.c: note: in included file:
>> include/linux/skmsg.h:482:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_prog *__old @@
   include/linux/skmsg.h:482:13: sparse:     expected unsigned long [usertype] old
   include/linux/skmsg.h:482:13: sparse:     got struct bpf_prog *__old
>> include/linux/skmsg.h:482:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_prog *__new @@
   include/linux/skmsg.h:482:13: sparse:     expected unsigned long [usertype] new
   include/linux/skmsg.h:482:13: sparse:     got struct bpf_prog *__new
>> include/linux/skmsg.h:482:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_prog *__ret @@     got unsigned long @@
   include/linux/skmsg.h:482:13: sparse:     expected struct bpf_prog *__ret
   include/linux/skmsg.h:482:13: sparse:     got unsigned long
>> include/linux/skmsg.h:482:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_prog *__old @@
   include/linux/skmsg.h:482:13: sparse:     expected unsigned long [usertype] old
   include/linux/skmsg.h:482:13: sparse:     got struct bpf_prog *__old
>> include/linux/skmsg.h:482:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_prog *__new @@
   include/linux/skmsg.h:482:13: sparse:     expected unsigned long [usertype] new
   include/linux/skmsg.h:482:13: sparse:     got struct bpf_prog *__new
>> include/linux/skmsg.h:482:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_prog *__ret @@     got unsigned long @@
   include/linux/skmsg.h:482:13: sparse:     expected struct bpf_prog *__ret
   include/linux/skmsg.h:482:13: sparse:     got unsigned long
--
>> drivers/nvme/target/fabrics-cmd.c:169:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct nvmet_ctrl *__old @@
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     expected unsigned long [usertype] old
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     got struct nvmet_ctrl *__old
>> drivers/nvme/target/fabrics-cmd.c:169:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct nvmet_ctrl *__new @@
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     expected unsigned long [usertype] new
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     got struct nvmet_ctrl *__new
>> drivers/nvme/target/fabrics-cmd.c:169:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nvmet_ctrl *__ret @@     got unsigned long @@
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     expected struct nvmet_ctrl *__ret
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     got unsigned long
>> drivers/nvme/target/fabrics-cmd.c:169:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct nvmet_ctrl *__old @@
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     expected unsigned long [usertype] old
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     got struct nvmet_ctrl *__old
>> drivers/nvme/target/fabrics-cmd.c:169:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct nvmet_ctrl *__new @@
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     expected unsigned long [usertype] new
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     got struct nvmet_ctrl *__new
>> drivers/nvme/target/fabrics-cmd.c:169:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct nvmet_ctrl *__ret @@     got unsigned long @@
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     expected struct nvmet_ctrl *__ret
   drivers/nvme/target/fabrics-cmd.c:169:15: sparse:     got unsigned long
--
>> net/ipv4/protocol.c:34:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_protocol const *__old @@
   net/ipv4/protocol.c:34:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:34:17: sparse:     got struct net_protocol const *__old
>> net/ipv4/protocol.c:34:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_protocol const *__new @@
   net/ipv4/protocol.c:34:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:34:17: sparse:     got struct net_protocol const *__new
>> net/ipv4/protocol.c:34:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_protocol const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:34:17: sparse:     expected struct net_protocol const *__ret
   net/ipv4/protocol.c:34:17: sparse:     got unsigned long
>> net/ipv4/protocol.c:34:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_protocol const *__old @@
   net/ipv4/protocol.c:34:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:34:17: sparse:     got struct net_protocol const *__old
>> net/ipv4/protocol.c:34:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_protocol const *__new @@
   net/ipv4/protocol.c:34:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:34:17: sparse:     got struct net_protocol const *__new
>> net/ipv4/protocol.c:34:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_protocol const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:34:17: sparse:     expected struct net_protocol const *__ret
   net/ipv4/protocol.c:34:17: sparse:     got unsigned long
>> net/ipv4/protocol.c:41:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv4/protocol.c:41:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:41:17: sparse:     got struct net_offload const *__old
>> net/ipv4/protocol.c:41:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv4/protocol.c:41:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:41:17: sparse:     got struct net_offload const *__new
>> net/ipv4/protocol.c:41:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:41:17: sparse:     expected struct net_offload const *__ret
   net/ipv4/protocol.c:41:17: sparse:     got unsigned long
>> net/ipv4/protocol.c:41:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv4/protocol.c:41:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:41:17: sparse:     got struct net_offload const *__old
>> net/ipv4/protocol.c:41:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv4/protocol.c:41:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:41:17: sparse:     got struct net_offload const *__new
>> net/ipv4/protocol.c:41:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:41:17: sparse:     expected struct net_offload const *__ret
   net/ipv4/protocol.c:41:17: sparse:     got unsigned long
   net/ipv4/protocol.c:50:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_protocol const *__old @@
   net/ipv4/protocol.c:50:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:50:16: sparse:     got struct net_protocol const *__old
   net/ipv4/protocol.c:50:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_protocol const *__new @@
   net/ipv4/protocol.c:50:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:50:16: sparse:     got struct net_protocol const *__new
   net/ipv4/protocol.c:50:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_protocol const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:50:16: sparse:     expected struct net_protocol const *__ret
   net/ipv4/protocol.c:50:16: sparse:     got unsigned long
   net/ipv4/protocol.c:50:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_protocol const *__old @@
   net/ipv4/protocol.c:50:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:50:16: sparse:     got struct net_protocol const *__old
   net/ipv4/protocol.c:50:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_protocol const *__new @@
   net/ipv4/protocol.c:50:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:50:16: sparse:     got struct net_protocol const *__new
   net/ipv4/protocol.c:50:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_protocol const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:50:16: sparse:     expected struct net_protocol const *__ret
   net/ipv4/protocol.c:50:16: sparse:     got unsigned long
   net/ipv4/protocol.c:63:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv4/protocol.c:63:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:63:16: sparse:     got struct net_offload const *__old
   net/ipv4/protocol.c:63:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv4/protocol.c:63:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:63:16: sparse:     got struct net_offload const *__new
   net/ipv4/protocol.c:63:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:63:16: sparse:     expected struct net_offload const *__ret
   net/ipv4/protocol.c:63:16: sparse:     got unsigned long
   net/ipv4/protocol.c:63:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv4/protocol.c:63:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/protocol.c:63:16: sparse:     got struct net_offload const *__old
   net/ipv4/protocol.c:63:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv4/protocol.c:63:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/protocol.c:63:16: sparse:     got struct net_offload const *__new
   net/ipv4/protocol.c:63:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv4/protocol.c:63:16: sparse:     expected struct net_offload const *__ret
   net/ipv4/protocol.c:63:16: sparse:     got unsigned long
--
>> net/ipv4/route.c:1487:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rtable *__old @@
   net/ipv4/route.c:1487:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/route.c:1487:16: sparse:     got struct rtable *__old
>> net/ipv4/route.c:1487:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rtable *__new @@
   net/ipv4/route.c:1487:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/route.c:1487:16: sparse:     got struct rtable *__new
>> net/ipv4/route.c:1487:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rtable *__ret @@     got unsigned long @@
   net/ipv4/route.c:1487:16: sparse:     expected struct rtable *__ret
   net/ipv4/route.c:1487:16: sparse:     got unsigned long
>> net/ipv4/route.c:1487:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rtable *__old @@
   net/ipv4/route.c:1487:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/route.c:1487:16: sparse:     got struct rtable *__old
>> net/ipv4/route.c:1487:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rtable *__new @@
   net/ipv4/route.c:1487:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/route.c:1487:16: sparse:     got struct rtable *__new
>> net/ipv4/route.c:1487:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rtable *__ret @@     got unsigned long @@
   net/ipv4/route.c:1487:16: sparse:     expected struct rtable *__ret
   net/ipv4/route.c:1487:16: sparse:     got unsigned long
--
>> net/ipv4/ip_tunnel.c:463:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip_tunnel_encap_ops const *__old @@
   net/ipv4/ip_tunnel.c:463:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/ip_tunnel.c:463:17: sparse:     got struct ip_tunnel_encap_ops const *__old
>> net/ipv4/ip_tunnel.c:463:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip_tunnel_encap_ops const *__new @@
   net/ipv4/ip_tunnel.c:463:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/ip_tunnel.c:463:17: sparse:     got struct ip_tunnel_encap_ops const *__new
>> net/ipv4/ip_tunnel.c:463:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip_tunnel_encap_ops const *__ret @@     got unsigned long @@
   net/ipv4/ip_tunnel.c:463:17: sparse:     expected struct ip_tunnel_encap_ops const *__ret
   net/ipv4/ip_tunnel.c:463:17: sparse:     got unsigned long
>> net/ipv4/ip_tunnel.c:463:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip_tunnel_encap_ops const *__old @@
   net/ipv4/ip_tunnel.c:463:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/ip_tunnel.c:463:17: sparse:     got struct ip_tunnel_encap_ops const *__old
>> net/ipv4/ip_tunnel.c:463:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip_tunnel_encap_ops const *__new @@
   net/ipv4/ip_tunnel.c:463:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/ip_tunnel.c:463:17: sparse:     got struct ip_tunnel_encap_ops const *__new
>> net/ipv4/ip_tunnel.c:463:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip_tunnel_encap_ops const *__ret @@     got unsigned long @@
   net/ipv4/ip_tunnel.c:463:17: sparse:     expected struct ip_tunnel_encap_ops const *__ret
   net/ipv4/ip_tunnel.c:463:17: sparse:     got unsigned long
   net/ipv4/ip_tunnel.c:477:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip_tunnel_encap_ops const *__old @@
   net/ipv4/ip_tunnel.c:477:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/ip_tunnel.c:477:16: sparse:     got struct ip_tunnel_encap_ops const *__old
   net/ipv4/ip_tunnel.c:477:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip_tunnel_encap_ops const *__new @@
   net/ipv4/ip_tunnel.c:477:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/ip_tunnel.c:477:16: sparse:     got struct ip_tunnel_encap_ops const *__new
   net/ipv4/ip_tunnel.c:477:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip_tunnel_encap_ops const *__ret @@     got unsigned long @@
   net/ipv4/ip_tunnel.c:477:16: sparse:     expected struct ip_tunnel_encap_ops const *__ret
   net/ipv4/ip_tunnel.c:477:16: sparse:     got unsigned long
   net/ipv4/ip_tunnel.c:477:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip_tunnel_encap_ops const *__old @@
   net/ipv4/ip_tunnel.c:477:16: sparse:     expected unsigned long [usertype] old
   net/ipv4/ip_tunnel.c:477:16: sparse:     got struct ip_tunnel_encap_ops const *__old
   net/ipv4/ip_tunnel.c:477:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip_tunnel_encap_ops const *__new @@
   net/ipv4/ip_tunnel.c:477:16: sparse:     expected unsigned long [usertype] new
   net/ipv4/ip_tunnel.c:477:16: sparse:     got struct ip_tunnel_encap_ops const *__new
   net/ipv4/ip_tunnel.c:477:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip_tunnel_encap_ops const *__ret @@     got unsigned long @@
   net/ipv4/ip_tunnel.c:477:16: sparse:     expected struct ip_tunnel_encap_ops const *__ret
   net/ipv4/ip_tunnel.c:477:16: sparse:     got unsigned long
--
>> net/ipv4/inet_diag.c:1521:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct inet_diag_handler const *__old @@
   net/ipv4/inet_diag.c:1521:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/inet_diag.c:1521:17: sparse:     got struct inet_diag_handler const *__old
>> net/ipv4/inet_diag.c:1521:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct inet_diag_handler const *__new @@
   net/ipv4/inet_diag.c:1521:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/inet_diag.c:1521:17: sparse:     got struct inet_diag_handler const *__new
>> net/ipv4/inet_diag.c:1521:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct inet_diag_handler const *__ret @@     got unsigned long @@
   net/ipv4/inet_diag.c:1521:17: sparse:     expected struct inet_diag_handler const *__ret
   net/ipv4/inet_diag.c:1521:17: sparse:     got unsigned long
>> net/ipv4/inet_diag.c:1521:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct inet_diag_handler const *__old @@
   net/ipv4/inet_diag.c:1521:17: sparse:     expected unsigned long [usertype] old
   net/ipv4/inet_diag.c:1521:17: sparse:     got struct inet_diag_handler const *__old
>> net/ipv4/inet_diag.c:1521:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct inet_diag_handler const *__new @@
   net/ipv4/inet_diag.c:1521:17: sparse:     expected unsigned long [usertype] new
   net/ipv4/inet_diag.c:1521:17: sparse:     got struct inet_diag_handler const *__new
>> net/ipv4/inet_diag.c:1521:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct inet_diag_handler const *__ret @@     got unsigned long @@
   net/ipv4/inet_diag.c:1521:17: sparse:     expected struct inet_diag_handler const *__ret
   net/ipv4/inet_diag.c:1521:17: sparse:     got unsigned long
--
>> net/ipv6/protocol.c:30:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct inet6_protocol const *__old @@
   net/ipv6/protocol.c:30:17: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:30:17: sparse:     got struct inet6_protocol const *__old
>> net/ipv6/protocol.c:30:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct inet6_protocol const *__new @@
   net/ipv6/protocol.c:30:17: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:30:17: sparse:     got struct inet6_protocol const *__new
>> net/ipv6/protocol.c:30:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct inet6_protocol const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:30:17: sparse:     expected struct inet6_protocol const *__ret
   net/ipv6/protocol.c:30:17: sparse:     got unsigned long
>> net/ipv6/protocol.c:30:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct inet6_protocol const *__old @@
   net/ipv6/protocol.c:30:17: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:30:17: sparse:     got struct inet6_protocol const *__old
>> net/ipv6/protocol.c:30:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct inet6_protocol const *__new @@
   net/ipv6/protocol.c:30:17: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:30:17: sparse:     got struct inet6_protocol const *__new
>> net/ipv6/protocol.c:30:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct inet6_protocol const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:30:17: sparse:     expected struct inet6_protocol const *__ret
   net/ipv6/protocol.c:30:17: sparse:     got unsigned long
   net/ipv6/protocol.c:39:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct inet6_protocol const *__old @@
   net/ipv6/protocol.c:39:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:39:16: sparse:     got struct inet6_protocol const *__old
   net/ipv6/protocol.c:39:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct inet6_protocol const *__new @@
   net/ipv6/protocol.c:39:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:39:16: sparse:     got struct inet6_protocol const *__new
   net/ipv6/protocol.c:39:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct inet6_protocol const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:39:16: sparse:     expected struct inet6_protocol const *__ret
   net/ipv6/protocol.c:39:16: sparse:     got unsigned long
   net/ipv6/protocol.c:39:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct inet6_protocol const *__old @@
   net/ipv6/protocol.c:39:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:39:16: sparse:     got struct inet6_protocol const *__old
   net/ipv6/protocol.c:39:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct inet6_protocol const *__new @@
   net/ipv6/protocol.c:39:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:39:16: sparse:     got struct inet6_protocol const *__new
   net/ipv6/protocol.c:39:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct inet6_protocol const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:39:16: sparse:     expected struct inet6_protocol const *__ret
   net/ipv6/protocol.c:39:16: sparse:     got unsigned long
>> net/ipv6/protocol.c:54:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv6/protocol.c:54:17: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:54:17: sparse:     got struct net_offload const *__old
>> net/ipv6/protocol.c:54:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv6/protocol.c:54:17: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:54:17: sparse:     got struct net_offload const *__new
>> net/ipv6/protocol.c:54:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:54:17: sparse:     expected struct net_offload const *__ret
   net/ipv6/protocol.c:54:17: sparse:     got unsigned long
>> net/ipv6/protocol.c:54:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv6/protocol.c:54:17: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:54:17: sparse:     got struct net_offload const *__old
>> net/ipv6/protocol.c:54:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv6/protocol.c:54:17: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:54:17: sparse:     got struct net_offload const *__new
>> net/ipv6/protocol.c:54:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:54:17: sparse:     expected struct net_offload const *__ret
   net/ipv6/protocol.c:54:17: sparse:     got unsigned long
   net/ipv6/protocol.c:63:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv6/protocol.c:63:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:63:16: sparse:     got struct net_offload const *__old
   net/ipv6/protocol.c:63:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv6/protocol.c:63:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:63:16: sparse:     got struct net_offload const *__new
   net/ipv6/protocol.c:63:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:63:16: sparse:     expected struct net_offload const *__ret
   net/ipv6/protocol.c:63:16: sparse:     got unsigned long
   net/ipv6/protocol.c:63:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct net_offload const *__old @@
   net/ipv6/protocol.c:63:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/protocol.c:63:16: sparse:     got struct net_offload const *__old
   net/ipv6/protocol.c:63:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct net_offload const *__new @@
   net/ipv6/protocol.c:63:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/protocol.c:63:16: sparse:     got struct net_offload const *__new
   net/ipv6/protocol.c:63:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_offload const *__ret @@     got unsigned long @@
   net/ipv6/protocol.c:63:16: sparse:     expected struct net_offload const *__ret
   net/ipv6/protocol.c:63:16: sparse:     got unsigned long
--
>> net/ipv6/ip6_tunnel.c:1768:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip6_tnl_encap_ops const *__old @@
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     expected unsigned long [usertype] old
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     got struct ip6_tnl_encap_ops const *__old
>> net/ipv6/ip6_tunnel.c:1768:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip6_tnl_encap_ops const *__new @@
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     expected unsigned long [usertype] new
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     got struct ip6_tnl_encap_ops const *__new
>> net/ipv6/ip6_tunnel.c:1768:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip6_tnl_encap_ops const *__ret @@     got unsigned long @@
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     expected struct ip6_tnl_encap_ops const *__ret
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     got unsigned long
>> net/ipv6/ip6_tunnel.c:1768:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip6_tnl_encap_ops const *__old @@
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     expected unsigned long [usertype] old
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     got struct ip6_tnl_encap_ops const *__old
>> net/ipv6/ip6_tunnel.c:1768:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip6_tnl_encap_ops const *__new @@
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     expected unsigned long [usertype] new
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     got struct ip6_tnl_encap_ops const *__new
>> net/ipv6/ip6_tunnel.c:1768:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip6_tnl_encap_ops const *__ret @@     got unsigned long @@
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     expected struct ip6_tnl_encap_ops const *__ret
   net/ipv6/ip6_tunnel.c:1768:17: sparse:     got unsigned long
   net/ipv6/ip6_tunnel.c:1782:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip6_tnl_encap_ops const *__old @@
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     got struct ip6_tnl_encap_ops const *__old
   net/ipv6/ip6_tunnel.c:1782:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip6_tnl_encap_ops const *__new @@
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     got struct ip6_tnl_encap_ops const *__new
   net/ipv6/ip6_tunnel.c:1782:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip6_tnl_encap_ops const *__ret @@     got unsigned long @@
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     expected struct ip6_tnl_encap_ops const *__ret
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     got unsigned long
   net/ipv6/ip6_tunnel.c:1782:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct ip6_tnl_encap_ops const *__old @@
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     got struct ip6_tnl_encap_ops const *__old
   net/ipv6/ip6_tunnel.c:1782:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct ip6_tnl_encap_ops const *__new @@
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     got struct ip6_tnl_encap_ops const *__new
   net/ipv6/ip6_tunnel.c:1782:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct ip6_tnl_encap_ops const *__ret @@     got unsigned long @@
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     expected struct ip6_tnl_encap_ops const *__ret
   net/ipv6/ip6_tunnel.c:1782:16: sparse:     got unsigned long
--
>> net/ipv6/route.c:1433:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rt6_info *__old @@
   net/ipv6/route.c:1433:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/route.c:1433:16: sparse:     got struct rt6_info *__old
>> net/ipv6/route.c:1433:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rt6_info *__new @@
   net/ipv6/route.c:1433:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/route.c:1433:16: sparse:     got struct rt6_info *__new
>> net/ipv6/route.c:1433:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rt6_info *__ret @@     got unsigned long @@
   net/ipv6/route.c:1433:16: sparse:     expected struct rt6_info *__ret
   net/ipv6/route.c:1433:16: sparse:     got unsigned long
>> net/ipv6/route.c:1433:16: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rt6_info *__old @@
   net/ipv6/route.c:1433:16: sparse:     expected unsigned long [usertype] old
   net/ipv6/route.c:1433:16: sparse:     got struct rt6_info *__old
>> net/ipv6/route.c:1433:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rt6_info *__new @@
   net/ipv6/route.c:1433:16: sparse:     expected unsigned long [usertype] new
   net/ipv6/route.c:1433:16: sparse:     got struct rt6_info *__new
>> net/ipv6/route.c:1433:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rt6_info *__ret @@     got unsigned long @@
   net/ipv6/route.c:1433:16: sparse:     expected struct rt6_info *__ret
   net/ipv6/route.c:1433:16: sparse:     got unsigned long
   net/ipv6/route.c:2342:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 @@
   net/ipv6/route.c:2342:39: sparse:     expected unsigned int [usertype] flow_label
   net/ipv6/route.c:2342:39: sparse:     got restricted __be32
--
>> net/mptcp/mib.c:85:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct mptcp_mib [noderef] __percpu *__old @@
   net/mptcp/mib.c:85:13: sparse:     expected unsigned long [usertype] old
   net/mptcp/mib.c:85:13: sparse:     got struct mptcp_mib [noderef] __percpu *__old
>> net/mptcp/mib.c:85:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct mptcp_mib [noderef] __percpu *__new @@
   net/mptcp/mib.c:85:13: sparse:     expected unsigned long [usertype] new
   net/mptcp/mib.c:85:13: sparse:     got struct mptcp_mib [noderef] __percpu *__new
>> net/mptcp/mib.c:85:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct mptcp_mib [noderef] __percpu *__ret @@     got unsigned long @@
   net/mptcp/mib.c:85:13: sparse:     expected struct mptcp_mib [noderef] __percpu *__ret
   net/mptcp/mib.c:85:13: sparse:     got unsigned long
>> net/mptcp/mib.c:85:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct mptcp_mib [noderef] __percpu *__old @@
   net/mptcp/mib.c:85:13: sparse:     expected unsigned long [usertype] old
   net/mptcp/mib.c:85:13: sparse:     got struct mptcp_mib [noderef] __percpu *__old
>> net/mptcp/mib.c:85:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct mptcp_mib [noderef] __percpu *__new @@
   net/mptcp/mib.c:85:13: sparse:     expected unsigned long [usertype] new
   net/mptcp/mib.c:85:13: sparse:     got struct mptcp_mib [noderef] __percpu *__new
>> net/mptcp/mib.c:85:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct mptcp_mib [noderef] __percpu *__ret @@     got unsigned long @@
   net/mptcp/mib.c:85:13: sparse:     expected struct mptcp_mib [noderef] __percpu *__ret
   net/mptcp/mib.c:85:13: sparse:     got unsigned long
   net/mptcp/mib.c:85:13: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/sunrpc/auth.c:113:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rpc_authops const *__old @@
   net/sunrpc/auth.c:113:15: sparse:     expected unsigned long [usertype] old
   net/sunrpc/auth.c:113:15: sparse:     got struct rpc_authops const *__old
>> net/sunrpc/auth.c:113:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rpc_authops const *__new @@
   net/sunrpc/auth.c:113:15: sparse:     expected unsigned long [usertype] new
   net/sunrpc/auth.c:113:15: sparse:     got struct rpc_authops const *__new
>> net/sunrpc/auth.c:113:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rpc_authops const *__ret @@     got unsigned long @@
   net/sunrpc/auth.c:113:15: sparse:     expected struct rpc_authops const *__ret
   net/sunrpc/auth.c:113:15: sparse:     got unsigned long
>> net/sunrpc/auth.c:113:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rpc_authops const *__old @@
   net/sunrpc/auth.c:113:15: sparse:     expected unsigned long [usertype] old
   net/sunrpc/auth.c:113:15: sparse:     got struct rpc_authops const *__old
>> net/sunrpc/auth.c:113:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rpc_authops const *__new @@
   net/sunrpc/auth.c:113:15: sparse:     expected unsigned long [usertype] new
   net/sunrpc/auth.c:113:15: sparse:     got struct rpc_authops const *__new
>> net/sunrpc/auth.c:113:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rpc_authops const *__ret @@     got unsigned long @@
   net/sunrpc/auth.c:113:15: sparse:     expected struct rpc_authops const *__ret
   net/sunrpc/auth.c:113:15: sparse:     got unsigned long
   net/sunrpc/auth.c:129:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rpc_authops const *__old @@
   net/sunrpc/auth.c:129:15: sparse:     expected unsigned long [usertype] old
   net/sunrpc/auth.c:129:15: sparse:     got struct rpc_authops const *__old
   net/sunrpc/auth.c:129:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rpc_authops const *__new @@
   net/sunrpc/auth.c:129:15: sparse:     expected unsigned long [usertype] new
   net/sunrpc/auth.c:129:15: sparse:     got struct rpc_authops const *__new
   net/sunrpc/auth.c:129:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rpc_authops const *__ret @@     got unsigned long @@
   net/sunrpc/auth.c:129:15: sparse:     expected struct rpc_authops const *__ret
   net/sunrpc/auth.c:129:15: sparse:     got unsigned long
   net/sunrpc/auth.c:129:15: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rpc_authops const *__old @@
   net/sunrpc/auth.c:129:15: sparse:     expected unsigned long [usertype] old
   net/sunrpc/auth.c:129:15: sparse:     got struct rpc_authops const *__old
   net/sunrpc/auth.c:129:15: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rpc_authops const *__new @@
   net/sunrpc/auth.c:129:15: sparse:     expected unsigned long [usertype] new
   net/sunrpc/auth.c:129:15: sparse:     got struct rpc_authops const *__new
   net/sunrpc/auth.c:129:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rpc_authops const *__ret @@     got unsigned long @@
   net/sunrpc/auth.c:129:15: sparse:     expected struct rpc_authops const *__ret
   net/sunrpc/auth.c:129:15: sparse:     got unsigned long
   net/sunrpc/auth.c:628:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *extern [addressable] [toplevel] cred @@
   net/sunrpc/auth.c:628:34: sparse:     expected struct cred const *cred
   net/sunrpc/auth.c:628:34: sparse:     got struct cred const [noderef] __rcu *extern [addressable] [toplevel] cred
--
>> net/sunrpc/svcauth.c:147:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct auth_ops *__old @@
   net/sunrpc/svcauth.c:147:23: sparse:     expected unsigned long [usertype] old
   net/sunrpc/svcauth.c:147:23: sparse:     got struct auth_ops *__old
>> net/sunrpc/svcauth.c:147:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct auth_ops *__new @@
   net/sunrpc/svcauth.c:147:23: sparse:     expected unsigned long [usertype] new
   net/sunrpc/svcauth.c:147:23: sparse:     got struct auth_ops *__new
>> net/sunrpc/svcauth.c:147:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct auth_ops *__ret @@     got unsigned long @@
   net/sunrpc/svcauth.c:147:23: sparse:     expected struct auth_ops *__ret
   net/sunrpc/svcauth.c:147:23: sparse:     got unsigned long
>> net/sunrpc/svcauth.c:147:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct auth_ops *__old @@
   net/sunrpc/svcauth.c:147:23: sparse:     expected unsigned long [usertype] old
   net/sunrpc/svcauth.c:147:23: sparse:     got struct auth_ops *__old
>> net/sunrpc/svcauth.c:147:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct auth_ops *__new @@
   net/sunrpc/svcauth.c:147:23: sparse:     expected unsigned long [usertype] new
   net/sunrpc/svcauth.c:147:23: sparse:     got struct auth_ops *__new
>> net/sunrpc/svcauth.c:147:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct auth_ops *__ret @@     got unsigned long @@
   net/sunrpc/svcauth.c:147:23: sparse:     expected struct auth_ops *__ret
   net/sunrpc/svcauth.c:147:23: sparse:     got unsigned long
--
>> kernel/sched/core.c:961:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct wake_q_node *__old @@
   kernel/sched/core.c:961:13: sparse:     expected unsigned long [usertype] old
   kernel/sched/core.c:961:13: sparse:     got struct wake_q_node *__old
>> kernel/sched/core.c:961:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct wake_q_node *__new @@
   kernel/sched/core.c:961:13: sparse:     expected unsigned long [usertype] new
   kernel/sched/core.c:961:13: sparse:     got struct wake_q_node *__new
>> kernel/sched/core.c:961:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct wake_q_node *__ret @@     got unsigned long @@
   kernel/sched/core.c:961:13: sparse:     expected struct wake_q_node *__ret
   kernel/sched/core.c:961:13: sparse:     got unsigned long
>> kernel/sched/core.c:961:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct wake_q_node *__old @@
   kernel/sched/core.c:961:13: sparse:     expected unsigned long [usertype] old
   kernel/sched/core.c:961:13: sparse:     got struct wake_q_node *__old
>> kernel/sched/core.c:961:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct wake_q_node *__new @@
   kernel/sched/core.c:961:13: sparse:     expected unsigned long [usertype] new
   kernel/sched/core.c:961:13: sparse:     got struct wake_q_node *__new
>> kernel/sched/core.c:961:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct wake_q_node *__ret @@     got unsigned long @@
   kernel/sched/core.c:961:13: sparse:     expected struct wake_q_node *__ret
   kernel/sched/core.c:961:13: sparse:     got unsigned long
   kernel/sched/core.c:1043:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1043:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1043:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2248:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2248:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2248:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2248:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2248:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2248:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5669:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5669:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5669:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6627:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6627:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6627:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7200:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7200:17: sparse:    struct task_struct *
   kernel/sched/core.c:7200:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7415:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7415:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7415:22: sparse:    struct task_struct *
   kernel/sched/core.c:11503:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11503:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11503:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1353:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:552:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1353:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:585:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:601:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:638:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:639:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:679:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:680:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:2239:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2240:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2241:18: sparse: sparse: dereference of noderef expression
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2325:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2325:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2325:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2325:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2325:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct *
   kernel/sched/core.c:8436:9: sparse: sparse: context imbalance in 'sched_setaffinity' - different lock contexts for basic block
   kernel/sched/core.c:8498:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/core.c:8661:28: sparse: sparse: context imbalance in '__cond_resched_lock' - unexpected unlock
   kernel/sched/core.c:8679:17: sparse: sparse: context imbalance in '__cond_resched_rwlock_read' - unexpected unlock
   kernel/sched/core.c:8697:17: sparse: sparse: context imbalance in '__cond_resched_rwlock_write' - unexpected unlock
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2153:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2325:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2325:9: sparse:    struct task_struct *
--
>> kernel/rcu/rcutorture.c:1754:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rcu_torture_reader_check *__old @@
   kernel/rcu/rcutorture.c:1754:21: sparse:     expected unsigned long [usertype] old
   kernel/rcu/rcutorture.c:1754:21: sparse:     got struct rcu_torture_reader_check *__old
>> kernel/rcu/rcutorture.c:1754:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rcu_torture_reader_check *__new @@
   kernel/rcu/rcutorture.c:1754:21: sparse:     expected unsigned long [usertype] new
   kernel/rcu/rcutorture.c:1754:21: sparse:     got struct rcu_torture_reader_check *__new
>> kernel/rcu/rcutorture.c:1754:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rcu_torture_reader_check *__ret @@     got unsigned long @@
   kernel/rcu/rcutorture.c:1754:21: sparse:     expected struct rcu_torture_reader_check *__ret
   kernel/rcu/rcutorture.c:1754:21: sparse:     got unsigned long
>> kernel/rcu/rcutorture.c:1754:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rcu_torture_reader_check *__old @@
   kernel/rcu/rcutorture.c:1754:21: sparse:     expected unsigned long [usertype] old
   kernel/rcu/rcutorture.c:1754:21: sparse:     got struct rcu_torture_reader_check *__old
>> kernel/rcu/rcutorture.c:1754:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rcu_torture_reader_check *__new @@
   kernel/rcu/rcutorture.c:1754:21: sparse:     expected unsigned long [usertype] new
   kernel/rcu/rcutorture.c:1754:21: sparse:     got struct rcu_torture_reader_check *__new
>> kernel/rcu/rcutorture.c:1754:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rcu_torture_reader_check *__ret @@     got unsigned long @@
   kernel/rcu/rcutorture.c:1754:21: sparse:     expected struct rcu_torture_reader_check *__ret
   kernel/rcu/rcutorture.c:1754:21: sparse:     got unsigned long
   kernel/rcu/rcutorture.c:1755:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rcu_torture_reader_check *__old @@
   kernel/rcu/rcutorture.c:1755:21: sparse:     expected unsigned long [usertype] old
   kernel/rcu/rcutorture.c:1755:21: sparse:     got struct rcu_torture_reader_check *__old
   kernel/rcu/rcutorture.c:1755:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rcu_torture_reader_check *__new @@
   kernel/rcu/rcutorture.c:1755:21: sparse:     expected unsigned long [usertype] new
   kernel/rcu/rcutorture.c:1755:21: sparse:     got struct rcu_torture_reader_check *__new
   kernel/rcu/rcutorture.c:1755:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rcu_torture_reader_check *__ret @@     got unsigned long @@
   kernel/rcu/rcutorture.c:1755:21: sparse:     expected struct rcu_torture_reader_check *__ret
   kernel/rcu/rcutorture.c:1755:21: sparse:     got unsigned long
   kernel/rcu/rcutorture.c:1755:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rcu_torture_reader_check *__old @@
   kernel/rcu/rcutorture.c:1755:21: sparse:     expected unsigned long [usertype] old
   kernel/rcu/rcutorture.c:1755:21: sparse:     got struct rcu_torture_reader_check *__old
   kernel/rcu/rcutorture.c:1755:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rcu_torture_reader_check *__new @@
   kernel/rcu/rcutorture.c:1755:21: sparse:     expected unsigned long [usertype] new
   kernel/rcu/rcutorture.c:1755:21: sparse:     got struct rcu_torture_reader_check *__new
   kernel/rcu/rcutorture.c:1755:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rcu_torture_reader_check *__ret @@     got unsigned long @@
   kernel/rcu/rcutorture.c:1755:21: sparse:     expected struct rcu_torture_reader_check *__ret
   kernel/rcu/rcutorture.c:1755:21: sparse:     got unsigned long
   kernel/rcu/rcutorture.c:1756:31: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rcu_torture_reader_check *__old @@
   kernel/rcu/rcutorture.c:1756:31: sparse:     expected unsigned long [usertype] old
   kernel/rcu/rcutorture.c:1756:31: sparse:     got struct rcu_torture_reader_check *__old
   kernel/rcu/rcutorture.c:1756:31: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rcu_torture_reader_check *__new @@
   kernel/rcu/rcutorture.c:1756:31: sparse:     expected unsigned long [usertype] new
   kernel/rcu/rcutorture.c:1756:31: sparse:     got struct rcu_torture_reader_check *__new
   kernel/rcu/rcutorture.c:1756:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rcu_torture_reader_check *__ret @@     got unsigned long @@
   kernel/rcu/rcutorture.c:1756:31: sparse:     expected struct rcu_torture_reader_check *__ret
   kernel/rcu/rcutorture.c:1756:31: sparse:     got unsigned long
   kernel/rcu/rcutorture.c:1756:31: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct rcu_torture_reader_check *__old @@
   kernel/rcu/rcutorture.c:1756:31: sparse:     expected unsigned long [usertype] old
   kernel/rcu/rcutorture.c:1756:31: sparse:     got struct rcu_torture_reader_check *__old
   kernel/rcu/rcutorture.c:1756:31: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct rcu_torture_reader_check *__new @@
   kernel/rcu/rcutorture.c:1756:31: sparse:     expected unsigned long [usertype] new
   kernel/rcu/rcutorture.c:1756:31: sparse:     got struct rcu_torture_reader_check *__new
   kernel/rcu/rcutorture.c:1756:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct rcu_torture_reader_check *__ret @@     got unsigned long @@
   kernel/rcu/rcutorture.c:1756:31: sparse:     expected struct rcu_torture_reader_check *__ret
   kernel/rcu/rcutorture.c:1756:31: sparse:     got unsigned long
   kernel/rcu/rcutorture.c:404:12: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c:446:13: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:631:12: sparse: sparse: context imbalance in 'srcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:301:9: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:1854:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
--
   fs/notify/mark.c:559:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsnotify_mark_connector [noderef] __rcu *_n_ @@     got struct fsnotify_mark_connector *[assigned] conn @@
   fs/notify/mark.c:559:13: sparse:     expected struct fsnotify_mark_connector [noderef] __rcu *_n_
   fs/notify/mark.c:559:13: sparse:     got struct fsnotify_mark_connector *[assigned] conn
>> fs/notify/mark.c:559:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fsnotify_mark_connector [noderef] __rcu *__old @@
   fs/notify/mark.c:559:13: sparse:     expected unsigned long [usertype] old
   fs/notify/mark.c:559:13: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *__old
>> fs/notify/mark.c:559:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fsnotify_mark_connector [noderef] __rcu *__new @@
   fs/notify/mark.c:559:13: sparse:     expected unsigned long [usertype] new
   fs/notify/mark.c:559:13: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *__new
>> fs/notify/mark.c:559:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fsnotify_mark_connector [noderef] __rcu *__ret @@     got unsigned long @@
   fs/notify/mark.c:559:13: sparse:     expected struct fsnotify_mark_connector [noderef] __rcu *__ret
   fs/notify/mark.c:559:13: sparse:     got unsigned long
>> fs/notify/mark.c:559:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fsnotify_mark_connector [noderef] __rcu *__old @@
   fs/notify/mark.c:559:13: sparse:     expected unsigned long [usertype] old
   fs/notify/mark.c:559:13: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *__old
>> fs/notify/mark.c:559:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fsnotify_mark_connector [noderef] __rcu *__new @@
   fs/notify/mark.c:559:13: sparse:     expected unsigned long [usertype] new
   fs/notify/mark.c:559:13: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *__new
>> fs/notify/mark.c:559:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fsnotify_mark_connector [noderef] __rcu *__ret @@     got unsigned long @@
   fs/notify/mark.c:559:13: sparse:     expected struct fsnotify_mark_connector [noderef] __rcu *__ret
   fs/notify/mark.c:559:13: sparse:     got unsigned long
   fs/notify/mark.c:559:13: sparse: sparse: cast removes address space '__rcu' of expression
   fs/notify/mark.c:322:9: sparse: sparse: context imbalance in 'fsnotify_put_mark' - unexpected unlock
   fs/notify/mark.c:574:39: sparse: sparse: context imbalance in 'fsnotify_grab_connector' - different lock contexts for basic block
   fs/notify/mark.c:659:20: sparse: sparse: context imbalance in 'fsnotify_add_mark_list' - unexpected unlock
   fs/notify/mark.c:739:25: sparse: sparse: context imbalance in 'fsnotify_find_mark' - unexpected unlock
   fs/notify/mark.c:813:17: sparse: sparse: context imbalance in 'fsnotify_destroy_marks' - unexpected unlock
--
>> kernel/trace/ring_buffer.c:1434:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct buffer_page *__old @@
   kernel/trace/ring_buffer.c:1434:23: sparse:     expected unsigned long [usertype] old
   kernel/trace/ring_buffer.c:1434:23: sparse:     got struct buffer_page *__old
>> kernel/trace/ring_buffer.c:1434:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct buffer_page *__new @@
   kernel/trace/ring_buffer.c:1434:23: sparse:     expected unsigned long [usertype] new
   kernel/trace/ring_buffer.c:1434:23: sparse:     got struct buffer_page *__new
>> kernel/trace/ring_buffer.c:1434:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct buffer_page *__ret @@     got unsigned long @@
   kernel/trace/ring_buffer.c:1434:23: sparse:     expected struct buffer_page *__ret
   kernel/trace/ring_buffer.c:1434:23: sparse:     got unsigned long
>> kernel/trace/ring_buffer.c:1434:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct buffer_page *__old @@
   kernel/trace/ring_buffer.c:1434:23: sparse:     expected unsigned long [usertype] old
   kernel/trace/ring_buffer.c:1434:23: sparse:     got struct buffer_page *__old
>> kernel/trace/ring_buffer.c:1434:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct buffer_page *__new @@
   kernel/trace/ring_buffer.c:1434:23: sparse:     expected unsigned long [usertype] new
   kernel/trace/ring_buffer.c:1434:23: sparse:     got struct buffer_page *__new
>> kernel/trace/ring_buffer.c:1434:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct buffer_page *__ret @@     got unsigned long @@
   kernel/trace/ring_buffer.c:1434:23: sparse:     expected struct buffer_page *__ret
   kernel/trace/ring_buffer.c:1434:23: sparse:     got unsigned long
>> kernel/trace/ring_buffer.c:1960:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct list_head *__old @@
   kernel/trace/ring_buffer.c:1960:21: sparse:     expected unsigned long [usertype] old
   kernel/trace/ring_buffer.c:1960:21: sparse:     got struct list_head *__old
>> kernel/trace/ring_buffer.c:1960:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct list_head *__new @@
   kernel/trace/ring_buffer.c:1960:21: sparse:     expected unsigned long [usertype] new
   kernel/trace/ring_buffer.c:1960:21: sparse:     got struct list_head *__new
>> kernel/trace/ring_buffer.c:1960:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct list_head *__ret @@     got unsigned long @@
   kernel/trace/ring_buffer.c:1960:21: sparse:     expected struct list_head *__ret
   kernel/trace/ring_buffer.c:1960:21: sparse:     got unsigned long
>> kernel/trace/ring_buffer.c:1960:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct list_head *__old @@
   kernel/trace/ring_buffer.c:1960:21: sparse:     expected unsigned long [usertype] old
   kernel/trace/ring_buffer.c:1960:21: sparse:     got struct list_head *__old
>> kernel/trace/ring_buffer.c:1960:21: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct list_head *__new @@
   kernel/trace/ring_buffer.c:1960:21: sparse:     expected unsigned long [usertype] new
   kernel/trace/ring_buffer.c:1960:21: sparse:     got struct list_head *__new
>> kernel/trace/ring_buffer.c:1960:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct list_head *__ret @@     got unsigned long @@
   kernel/trace/ring_buffer.c:1960:21: sparse:     expected struct list_head *__ret
   kernel/trace/ring_buffer.c:1960:21: sparse:     got unsigned long
   kernel/trace/ring_buffer.c:4934:9: sparse: sparse: context imbalance in 'ring_buffer_peek' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5020:9: sparse: sparse: context imbalance in 'ring_buffer_consume' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5410:17: sparse: sparse: context imbalance in 'ring_buffer_empty' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5440:9: sparse: sparse: context imbalance in 'ring_buffer_empty_cpu' - different lock contexts for basic block
--
>> fs/crypto/keysetup.c:600:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fscrypt_inode_info *__old @@
   fs/crypto/keysetup.c:600:13: sparse:     expected unsigned long [usertype] old
   fs/crypto/keysetup.c:600:13: sparse:     got struct fscrypt_inode_info *__old
>> fs/crypto/keysetup.c:600:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fscrypt_inode_info *__new @@
   fs/crypto/keysetup.c:600:13: sparse:     expected unsigned long [usertype] new
   fs/crypto/keysetup.c:600:13: sparse:     got struct fscrypt_inode_info *__new
>> fs/crypto/keysetup.c:600:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fscrypt_inode_info *__ret @@     got unsigned long @@
   fs/crypto/keysetup.c:600:13: sparse:     expected struct fscrypt_inode_info *__ret
   fs/crypto/keysetup.c:600:13: sparse:     got unsigned long
>> fs/crypto/keysetup.c:600:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fscrypt_inode_info *__old @@
   fs/crypto/keysetup.c:600:13: sparse:     expected unsigned long [usertype] old
   fs/crypto/keysetup.c:600:13: sparse:     got struct fscrypt_inode_info *__old
>> fs/crypto/keysetup.c:600:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fscrypt_inode_info *__new @@
   fs/crypto/keysetup.c:600:13: sparse:     expected unsigned long [usertype] new
   fs/crypto/keysetup.c:600:13: sparse:     got struct fscrypt_inode_info *__new
>> fs/crypto/keysetup.c:600:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fscrypt_inode_info *__ret @@     got unsigned long @@
   fs/crypto/keysetup.c:600:13: sparse:     expected struct fscrypt_inode_info *__ret
   fs/crypto/keysetup.c:600:13: sparse:     got unsigned long
--
>> fs/crypto/hooks.c:398:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got char *__old @@
   fs/crypto/hooks.c:398:13: sparse:     expected unsigned long [usertype] old
   fs/crypto/hooks.c:398:13: sparse:     got char *__old
>> fs/crypto/hooks.c:398:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got char *__new @@
   fs/crypto/hooks.c:398:13: sparse:     expected unsigned long [usertype] new
   fs/crypto/hooks.c:398:13: sparse:     got char *__new
>> fs/crypto/hooks.c:398:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected char *__ret @@     got unsigned long @@
   fs/crypto/hooks.c:398:13: sparse:     expected char *__ret
   fs/crypto/hooks.c:398:13: sparse:     got unsigned long
>> fs/crypto/hooks.c:398:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got char *__old @@
   fs/crypto/hooks.c:398:13: sparse:     expected unsigned long [usertype] old
   fs/crypto/hooks.c:398:13: sparse:     got char *__old
>> fs/crypto/hooks.c:398:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got char *__new @@
   fs/crypto/hooks.c:398:13: sparse:     expected unsigned long [usertype] new
   fs/crypto/hooks.c:398:13: sparse:     got char *__new
>> fs/crypto/hooks.c:398:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected char *__ret @@     got unsigned long @@
   fs/crypto/hooks.c:398:13: sparse:     expected char *__ret
   fs/crypto/hooks.c:398:13: sparse:     got unsigned long
--
>> fs/verity/open.c:259:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fsverity_info *__old @@
   fs/verity/open.c:259:13: sparse:     expected unsigned long [usertype] old
   fs/verity/open.c:259:13: sparse:     got struct fsverity_info *__old
>> fs/verity/open.c:259:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fsverity_info *__new @@
   fs/verity/open.c:259:13: sparse:     expected unsigned long [usertype] new
   fs/verity/open.c:259:13: sparse:     got struct fsverity_info *__new
>> fs/verity/open.c:259:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fsverity_info *__ret @@     got unsigned long @@
   fs/verity/open.c:259:13: sparse:     expected struct fsverity_info *__ret
   fs/verity/open.c:259:13: sparse:     got unsigned long
>> fs/verity/open.c:259:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct fsverity_info *__old @@
   fs/verity/open.c:259:13: sparse:     expected unsigned long [usertype] old
   fs/verity/open.c:259:13: sparse:     got struct fsverity_info *__old
>> fs/verity/open.c:259:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct fsverity_info *__new @@
   fs/verity/open.c:259:13: sparse:     expected unsigned long [usertype] new
   fs/verity/open.c:259:13: sparse:     got struct fsverity_info *__new
>> fs/verity/open.c:259:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct fsverity_info *__ret @@     got unsigned long @@
   fs/verity/open.c:259:13: sparse:     expected struct fsverity_info *__ret
   fs/verity/open.c:259:13: sparse:     got unsigned long
--
>> kernel/bpf/bpf_local_storage.c:495:24: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_local_storage *__old @@
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     expected unsigned long [usertype] old
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     got struct bpf_local_storage *__old
>> kernel/bpf/bpf_local_storage.c:495:24: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_local_storage *__new @@
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     expected unsigned long [usertype] new
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     got struct bpf_local_storage *__new
>> kernel/bpf/bpf_local_storage.c:495:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_local_storage *__ret @@     got unsigned long @@
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     expected struct bpf_local_storage *__ret
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     got unsigned long
>> kernel/bpf/bpf_local_storage.c:495:24: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_local_storage *__old @@
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     expected unsigned long [usertype] old
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     got struct bpf_local_storage *__old
>> kernel/bpf/bpf_local_storage.c:495:24: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_local_storage *__new @@
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     expected unsigned long [usertype] new
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     got struct bpf_local_storage *__new
>> kernel/bpf/bpf_local_storage.c:495:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_local_storage *__ret @@     got unsigned long @@
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     expected struct bpf_local_storage *__ret
   kernel/bpf/bpf_local_storage.c:495:24: sparse:     got unsigned long
--
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got struct bpf_dtab_netdev [noderef] __rcu *__old @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] old
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__old
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got struct bpf_dtab_netdev [noderef] __rcu *__new @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected unsigned long [usertype] new
   kernel/bpf/devmap.c:1137:40: sparse:     got struct bpf_dtab_netdev [noderef] __rcu *__new
>> kernel/bpf/devmap.c:1137:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev [noderef] __rcu *__ret @@     got unsigned long @@
   kernel/bpf/devmap.c:1137:40: sparse:     expected struct bpf_dtab_netdev [noderef] __rcu *__ret
   kernel/bpf/devmap.c:1137:40: sparse:     got unsigned long
   kernel/bpf/devmap.c:1137:40: sparse: sparse: cast removes address space '__rcu' of expression
--
>> kernel/bpf/helpers.c:1997:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got void *__old @@
   kernel/bpf/helpers.c:1997:13: sparse:     expected unsigned long [usertype] old
   kernel/bpf/helpers.c:1997:13: sparse:     got void *__old
>> kernel/bpf/helpers.c:1997:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got void *__new @@
   kernel/bpf/helpers.c:1997:13: sparse:     expected unsigned long [usertype] new
   kernel/bpf/helpers.c:1997:13: sparse:     got void *__new
>> kernel/bpf/helpers.c:1997:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected void *__ret @@     got unsigned long @@
   kernel/bpf/helpers.c:1997:13: sparse:     expected void *__ret
   kernel/bpf/helpers.c:1997:13: sparse:     got unsigned long
>> kernel/bpf/helpers.c:1997:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got void *__old @@
   kernel/bpf/helpers.c:1997:13: sparse:     expected unsigned long [usertype] old
   kernel/bpf/helpers.c:1997:13: sparse:     got void *__old
>> kernel/bpf/helpers.c:1997:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got void *__new @@
   kernel/bpf/helpers.c:1997:13: sparse:     expected unsigned long [usertype] new
   kernel/bpf/helpers.c:1997:13: sparse:     got void *__new
>> kernel/bpf/helpers.c:1997:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected void *__ret @@     got unsigned long @@
   kernel/bpf/helpers.c:1997:13: sparse:     expected void *__ret
   kernel/bpf/helpers.c:1997:13: sparse:     got unsigned long
   kernel/bpf/helpers.c:2096:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got void *__old @@
   kernel/bpf/helpers.c:2096:13: sparse:     expected unsigned long [usertype] old
   kernel/bpf/helpers.c:2096:13: sparse:     got void *__old
   kernel/bpf/helpers.c:2096:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got void *__new @@
   kernel/bpf/helpers.c:2096:13: sparse:     expected unsigned long [usertype] new
   kernel/bpf/helpers.c:2096:13: sparse:     got void *__new
   kernel/bpf/helpers.c:2096:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected void *__ret @@     got unsigned long @@
   kernel/bpf/helpers.c:2096:13: sparse:     expected void *__ret
   kernel/bpf/helpers.c:2096:13: sparse:     got unsigned long
   kernel/bpf/helpers.c:2096:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got void *__old @@
   kernel/bpf/helpers.c:2096:13: sparse:     expected unsigned long [usertype] old
   kernel/bpf/helpers.c:2096:13: sparse:     got void *__old
   kernel/bpf/helpers.c:2096:13: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got void *__new @@
   kernel/bpf/helpers.c:2096:13: sparse:     expected unsigned long [usertype] new
   kernel/bpf/helpers.c:2096:13: sparse:     got void *__new
   kernel/bpf/helpers.c:2096:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected void *__ret @@     got unsigned long @@
   kernel/bpf/helpers.c:2096:13: sparse:     expected void *__ret
   kernel/bpf/helpers.c:2096:13: sparse:     got unsigned long
   kernel/bpf/helpers.c:2157:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2187:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2495:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2500:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +576 fs/nfs/nfs4idmap.c

e9ab41b620e4b6 fs/nfs/idmap.c     Trond Myklebust 2012-09-27  571  
51fd2eb52c0ca8 fs/nfs/nfs4idmap.c Trond Myklebust 2022-07-13  572  static void nfs_idmap_abort_pipe_upcall(struct idmap *idmap,
51fd2eb52c0ca8 fs/nfs/nfs4idmap.c Trond Myklebust 2022-07-13  573  					struct idmap_legacy_upcalldata *data,
51fd2eb52c0ca8 fs/nfs/nfs4idmap.c Trond Myklebust 2022-07-13  574  					int ret)
e9ab41b620e4b6 fs/nfs/idmap.c     Trond Myklebust 2012-09-27  575  {
51fd2eb52c0ca8 fs/nfs/nfs4idmap.c Trond Myklebust 2022-07-13 @576  	if (cmpxchg(&idmap->idmap_upcall_data, data, NULL) == data)
51fd2eb52c0ca8 fs/nfs/nfs4idmap.c Trond Myklebust 2022-07-13  577  		nfs_idmap_complete_pipe_upcall(data, ret);
e9ab41b620e4b6 fs/nfs/idmap.c     Trond Myklebust 2012-09-27  578  }
e9ab41b620e4b6 fs/nfs/idmap.c     Trond Myklebust 2012-09-27  579  

:::::: The code at line 576 was first introduced by commit
:::::: 51fd2eb52c0ca8275a906eed81878ef50ae94eb0 NFSv4: Fix races in the legacy idmapper upcall

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
