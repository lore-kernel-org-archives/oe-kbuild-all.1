Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023C3A1E8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766014342; cv=none; b=kM/t35JbkD05gv1WpzpEnhIx7vVEYipzVupjZ2cTeQBl3R8IKyTGySuhl1nlLtQ83tSp57KFI+eb2lpRLcBr3JAav3SDdIIyQOLEE4p7L+Ovcz7SC8d3cgIIrmvsG0m8uIwJnhZQCtFfuabaZmUvIf4tjVniygMGUz6MglZ7qiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766014342; c=relaxed/simple;
	bh=cpvfY78kAt4ECWJzWG/UGbEtCB4TKaHRiaH1D01qayE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRv6bi+tfijJRvVz7dUDrIWUaofb9jut59B62BRvW12cm6zxu5Gs3w+MsZJJ6VpzEiNHlQfAn16NoBTQFvo9iYtG9YRCGHpV/xp9eJmIyGuw4IwLFXjwdBhi7lMMXSrX3cvbzC/GtYyEnNjVSLBPEHcp7R87hX/ULDn8DcCDV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZBCMUPX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZBCMUPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766014341; x=1797550341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpvfY78kAt4ECWJzWG/UGbEtCB4TKaHRiaH1D01qayE=;
  b=ZZBCMUPX7578QqtOqun/PKX49cUZZf1AczrxeEyEOsgd0tMHS4nyY9KK
   lRigBChK0C+ZXlKv2/8d73ye2N54EhLg2S5gFDsVki2GEBmkzui3wpkOp
   fTm5on200JGE+/ZxqWB58HDXlBFTrHNMpRh03imbD9CfMh1shxEp257fc
   F5nl6MUukebgNioqp4hJRr9cHMxYi1+11Q8oDOKbA5z+U7jEagQ1s9nID
   HyCjDVWKf71mn2LcCqbyZRw0wp+h0tdUwTki+lYAK7Ns48PwZ6RJF9wCm
   83MTGv4Vc2r8BZn9RbK5Pq6jU2UChah99lse6bnK3qB0IdTDeEz+FLHjf
   g==;
X-CSE-ConnectionGUID: wgUQ7RQAS4W2Cm0naUDJTg==
X-CSE-MsgGUID: VVpWyI+GTD6PuXq0arZNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78276320"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78276320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:32:21 -0800
X-CSE-ConnectionGUID: lN77d4k/QES3wLqAEK+pRw==
X-CSE-MsgGUID: Yv0mS5cEQYKWSgejS/YaWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202937387"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2025 15:32:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW10D-000000001Lb-14gr;
	Wed, 17 Dec 2025 23:32:17 +0000
Date: Thu, 18 Dec 2025 07:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2] drivers/md/dm-bow.c:793:6:
 sparse: sparse: symbol 'dm_bow_resume' was not declared. Should it be
 static?
Message-ID: <202512180737.exbUH1CS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 88e27b17aab604fb2d486e538b2ef55cd967a430 [0/2] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: x86_64-randconfig-123-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180737.exbUH1CS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180737.exbUH1CS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180737.exbUH1CS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was not declared. Should it be static?
   drivers/md/dm-bow.c:148:6: sparse: sparse: symbol 'add_before' was not declared. Should it be static?
   drivers/md/dm-bow.c:178:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:178:24: sparse:     expected int
   drivers/md/dm-bow.c:178:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:186:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:186:32: sparse:     expected int
   drivers/md/dm-bow.c:186:32: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:205:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:205:24: sparse:     expected int
   drivers/md/dm-bow.c:205:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:282:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:282:24: sparse:     expected int
   drivers/md/dm-bow.c:282:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:395:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:395:24: sparse:     expected int
   drivers/md/dm-bow.c:395:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:339:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:339:24: sparse:     expected int
   drivers/md/dm-bow.c:339:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:344:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:344:24: sparse:     expected int
   drivers/md/dm-bow.c:344:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:350:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:350:24: sparse:     expected int
   drivers/md/dm-bow.c:350:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:358:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:358:24: sparse:     expected int
   drivers/md/dm-bow.c:358:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:422:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:422:24: sparse:     expected int
   drivers/md/dm-bow.c:422:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:427:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:427:24: sparse:     expected int
   drivers/md/dm-bow.c:427:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:437:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:437:24: sparse:     expected int
   drivers/md/dm-bow.c:437:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:443:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:443:24: sparse:     expected int
   drivers/md/dm-bow.c:443:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:462:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:462:24: sparse:     expected int
   drivers/md/dm-bow.c:462:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:553:53: sparse: sparse: Using plain integer as NULL pointer
>> drivers/md/dm-bow.c:793:6: sparse: sparse: symbol 'dm_bow_resume' was not declared. Should it be static?
   drivers/md/dm-bow.c:827:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:827:24: sparse:     expected int
   drivers/md/dm-bow.c:827:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:846:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:846:24: sparse:     expected int
   drivers/md/dm-bow.c:846:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:939:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:939:24: sparse:     expected int
   drivers/md/dm-bow.c:939:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:975:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_status_t [usertype] bi_status @@     got int [assigned] ret @@
   drivers/md/dm-bow.c:975:32: sparse:     expected restricted blk_status_t [usertype] bi_status
   drivers/md/dm-bow.c:975:32: sparse:     got int [assigned] ret
   drivers/md/dm-bow.c:1103:5: sparse: sparse: symbol 'remap_unless_illegal_trim' was not declared. Should it be static?
   drivers/md/dm-bow.c:1259:5: sparse: sparse: symbol 'dm_bow_prepare_ioctl' was not declared. Should it be static?
   drivers/md/dm-bow.c:1292:12: sparse: sparse: symbol 'dm_bow_init' was not declared. Should it be static?
   drivers/md/dm-bow.c:1301:6: sparse: sparse: symbol 'dm_bow_exit' was not declared. Should it be static?
   drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/md/dm-bow.c:523:26: sparse: signed value source

vim +/dm_bow_resume +793 drivers/md/dm-bow.c

   792	
 > 793	void dm_bow_resume(struct dm_target *ti)
   794	{
   795		struct mapped_device *md = dm_table_get_md(ti->table);
   796		struct bow_context *bc = ti->private;
   797		int ret;
   798	
   799		if (bc->kobj_holder.kobj.state_initialized)
   800			return;
   801	
   802		ret = kobject_init_and_add(&bc->kobj_holder.kobj, &bow_ktype,
   803					   &disk_to_dev(dm_disk(md))->kobj, "%s",
   804					   "bow");
   805		if (ret)
   806			ti->error = "Cannot create sysfs node";
   807	}
   808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
